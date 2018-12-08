var MultiTree =
{
	trees: [],

	doLoad: function()
	{
		var count = clientData.treeJson.length;
		var panel = $elem("ContentRoot");
		panel.innerHTML = Jui.string.repeat("<div class=TreePanel></div>", count);
		for (var i = 0; i < count; ++i) {
			var args = {target:panel.children[i], multiSelect:true};
			MultiTree.trees.push(Jui.option.Tree.create(args));
			MultiTree.trees[i].load([clientData.treeJson[i]], false);
			MultiTree.trees[i].expandLevel(20);
		}
	},

	getSelectedIds: function()
	{
		var ids = [];
		for (var i = 0; i < MultiTree.trees.length; ++i) {
			ids = ids.concat(MultiTree.trees[i].getSelectedIds(true));
		}
		return ids;
	}
};

window.onload = MultiTree.doLoad;
