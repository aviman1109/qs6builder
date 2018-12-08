var ReportList =
{
	doCatalogConfig: function()
	{
		var options = CommonBusiness.defaultDialogOptions.sortAndEdit;
		Utility.openDialog("Qs.ReportCatalog.SortAndEdit.page", null, options, function(ret) {
			if (ret.modified) {
				EntityList.reloadTree();
				EntityList.doRefresh();
			}
		});
	},

	doPreview: function()
	{
		var reportId = list.getSelectedKeys()[0];
		if (reportId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var features = "status=yes,toolbar=no,menubar=no,location=no,resizable=yes,width=900,height=600";
		Utility.openWindow("Qs.Report.Show.page", {reportId:reportId}, "_blank", features);
	},
	
	doAddToMenu: function()
	{
		var reportId = list.getSelectedKeys()[0];
		if (reportId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Qs.Report.getMenuEditInitData", {reportId:reportId}, true, function(ret) {
			var args = {
				multiAdd		: false,
				closeAfterSave	: true,
				initData		: ret
			};
			CommonBusiness.openEntity("Qs.Menu", args, "Dialog");
		});
	},

	doAddToHomepage: function() {
		var args = {
			editId			: "c3470bbc-1381-4038-9b7f-323abee59825",
			relationId		: "d2ff723c-da67-42d7-9a7b-91909192c4d5",
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
		var args = {reportId:list.getSelectedKeys()[0]};
		if (args.reportId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.download("Qs.Report.exportSql", args);
	},
	
	doSqlExportAll: function()
	{
		Utility.download("Qs.Report.exportSql", {exportAll:true});
	}
};
