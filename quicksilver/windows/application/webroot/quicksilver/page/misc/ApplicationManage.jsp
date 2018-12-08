<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List">
		<c:script src="quicksilver/page/misc/ApplicationManage.js"/>
		<c:css src="quicksilver/page/misc/ApplicationManage.css"/>
	</c:head>
	<c:body splitter="true" onload="ApplicationManage.doLoad()">
		<div id="PathCell"></div>
		<div id="ListCell"></div>
	</c:body>
</c:html>
