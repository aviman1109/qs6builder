var MenuExport =
{
	doExport: function()
	{
		var menuIds = MultiTree.getSelectedIds();
		if (menuIds.length == 0) {
			Jui.message.alert($text("Qs.MenuExport.SelectAlert"));
			return;
		}
		Utility.download("Qs.Menu.export", {menuIds:menuIds});
	}
};
