var Mobile =
{
	doTabBarSwitch: function(event)
	{
		var item = event.item;
		var stackId = item.id;
		Jui.basic.Page.setCurrentStack(stackId);
		if (Jui.basic.Page.getCurrentPage() == null) {
			Utility.openPage(item.pageCode);
		}
	},
	
	loadTabBar: function()
	{
		var tabBarData = [
     	    {id:"1", text:"業務", pageCode:"Qs.MobileMenu.Menu", icon:"quicksilver-mobile/image/40/Business.png"},
     	    {id:"2", text:"訊息", pageCode:"Qs.Page.MobileInDevelopment", icon:"quicksilver-mobile/image/40/Message.png"},
     	    {id:"3", text:"設置", pageCode:"Qs.Parameter.MobileUser", icon:"quicksilver-mobile/image/40/Config.png"}
     	];
		Mobile.tabBar.load(tabBarData);
	}
};

window.onload = function()
{
	var pageContainer = $elem("PageContainer");
	Jui.dom.addClass(pageContainer, "JuiPageContainerFullScreen");
	Jui.basic.Page.setContainer(pageContainer); 

	var tabContainer = $elem("TabContainer");
	tabContainer.style.display = "none";
	Mobile.tabBar = Jui.option.TabBar.create({
		target		: "TabContainer",
		onswitch	: Mobile.doTabBarSwitch
	});
	
	var options = {
		hasNavBar	: false,
		scrollable	: false,
		scripts		: ["quicksilver-mobile/page/user/Login.css", "quicksilver-mobile/page/user/Login.js"],
	};
	Utility.openPage(null, null, options);
};
