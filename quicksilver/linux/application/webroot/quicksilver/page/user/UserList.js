var UserList =
{
	doLoad: function()
	{
	},
	
	doShowDisabledChange: function()
	{
		EntityList.query();
	},

	doEnable: function()
	{
		UserList.setEnabled(true);
	},

	doDisable: function()
	{
		UserList.setEnabled(false);
	},

	doSetPassword: function()
	{
		var args = {userId:list.getSelectedKeys()[0]};
		if (args.userId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog("Qs.User.PasswordModify.page", args);
	},

	setEnabled: function(enabled)
	{
		var args = {entityIds:list.getSelectedKeys(), enabled:enabled};
		if (args.entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Qs.User.setEnabled", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			CommonBusiness.loadListRow(list, clientData.unitCode, clientData.listId, args.entityIds);
		});
	},
	
	getArguments: function()
	{
		var args = EntityList.$getArguments();
		args.filtered = !toolBar.getItem("ShowDisabled").getValue();
		return args;
	}
};

EntityList.getArguments = UserList.getArguments;
