<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfinstance/WorkItemSubmit.js"/>
		<c:css src="quicksilver/page/wfinstance/WorkItemSubmit.css"/>
	</c:head>
	<c:body onload="WorkItemSubmit.doLoad()">
		<div id="WorkItemPane" class="QsFullSize"></div>
	</c:body>
</c:html>
