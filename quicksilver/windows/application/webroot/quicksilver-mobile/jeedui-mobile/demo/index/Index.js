var Index = 
{
	tabBar: null,
	
	defaultPages:
	{
		"1" : {
			title	: "功能演示",
			button	: {icon:"demo/image/ios7/1-01.png", onclick:"Index.doRefresh"},
			dataUrl	: "demo/index/FunctionDemo.json",
			scripts	: ["demo/index/FunctionDemo.js"]
		},
		"2" : {
			title	: "信息",
			scripts	: ["demo/index/Message.js"]
		},
		"3" : {
			title	: "设置",
			scripts	: ["demo/index/Config.js"]
		}
	},
	
	doLoad: function()
	{
		Jui.basic.Page.setContainer(Jui.dom.element("PageContainer"));
		
		var tabBarData = [
		    {id:"1", text:"业务", icon:"demo/image/Function.png"},
		    {id:"2", text:"信息", icon:"demo/image/Message.png"},
		    {id:"3", text:"设置", icon:"demo/image/Config.png"}
		];
		Index.tabBar = Jui.option.TabBar.create({target:"TabContainer", onswitch:Index.doMainTabSwitch});
		Index.tabBar.load(tabBarData);
	},
	
	doMainTabSwitch: function(event)
	{
		var stackId = event.item.id;
		Jui.basic.Page.setCurrentStack(stackId);
		if (Jui.basic.Page.getCurrentPage() == null) {
			var args = Index.defaultPages[stackId];
			var page = Jui.basic.Page.open(args);
			PageLoader.load(page, args);
		}
	},
	
	doRefresh: function()
	{
		window.location.reload(true);
	}
};
