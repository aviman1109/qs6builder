<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/page/SpecialPathConfig.js"/>
		<c:css src="quicksilver/page/page/SpecialPathConfig.css"/>
	</c:head>
	<c:body onload="SpecialPathConfig.doLoad()">
		<div id=TabContainer></div>
		<div class="ButtonContainerOuter QsMiddleAlign"><div id=ButtonContainer class=QsVertButtonPanel></div></div>
	</c:body>
</c:html>
