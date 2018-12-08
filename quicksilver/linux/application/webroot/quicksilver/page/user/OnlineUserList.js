var OnlineUserList =
{
	doKickOut: function()
	{
		var args = {entityIds:list.getSelectedKeys()};
		if (args.entityIds.length == 0) {
			alert($text("Public.SelectAlert"));
			return;
		}
		if (confirm($text("Qs.OnlineUser.DisconnectConfirm"))) {
			Utility.invoke("Qs.OnlineUser.kickOut", args, true, function(ret) {
				alert($text("Public.OperationSuccess"));
				list.deleteSelectedRows();
			});
		}
	}
};
