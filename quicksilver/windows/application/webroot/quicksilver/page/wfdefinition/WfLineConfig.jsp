<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,Form">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfLineConfig.js"/>
		<c:css src="quicksilver/page/wfdefinition/WfLineConfig.css"/>
	</c:head>
	<c:body onload="WfLineConfig.doLoad()">
		<div id="BasicBody"></div>
	</c:body>
</c:html>
