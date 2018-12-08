var MonitorCache =
{
	doLoad: function()
	{
		MonitorCache.list = Jui.option.List.create({
			target				: "QsContent",
			multiPage			: false,
			multiSelect			: false,
			showZeroValue		: true,
			addEmptyTailColumn	: true
		});
		MonitorCache.list.loadTitle({keyField:"region", nameField:"region", fields:[
		    {name:"region", title:$text("Qs.Cache.Region"), control:"InputBox",	width:200},
		    {name:"visit",	title:$text("Qs.Cache.Visit"),	control:"InputBox",	type:"bigint", align:"right"},
		    {name:"hit",	title:$text("Qs.Cache.Hit"),	control:"InputBox",	type:"bigint", align:"right"},
		    {name:"rate",	title:$text("Qs.Cache.Rate"),	control:"InputBox",	type:"double", align:"right"}
		]});
		MonitorCache.doRefresh();
	},

	doClear: function()
	{
		Jui.message.confirm($text("Qs.Cache.ClearConfirm"), function() {
			Utility.invoke("Qs.Monitor.clearCache", null, true, function() {
				Jui.message.hint($text("Qs.Cache.ClearSuccess"));
			});
		});
	},

	doViewTree: function()
	{
		Utility.openDialog("Qs.Monitor.CacheTree.page");
	},

	doRefresh: function()
	{
		Utility.invoke("Qs.Monitor.getCacheListDataJson", null, true, function(ret) {
			MonitorCache.list.loadData(ret.data);
		});
	},

	doExcelExport: function()
	{
		Utility.download("Qs.Monitor.exportCache");
	}
};
