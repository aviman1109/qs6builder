var ListList =
{
	doLoad: function()
	{
	},

	doOrderConfig: function()
	{
		var keys = list.getSelectedKeys();
		if (keys.length == 0) {
			alert($text("Public.SelectAlert"));
			return;
		}
		var args = {unitId:clientData.masterEntityId, contextId:keys[0]};
		Utility.openDialog("Qs.Field.OrderConfig.page", args);
	}
};
