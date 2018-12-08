<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List">
		<c:script src="quicksilver/page/wfdefinition/WfVersionChartError.js"/>
		<c:css src="quicksilver/page/wfdefinition/WfVersionChartError.css"/>
	</c:head>
	<c:body onload="WfVersionChartError.doLoad()">
		<div id="MessageRow"></div>
		<div id="ListPanel"></div>
	</c:body>
</c:html>
