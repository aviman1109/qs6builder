var PrivilegeList =
{
	doAdd: function(event)
	{
		EntityList.doAdd.call(this, event);
	},

	doTypeConfig: function()
	{
		Utility.openDialog("Qs.PrivilegeType.List.page");
	},
	
	doUserAccessFieldConfig: function()
	{
		Utility.openDialog("Qs.Privilege.UserAccessFieldConfig.page");
	}
};
