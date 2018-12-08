var SqlExecute =
{
	doLoad: function()
	{
		SqlExecute.sqlBox = Jui.basic.TextBox.create({
			target		: "SqlZone",
			style		: "width:100%;height:100%",
			wrap		: "off",
			onkeydown	: SqlExecute.doSqlBoxKeyDown,
			onchange	: SqlExecute.doSqlBoxChange
		});
		SqlExecute.tabStrip = Jui.option.TabStrip.create({
			target		: "ResultZone"
		});
		SqlExecute.list = Jui.option.List.create({
			target		: "ListPanel",
			multiPage	: true,
			multiSelect	: false,
			onquery		: SqlExecute.doListPageChange
		});

		var dsItems = [];
		for (var i = 0, ds = clientData.dataSources; i < ds.length; ++i) {
			dsItems.push({text:ds[i]});
		}
		toolBar.getItem("DataSource").loadItems(dsItems);
		toolBar.getItem("DataSource").setValue(clientData.dataSourceId);
		
		SqlExecute.tabStrip.load([
		    {id:"Log", 			text:$text("Qs.SystemTool.SqlExecute.Log"), 		body:"LogPanel"},
		    {id:"ResultSet", 	text:$text("Qs.SystemTool.SqlExecute.ResultSet"), 	body:"ListPanel"}
		]);
		Jui.option.Resizer.create({elements:["SqlZone", "ResultZone"], offset:-2, shrinks:[8, 8]});
		
		var sql = localStorage.getItem("Qs.SqlExecute.Content");
		if (!Jui.string.isEmpty(sql)) {
			SqlExecute.sqlBox.setValue(sql);
		}
	},
	
	doExecute: function()
	{
		var args = {
			dataSource	: toolBar.getItem("DataSource").getValue(),
			sql			: SqlExecute.sqlBox.getSelectedText() || SqlExecute.sqlBox.getValue()
		};
		if (!Jui.string.isEmpty(args.sql)) {
			if (clientData.requireCaptcha) {
				var host = location.href.replace(/^http(s?):\/\//, "").replace(/(\:|\/).*/, "");
				var message = $text("Qs.Misc.SqlExecuteCaptchaMessage").replace("${0}", host);
				Utility.showCaptcha(message, function() {
					SqlExecute.execute(args);
				});
			}
			else {
				SqlExecute.execute(args);
			}
		}
	},

	execute: function(args)
	{
		Utility.invoke("Qs.Misc.executeSql", args, true, function(ret) {
			SqlExecute.tabStrip.setCurrentId(ret.list == null ? "Log" : "ResultSet");
			SqlExecute.loadLogs(ret.logs);
			SqlExecute.loadList(ret.list);
		});
	},
	
	doExportResult: function()
	{
		if (SqlExecute.sql == null) {
			Jui.message.alert($text("Qs.SystemTool.SqlExecute.QueryBeforeExportAlert"));
			return;
		}
		var args = {
			dataSource	: toolBar.getItem("DataSource").getValue(),
			sql			: SqlExecute.sql				
		};
		Utility.download("Qs.Misc.exportResultSet", args);
	},
	
	doClearCache: function()
	{
		Jui.message.confirm($text("Qs.Cache.ClearConfirm"), function() {
			Utility.invoke("Qs.Monitor.clearCache", null, true, function() {
				Jui.message.hint($text("Qs.Cache.ClearSuccess"));
			});
		});
	},

	doSqlBoxKeyDown: function()
	{
		if (event.keyCode == 13 && event.ctrlKey) {
			SqlExecute.doExecute();
		}
	},
	
	doSqlBoxChange: function()
	{
		localStorage.setItem("Qs.SqlExecute.Content", SqlExecute.sqlBox.getValue());
	},
	
	loadLogs: function(logs)
	{
		var buffer = [];
		for (var i = 0; i < logs.length; ++i) {
			var log = logs[i];
			buffer.push("<div class='Log " + log.status + "'>");
			buffer.push(Jui.$h(log.message) + " <label class=sql>(" + Jui.$h(log.sql) + ")</label>");
			buffer.push("</div>");
		}
		$elem("LogPanel").innerHTML = buffer.join("");
	},
	
	loadList: function(list)
	{
		$elem("ListPanel").style.display = list == null ? "none" : "block";
		SqlExecute.sql = list == null ? null : list.sql;
		SqlExecute.dataSource = toolBar.getItem("DataSource").getValue();
		if (list != null) {
			var fields = [];
			for (var i = 0; i < list.columns.length; ++i) {
				var column = list.columns[i];
				fields.push({name:column.name, title:column.name, align:column.align, control:"InputBox"});
			}
			SqlExecute.list.setShowPageCount(false);
			SqlExecute.list.setShowPageCountVisible(!list.isProcedure);
			SqlExecute.list.setPageJumpEnabled(!list.isProcedure);
			SqlExecute.list.loadTitle(fields);
			SqlExecute.list.loadData(list);
		}
	},
	
	doListPageChange: function(event)
	{
		var args = Jui.object.merge({
			dataSource		: SqlExecute.dataSource,
			sql				: SqlExecute.sql,
			showPageCount	: SqlExecute.list.isShowPageCount()
		}, event.arguments);
		Utility.invoke("Qs.Misc.getSqlResultList", args, true, function(ret) {
			SqlExecute.list.loadData(ret.list);
		}, {progressBar:{text:$text("Public.GettingData")}});
	}
};
