<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Tree,Form,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src='<%=result.getServerString("solutionScriptFile")%>'/>
		<c:script src="quicksilver/page/report/ReportShow.js"/>
		<c:css src="quicksilver/page/report/ReportShow.css"/>
	</c:head>
	<c:body>
		<% if (result.containsClientKey("treeJson")) { %>
			<div id="LeftZone" class="QsRightBorder">
				<div id="TreeTitle" class="QsBlockTitle"></div>
				<div id="TreePanel"></div>
			</div>
		<% } %>
		<div id="RightZone">
			<div id="FormPanel"></div>
			<div id="ReportPanel">
				<iframe id="ReportFrame" <%="frameborder=0"%>></iframe>
			</div>
		</div>
	</c:body>
</c:html>
