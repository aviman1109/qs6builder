var WfLineConfig =
{
	doLoad: function()
	{
		WfLineConfig.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		WfLineConfig.tabStrip.load([{text:$text("Wf.Basic"), body:"BasicBody"}]);
		
		WfLineConfig.basicForm = Jui.option.Form.create({target:"BasicBody", titleWidth:100});
		WfLineConfig.basicForm.loadTitle(clientData.basicFormTitle);
		WfLineConfig.basicForm.loadData(clientData.urlArgs.basic);
		WfLineConfig.basicForm.getControl("FDefault").onchange = WfLineConfig.doDefaultChange;
		WfLineConfig.basicForm.getControl("FSupportJump").onchange = WfLineConfig.doSupportJumpChange;
		WfLineConfig.basicForm.getControl("FCondition").setClearOnDisable(true);
		WfLineConfig.basicForm.getControl("FCondition").setRestoreOnEnable(true);
		WfLineConfig.basicForm.getControl("FJumpResult").setClearOnDisable(true);
		WfLineConfig.basicForm.getControl("FJumpResult").setRestoreOnEnable(true);
		WfLineConfig.doDefaultChange();
		WfLineConfig.doSupportJumpChange();
	},
	
	doConfirm: function()
	{
		if (WfLineConfig.basicForm.validate()) {
			var ret = {basic:WfLineConfig.basicForm.getData()};
			Utility.closeDialog(ret);
		}
	},
	
	doDefaultChange: function()
	{
		var isDefault = WfLineConfig.basicForm.getFieldValue("FDefault");
		WfLineConfig.basicForm.setFieldEnabled("FConditionType", !isDefault, true);
		WfLineConfig.basicForm.setFieldEnabled("FCondition", !isDefault, true);
	},
	
	doSupportJumpChange: function()
	{
		var supportJump = WfLineConfig.basicForm.getFieldValue("FSupportJump");
		WfLineConfig.basicForm.setFieldEnabled("FJumpResult", supportJump, true);
	}
};
