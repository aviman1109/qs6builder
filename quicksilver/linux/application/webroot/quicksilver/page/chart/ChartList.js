var ChartList =
{
	doCatalogConfig: function()
	{
		var options = CommonBusiness.defaultDialogOptions.sortAndEdit;
		Utility.openDialog("Qs.ChartCatalog.SortAndEdit.page", null, options, function(ret) {
			if (ret.modified) {
				EntityList.reloadTree();
				EntityList.doRefresh();
			}
		});
	},

	doPreview: function()
	{
		var chartId = list.getSelectedKeys()[0];
		if (chartId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog("Qs.Chart.Show.page", {chartId:chartId});
	},
	
	doAddToMenu: function()
	{
		var chartId = list.getSelectedKeys()[0];
		if (chartId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Qs.Chart.getMenuEditInitData", {chartId:chartId}, true, function(ret) {
			var args = {
				multiAdd		: false,
				closeAfterSave	: true,
				initData		: ret
			};
			CommonBusiness.openEntity("Qs.Menu", args, "Dialog");
		});
	},

	doAddToHomepage: function()
	{
		var args = {
			editId			: "f6f4ec41-5e7d-41f0-8872-8f22fe55a581",
			relationId		: "4e303ccd-11db-4aee-bc7b-688486eb3959",
			masterEntityId	: list.getSelectedKeys()[0],
			multiAdd		: false
		};
		if (args.masterEntityId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		CommonBusiness.openEntity("Qs.HomepageItem", args, "Dialog");
	},
	
	doSqlExportCurrent: function()
	{
		var args = {chartId:list.getSelectedKeys()[0]};
		if (args.chartId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.download("Qs.Chart.exportSql", args);
	},
	
	doSqlExportAll: function()
	{
		Utility.download("Qs.Chart.exportSql", {exportAll:true});
	}
};
