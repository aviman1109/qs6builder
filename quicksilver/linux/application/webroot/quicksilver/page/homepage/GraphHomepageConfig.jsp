<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Jui.graph.StretchGraph">
		<c:script src="quicksilver/page/homepage/GraphHomepageConfig.js"/>
		<style>
			.GraphHomepageNode
			{
				background-image: url(quicksilver/page/homepage/image/GraphHomepageNode.png);
			}
		</style>	
	</c:head>
	<c:body onload="GHC.doLoad()" splitter="true">
		<script>
			GHC.legendItems = [
				{type:"Node", text:'<%=text("Qs.GraphHomepage.Node")%>', className:"JuiGraphLegendNormalNode"},
	    		{type:"Line", text:'<%=text("Qs.GraphHomepage.Line")%>', className:"JuiGraphLegendArrow"}
			];
			GHC.graph = Jui.graph.StretchGraph.create({
				isDesignMode		: true,
				gridVisible			: false,
				image				: GHC.backgroundImage,
				lineTypes			: GHC.getLineTypes(),
				nodeTypes			: GHC.getNodeTypes(),
				legendItems			: GHC.legendItems,
				lineMargin			: 15,
				onnodedoubleclick	: GHC.doNodeDoubleClick,
				onNodeAdd			: GHC.doNodeAdd
			});
		</script>
	</c:body>
</c:html>
