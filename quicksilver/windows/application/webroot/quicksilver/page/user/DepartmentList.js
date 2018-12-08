var DepartmentList =
{
	doShowDisabledChange: function()
	{
		EntityList.query();
	},

	doEnable: function()
	{
		DepartmentList.setEnabled(true);
	},

	doDisable: function()
	{
		DepartmentList.setEnabled(false);
	},

	setEnabled: function(enabled)
	{
		var args = {entityIds:list.getSelectedKeys(), enabled:enabled};
		if (args.entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Qs.Department.setEnabled", args, true, function(ret) {
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

EntityList.getArguments = DepartmentList.getArguments;
