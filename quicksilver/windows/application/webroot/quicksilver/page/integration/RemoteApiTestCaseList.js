var RemoteApiTestCaseList =
{
	doRun: function()
	{
		var args = {entityId:list.getSelectedKeys()[0]};
		if (args.entityId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog("Qs.RemoteApiTestCase.Run.page", args);
	}
};
