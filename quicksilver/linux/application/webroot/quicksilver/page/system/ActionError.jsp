<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/system/ActionError.js"/>
		<c:css src="quicksilver/page/system/Error.css"/>
	</c:head>
	<c:body>
		<div id="TitleZone">
			<span><script>document.write(Jui.$h(clientData.urlArgs.message))</script></span>
		</div>
		<div id="DetailZone" style="display:none"></div>
	</c:body>
</c:html>
