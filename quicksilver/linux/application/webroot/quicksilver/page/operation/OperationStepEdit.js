var OperationStepEdit =
{
	doLoad: function()
	{
		var tabStrip = form.getTabStrip();
		var panel = tabStrip.add({id:"NoticeRange", text:$text("Qs.Notice.Range")}, false);
		UserPickList.initialize(panel, clientData.eventUnitId, false, clientData.recipientListJson);
		
		OperationStepEdit.defaultContentLabel = form.getControl("FContent").getArgs().title;
		var clearFields = [
		    "FPrivilegeTypeId", "FPrivilegeId", "FWorkflowId", "FActivityCode", "FActivityResult",
		    "FNoticeId", "FContent", "FMessage"
		];
		for (var i = 0; i < clearFields.length; ++i) {
			form.getControl(clearFields[i]).setClearOnDisable(true);
		}
		var enableFields = ["FPrivilegeTypeId", "FPrivilegeId", "FContent", "FMessage"];
		for (var i = 0; i < enableFields.length; ++i) {
			form.getControl(enableFields[i]).setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = OperationStepEdit.doTypeChange;
		form.getControl("FWorkflowId").onbeforedrop = null;
		form.getControl("FWorkflowId").loadItems(clientData.workflows);
		OperationStepEdit.doTypeChange();
	},

	doTypeChange: function()
	{
		var type = form.getFieldValue("FType");
		var isWorkflow = /Process|Activity/.test(type);
		var isTerminateProcess = /TerminateProcess/.test(type);
		var isNotice = /Notice/.test(type);
		form.setFieldEnabled("FPrivilegeTypeId", type == "Validation-PrivilegeType", true);
		form.setFieldEnabled("FPrivilegeId", type == "Validation-Privilege", true);
		form.setFieldEnabled("FMessage", /Validation/.test(type) && !/Privilege/.test(type), true);
		form.setFieldEnabled("FWorkflowId", isWorkflow && !isTerminateProcess, true);
		form.setFieldEnabled("FActivityCode", /Activity/.test(type), true);
		form.setFieldEnabled("FActivityResult", /Activity/.test(type), true);
		form.setFieldEnabled("FContent", !/SaveForm/.test(type) && !isNotice && !isTerminateProcess, !isWorkflow);
		UserPickList.setEnabled(isNotice);
		var label = OperationStepEdit.defaultContentLabel;
		if (/Expression/.test(type)) {
			label = clientData.labels.expression;
		}
		else if (/Sql/.test(type)) {
			label = clientData.labels.sqlStatement;
		}
		else if (/Java/.test(type)) {
			label = clientData.labels.javaClass;
		}
		else if (isWorkflow) {
			label = clientData.labels.relevantData;
		}
		form.setFieldTitle("FContent", label);
		form.setFieldRequired("FContent", !isWorkflow);
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (!/Notice/.test(form.getFieldValue("FType"))) {
		return true;
	}
	if (UserPickList.list.length() == 0) {
		alert($text("Qs.Notice.SelectRangeAlert"));
		form.getTabStrip().setCurrentTabById("NoticeRange");
		return false;
	}
	for (var i = 0, recipients = UserPickList.list.getData(); i < recipients.length; ++i) {
		var recipient = recipients[i];
		if (recipient.type != "Initiator" && Jui.string.isEmpty(recipient.text)) {
			alert($text("Qs.Notice.InvalidRangeItemAlert").replace("${0}", i + 1));
			form.getTabStrip().setCurrentTabById("NoticeRange");
			return false;
		}
	}
	if (JSON.stringify(UserPickList.getData()).length > clientData.maxNoticeRecipientsTextLength) {
		alert($text("Qs.Notice.RangeTextTooLong"));
		form.getTabStrip().setCurrentTabById("NoticeRange");
		return false;
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	if (/Notice/.test(data.FType)) {
		data.FNoticeRecipients = JSON.stringify(UserPickList.getData());
	}
	else {
		data.FNoticeRecipients = null;
	}
	return data;
};
