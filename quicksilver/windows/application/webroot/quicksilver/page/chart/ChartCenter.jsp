<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Tree,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/chart/ChartCenter.js"/>
		<c:css src="quicksilver/page/chart/ChartCenter.css"/>
	</c:head>
	<c:body splitter="true" onload="ChartCenter.doLoad()">
		<div id="LeftZone" class="QsRightBorder"></div>
		<div id="RightZone" class="QsLeftBorder">
			<iframe id="Chart" class="QsFullSize" <%="frameborder=0"%> style="display:none"></iframe>
		</div>
	</c:body>
</c:html>
