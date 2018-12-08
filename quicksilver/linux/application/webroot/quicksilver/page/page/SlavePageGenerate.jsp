<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List">
		<c:script src="quicksilver/page/page/SlavePageGenerate.js"/>
		<c:css src="quicksilver/page/page/SlavePageGenerate.css"/>
	</c:head>
	<c:body onload="SlavePageGenerate.doLoad()">
		<div class="HeadMessage"><%=text("Qs.SlavePageGenerate.HeadMessage")%></div>
		<div id="ListPanel"></div>
		<div class="TailMessage"><%=text("Qs.SlavePageGenerate.TailMessage")%></div>
	</c:body>
</c:html>
