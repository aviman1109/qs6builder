<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/fusioncharts/FusionCharts.js"/>
		<c:script src="quicksilver/page/chart/Chart.js"/>
		<c:script src="quicksilver/page/homepage/Homepage.js"/>
		<c:css src="quicksilver/page/chart/Chart.css"/>
		<c:css src="quicksilver/page/homepage/Homepage.css"/>
	</c:head>
	<c:body toolbar="false" onload="Homepage.doLoad()">
		<%=result.getServerString("html")%>
	</c:body>
</c:html>
