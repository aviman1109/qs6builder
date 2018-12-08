var ChartCenter =
{
	chartId: null,
	
	doLoad: function()
	{
		ChartCenter.tree =  Jui.option.Tree.create({
			target		: "LeftZone",
			onnodeclick	: ChartCenter.doTreeNodeClick
		});
		Jui.option.Resizer.create({elements:["LeftZone", "RightZone"], transparent:false});

		ChartCenter.tree.load(clientData.treeJson);
		ChartCenter.tree.expandLevel(1);
	},
	
	doTreeNodeClick: function(event)
	{
		if (event.json.iconType == "item") {
			var iframe = $elem("Chart");
			iframe.style.display = "block";
			var url = event.data || "Qs.Chart.Show.page";
			ChartCenter.chartId = event.json.id;
			iframe.src = Utility.getUrl(url, {chartId:event.json.id, showToolBar:false});
		}
	},

	doExportGrid: function()
	{
		var iframe = $elem("Chart");
		var table = iframe.contentWindow.Chart.getGridTable();
		if (table == null) {
			alert($text("Qs.Chart.Grid.CannotExportAlert"));
			return;
		}
		var args = {cells:Utility.getTableCellsForExport(table)};
		Utility.download("Qs.Export.exportHtmlTable", args);
	},
	
	doPrivateChartConfig: function(event)
	{
		Utility.openDialog("Qs.Chart.PrivateList.page", null, null, function(ret) {
			Utility.invoke("Qs.Chart.getChartTreeJson", null, true, function(ret) {
				ChartCenter.tree.load(ret.treeJson);
				ChartCenter.tree.expandLevel(1);
				if (ChartCenter.chartId != null) {
					var nodeIds = ChartCenter.getTreeNodeIds(ret.treeJson);
					if (ChartCenter.chartId in nodeIds) {
						$elem("Chart").src = $elem("Chart").src;
					}
					else {
						$elem("Chart").style.display = "none";
					}
				}
			});
		});
	},

	getTreeNodeIds: function(json, nodeIds)
	{
		if (nodeIds == null) {
			nodeIds = {};
		}
		for (var i = 0; i < json.length; ++i) {
			var item = json[i];
			nodeIds[item.id] = 1;
			if (item.children != null) {
				ChartCenter.getTreeNodeIds(item.children, nodeIds);
			}
		}
		return nodeIds;
	},
	
	clear: function()
	{
		var iframe = $elem("Chart");
		iframe.style.display = "none";
		iframe.src = "about:blank";
	}
};
