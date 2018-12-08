var RoleChart =
{
	doSave: function()
	{
		var args = {roleId:clientData.roleId, chartIds:MultiTree.getSelectedIds()};
		Utility.invoke("Qs.Chart.setRoleCharts", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	}
};
