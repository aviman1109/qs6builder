var Menu =
{
	doModuleIdBoxBeforeDrop: function()
	{
		var box = this;
		if (!Menu.moduleDropdownLoaded) {
			Utility.syncInvoke("Qs.Menu.getModuleDropdownJson", {}, function(ret) {
				box.loadItems(ret.data);
				Menu.moduleDropdownLoaded = true;
			});
		}
	}
};
