var EditList = 
{
	doLoad: function()
	{
	},

	doSlavePageConfig: function(event)
	{
		var keys = list.getSelectedKeys();
		if (keys.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var args = {entityId:keys[0], isMobile:/Mobile/.test(event.id)};
		if (args.entityId != null) {
			var options = CommonBusiness.defaultDialogOptions.doubleSorter;
			Utility.openDialog("Qs.Edit.SlavePageConfig.page", args, options);
		}
	}
};
