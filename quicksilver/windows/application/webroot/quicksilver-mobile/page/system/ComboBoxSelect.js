Utility.defineScript("Qs.Mobile.ComboBoxSelect",
{
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var body = Jui.basic.Page.getBody(page);
		this.list = Jui.basic.PickList.create({
			target	: body,
			value	: page.args.value,
			items	: page.args.items,
			onclick	: Qs.Mobile.ComboBoxSelect.doItemClick
		});
	},
	
	doItemClick: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (!page.args.multiSelect) {
			Jui.basic.Page.close(page, event.value);
		}
	}
});
