Utility.defineScript("Qs.Menu",
{
	list: null,
	
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		this.list = Jui.option.List.create({
			target	: Jui.basic.Page.getBody(page),
			onclick	: Qs.Menu.doClick
		});
	},
	
	ondata: function(data)
	{
		var titleJson = [{name:"text", control:"InputBox", fontSize:18, height:40}];
		this.list.loadTitle(titleJson);
		this.list.loadData(data.items);
	},
	
	doClick: function(event)
	{
		Utility.openPage(event.data.pageCode, event.data.pageArgs, {title:event.data.text});
	}
});
