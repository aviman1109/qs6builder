var WorkflowEdit =
{
	doLoad: function()
	{
		form.getControl("FSupportUnit").onchange = WorkflowEdit.doSupportUnitChange;
		form.getControl("FUnitId").setClearOnDisable(true);
		form.getControl("FUnitId").setRestoreOnEnable(true);
		WorkflowEdit.doSupportUnitChange();
	},

	doSupportUnitChange: function()
	{
		var supportUnit = form.getFieldValue("FSupportUnit");
		form.setFieldEnabled("FUnitId", supportUnit, true);
	},

	doEnable: function()
	{
		var args = {workflowId:clientData.urlArgs.entityId};
		if (args.workflowId != null) {
			Utility.invoke("Wf.Workflow.enable", args, true, function(ret) {
				alert($text("Wf.Workflow.EnableSuccess"));
				navigate(location.href);
			});
		}
	},

	doDisable: function()
	{
		var args = {workflowId:clientData.urlArgs.entityId};
		if (args.workflowId != null) {
			Utility.invoke("Wf.Workflow.disable", args, true, function(ret) {
				alert($text("Wf.Workflow.DisableSuccess"));
				navigate(location.href);
			});
		}
	},

	doSqlExport: function()
	{
		var args = {workflowId:clientData.urlArgs.entityId, format:"sql"};
		if (args.workflowId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		Utility.download("Wf.Workflow.export", args);
	}
};
