PageLoader.defineScript("Demo.Message",  
{
	onload: function()
	{
		var pageBody = Jui.basic.Page.getBody(this);
		pageBody.innerHTML = "<div style='padding-top:40px;text-align:center'>各种消息，包括提醒信息、Chat等</div>";
	}
});
