var RoleReport =
{
	doSave: function()
	{
		var args = {roleId:clientData.roleId, reportIds:MultiTree.getSelectedIds()};
		Utility.invoke("Qs.Report.setRoleReports", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	}
};
