var ParameterGroupSortAndEdit =
{
	doLoad: function()
	{
		SortAndEdit.form.getControl("FParentId").onbeforedrop = ParameterGroupSortAndEdit.doParentBoxBeforeDrop;
	},

	doParentBoxBeforeDrop: function()
	{
		var items = [];
		for (var i = 0, data = SortAndEdit.sorter.getData(); i < data.length; ++i) {
			if (data[i].level == 1) {
				items.push({value:data[i].value, text:data[i].text});
			}
		}
		SortAndEdit.form.getControl("FParentId").loadItems(items);
	}
};
