<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/misc/InstallWordPaster.js"/>
		<c:css src="quicksilver/page/misc/InstallWordPaster.css"/>
	</c:head>
	<c:body onload="InstallWordPaster.doLoad()">
		<div><%=text("Qs.Misc.InstallWordPasterInformation")%></div>
		<div id="HtmlBoxPanel"></div>
	</c:body>
</c:html>
