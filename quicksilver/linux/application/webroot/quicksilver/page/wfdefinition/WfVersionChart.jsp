<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Jui.graph.Workflow">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/template/EntityForm.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfVersionChart.js"/>
	</c:head>
	<c:body onload="WfVersionChart.doLoad()">
	</c:body>
</c:html>
