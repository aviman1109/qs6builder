var MonitorCacheTree =
{
	doLoad: function()
	{
		MonitorCacheTree.tree = Jui.option.Tree.create({
			target		: "QsContent",
			sameIcon	: true,
			style		: "padding-left:8px;padding-top:2px;width:100%;height:100%"
		});
		MonitorCacheTree.tree.load(clientData.treeJson);
		MonitorCacheTree.tree.expandLevel(1);
	}
};
