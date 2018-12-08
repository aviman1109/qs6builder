<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/fusioncharts/FusionCharts.js"/>
		<c:script src="quicksilver/page/chart/Chart.js"/>
		<c:script src="quicksilver/page/monitor/ClusterNodeChart.js"/>
		<c:css src="quicksilver/page/chart/Chart.css"/>
		<c:css src="quicksilver/page/monitor/ClusterNodeChart.css"/>
	</c:head>
	<c:body onload="ClusterNodeChart.doLoad()">
		<div id="CpuPanel"></div>
		<div id="MemoryPanel"></div>
		<div id="JvmMemoryPanel"></div>
		<div id="DbResponseTimePanel" class="PanelWithBottomLegend"></div>
		<div id="DbFrequencyPanel" class="PanelWithBottomLegend"></div>
	</c:body>
</c:html>
