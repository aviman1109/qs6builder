var ChartCatalogSortAndEdit =
{
	doLoad: function()
	{
		SortAndEdit.form.getControl("FParentId").onbeforedrop = ChartCatalogSortAndEdit.doParentBoxBeforeDrop;
	},
	
	doParentBoxBeforeDrop: function()
	{
		SortAndEdit.form.getControl("FParentId").loadItems(SortAndEdit.sorter.getData());
	}
};
