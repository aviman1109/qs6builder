var WfEventConfig =
{
	initialize: function()
	{
		var regex = null;
		if (clientData.urlArgs.element == "Process") {
			regex = /Process/;
		}
		else if (clientData.urlArgs.element == "AutoActivity") {
			regex = /Activity/;
		}
		else if (clientData.urlArgs.element == "ManualActivity") {
			regex = /Activity|WorkItem|Participant/;
		}
		for (var i = 0, fields = clientData.basicFormJson.title; i < fields.length; ++i) {
			var field = fields[i];
			if (field.name == "FOccasion") {
				for (var j = field.items.length - 1; j >= 0; --j) {
					if (!regex.test(field.items[j].value)) {
						field.items.splice(j, 1);
					}
				}
			}
		}
	},
	
	doLoad: function()
	{
		WfEventConfig.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		WfEventConfig.tabStrip.load([
 			{text:$text("Wf.Basic"),		body:"BasicBody"},
 			{text:$text("Qs.Notice.Range"),	body:"RecipientBody", id:"NoticeRange"}
 		]);
		
		WfEventConfig.basicForm = Jui.option.Form.create({
			target						: "BasicBody",
			titleWidth					: 100,
			columnCount					: 2,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop
		});
		WfEventConfig.basicForm.load(clientData.basicFormJson);
		var unitId = clientData.urlArgs.unitId;
		var manualNodes = clientData.urlArgs.manualNodes;
		UserPickList.initialize($elem("RecipientBody"), unitId, true, clientData.recipientListJson, manualNodes);
		
		var conditionalFields = ["FNoticeId", "FEntityEventCode", "FContent"];
 		for (var i = 0; i < conditionalFields.length; ++i) {
 			WfEventConfig.basicForm.getControl(conditionalFields[i]).setClearOnDisable(true);
 			WfEventConfig.basicForm.getControl(conditionalFields[i]).setRestoreOnEnable(true);
 		}
 		WfEventConfig.basicForm.getControl("FHandleType").onchange = WfEventConfig.doHandleTypeBoxChange;
		WfEventConfig.doHandleTypeBoxChange();
	},
	
	doConfirm: function()
	{
		if (!WfEventConfig.basicForm.validate()) {
			return;
		}
		var data = WfEventConfig.basicForm.getData();
		var handleType = WfEventConfig.basicForm.getFieldValue("FHandleType");
		if (/Notice/.test(handleType)) {
			if (UserPickList.list.length() == 0) {
				Jui.message.alert($text("Qs.Notice.SelectRangeAlert"));
				WfEventConfig.tabStrip.setCurrentId("NoticeRange");
				return;
			}
			for (var i = 0, recipients = UserPickList.list.getData(); i < recipients.length; ++i) {
				var recipient = recipients[i];
				var type = recipient.type;
				if (type != "Initiator" && type != "Participant" && Jui.string.isEmpty(recipient.text)) {
					Jui.message.alert($text("Qs.Notice.InvalidRangeItemAlert").replace("${0}", i + 1));
					WfEventConfig.tabStrip.setCurrentId("NoticeRange");
					return;
				}
			}
			data.recipients = UserPickList.getData();
		}
		else {
			delete data.recipients;
		}
		Utility.closeDialog(data);
	},
	
	doHandleTypeBoxChange: function()
	{
		var handleType = WfEventConfig.basicForm.getFieldValue("FHandleType");
		WfEventConfig.basicForm.setFieldEnabled("FNoticeId", /Notice/.test(handleType), true);
		WfEventConfig.basicForm.setFieldEnabled("FEntityEventCode", /FireEntityEvent/.test(handleType), true);
		WfEventConfig.basicForm.setFieldEnabled("FContent", !/Notice|FireEntityEvent/.test(handleType), true);
		UserPickList.setEnabled(/Notice/.test(handleType));
	}
};

WfEventConfig.initialize();
