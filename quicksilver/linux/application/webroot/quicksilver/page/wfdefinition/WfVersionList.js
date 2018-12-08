var WfVersionList =
{
	doSetActive: function()
	{
		var args = {versionId:list.getSelectedKeys()[0]};
		if (args.versionId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Wf.Version.setActive", args, true, function(ret) {
			alert($text("Public.OperationSuccess"));
			list.refresh();
		});
	}
};
