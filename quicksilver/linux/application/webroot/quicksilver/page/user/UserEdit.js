var UserEdit =
{
	doSetPassword: function()
	{
		Utility.openDialog("Qs.User.PasswordModify.page", {userId:clientData.entityId});
	},

	doEnable: function()
	{
		UserEdit.setEnabled(true);
	},

	doDisable: function()
	{
		UserEdit.setEnabled(false);
	},

	setEnabled: function(enabled)
	{
		var args = {entityIds:[clientData.entityId], enabled:enabled};
		Utility.invoke("Qs.User.setEnabled", args, true, function(ret) {
			alert($text("Public.OperationSuccess"));
			EntityForm.reload(clientData.entityId);
		});
	}
};
