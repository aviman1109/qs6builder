var OperationEdit =
{
	doLoad: function()
	{
		var conditionalFields = ["FPrivilegeTypeId", "FPrivilegeId"];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FPrivilegeMode").onchange = OperationEdit.doPrivilegeModeChange;
		OperationEdit.doPrivilegeModeChange();
	},

	doPrivilegeModeChange: function()
	{
		var mode = form.getFieldValue("FPrivilegeMode");
		form.setFieldEnabled("FPrivilegeTypeId", mode == "ByType", true);
		form.setFieldEnabled("FPrivilegeId", mode == "ByPrivilege", true);
	},

	doSqlExport: function()
	{
		Utility.download("Qs.Operation.exportSql", {operationId:clientData.entityId});
	}
};
