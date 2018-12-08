var ClusterNodeChart =
{
	doLoad: function()
	{
		var args = {nodeId:clientData.urlArgs.masterEntityId};
		Utility.invoke("Qs.ClusterNode.getChartData", args, true, function(ret) {
			var cpu = {chart:Chart.getCommonProperties()};
			cpu.chart.caption = "CPU";
			cpu.chart.yaxismaxvalue = 100;
			cpu.chart.numbersuffix = "%";
			cpu.data = [];
			var memory = {chart:Chart.getCommonProperties()};
			memory.chart.caption = "Memory";
			memory.chart.numbersuffix = "MB";
			memory.chart.yaxismaxvalue = ret.performance.memoryTotal;
			memory.data = [];
			var jvmMemory = {chart:Chart.getCommonProperties()};
			jvmMemory.chart.caption = "JVM Memory";
			jvmMemory.chart.numbersuffix = "MB";
			jvmMemory.data = [];
			var dbResponseTime = {chart:Chart.getCommonProperties()};
			dbResponseTime.chart.caption = "Database Response Time";
			dbResponseTime.categories = [{category:[]}];
			dbResponseTime.chart.numberSuffix = "ms";
			dbResponseTime.dataset = [
			    {color:"0000FF", seriesname:"Read", data:[]},
			    {color:"FF6000", seriesname:"Write", data:[]}
			];
			var dbFrequency = {chart:Chart.getCommonProperties()};
			dbFrequency.chart.caption = "Database Operation Frequency (op/s)";
			dbFrequency.categories = [{category:[]}];
			dbFrequency.dataset = [
			    {color:"0000FF", seriesname:"Read", data:[]},
			    {color:"FF6000", seriesname:"Write", data:[]}
			];
			for (var i = 0; i < ret.performance.items.length; ++i) {
				var item = ret.performance.items[i];
				cpu.data.push({value:item.cpuUsed});
				memory.data.push({value:item.memoryUsed});
				jvmMemory.data.push({value:item.jvmMemoryUsed});
				dbFrequency.categories[0].category.push({label:""});
				dbFrequency.dataset[0].data.push({value:item.dbReadFrequency});
				dbFrequency.dataset[1].data.push({value:item.dbWriteFrequency});
				dbResponseTime.categories[0].category.push({label:""});
				dbResponseTime.dataset[0].data.push({value:item.dbReadResponseTime});
				dbResponseTime.dataset[1].data.push({value:item.dbWriteResponseTime});
			}
			var data = [cpu, memory, jvmMemory, dbResponseTime, dbFrequency];
			var chartIds = ["Cpu", "Memory", "JvmMemory", "DbResponseTime", "DbFrequency"];
			for (var i = 0; i < data.length; ++i) {
				data[i].chart.formatnumberscale = "0";
				data[i].chart.showvalues = "0";
				data[i].chart.linecolor = "FF6000";
				data[i].chart.linethickness = "2";
				data[i].chart.drawanchors = "0";
				data[i].chart.canvasborderthickness = "1";
				var flashPath = "quicksilver/fusioncharts/" + (i < 3 ? "Line.swf" : "MSLine.swf");
				var chart = new FusionCharts(flashPath, chartIds[i], "100%", "100%", "0", "1");
				chart.setJSONData(data[i]);
				chart.render($elem("" + chartIds[i] + "Panel"));
			}
			
			var content = $elem("QsContent");
			flashPath = "quicksilver/fusioncharts/Pie2D.swf";
			for (var i = 0; i < ret.fileSystems.length; ++i) {
				var fs = ret.fileSystems[i];
				var json = {
					chart	: Chart.getCommonProperties(),
					data	: [
					    {value:fs.spaceAvailable, 	label:"Available", 	color:"FF00FF"},
					    {value:fs.spaceUsed, 		label:"Used", 		color:"0000FF"}
					]
				};
				json.chart.caption = fs.dirName + (fs.dirName == fs.name ? "" : " (" + fs.name + ")");
				json.chart.startingangle = "180";
				json.chart.numbersuffix = "GB";
				var containerId = "PiePanel" + i;
				var chartId = "PieChart" + i;
				Jui.dom.insertHtml(content, "BeforeEnd", "<div id=" + containerId + "></div>");
				var chart = new FusionCharts(flashPath, chartId, "100%", "100%", "0", "1");
				chart.setJSONData(json);
				chart.render(containerId);
			}
		});
	},
	
	doRefresh: function()
	{
		window.location.reload();
	}
};
