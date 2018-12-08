<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/rule/Duplication.js"/>
		<c:css src="quicksilver/page/rule/Duplication.css"/>
	</c:head>
	<c:body onload="Duplication.doLoad()">
		<div id="Message"></div>
		<div id="ListPanel" class="QsTopBorder"></div>
	</c:body>
</c:html>
