<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/misc/Prompt.js"/>
		<c:css src="quicksilver/page/misc/Prompt.css"/>
	</c:head>
	<c:body onload="Prompt.doLoad()">
		<div><script>document.write(Prompt.information);</script></div>
		<div id="BoxPanel"></div>
	</c:body>
</c:html>
