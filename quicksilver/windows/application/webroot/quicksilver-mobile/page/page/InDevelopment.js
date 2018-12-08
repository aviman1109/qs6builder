Utility.defineScript("Qs.Page.InDevelopment",
{
	list: null,
	
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var body = Jui.basic.Page.getBody(page);
		body.innerHTML	= "<div style='text-align:center;padding-top:20px'>"
						+ "页面开发中，请等待。"
						+ "</div>";
	}
});
