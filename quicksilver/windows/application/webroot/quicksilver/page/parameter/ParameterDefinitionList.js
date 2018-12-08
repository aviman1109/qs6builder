var ParameterDefinitionList =
{
	doGroupConfig: function()
	{
		var options = CommonBusiness.defaultDialogOptions.sortAndEdit;
		Utility.openDialog("Qs.ParameterGroup.SortAndEdit.page", null, options, function(ret) {
			if (ret.modified) {
				EntityList.doRefresh();
			}
		});
	},

	doSort: function()
	{
		var options = CommonBusiness.defaultDialogOptions.sort;
		Utility.openDialog("Qs.ParameterDefinition.Sort.page", null, options, function() {
			EntityList.doRefresh();
		});
	},

	doSqlExport: function()
	{
		Utility.download("Qs.ParameterDefinition.exportSql");
	}
};
