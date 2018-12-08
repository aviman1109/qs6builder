var UnitList =
{
	doBatchExport: function()
	{
		Utility.openDialog("Qs.Unit.Export.page");
	}
};

EntityList.getDeleteConfirmMessage = function()
{
	return $text("Qs.Unit.DeleteConfirm");
};
