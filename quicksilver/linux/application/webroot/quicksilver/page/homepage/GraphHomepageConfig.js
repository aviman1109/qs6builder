var GHC = 
{
	nodeWidth: clientData.nodeWidth || 64,
	
	nodeHeight: clientData.nodeHeight || 64,
	
	lineWidth: clientData.lineWidth || 5,
	
	lineColor: clientData.lineColor || "8080FF",
	
	backgroundImage: clientData.backgroundImage || "quicksilver/page/homepage/image/GraphHomepageBackground.jpg",
	
	doLoad: function()
	{
		GHC.graph.load({nodes:clientData.nodes, lines:clientData.lines});
	},
	
	doSetProperty: function()
	{
		var args = {
			nodeWidth		: GHC.nodeWidth,
			nodeHeight		: GHC.nodeHeight,
			lineWidth		: GHC.lineWidth,
			lineColor		: GHC.lineColor,
			backgroundImage	: GHC.backgroundImage
		};
		Utility.openDialog("Qs.GraphHomepage.Property.page", args, null, function(ret) {
			GHC.nodeWidth 		= parseInt(ret.nodeWidth);
			GHC.nodeHeight 		= parseInt(ret.nodeHeight);
			GHC.lineWidth 		= parseInt(ret.lineWidth);
			GHC.lineColor		= ret.lineColor;
			GHC.backgroundImage	= ret.backgroundImage;
			var data			= GHC.graph.getJson();
			GHC.graph.setImage(GHC.backgroundImage);
			GHC.graph.setMetaData(GHC.getNodeTypes(), GHC.getLineTypes(), GHC.legendItems);
			GHC.graph.load(data);
		});
	},
	
	getNodeTypes: function()
	{
		return [{name:"Node", width:GHC.nodeWidth, height:GHC.nodeHeight, className:"GraphHomepageNode"}];
	},
	
	getLineTypes: function()
	{
		return [{name:"Line", arrow:"single", width:GHC.lineWidth, color:"#" + GHC.lineColor}];
	},
	
	doNodeDoubleClick: function(event)
	{
		var args = Jui.object.merge({}, event.node, event.node.data);
		Utility.openDialog("Qs.GraphHomepage.Item.page", args, null, function(ret) {
			var data = {icon:ret.icon, pageId:ret.pageId, pageName:ret.pageName, url:ret.url};
			GHC.graph.updateNode(event.node.id, ret.text, ret.icon, data);
		});
	},
	
	doDelete: function()
	{
		var line = GHC.graph.getCurrentLine();
		var node = GHC.graph.getCurrentNode();
		if (line == null && node == null) {
			Jui.message.hint($text("Qs.GraphHomepage.DeleteHint"));
			return;
		}
		var code = line == null ? "Qs.GraphHomepage.DeleteNodeConfirm" : "Qs.GraphHomepage.DeleteLineConfirm";
		Jui.message.confirm($text(code), function() {
			GHC.graph.deleteCurrentElement();
		});
	},

	doSave: function()
	{
		GHC.save(false);
	},	
	
	doSetHomepage: function()
	{
		GHC.save(true);
	},
	
	save: function(setHomepage)
	{
		var data = Jui.object.merge({
			FNodeWidth		: GHC.nodeWidth,
			FNodeHeight		: GHC.nodeHeight,
			FLineWidth		: GHC.lineWidth,
			FLineColor		: GHC.lineColor,
			FBackgroundImage: GHC.backgroundImage
		}, GHC.graph.getJson());
		for (var i = 0; i < data.nodes.length; ++i) {
			var node = data.nodes[i];
			if (node.data == null || (Jui.string.isEmpty(node.data.pageId) && Jui.string.isEmpty(node.data.url))) {
				Jui.message.alert($text("Qs.GraphHomepage.NoPageAndUrl").replace("${0}", node.text));
				return;
			}
		}
		var args = {setHomepage:setHomepage == true, data:data};
		Utility.invoke("Qs.HomepageItem.saveGraphHomepageConfig", args, true, function(){
			Jui.message.success($text("Public.SaveSuccess"));
		});
	}
};
