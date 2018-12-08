PageLoader.defineScript("Demo.Function",  
{
	onload: function()
	{
		var pageBody = Jui.basic.Page.getBody(this);
		this.list = Jui.option.List.create({target:pageBody});
		this.list.onclick = this.doListClick;
	},
	
	ondata: function(json)
	{
		this.list.load(json);
	},
	
	onunload: function()
	{
		
	},
	
	doListClick: function(event)
	{
		var args = {
			title	: event.data.FName,
			button	: {icon:"demo/image/ios7/1-01.png", onclick:"Index.doRefresh"},
			dataUrl	: "demo/business/ContactList.json",
			scripts	: ["demo/business/ContactList.js"]
		};
		var page = Jui.basic.Page.open(args);
		PageLoader.load(page, args);
	}
});
