var DepartmentEdit =
{
	doEnable: function()
	{
		DepartmentEdit.setEnabled(true);
	},

	doDisable: function()
	{
		DepartmentEdit.setEnabled(false);
	},

	setEnabled: function(enabled)
	{
		var args = {entityIds:[clientData.entityId], enabled:enabled};
		Utility.invoke("Qs.Department.setEnabled", args, true, function(ret) {
			alert($text("Public.OperationSuccess"));
			EntityForm.reload(clientData.entityId);
		});
	}
};
