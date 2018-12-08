<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/demo/WebChat.js"/>
		<c:css src="quicksilver/page/demo/WebChat.css"/>
	</c:head>
	<c:body toolbar="false">
		<div class=MessageZone>
			<div id=MessageList></div>
			<textarea id=Editor></textarea>
		</div>
		<div class=ButtonZone <%="unselectable=on"%>>
			<div class=Button onclick=WebChat.doSendClick()>Send</div>
		</div>
	</c:body>
</c:html>
