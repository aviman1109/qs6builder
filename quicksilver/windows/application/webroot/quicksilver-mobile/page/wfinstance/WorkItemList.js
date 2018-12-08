Utility.defineScript("Qs.WorkItem.List",
{
	onload: function()
	{
		this.list.onclick = Qs.WorkItem.List.doItemClick;
	},
	
	doItemClick: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		var args = {workItemId:event.id, handleOnly:false};
		Utility.invoke("Wf.WorkItem.getHandleInformation", args, true, function(ret) {
			Utility.openPage(ret.mobilePageCode, ret.args, null, function(ret) {
				if (ret != null) {
					page.refresh();
				}
			});
		});
	}
});
