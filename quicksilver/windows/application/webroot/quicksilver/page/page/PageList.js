var PageList =
{
	doAddToMenu: function()
	{
		var args = {relationId:"8cdf5a03-eb6a-4601-9163-781dc82d2d7c", closeAfterSave:true};
		args.masterEntityId = list.getSelectedKeys()[0];
		if (args.masterEntityId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		CommonBusiness.openEntity("Qs.Menu", args, "Dialog");
	}
};
