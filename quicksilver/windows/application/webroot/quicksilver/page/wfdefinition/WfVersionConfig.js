var WfVersionConfig =
{
	manualNodes: clientData.urlArgs.manualNodes || [],
	
	doLoad: function()
	{
		WfVersionConfig.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		WfVersionConfig.tabStrip.load([
			{text:$text("Wf.Basic"),		body:"BasicBody"},
			{text:$text("Wf.RelevantData"),	body:"RelevantDataBody"},
			{text:$text("Wf.Event"), 		body:"EventBody"},
			{text:$text("Wf.Notice"), 		body:"NoticeBody"}
		]);

		//basic
		WfVersionConfig.basicForm = Jui.option.Form.create({
			target						: "BasicBody",
			titleWidth					: 100,
			columnCount					: 1,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop
		});
		WfVersionConfig.basicForm.load(clientData.basicFormJson);
		
		//relevant data
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.Add"),
			onclick	: WfVersionConfig.doListAdd
		});
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.Delete"),
			onclick	: WfVersionConfig.doListDelete
		});
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.MoveUp"),
			onclick	: WfVersionConfig.doListMoveUp
		});
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.MoveDown"),
			onclick	: WfVersionConfig.doListMoveDown
		});
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.MoveTop"),
			onclick	: WfVersionConfig.doListMoveTop
		});
		Jui.basic.Button.create({
			target	: "RelevantDataButtonPanel",		
			text	: $text("Public.MoveBottom"),
			onclick	: WfVersionConfig.doListMoveBottom
		});
		WfVersionConfig.relevantDataList = Jui.option.List.create({
			target		: "RelevantDataListPanel",		
			editable	: true,
			border		: "all"
		});
		WfVersionConfig.relevantDataList.loadTitle(WfVersionConfig._getRelevantDataListTitle());
		WfVersionConfig.relevantDataList.loadData(clientData.urlArgs.relevantData);

		//event
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.Add"),
			onclick	: WfVersionConfig.doEventAdd
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.Modify"),
			onclick	: WfVersionConfig.doEventModify
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.Delete"),
			onclick	: WfVersionConfig.doListDelete
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.MoveUp"),
			onclick	: WfVersionConfig.doListMoveUp
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.MoveDown"),
			onclick	: WfVersionConfig.doListMoveDown
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.MoveTop"),
			onclick	: WfVersionConfig.doListMoveTop
		});
		Jui.basic.Button.create({
			target	: "EventButtonPanel",		
			text	: $text("Public.MoveBottom"),
			onclick	: WfVersionConfig.doListMoveBottom
		});
		WfVersionConfig.eventList = Jui.option.List.create({
			target			: "EventListPanel",		
			border			: "all",
			multiPage		: false,
			ondoubleclick	: WfVersionConfig.doEventListDoubleClick
		});
		WfVersionConfig.eventList.loadTitle(clientData.eventListTitle);
		WfVersionConfig.eventList.loadData(clientData.urlArgs.events);

		//notice
		WfVersionConfig.noticeForm = Jui.option.Form.create({
			target						: "NoticeBody",
			titleWidth					: 100,
			columnCount					: 2,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop
		});
		WfVersionConfig.noticeForm.loadTitle(WfVersionConfig._getNoticeFormTitle());
		WfVersionConfig.noticeForm.loadData(clientData.notice);
		
		WfVersionConfig.noticeForm.getControl("useDefaultWorkItemNotice").fireEvent("onchange");
		WfVersionConfig.noticeForm.getControl("useDefaultWorkItemMedia").fireEvent("onchange");
		WfVersionConfig.noticeForm.getControl("useDefaultFinishNotice").fireEvent("onchange");
		WfVersionConfig.noticeForm.getControl("useDefaultFinishMedia").fireEvent("onchange");
		WfVersionConfig.noticeForm.getControl("useDefaultTerminateNotice").fireEvent("onchange");
		WfVersionConfig.noticeForm.getControl("useDefaultTerminateMedia").fireEvent("onchange");
	},
	
	doUseDefaultNoticeChange: function()
	{
		var family = this.getArgs().family;
		var noticeField = family + "NoticeId";
		var isCustom = this.getValue() == "false";
		WfVersionConfig.noticeForm.setFieldEnabled(noticeField, isCustom, true);
		if (!isCustom) {
			var defaultNotice = clientData.defaultNotices[family];
			WfVersionConfig.noticeForm.setFieldValue(noticeField, defaultNotice.id, defaultNotice.name);
		}
	},
	
	doUseDefaultMediaChange: function()
	{
		var family = this.getArgs().family;
		var mediaField = family + "Media";
		var isCustom = this.getValue() == "false";
		var noticeId = WfVersionConfig.noticeForm.getFieldValue(family + "NoticeId");
		WfVersionConfig.noticeForm.setFieldEnabled(mediaField, isCustom);
		if (!isCustom) {
			if (noticeId == null) {
				WfVersionConfig.noticeForm.getControl(mediaField).setValues([]);
			}
			else {
				Utility.invoke("Qs.Notice.getMedias", {noticeId:noticeId}, true, function(ret) {
					WfVersionConfig.noticeForm.getControl(mediaField).setValues(ret.medias);
				});
			}
		}
	},
	
	doNoticeChange: function()
	{
		var family = this.getArgs().family;
		var useDefaultMediaField = "useDefault" + Jui.string.upperFirstLetter(family) + "Media";
		var useDefaultMedia = WfVersionConfig.noticeForm.getFieldValue(useDefaultMediaField) == "true";
		if (useDefaultMedia) {
			var mediaField = family + "Media";
			var noticeId = this.getValue();
			if (noticeId == null) {
				WfVersionConfig.noticeForm.getControl(mediaField).setValues([]);
			}
			else {
				Utility.invoke("Qs.Notice.getMedias", {noticeId:noticeId}, true, function(ret) {
					WfVersionConfig.noticeForm.getControl(mediaField).setValues(ret.medias);
				});
			}
		}
	},
	
	doConfirm: function()
	{
		var properties = ["basicForm", "relevantDataList", null, "noticeForm"];
		for (var i = 0; i < properties.length; ++i) {
			var control = WfVersionConfig[properties[i]];
			if (control != null && !control.validate(false)) {
				WfVersionConfig.tabStrip.setIndex(i);
				control.validate();
				return;
			}
		}
		var ret = {
			basic			: WfVersionConfig.basicForm.getData(),
			relevantData	: WfVersionConfig.relevantDataList.getData(),
			events			: WfVersionConfig.eventList.getData(),
			notice			: WfVersionConfig._getNoticeFormData()
		};
		delete ret.notice.workItemNoticeName;
		delete ret.notice.finishNoticeName;
		delete ret.notice.terminateNoticeName;
		Utility.closeDialog(ret);
	},

	doEventAdd: function()
	{
		var args = {
			element		: "Process",
			unitId		: WfVersionConfig.basicForm.getFieldValue("FUnitId"),
			manualNodes	: WfVersionConfig.manualNodes
		};
		Utility.openDialog("Wf.Event.Config.page", args, null, function(ret) {
			WfVersionConfig.eventList.appendData(ret);
		});
	},

	doEventModify: function()
	{
		WfVersionConfig.openEvent(WfVersionConfig.eventList.getSelectedIndices()[0]);
	},

	doEventListDoubleClick: function(event)
	{
		WfVersionConfig.openEvent(event.index);
	},

	openEvent: function(index)
	{
		if (index == null || index < 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var args = {
			element		: "Process",
			unitId		: WfVersionConfig.basicForm.getFieldValue("FUnitId"),			
			data		: WfVersionConfig.eventList.getData()[index],
			manualNodes	: WfVersionConfig.manualNodes
		};
		args.recipients	= args.data.recipients;
		delete args.data.recipients;
		Utility.openDialog("Wf.Event.Config.page", args, null, function(ret) {
			WfVersionConfig.eventList.updateDataByIndex(ret, index);
		});
	},

	doListAdd: function()
	{
		WfVersionConfig.getCurrentList().appendDataAndEdit({});
	},

	doListDelete: function()
	{
		WfVersionConfig.getCurrentList().deleteSelectedRows();
	},
	
	doListMoveUp: function()
	{
		WfVersionConfig.getCurrentList().moveUp();
	},
	
	doListMoveDown: function()
	{
		WfVersionConfig.getCurrentList().moveDown();
	},
	
	doListMoveTop: function()
	{
		WfVersionConfig.getCurrentList().moveTop();
	},
	
	doListMoveBottom: function()
	{
		WfVersionConfig.getCurrentList().moveBottom();
	},
	
	getCurrentList: function()
	{
		return WfVersionConfig[WfVersionConfig.tabStrip.getIndex() == 1 ? "relevantDataList" : "eventList"];
	},
	
	_getRelevantDataListTitle: function()
	{
		return [
		    {
		    	name		: "key",
		    	title		: $text("Wf.RelevantData.Key"),
		    	control		: "InputBox",
		    	width		: 150,
		    	maxLength	: 50,
		    	required	: true
		    },
		    {
		    	name		: "type",
		    	title		: $text("Wf.RelevantData.Type"),
		    	control		: "ComboBox",
		    	width		: 70,
		    	required	: true,
		    	items		: WfVersionConfig.relevantDataTypeItems
		    },
		    {
		    	name		: "isArray",
		    	title		: $text("Wf.RelevantData.IsArray"),
		    	control		: "CheckBox",
		    	width		: 70,
		    	align		: "center"
		    },
		    {
		    	name		: "defaultValue",
		    	title		: $text("Wf.RelevantData.DefaultValue"),
		    	control		: "InputBox",
		    	width		: 80
		    }
		];
	},
	
	_getNoticeFormTitle: function()
	{
		var radioItems = [
 		    {value:"true", 	text:$text("Wf.Version.Notice.Default")},
 		    {value:"false",	text:$text("Wf.Version.Notice.Custom")}
         ];
 		var mediaItems = [
 	        {value:"Email",			text:$text("Wf.Version.Media.Email")},
 		    {value:"ShortMessage",	text:$text("Wf.Version.Media.ShortMessage")},
 		    {value:"SystemMessage",	text:$text("Wf.Version.Media.SystemMessage")}
 		];
		return [
		    {
         		name			: "useDefaultWorkItemNotice",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Notice"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.WorkItemNotice"),
	            rowSpan			: 1,
	            family			: "workItem",
	            onchange		: WfVersionConfig.doUseDefaultNoticeChange
		    },
		    {
         		name			: "workItemNoticeId",
	            control			: "EntityBox",
	            title			: $text("Wf.Version.SpecifiedNotice"),
	            entityType		: "Qs.Notice",
	            textField		: "workItemNoticeName",
	            group2			: $text("Wf.Version.WorkItemNotice"),
	            family			: "workItem",
	            onchange		: WfVersionConfig.doNoticeChange
		    },
		    {
         		name			: "useDefaultWorkItemMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Media"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.WorkItemNotice"),
	            rowSpan			: 1,
	            family			: "workItem",
	            onchange		: WfVersionConfig.doUseDefaultMediaChange
		    },
		    {
         		name			: "workItemMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.SpecifiedMedia"),
	            items			: mediaItems,
	            clearOnDisable	: true,
	            family			: "workItem",
	            group2			: $text("Wf.Version.WorkItemNotice")
		    },
		    
		    {
         		name			: "useDefaultFinishNotice",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Notice"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.FinishNotice"),
	            rowSpan			: 1,
	            family			: "finish",
	            onchange		: WfVersionConfig.doUseDefaultNoticeChange
		    },
		    {
         		name			: "finishNoticeId",
	            control			: "EntityBox",
	            title			: $text("Wf.Version.SpecifiedNotice"),
	            entityType		: "Qs.Notice",
	            textField		: "finishNoticeName",
	            group2			: $text("Wf.Version.FinishNotice"),
	            family			: "finish",
	            onchange		: WfVersionConfig.doNoticeChange
		    },
		    {
         		name			: "useDefaultFinishMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Media"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.FinishNotice"),
	            rowSpan			: 1,
	            family			: "finish",
	            onchange		: WfVersionConfig.doUseDefaultMediaChange
		    },
		    {
         		name			: "finishMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.SpecifiedMedia"),
	            items			: mediaItems,
	            clearOnDisable	: true,
	            family			: "finish",
	            group2			: $text("Wf.Version.FinishNotice")
		    },
		    
		    {
         		name			: "useDefaultTerminateNotice",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Notice"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.TerminateNotice"),
	            rowSpan			: 1,
	            family			: "terminate",
	            onchange		: WfVersionConfig.doUseDefaultNoticeChange
		    },
		    {
         		name			: "terminateNoticeId",
	            control			: "EntityBox",
	            title			: $text("Wf.Version.SpecifiedNotice"),
	            entityType		: "Qs.Notice",
	            textField		: "terminateNoticeName",
	            group2			: $text("Wf.Version.TerminateNotice"),
	            family			: "terminate",
	            onchange		: WfVersionConfig.doNoticeChange
		    },
		    {
         		name			: "useDefaultTerminateMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.Media"),
	            multiSelect		: false,
	            items			: radioItems,
	            group2			: $text("Wf.Version.TerminateNotice"),
	            rowSpan			: 1,
	            family			: "terminate",
	            onchange		: WfVersionConfig.doUseDefaultMediaChange
		    },
		    {
         		name			: "terminateMedia",
	            control			: "MultiCheckBox",
	            title			: $text("Wf.Version.SpecifiedMedia"),
	            items			: mediaItems,
	            clearOnDisable	: true,
	            family			: "terminate",
	            group2			: $text("Wf.Version.TerminateNotice")
		    },
        ];		
	},
	
	_getNoticeFormData: function()
	{
		var data = WfVersionConfig.noticeForm.getData();
		var families = ["workItem", "finish", "terminate"];
		for (var i = 0; i < families.length; ++i) {
			var family = families[i];
			var upper = Jui.string.upperFirstLetter(family);
			data["useDefault" + upper + "Notice"] = Jui.cast.toBool(data["useDefault" + upper + "Notice"]);
			data["useDefault" + upper + "Media"] = Jui.cast.toBool(data["useDefault" + upper + "Media"]);
			if (data["useDefault" + upper + "Notice"]) {
				delete data[family + "NoticeId"];
			}
			if (data["useDefault" + upper + "Media"]) {
				delete data[family + "Media"];
			}
		}
		return data;
	}
};
