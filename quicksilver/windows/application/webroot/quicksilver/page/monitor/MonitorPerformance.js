var MonitorPerformance =
{
	doLoad: function()
	{
		if (clientData.isClusterEnabled) {
			var nodeBox = toolBar.getItem("Node");
			var items = nodeBox.getItems();
			if (items.length > 0) {
				nodeBox.setValue(items[0].value);
			}
		}
		else {
			toolBar.setItemVisible("Node", false);
			toolBar.setItemVisible("NodeLabel", false);
		}
		toolBar.getItem("Type").setValue("Transaction");
		var fields = [
		    {
		    	name	: "count",
		    	title	: $text("Qs.Performance.Count"),
		    	control	: "InputBox",
		    	type	: "bigint",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "slowCount1",
		    	title	: $text("Qs.Performance.SlowCount", 1),
		    	control	: "InputBox",
		    	type	: "bigint",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "slowCount2",
		    	title	: $text("Qs.Performance.SlowCount", 2),
		    	control	: "InputBox",
		    	type	: "bigint",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "slowCount3",
		    	title	: $text("Qs.Performance.SlowCount", 3),
		    	control	: "InputBox",
		    	type	: "bigint",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "totalMillis",
		    	title	: $text("Qs.Performance.Total"),
		    	control	: "InputBox",
		    	type	: "bigint",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "avgMillis",
		    	title	: $text("Qs.Performance.Average"),
		    	control	: "InputBox",
		    	type	: "int",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "minMillis",
		    	title	: $text("Qs.Performance.Min"),
		    	control	: "InputBox",
		    	type	: "int",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "maxMillis",
		    	title	: $text("Qs.Performance.Max"),
		    	control	: "InputBox",
		    	type	: "int",
		    	align	: "right",
		    	width	: 100
		    },
		    {
		    	name	: "code",
		    	title	: $text("Qs.Performance.Code"),
		    	control	: "InputBox",
		    	width	: 300
		    }
		];
		MonitorPerformance.list = Jui.option.List.create({
			target			: "QsContent",
			multiPage		: false,
			multiSelect		: false,
			showZeroValue	: true
		});
		MonitorPerformance.list.loadTitle({keyField:"code", nameField:"code", fields:fields});
		MonitorPerformance.doRefresh();
	},

	doNodeChange: function()
	{
		if (toolBar.getItem("Node").getValue() != null && toolBar.getItem("Type").getValue() != null) {
			MonitorPerformance.doRefresh();
		}
	},
	
	doTypeChange: function()
	{
		if (toolBar.getItem("Type").getValue() != null) {
			MonitorPerformance.doRefresh();
		}
	},

	doRefresh: function()
	{
		var args = {type:toolBar.getItem("Type").getValue()};
		if (Jui.string.isEmpty(args.type)) {
			alert($text("Qs.Performance.SelectTypeAlert"));
			toolBar.getItem("Type").focus();
			return;
		}
		var url = MonitorPerformance.wrapUrl("Qs.Monitor.getPerformanceListDataJson");
		Utility.invoke(url, args, true, function(ret) {
			MonitorPerformance.list.loadData(ret.data);
		});
	},

	doExcelExport: function()
	{
		Utility.download(MonitorPerformance.wrapUrl("Qs.Monitor.exportPerformance"));
	},
	
	wrapUrl: function(url)
	{
		var node = clientData.isClusterEnabled ? toolBar.getItem("Node").getValue() : null;
		if (node != null) {
			url = "qsvd-" + node + "/" + url;
		}
		return url;
	}
};
