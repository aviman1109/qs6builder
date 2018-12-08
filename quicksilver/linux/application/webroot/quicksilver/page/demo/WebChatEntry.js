var QsWebChatEntry = 
{
	basePath: null,
	
	buttonId: "QsWebChatEntryButton",
	
	paneId: "QsWebChatEntryPane",
	
	initialize: function()
	{
		var scripts = document.getElementsByTagName("script");
		var script = scripts[scripts.length - 1];
		QsWebChatEntry.basePath = script.src.replace(/[^\/]*$/, "") + "../../..";
		if (document.body == null) {
			window.addEventListener("load", QsWebChatEntry.createButton);
		}
		else {
			QsWebChatEntry.createButton();
		}
	},
	
	createButton: function()
	{
		if (document.getElementById(QsWebChatEntry.buttonId) != null) {
			return;
		}
		var button						= document.createElement("div");
		button.id						= QsWebChatEntry.buttonId;
		button.style.position			= "fixed";
		button.style.bottom				= "0px";
		button.style.right				= "15px";
		button.style.width				= "120px";
		button.style.height				= "33px";
		button.style.backgroundColor	= "rgba(80,80,160,0.8)";
		button.style.textAlign			= "center";
		button.style.lineHeight			= "30px";
		button.style.fontSize			= "14px";
		button.style.fontFamily			= "Arial,sans-serif";
		button.style.cursor				= "pointer";
		button.style.color				= "#FFFFFF";
		button.innerHTML				= "Chat Now";
		button.onclick					= QsWebChatEntry.doButtonClick;
		document.body.appendChild(button);
	},
	
	doButtonClick: function()
	{
		if (typeof WebSocket == "undefined") {
			var message = "Your browser is not supported. "
						+ "Please upgrade to IE10+, or the latest version of Chrome/Firefox/Safari.";
			alert(message); 
			return;
		}
		
		var pane = document.getElementById(QsWebChatEntry.paneId);
		if (pane == null) {
			var pane = document.createElement("div");
			pane.id = QsWebChatEntry.paneId;
			with (pane.style) {
				position		= "fixed";
				left			= "20%";
				top				= "10%";
				width			= "60%";
				height			= "80%";
				padding			= "30px 6px 6px 6px";
				backgroundColor	= "rgba(80,80,160,0.8)";
				fontSize		= "16px";
				cursor			= "default";
				boxSizing		= "border-box";
				resize			= "both";
				border			= "1px solid #404080";
			}
			var closeImage		= "iVBORw0KGgoAAAANSUhEUgAAAAsAAAAJAQMAAADeqkRuAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMA"
								+ "QObYZgAAAB5JREFUCNdjePCAofAAg3UDgzwDAx8DkASygSJAcQBm0welRg1/ZwAAAABJRU5ErkJggg==";
			pane.innerHTML		= "<div style='position:absolute;top:0px;width:100%;height:30px;line-height:30px;"
								+	"color:#FFFFFF;text-align:center'>"
								+   "WebChat Demo"
								+ "</div>"
								+ "<div style='position:absolute;top:0px;right:6px;height:25px;width:50px;"
								+ 	"background-color:#303060;"
								+ 	"background-repeat:no-repeat;background-position:center center;"
								+ 	"background-image:url(data:image/png;base64," + closeImage + ")'"
								+ 	" onclick=QsWebChatEntry.doCloseButtonClick()></div>"
								+ "<iframe frameborder=no style='width:100%;height:100%;background-color:#F7F7FF'>"
								+ "</iframe>";
			pane.lastChild.src	= QsWebChatEntry.basePath + "/Qs.Demo.WebChat.page";
			document.body.appendChild(pane);
		}
		pane.style.display = "block";
 	},
 	
 	doCloseButtonClick: function()
 	{
		var pane = document.getElementById(QsWebChatEntry.paneId);
		pane.style.display = "none";
 	}
};

QsWebChatEntry.initialize();
