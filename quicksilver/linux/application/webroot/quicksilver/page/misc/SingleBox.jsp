<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/misc/SingleBox.js"/>
		<c:css src="quicksilver/page/misc/SingleBox.css"/>
	</c:head>
	<c:body onload="SingleBox.doLoad()">
		<div class=QsMiddleAlign><div><script>document.write(SingleBox.information);</script></div></div>
		<div id="BoxPanel"></div>
	</c:body>
</c:html>
