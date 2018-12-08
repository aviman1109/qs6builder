var WfNodeConfig =
{
	unitId			: clientData.urlArgs.unitId,
	type			: clientData.urlArgs.type,
	currentCode		: clientData.urlArgs.code,
	allNodeCodes	: clientData.urlArgs.allNodeCodes || {},
	manualNodes		: clientData.urlArgs.manualNodes || [],
	
	doLoad: function()
	{
		WfNodeConfig.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});

		WfNodeConfig.basicForm = Jui.option.Form.create({
			target					: "BasicBody",
			titleWidth				: 100,
			columnCount				: 2,
			entityBoxViewHandler	: CommonBusiness.doEntityBoxView
		});
		WfNodeConfig.basicForm.loadTitle(clientData.basicFormTitle);
		
		if ($elem("PageBody") != null) {
			WfNodeConfig.pageForm = Jui.option.Form.create({
				target		: "PageFormPanel",
				titleWidth	: 80,
				columnCount	: 2
			});
			WfNodeConfig.pageForm.loadTitle(clientData.pageFormTitle);
			WfNodeConfig.buttonAddButton = Jui.basic.ComboButton.create({
				target		: "PageButtonPanel",
				text		: $text("Public.Add"),
				dropOnly	: true,
				onclick		: WfNodeConfig.doButtonListAdd
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",
				text	: $text("Public.Modify"),
				onclick	: WfNodeConfig.doButtonListModify
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",
				text	: $text("Public.Delete"),
				onclick	: WfNodeConfig.doListDelete
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",		
				text	: $text("Public.MoveUp"),
				onclick	: WfNodeConfig.doListMoveUp
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",		
				text	: $text("Public.MoveDown"),
				onclick	: WfNodeConfig.doListMoveDown
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",		
				text	: $text("Public.MoveTop"),
				onclick	: WfNodeConfig.doListMoveTop
			});
			Jui.basic.Button.create({
				target	: "PageButtonPanel",		
				text	: $text("Public.MoveBottom"),
				onclick	: WfNodeConfig.doListMoveBottom
			});
			
			WfNodeConfig.buttonList = Jui.option.List.create({
				target			: "ButtonListPanel",
				border			: "all",
				multiPage		: false,
				ondoubleclick	: WfNodeConfig.doButtonListDoubleClick
			});
			WfNodeConfig.buttonList.loadTitle(clientData.buttonListTitle);
		}
		
		//participant
		if ($elem("ParticipantBody") != null) {
			WfNodeConfig.participantButtons = [
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.Add"),
					onclick	: WfNodeConfig.doListAdd
				}),
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.Delete"),
					onclick	: WfNodeConfig.doListDelete
				}),
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.MoveUp"),
					onclick	: WfNodeConfig.doListMoveUp
				}),
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.MoveDown"),
					onclick	: WfNodeConfig.doListMoveDown
				}),
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.MoveTop"),
					onclick	: WfNodeConfig.doListMoveTop
				}),
				Jui.basic.Button.create({
					target	: "ParticipantButtonCell",
					text	: $text("Public.MoveBottom"),
					onclick	: WfNodeConfig.doListMoveBottom
				})
			];
			WfNodeConfig.participantList = Jui.option.List.create({
				target						: "ParticipantListRow",
				editable					: true,
				border						: "all",
				entityBoxViewHandler		: WfNodeConfig.doParticipantEntityBoxView,
				entityBoxSelectHandler		: WfNodeConfig.doParticipantEntityBoxSelect,
				entityBoxBeforeDropHandler	: WfNodeConfig.doParticipantEntityBoxBeforeDrop
			});
			WfNodeConfig.participantList.loadTitle(clientData.participantListTitle);
			WfNodeConfig.executorBox = Jui.basic.ComboBox.create({
				target			: "ExecutorBoxRow",
				clearOnDisable	: true,
				restoreOnEnable	: true,
				style			: "width:100%"
			});
			WfNodeConfig.fieldBox = Jui.basic.ComboBox.create({
				target			: "FieldBoxRow",
				clearOnDisable	: true,
				restoreOnEnable	: true,
				style			: "width:100%",
				items			: clientData.participantFieldItems
			});
			WfNodeConfig.relevantDataBox = Jui.basic.InputBox.create({
				target			: "RelevantDataBoxRow",
				clearOnDisable	: true,
				restoreOnEnable	: true,
				style			: "width:100%"
			});
			WfNodeConfig.javaClassBox = Jui.basic.InputBox.create({
				target			: "JavaClassBoxRow",
				clearOnDisable	: true,
				restoreOnEnable	: true,
				style			: "width:100%"
			});
			WfNodeConfig.sqlBox = Jui.basic.TextBox.create({
				target			: "SqlBoxRow",
				clearOnDisable	: true,
				restoreOnEnable	: true,
				style			: "width:100%;height:100%"
			});
		}

		var basic = clientData.urlArgs.basic;
		var tabStripJson = [{id:"basic", text:$text("Wf.Basic"), body:"BasicBody"}];
		if (WfNodeConfig.type == "Manual") {
			tabStripJson.push({id:"page", text:$text("Wf.Node.Page"), body:"PageBody"});
			tabStripJson.push({id:"participant", text:$text("Wf.Participant"), body:"ParticipantBody"});
		}
		if (WfNodeConfig.type != "Start") {
			tabStripJson.push({id:"event", text:$text("Wf.Event"), body:"EventBody"});
		}
		WfNodeConfig.tabStrip.load(tabStripJson);
		WfNodeConfig.basicForm.loadData(basic);
		if (WfNodeConfig.basicForm.hasControl("FJoinMode")) {
			WfNodeConfig.basicForm.getControl("FJoinMode").onchange = WfNodeConfig.doJoinModeChange;
			WfNodeConfig.basicForm.getControl("FJoinCondition").setClearOnDisable(true);
			WfNodeConfig.basicForm.getControl("FJoinCondition").setRestoreOnEnable(true);
			WfNodeConfig.doJoinModeChange();
		}
		if (WfNodeConfig.basicForm.hasControl("FAutoCompleteMode")) {
			WfNodeConfig.basicForm.getControl("FAutoCompleteMode").onchange = WfNodeConfig.doAutoCompleteModeChange;
			WfNodeConfig.basicForm.getControl("FAutoCompleteResult").setClearOnDisable(true);
			WfNodeConfig.basicForm.getControl("FAutoCompleteTimeLength").setClearOnDisable(true);
			WfNodeConfig.basicForm.getControl("FAutoCompleteTimeType").setClearOnDisable(true);
			WfNodeConfig.doAutoCompleteModeChange();
		}
		if (WfNodeConfig.basicForm.hasControl("FDeputeMode")) {
			WfNodeConfig.basicForm.getControl("FDeputeMode").onchange = WfNodeConfig.doDeputeModeChange;
			WfNodeConfig.basicForm.getControl("FDeputeHours").setClearOnDisable(true);
			WfNodeConfig.doDeputeModeChange();
		}
		if (WfNodeConfig.type == "Manual") {
			WfNodeConfig.basicForm.getControl("FInstant").onchange = WfNodeConfig.doInstantChange;
			WfNodeConfig.basicForm.getControl("FPrivilegeId").onbeforedrop = WfNodeConfig.doPrivilegeIdBeforeDrop;
			WfNodeConfig.executorBox.loadItems(WfNodeConfig.manualNodes);
			WfNodeConfig.pageForm.loadData(clientData.urlArgs.page);
			WfNodeConfig.pageForm.getControl("FUrlType").onchange = WfNodeConfig.doUrlTypeChange;
			WfNodeConfig.pageForm.getControl("FUrl").setClearOnDisable(true);
			WfNodeConfig.pageForm.getControl("FUrl").setRestoreOnEnable(true);
			WfNodeConfig.doUrlTypeChange();
			WfNodeConfig.buttonList.loadData(clientData.urlArgs.buttons || []);
			WfNodeConfig.buttonAddButton.setItems(clientData.buttonTypes);
			var radios = document.getElementsByName("ParticipantSource");
			var participant = clientData.urlArgs.participant;
			for (var i = 0; i < radios.length; ++i) {
				radios[i].hideFocus = true;
				radios[i].onclick = WfNodeConfig.doParticipantSourceChange;
				if (radios[i].value == participant.source) {
					radios[i].checked = true;
				}
			}
			if (participant.source == "List") {
				WfNodeConfig.participantList.loadData(participant.value);
			}
			else if (participant.source == "Executor") {
				if (WfNodeConfig.executorBox.containsValue(participant.value)) {
					WfNodeConfig.executorBox.setValue(participant.value);
				}
			}
			else if (participant.source == "Field") {
				if (WfNodeConfig.fieldBox.containsValue(participant.value)) {
					WfNodeConfig.fieldBox.setValue(participant.value);
				}
			}
			else if (participant.source == "RelevantData") {
				WfNodeConfig.relevantDataBox.setValue(participant.value);
			}
			else if (participant.source == "JavaClass") {
				WfNodeConfig.javaClassBox.setValue(participant.value);
			}
			else if (participant.source == "Sql") {
				WfNodeConfig.sqlBox.setValue(participant.value);
			}
			WfNodeConfig.doInstantChange();
			WfNodeConfig.doParticipantSourceChange();
		}
		
		//event
		if (WfNodeConfig.type != "Start") {
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.Add"),
				onclick	: WfNodeConfig.doEventAdd
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.Modify"),
				onclick	: WfNodeConfig.doEventModify
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.Delete"),
				onclick	: WfNodeConfig.doListDelete
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.MoveUp"),
				onclick	: WfNodeConfig.doListMoveUp
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.MoveDown"),
				onclick	: WfNodeConfig.doListMoveDown
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.MoveTop"),
				onclick	: WfNodeConfig.doListMoveTop
			});
			Jui.basic.Button.create({
				target	: "EventButtonPanel",		
				text	: $text("Public.MoveBottom"),
				onclick	: WfNodeConfig.doListMoveBottom
			});
			WfNodeConfig.eventList = Jui.option.List.create({
				target			: "EventListPanel",		
				border			: "all",
				multiPage		: false,
				ondoubleclick	: WfNodeConfig.doEventListDoubleClick
			});
			WfNodeConfig.eventList.loadTitle(clientData.eventListTitle);
			WfNodeConfig.eventList.loadData(clientData.urlArgs.events || []);
		}
	},
	
	doJoinModeChange: function()
	{
		var isConditionJoin = WfNodeConfig.basicForm.getFieldValue("FJoinMode") == "Condition";
		WfNodeConfig.basicForm.setFieldEnabled("FJoinConditionType", isConditionJoin, true);
		WfNodeConfig.basicForm.setFieldEnabled("FJoinCondition", isConditionJoin, true);
	},

	doAutoCompleteModeChange: function()
	{
		var isAutoComplet = WfNodeConfig.basicForm.getFieldValue("FAutoCompleteMode") == "FinishActivity";
		WfNodeConfig.basicForm.setFieldEnabled("FAutoCompleteResult", isAutoComplet, true);
		WfNodeConfig.basicForm.setFieldEnabled("FAutoCompleteTimeLength", isAutoComplet, true);
		WfNodeConfig.basicForm.setFieldEnabled("FAutoCompleteTimeType", isAutoComplet, true);
	},
	
	doInstantChange: function()
	{
		var isInstant = WfNodeConfig.basicForm.getFieldValue("FInstant");
		WfNodeConfig.basicForm.setFieldEnabled("FAutoCompleteMode", !isInstant, true);
		if (isInstant) {
			WfNodeConfig.basicForm.setFieldValue("FAutoCompleteMode", "FinishActivity");
			WfNodeConfig.doAutoCompleteModeChange();
		}
	},
	
	doDeputeModeChange: function()
	{
		var isCustom = WfNodeConfig.basicForm.getFieldValue("FDeputeMode") == "CustomHours";
		WfNodeConfig.basicForm.setFieldEnabled("FDeputeHours", isCustom, true);
	},

	doConfirm: function()
	{
		var items = [
			{control:WfNodeConfig.basicForm, tabId:"basic"},
			{control:WfNodeConfig.pageForm, tabId:"page"},
			{control:WfNodeConfig.participantList, tabId:"participant"}
		];
		for (var i = 0; i < items.length; ++i) {
			var item = items[i];
			if (item.control != null && !item.control.validate(false)) {
				WfNodeConfig.tabStrip.setCurrentId(item.tabId);
				item.control.validate();
				return;
			}
		}
		var ret = {
			basic	: WfNodeConfig.basicForm.getData(),
			events	: WfNodeConfig.type == "Start" ? [] : WfNodeConfig.eventList.getData(),
			page	: WfNodeConfig.type == "Manual" ? WfNodeConfig.pageForm.getData() : {},
			buttons	: WfNodeConfig.type == "Manual" ? WfNodeConfig.buttonList.getData() : []
		};
		if (ret.basic.FCode != WfNodeConfig.currentCode && ret.basic.FCode in WfNodeConfig.allNodeCodes) {
			WfNodeConfig.tabStrip.setCurrentId("basic");
			Jui.message.alert($text("Wf.Node.DuplicateCode").replace("${0}", ret.code));
			WfNodeConfig.basicForm.setFieldFocus("FCode");
			return;
		}
		if (WfNodeConfig.type == "Manual") {
			var info = null;
			if ($elem("ListRadio").checked) {
				ret.participant = {source:"List", value:WfNodeConfig.participantList.getData()};
				info = {message:"Wf.Participant.ConfigList"};
			}
			else if ($elem("InitiatorRadio").checked) {
				ret.participant = {source:"Initiator"};
			}
			else if ($elem("ExecutorRadio").checked) {
				ret.participant = {source:"Executor", value:WfNodeConfig.executorBox.getValue()};
				info = {message:"Wf.Participant.SelectActivity", box:"executorBox"};
			}
			else if ($elem("FieldRadio").checked) {
				ret.participant = {source:"Field", value:WfNodeConfig.fieldBox.getValue()};
				info = {message:"Wf.Participant.SelectField", box:"fieldBox"};
			}
			else if ($elem("RelevantDataRadio").checked) {
				ret.participant = {source:"RelevantData", value:WfNodeConfig.relevantDataBox.getValue()};
				info = {message:"Wf.Participant.InputRelevantData", box:"relevantDataBox"};
			}
			else if ($elem("JavaClassRadio").checked) {
				ret.participant = {source:"JavaClass", value:WfNodeConfig.javaClassBox.getValue()};
				info = {message:"Wf.Participant.InputJavaClass", box:"javaClassBox"};
			}
			else if ($elem("SqlRadio").checked) {
				ret.participant = {source:"Sql", value:WfNodeConfig.sqlBox.getValue()};
				info = {message:"Wf.Participant.InputSql", box:"sqlBox"};
			}
			if (ret.participant.source != "Initiator"
				&& (Jui.string.isEmpty(ret.participant.value) || ret.participant.value.length == 0)) {
				WfNodeConfig.tabStrip.setCurrentId("participant");
				Jui.message.alert($text(info.message), function() {
					if (info.box != null) {
						WfNodeConfig[info.box].focus();
					}
				});
				return;
			}
		}
		Utility.closeDialog(ret);
	},
	
	doButtonListAdd: function(event)
	{
		if (event.id == "Button" || event.id == "ComboButton") {
			var args = {type:event.id};
			Utility.openDialog("Wf.Button.Config.page", args, null, function(ret) {
				ret.FType = args.type;
				WfNodeConfig.getCurrentList().appendData(ret);
			});
		}
		else {
			var data = {FType:"Button", FCode:event.id, FName:event.text, FIcon:event.icon, FHandleType:"Default"};
			WfNodeConfig.getCurrentList().appendData(data);
		}
	},
	
	doButtonListDoubleClick: function(event)
	{
		WfNodeConfig.configButton(event.index);
	},
	
	doButtonListModify: function()
	{
		WfNodeConfig.configButton(WfNodeConfig.getCurrentList().getSelectedIndices()[0]);
	},
	
	configButton: function(index)
	{
		if (index == null || index < 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var list	= WfNodeConfig.getCurrentList();
		var data	= list.getData()[index];
		var args	= {type:data.FType, data:data};
		Utility.openDialog("Wf.Button.Config.page", args, null, function(ret) {
			list.updateDataByIndex(ret, index);
		});
	},
	
	doEventAdd: function()
	{
		var args = {
			element		: WfNodeConfig.type == "Manual" ? "ManualActivity" : "AutoActivity",
			unitId		: WfNodeConfig.unitId,
			manualNodes	: WfNodeConfig.manualNodes
		};
		Utility.openDialog("Wf.Event.Config.page", args, null, function(ret) {
			WfNodeConfig.eventList.appendData(ret);
		});
	},
	
	doEventModify: function()
	{
		WfNodeConfig.openEvent(WfNodeConfig.eventList.getSelectedIndices()[0]);
	},
	
	doEventListDoubleClick: function(event)
	{
		WfNodeConfig.openEvent(event.index);
	},
	
	openEvent: function(index)
	{
		if (index == null || index < 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var args = {
			element		: WfNodeConfig.type == "Manual" ? "ManualActivity" : "AutoActivity",
			unitId		: WfNodeConfig.unitId,
			data		: WfNodeConfig.eventList.getData()[index],
			manualNodes	: WfNodeConfig.manualNodes
		};
		args.recipients	= args.data.recipients;
		delete args.data.recipients;
		Utility.openDialog("Wf.Event.Config.page", args, null, function(ret) {
			WfNodeConfig.eventList.updateDataByIndex(ret, index);
		});
	},
	
	doListAdd: function()
	{
		WfNodeConfig.getCurrentList().appendDataAndEdit({});
	},
	
	doListDelete: function()
	{
		WfNodeConfig.getCurrentList().deleteSelectedRows();
	},
	
	doListMoveUp: function()
	{
		WfNodeConfig.getCurrentList().moveUp();
	},
	
	doListMoveDown: function()
	{
		WfNodeConfig.getCurrentList().moveDown();
	},
	
	doListMoveTop: function()
	{
		WfNodeConfig.getCurrentList().moveTop();
	},
	
	doListMoveBottom: function()
	{
		WfNodeConfig.getCurrentList().moveBottom();
	},
	
	doUrlTypeChange: function()
	{
		var FUrlType = WfNodeConfig.pageForm.getFieldValue("FUrlType");
		WfNodeConfig.pageForm.setFieldEnabled("FUrl", FUrlType == "Custom", true);
	},
	
	doParticipantSourceChange: function()
	{
		for (var i = 0; i < WfNodeConfig.participantButtons.length; ++i) {
			WfNodeConfig.participantButtons[i].setDisabled(!$elem("ListRadio").checked);
		}
		WfNodeConfig.executorBox.setDisabled(!$elem("ExecutorRadio").checked);
		WfNodeConfig.fieldBox.setDisabled(!$elem("FieldRadio").checked);
		WfNodeConfig.relevantDataBox.setDisabled(!$elem("RelevantDataRadio").checked);
		WfNodeConfig.javaClassBox.setDisabled(!$elem("JavaClassRadio").checked);
		WfNodeConfig.sqlBox.setDisabled(!$elem("SqlRadio").checked);
		if ($elem("ListRadio").checked && WfNodeConfig.participantListData != null) {
			WfNodeConfig.participantList.loadData(WfNodeConfig.participantListData);
			WfNodeConfig.participantListData = null;
		}
		else if (!$elem("ListRadio").checked && WfNodeConfig.participantList.length() > 0) {
			WfNodeConfig.participantListData = WfNodeConfig.participantList.getData();
			WfNodeConfig.participantList.clear();
		}
	},
	
	doParticipantEntityBoxView: function()
	{
		this.setEntityType("Qs." + WfNodeConfig.participantList.getEditFieldValue("type"));
		CommonBusiness.doEntityBoxView.apply(this);
	},
	
	doParticipantEntityBoxSelect: function()
	{
		var typeBox = WfNodeConfig.participantList.getControl("type");
		if (Jui.string.isEmpty(typeBox.getValue())) {
			Jui.message.alert($text("Wf.Participant.SelectType"), function() {
				typeBox.focus();
			});
			return false;
		}
		this.setEntityType("Qs." + typeBox.getValue());
		CommonBusiness.doEntityBoxSelect.apply(this);
	},
	
	doParticipantEntityBoxBeforeDrop: function()
	{
		var typeBox = WfNodeConfig.participantList.getControl("type");
		if (Jui.string.isEmpty(typeBox.getValue())) {
			Jui.message.alert($text("Wf.Participant.SelectType"), function() {
				typeBox.focus();
			});
			return false;
		}
		this.setEntityType("Qs." + typeBox.getValue());
		CommonBusiness.doEntityBoxBeforeDrop.apply(this);
	},
	
	doPrivilegeIdBeforeDrop: function()
	{
		WfNodeConfig.basicForm.getControl("FPrivilegeId").loadItems(clientData.privileges || []);
	},
	
	getCurrentList: function()
	{
		var map = {"page":"buttonList", "participant":"participantList", "event":"eventList"};
		return WfNodeConfig[map[WfNodeConfig.tabStrip.getCurrentId()]];
	}
};