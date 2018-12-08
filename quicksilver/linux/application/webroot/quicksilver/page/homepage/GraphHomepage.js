var GH = 
{
	nodeWidth: clientData.nodeWidth || 64,
	
	nodeHeight: clientData.nodeHeight || 64,
	
	lineWidth: clientData.lineWidth || 5,
	
	lineColor: clientData.lineColor || "8080FF",
	
	backgroundImage: clientData.backgroundImage || "quicksilver/page/homepage/image/GraphHomepageBackground.jpg",
	
	doLoad: function()
	{
		GH.graph = Jui.graph.StretchGraph.create({
			target		: "QsContent",
			showLegend	: false,
			gridVisible	: false,
			autoCenter	: false,
			image		: GH.backgroundImage,
			lineTypes	: GH.getLineTypes(),
			nodeTypes	: GH.getNodeTypes(),
			lineMargin	: 15,
			onnodeclick	: GH.doNodeClick
		});
		GH.graph.load({nodes:clientData.nodes, lines:clientData.lines});
	},
	
	getNodeTypes: function()
	{
		return [{name:"Node", width:GH.nodeWidth, height:GH.nodeHeight, className:"GraphHomepageNode"}];
	},
	
	getLineTypes: function()
	{
		return [{name:"Line", arrow:"single", width:GH.lineWidth, color:"#" + GH.lineColor}];
	},
	
	doNodeClick: function(event)
	{
		var data = event.node.data;
		if (!Jui.string.isEmpty(data.url)) {
			Utility.openTab(data.url, null, event.node.text);
		}
		else if (!Jui.string.isEmpty(data.pageId)) {
			var page = Utility.getPage(data.pageCode);
			Utility.openTab(page.code + ".page", null, page.title, page.icon);
		}
		else {
			alert("pageId and url missing.");
		}
	}
};

Jui.event.attach(window, "resize", function() {
	if (GH.graph != null) {
		GH.graph.load({nodes:clientData.nodes, lines:clientData.lines});
	}
});
