var WorkItemList =
{
	doLoad: function()
	{
		list.getControl("FProcessId").onview = WorkItemList.doProcessView;
	},
	
	doOpen: function()
	{
		var workItemId = list.getSelectedKeys()[0];
		if (workItemId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		WorkItemList.open(workItemId);
	},
	
	open: function(workItemId)
	{
		var args = {workItemId:workItemId, handleOnly:false};
		Utility.invoke("Wf.WorkItem.getHandleInformation", args, true, function(ret) {
			if (ret.url == null) {
				CommonBusiness.openEntity("Wf.Process", {entityId:ret.processId}, "Dialog");
			}
			else {
				Utility.openDialog(ret.url, ret.args, CommonBusiness.defaultDialogOptions.info, function() {
					list.refresh();
				});
			}
		});
	},
	
	doProcessView: function()
	{
		var workItemId = list.getHoveringKey();
		if (workItemId != null) {
			WorkItemList.open(workItemId);
		}
	}
};

EntityList.doListDoubleClick = function(event)
{
	WorkItemList.open(event.id);
};
