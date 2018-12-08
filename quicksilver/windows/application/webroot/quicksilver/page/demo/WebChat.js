var WebChat =
{
	webSocket: null,
	
	messageQueue : [],
	
	doLoad: function()
	{
		WebChat.createWebSocket();
	},
	
	doWebSocketOpen: function()
	{
		WebChat.webSocket = this;
		WebChat.addMessage("Center", "WebSocket connection opened.");
		while (WebChat.messageQueue.length > 0) {
			var content = WebChat.messageQueue.shift();
			WebChat.webSocket.send(JSON.stringify({content:content}));
		}
	},
	
	doWebSocketClose: function()
	{
		WebChat.webSocket = null;
		WebChat.addMessage("Center", "WebSocket connection closed.");
	},
	
	doWebSocketError: function(event)
	{
		WebChat.addMessage("Center", event.data);
	},

	doWebSocketMessage: function(event)
	{
		WebChat.addMessage("Left", JSON.parse(event.data).content);
	},
	
	doSendClick: function()
	{
		var editor = $elem("Editor");
		var content = editor.value;
		if (Jui.string.isEmpty(content)) {
			Jui.message.alert("Please input the message.");
			return;
		}
		editor.value = "";
		editor.focus();
		WebChat.addMessage("Right", content);
		if (WebChat.webSocket == null) {
			WebChat.messageQueue.push(content);
			WebChat.createWebSocket();
		}
		else {
			WebChat.webSocket.send(JSON.stringify({content:content}));
		}
	},
	
	createWebSocket: function()
	{
		var url				= location.href.replace(/[^\/]*$/, "websocket/outer/Qs.Demo.Echo").replace(/^http/, "ws");
   		var webSocket 		= new WebSocket(url);
	    webSocket.onopen	= WebChat.doWebSocketOpen;
   		webSocket.onclose	= WebChat.doWebSocketClose;
   		webSocket.onmessage	= WebChat.doWebSocketMessage;
   		webSocket.onerror	= WebChat.doWebSocketError;
	},
	
	addMessage: function(align, content)
	{
		var elem = $elem("MessageList");
		var html = "<div class=Message" + align + "><div class=MessageContent>" + Jui.$h(content) + "</div></div>";
		Jui.dom.insertHtml(elem, "BeforeEnd", html);
		elem.scrollTop = elem.scrollHeight;
	}
};

window.onload = WebChat.doLoad;
