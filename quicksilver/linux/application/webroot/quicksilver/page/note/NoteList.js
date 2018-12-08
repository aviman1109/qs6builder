var NoteList = {};

clientData.defaultToolBarJson = clientData.toolBarJson;

clientData.toolBarJson = {right:[
	{"control":"Button", "text":$text("Qs.ToolItem.Add"),		"icon":"quicksilver/image/16/Add.png",		"onclick":"EntityList.doAdd"},
	{"control":"Button", "text":$text("Qs.ToolItem.Open"), 		"icon":"quicksilver/image/16/Open.png",		"onclick":"EntityList.doOpen"},
	{"control":"Button", "text":$text("Qs.ToolItem.Delete"),	"icon":"quicksilver/image/16/Delete.png",	"onclick":"EntityList.doDelete"},
	{"control":"Button", "text":$text("Qs.ToolItem.Refresh"),	"icon":"quicksilver/image/16/Refresh.png",	"onclick":"EntityList.doRefresh"}
]};
