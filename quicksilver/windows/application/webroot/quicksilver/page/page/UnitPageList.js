var UnitPageList =
{
	SLAVE_RELATION_ID: "8a085dc2-a218-480e-a85f-53d9dcf05d82",
		
	doTypeClick: function()
	{
		EntityList.relationId = toolBar.getItem("Type").getValue();
		EntityList.query();
	},
	
	doPlatformClick: function()
	{
		EntityList.query();
	},

	doSlavePageConfig: function(event)
	{
		var args = {entityId:clientData.masterEntityId, isMobile:/Mobile/.test(event.id)};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.Page.SlavePageConfig.page", args, options, function() {
			list.refresh();
		});
	}
};

EntityList.recordQuery = function()
{
	var item = EntityList.$recordQuery();
	item.relationBoxValue = toolBar.getItem("Type").getValue();
};

EntityList.restoreQuery = function(index)
{
	var item = EntityList.$restoreQuery(index);
	toolBar.getItem("Type").setValue(item.relationBoxValue); 
};

EntityList.getArguments = function()
{
	var args = EntityList.$getArguments();
	if (EntityList.relationId == UnitPageList.SLAVE_RELATION_ID) {
		args.order = ["FIndex"];
		args.conditions = [{fieldName:"FIsSlavePage", operator:"Equal", value:1}];
	}
	args.platform = toolBar.getItem("Platform").getValue();
	return args;
};