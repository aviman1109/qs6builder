Utility.defineScript("Qs.Mobile.DateBoxSelect",
{
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var body = Jui.basic.Page.getBody(page);
		this.picker = Jui.basic.DatePicker.create({
			target		: body,
			value		: page.args.value,
			hasTime		: page.args.hasTime
		});
	},
	
	doConfirm: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		Jui.basic.Page.close(page, page.picker.getValue());
	}
});
