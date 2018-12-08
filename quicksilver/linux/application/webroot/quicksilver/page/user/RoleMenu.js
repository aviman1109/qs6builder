var RoleMenu =
{
	doSave: function()
	{
		var args = {roleId:clientData.roleId, menuIds:MultiTree.getSelectedIds()};
		Utility.invoke("Qs.Menu.setRoleMenus", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},

	doExportAll: function()
	{
		Utility.download("Qs.Menu.exportRoleMenus");
	},

	doExportCurrent: function()
	{
		var args = {roleId:clientData.roleId};
		Utility.download("Qs.Menu.exportRoleMenus", args);
	}
};
