<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Tree,Form,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src='<%=result.getServerString("solutionScriptFile")%>'/>
		<c:script src="quicksilver/page/report/ReportCenter.js"/>
		<c:css src="quicksilver/page/chart/ChartCenter.css"/>
	</c:head>
	<c:body splitter="true" onload="ReportCenter.doLoad()">
		<div id="LeftZone" class="QsRightBorder"></div>
		<div id="RightZone" class="QsLeftBorder">
			<iframe id="Report" class="QsFullSize" <%="frameborder=0"%> style="display:none"></iframe>
		</div>
	</c:body>
</c:html>
