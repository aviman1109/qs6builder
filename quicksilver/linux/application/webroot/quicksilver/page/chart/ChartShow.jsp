<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	boolean hasTree = result.containsClientKey("treeJson");
	boolean hasFrame = result.containsClientKey("handlerPage");
%>

<c:html>
	<c:head import="Form,Tree,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/fusioncharts/FusionCharts.js"/>
		<c:script src="quicksilver/page/chart/Chart.js"/>
		<c:script src="quicksilver/page/chart/ChartShow.js"/>
		<c:css src="quicksilver/page/chart/Chart.css"/>
		<c:css src="quicksilver/page/chart/ChartShow.css"/>
	</c:head>
	<c:body splitter="true" onload="ChartShow.doLoad()">
		<% if (hasTree) { %>
			<div id="LeftZone" class="QsRightBorder">
				<div id="TreeTitle" class="QsBlockTitle"></div>
				<div id="TreePanel"></div>
			</div>
		<% } %>
		<div id="RightZone">
			<div id="FormPanel"></div>
			<% if (hasFrame) { %>
				<div id="FramePanel">
					<iframe id="ChartFrame" <%="frameborder=0"%>></iframe>
				</div>
			<% } else { %>
				<div id="ChartPanel"></div>
			<% } %>
		</div>
	</c:body>
</c:html>
