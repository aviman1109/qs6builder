<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,List,Resizer">
		<c:script src="quicksilver/page/misc/SqlExecute.js"/>
		<c:css src="quicksilver/page/misc/SqlExecute.css"/>
	</c:head>
	<c:body onload="SqlExecute.doLoad()">
		<div id="SqlZone"></div>
		<div id="ResultZone">
			<div id="LogPanel"></div>
			<div id="ListPanel"></div>
		</div>
	</c:body>
</c:html>
