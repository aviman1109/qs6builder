<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src='<%=result.getServerString("solutionScriptFile")%>'/>
		<c:script src="quicksilver/page/report/BillShow.js"/>
		<c:css src="quicksilver/page/report/BillShow.css"/>
	</c:head>
	<c:body onload="BillShow.doLoad()">
		<div id="FormPanel">
			<div id="UnitNameCell"></div>
			<div id="EntityBoxCell"></div>
		</div>
		<div id="ReportPanel">
			<iframe id="ReportFrame" <%="frameborder=0"%>></iframe>
		</div>
	</c:body>
</c:html>
