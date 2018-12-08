<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,List,Jui.graph.Workflow">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfinstance/WfChartAndDetail.js"/>
	</c:head>
	<c:body clazz="QsTabStripContainer" onload="WfChartAndDetail.doLoad()">
		<div id="ChartBody" class="QsFullSize"></div>
		<div id="DetailBody" class="QsFullSize QsPadding"></div>
	</c:body>
</c:html>
