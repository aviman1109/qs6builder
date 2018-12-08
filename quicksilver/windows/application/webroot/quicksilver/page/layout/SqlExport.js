var SqlExport =
{
	doLoad: function()
	{
		SqlExport.list = Jui.option.List.create({
			target			: "QsContent",
			multiPage		: false,
			ondoubleclick	: SqlExport.doListDoubleClick,
			hasCollection	: false
		});

		var dsItems = [];
		for (var i = 0, ds = clientData.dataSources; i < ds.length; ++i) {
			dsItems.push({text:ds[i]});
		}
		toolBar.getItem("DataSource").loadItems(dsItems);
		toolBar.getItem("DataSource").setValue(clientData.dataSourceId);
		var listTitleJson = {"keyField":"table", "nameField":"table", "fields":[
			{name:"table", title:$text("Qs.SqlExport.Table"), control:"InputBox", width:250},
			{name:"unit",  title:$text("Public.Unit"), control:"InputBox"}
		]};
		SqlExport.list.loadTitle(listTitleJson);
		SqlExport.list.loadData(clientData.tableListData);
		SqlExport.dataSourceId = clientData.dataSourceId;
	},

	doDataSourceChange: function()
	{
		var args = {dataSourceId:toolBar.getItem("DataSource").getValue()};
		if (!Jui.string.isEmpty(args.dataSourceId)) {
			Utility.invoke("Qs.Export.getTableListData", args, true, function(ret) {
				SqlExport.list.loadData(ret.tableListData);
				SqlExport.dataSourceId = args.dataSourceId;
			});
		}
	},

	doExport: function()
	{
		var args = {dataSourceId:SqlExport.dataSourceId, tableNames:SqlExport.list.getSelectedKeys()};
		if (args.tableNames.length == 0) {
			Jui.message.alert($text("Qs.SqlExport.SelectTableAlert"));
			return;
		}
		Utility.download("Qs.Export.exportTables", args);
	}
};
