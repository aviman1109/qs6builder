var ReportCenter =
{
	reportId: null,
	
	doLoad: function()
	{
		toolBar.setItemDisabled("Print", true);
		Jui.option.Resizer.create({elements:["LeftZone", "RightZone"], transparent:false});
		ReportCenter.tree =  Jui.option.Tree.create({
			target		: "LeftZone",
			onnodeclick	: ReportCenter.doTreeNodeClick
		});
		ReportCenter.tree.load(clientData.treeJson);
		ReportCenter.tree.expandLevel(1);
	},
	
	doTreeNodeClick: function(event)
	{
		if (event.json.iconType == "item") {
			var iframe = $elem("Report");
			iframe.style.display = "block";
			iframe.src = Utility.getUrl("Qs.Report.Show.page", {reportId:event.json.id, showToolBar:false});
			ReportCenter.reportId = event.json.id;
		}
	},
	
	doOpenNewWindow: function()
	{
		if (ReportCenter.reportId == null) {
			var message = $text("Public.SelectAlertTemplate");
			Jui.message.alert(message.replace("${0}", $text("Qs.Report")));
			return;
		}
		var features = "status=yes,toolbar=no,menubar=no,location=no,resizable=yes,width=900,height=600";
		Utility.openWindow("Qs.Report.Show.page", {reportId:ReportCenter.reportId}, "_blank", features);
	},
	
	doExecute: function()
	{
		if (ReportCenter.reportId == null) {
			Jui.message.alert($text("Qs.Report.NotLoaded"));
			return;
		}
		$elem("Report").contentWindow.ReportShow.tryLoadReport(true);
	},
	
	doPrint: function()
	{
		var frame = $elem("Report");
	    frame.contentWindow.ReportShow.print();
	}
};
