PageLoader.defineScript("Demo.ContactList",  
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
		var args = {title:event.data.FName};
		var page = Jui.basic.Page.open(args);
		PageLoader.load(page, args);
	}
});
