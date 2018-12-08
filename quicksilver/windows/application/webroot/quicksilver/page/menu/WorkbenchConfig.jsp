<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Tree">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/menu/WorkbenchConfig.js"/>
		<c:css src="quicksilver/page/menu/WorkbenchConfig.css"/>
	</c:head>
	<c:body onload="WorkbenchConfig.doLoad()">
		<div id="FullZone" class="FullZone"></div>
	</c:body>
</c:html>
