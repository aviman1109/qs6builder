var WorkbenchConfig = 
{
	trees: [],
		
	doLoad: function()
	{
		var count = clientData.treeJson.length;
		var panel = $elem("FullZone");
		panel.innerHTML = Jui.string.repeat("<div class=TreePanel></div>", count);
		for (var i = 0; i < count; ++i) {
			var args = {target:panel.children[i], multiSelect:true};
			WorkbenchConfig.trees.push(Jui.option.Tree.create(args));
			WorkbenchConfig.trees[i].load([clientData.treeJson[i]]);
			WorkbenchConfig.trees[i].expandLevel(20);
		}
	},

	doSave: function()
	{
		var menuIds = [];
		for (var i = 0; i < WorkbenchConfig.trees.length; ++i) {
			menuIds = menuIds.concat(WorkbenchConfig.trees[i].getSelectedIds(true));
		}
		var args = {entityId:clientData.entityId, isUser:clientData.isUser, menuIds:menuIds};
		Utility.invoke("Qs.Menu.setWorkbenchMenus", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Jui.window.getTop().MainFrame.loadTree("00000000-0000-0000-0008-010000000010");
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
