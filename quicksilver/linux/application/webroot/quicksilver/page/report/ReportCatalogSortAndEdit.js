var ReportCatalogSortAndEdit =
{
	doLoad: function()
	{
		SortAndEdit.form.getControl("FParentId").onbeforedrop = ReportCatalogSortAndEdit.doParentBoxBeforeDrop;
	},
	
	doParentBoxBeforeDrop: function()
	{
		SortAndEdit.form.getControl("FParentId").loadItems(SortAndEdit.sorter.getData());
	}
};
