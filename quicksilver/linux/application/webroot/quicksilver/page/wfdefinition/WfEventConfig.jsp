<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,Form">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/user/UserPickList.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfEventConfig.js"/>
		<c:css src="quicksilver/page/user/UserPickList.css"/>
		<c:css src="quicksilver/page/wfdefinition/WfEventConfig.css"/>
	</c:head>
	<c:body onload="WfEventConfig.doLoad()">
		<div id="BasicBody"></div>
		<div id="RecipientBody"></div>
	</c:body>
</c:html>
