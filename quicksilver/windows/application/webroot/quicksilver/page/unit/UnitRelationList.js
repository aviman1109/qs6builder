var UnitRelationList =
{
	doDirectionClick: function()
	{
		EntityList.relationId = toolBar.getItem("Direction").getValue();
		EntityList.query();
	},

	doGenerateSlavePage: function()
	{
		var args = {relationId:list.getSelectedKeys()[0]};
		if (args.relationId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog("Qs.Page.SlavePageGenerate.page", args);
	}
};

EntityList.recordQuery = function()
{
	var item = EntityList.$recordQuery();
	item.relationBoxValue = toolBar.getItem("Direction").getValue();
};

EntityList.restoreQuery = function(index)
{
	var item = EntityList.$restoreQuery(index);
	toolBar.getItem("Direction").setValue(item.relationBoxValue); 
};
