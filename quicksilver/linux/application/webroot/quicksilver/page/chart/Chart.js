var Chart =
{
	FLASH_MAPPING:
	{
		"Column"	: "quicksilver/fusioncharts/ScrollColumn2D.swf",
		"Bar"		: "quicksilver/fusioncharts/MSBar2D.swf",
		"Stack"		: "quicksilver/fusioncharts/ScrollStackedColumn2D.swf",
		"Line"		: "quicksilver/fusioncharts/ScrollLine2D.swf",
		"Pie"		: "quicksilver/fusioncharts/Pie2D.swf",
		"Doughnut"	: "quicksilver/fusioncharts/Doughnut2D.swf"
	},
	
	getCommonProperties: function()
	{
		return {
			animation 			: 1,
			baseFontSize 		: 12,
			palette 			: 2,
			showPrintMenuItem 	: 0,
			decimals 			: 2,
			useRoundEdges		: 1,
			aboutMenuItemLabel	: $text("Qs.Chart.AboutMenuLabel"),
			aboutMenuItemLink 	: "n-" + $text("Qs.System.CompanyHomepage")
		};
	},
	
	getData: function(panel, url, args, callback)
	{
		Chart._hide(panel);
		panel.style.backgroundImage = "url(quicksilver/image/gif/RoundProgressBar.gif)";
		panel.style.backgroundRepeat = "no-repeat";
		panel.style.backgroundPosition = "center center";
		Utility.invoke(url || "Qs.Chart.getChartData", args, true, function(data) {
			panel.style.backgroundImage = "";
			callback(data);
		});
	},

	show: function(panel, data, displayType, showBorder, shortEmptyMessage)
	{
		Chart._hide(panel);
		Chart._gridTable = null;
		if (data.values.length == 0 || (data.allZero && displayType != "Grid")) {
			var tableId = panel.id + "~chart_no_data~";
			if ($elem(tableId) == null) {
				var key = shortEmptyMessage ? "Qs.Chart.ShortEmptyMessage" : "Qs.Chart.EmptyMessage";
				var html = "<table id='" + tableId + "' class=FullSize style='background-color:#FFFFFF'>"
						 + 	"<tr><td align=center>"
						 + 	  "<table style='height:100%;font-size:14px;color:#808080'>"
						 +	    "<tr><td>" + $text(key) + "</td></tr>"
						 +	    "<tr height='20%'><td></td></tr>"
						 +     "</table>"
						 +   "</td></tr>"
						 + "</table>";
				Jui.dom.insertHtml(panel, "BeforeEnd", html);
			}
			$elem(tableId).style.display = "block";
			return;
		}
		
		if (displayType == null) {
			displayType = data.displayType;
		}
		data = Chart._processData(data, displayType, showBorder);
		var containerId = panel.id + "~" + data.flashPath;
		var chartId = panel.id + "~" + data.flashPath + "~chart";
		if ($elem(containerId) == null) {
			var html = "<div id='" + containerId + "' class=ChartContainer></div>";
			var container = Jui.dom.insertHtml(panel, "BeforeEnd", html);
			if (displayType == "Grid") {
				container.setAttribute("grid", true);
				Chart._loadGrid(container, data);
			}
			else {
				var chart = new FusionCharts(data.flashPath, chartId, "100%", "100%", "0", "1");
				data.xml == null ? chart.setJSONData(data) : chart.setDataXML(data.xml);
				chart.render(container);
			}
		}
		else {
			if (displayType == "Grid") {
				Chart._loadGrid($elem(containerId), data);
			}
			else {
				var chart = FusionCharts(chartId);
				data.xml == null ? chart.setJSONData(data) : chart.setDataXML(data.xml);
				chart.render($elem(containerId));
			}
		}
		$elem(containerId).style.display = "block";
	},

	getGridTable: function()
	{
		return Chart._gridTable;
	},
	
	_hide: function(panel)
	{
		for (var i = 0; i < panel.children.length; ++i) {
			panel.children[i].style.display = "none";
		}
	},

	_processData: function(data, displayType, showBorder)
	{
		if (displayType == "Grid") {
			return data;
		}
		if (data.isRawData) {
			var json = {
				flashPath 	: Chart.FLASH_MAPPING[displayType],
				chart	  	: Chart.getCommonProperties()
			};
			json.chart.caption = data.title;
			if (displayType == "Pie" || displayType == "Doughnut") {
				Chart._fillRoundData(json, data);
			}
			else if (data.dimensions.length == 1) {
				Chart._fillRectData(json, data, displayType);
			}
			else {
				Chart._fillMultiSeriesRectData(json, data);
			}
			data = json;
		}
		if (data.chart != null) {
			if (showBorder != null) {
				data.chart.showBorder = showBorder ? "1" : "0";
			}
			data.chart.aboutMenuItemLabel = $text("Qs.Chart.AboutMenuLabel");
			data.chart.aboutMenuItemLink = "n-" + $text("Qs.System.CompanyHomepage");
		}
		return data;
	},
	
	_fillRoundData: function(json, data)
	{
		json.data = [];
		var rand = new Utility.Random(7);
		for (var i = 0, groups = data.dimensions[0].groups; i < groups.length; ++i) {
			var group = groups[i];
			var item = {
				label : group.label,
				value : group.value,
				color : Chart._getRandomColor(rand)
			};
			if (data.linkable) {
				item.link = Chart._getChartLink(data, [group.id]);
			}
			json.data.push(item);
		}
		if (data.values.length < data.groupCount) {
			json.data.push({
				label : $text("Qs.Chart.OtherTitle"),
				value : data.summation - Chart._getCountAndSum(data.values).sum,
				color : Chart._getRandomColor(rand)
			});
		}
	},
	
	_fillRectData: function(json, rawData, displayType)
	{
		var category = [];
		var data = [];
		var rand = new Utility.Random(7);
		var dimension = rawData.dimensions[0];
		for (var i = 0; i < dimension.groups.length; ++i) {
			var group = dimension.groups[i];
			category.push({
				label: group.label
			});
			var item = {value:group.value};
			if (displayType != "Line") {
				item.color = Chart._getRandomColor(rand);
			}
			if (rawData.linkable) {
				item.link = Chart._getChartLink(rawData, [group.id]);
			}
			data.push(item);
		}
		json.chart.xAxisName = rawData.groupTitle1;
		json.chart.yAxisName = rawData.valueTitle;
		json.categories = [{category:category}];
		json.dataset = [{data:data}];
	},
	
	_fillMultiSeriesRectData: function(json, rawData)
	{
		var valueMap = {};
		for (var i = 0; i < rawData.values.length; ++i) {
			var item = rawData.values[i];
			var groups = item.groups;
			if (valueMap[groups[1]] == null) {
				valueMap[groups[1]] = {};
			}
			valueMap[groups[1]][groups[0]] = (valueMap[groups[1]][groups[0]] || 0) + item.value;
		}
		var category = [];
		for (var i = 0, groups = rawData.dimensions[0].groups; i < groups.length; ++i) {
			category.push({
				label: groups[i].label
			});
		}
		var dataset = [];
		for (var i = 0, subgroups = rawData.dimensions[1].groups; i < subgroups.length; ++i) {
			var subgroup = subgroups[i];
			var map = valueMap[subgroup.id];
			var data = [];
			for (var j = 0, groups = rawData.dimensions[0].groups; j < groups.length; ++j) {
				var group = groups[j];
				var value = map[group.id] == null ? "" : map[group.id];
				var item = {value:value};
				if (rawData.linkable) {
					item.link = Chart._getChartLink(rawData, [group.id, subgroup.id]);
				}
				data.push(item);
			}
			dataset.push({
				seriesName	: subgroup.label,
				data		: data
			});
		}
		json.chart.xAxisName = rawData.groupTitle1;
		json.chart.yAxisName = rawData.valueTitle;
		json.categories = [{category:category}];
		json.dataset = dataset;
	},
	
	_getCountAndSum: function(data)
	{
		var result = {count:0, sum:0};
		for (var i = 0; i < data.length; ++i) {
			var item = data[i];
			result.count += item.count;
			result.sum += item.value;
		}
		return result;
	},
	
	_getRandomColor: function(rand)
	{
		var array = [];
		for (var i = 0, n = 6, r = rand.nextInt(0xFFFFFF); i < n; ++i, r >>= 4) {
			var d = r & 0xF;
			array.push(d < 10 ? d : String.fromCharCode(65 + (d - 10)));
		}
		return array.reverse().join("");
	},
	
	_loadGrid: function(panel, data)
	{
		var info = {
			dimensions		: data.dimensions,
			horzDim			: data.gridHorizontalExpand ? data.dimensions[data.dimensions.length - 1] : null,
			vertDimCount	: data.gridHorizontalExpand ? data.dimensions.length - 1 : data.dimensions.length,
			showCount		: !data.gridHorizontalExpand && data.gridShowCount && ("count" in data.values[0]),
			showPercent		: data.gridShowPercent,
			recordCount		: data.recordCount,
			summation		: data.summation,
			linkable		: data.linkable,
			isZeroPercent	: data.gridPercentType == "Zero",
			hasFloatValue	: false,
			root			: {sum:0, count:0, children:{}, values:{}, level:0}
		};
		for (var i = 0; i < info.vertDimCount; ++i) {
			var dim = data.dimensions[i];
			dim.map = {};
			for (var j = 0; j < dim.groups.length; ++j) {
				var groupItem = dim.groups[j];
				groupItem.index = j;
				dim.map[groupItem.id] = groupItem;
			}
		}
		for (var i = 0; i < data.values.length; ++i) {
			var item = data.values[i];
			var horzGroup = info.horzDim == null ? null : item.groups[item.groups.length - 1];  
			var currentNode = info.root;
			if (!info.hasFloatValue && item.value != Math.round(item.value)) {
				info.hasFloatValue = true;
			}
			for (var j = 0; j <= info.vertDimCount; ++j) {
				currentNode.sum += item.value;
				currentNode.count += item.count || 0;
				if (info.horzDim != null) {
					if (currentNode.values[horzGroup] == null) {
						currentNode.values[horzGroup] = 0;
					}
					currentNode.values[horzGroup] += item.value;
				}
				if (j < info.vertDimCount) {
					var group = item.groups[j];
					if (currentNode.children[group] == null) {
						currentNode.children[group] = {sum:0, count:0, values:{}, level:j + 1, group:group};
						if (j < info.vertDimCount - 1) {
							currentNode.children[group].children = {};
						}
					}
					currentNode = currentNode.children[group];
				}
			}
		}
		Chart._calcRowSpan(info.root);
		
		var buffer = [];
		buffer.push("<table class=ChartGridTable>");
		buffer.push("<tr>");
		for (var i = 0; i < info.vertDimCount; ++i) {
			buffer.push("<th>" + data.dimensions[i].title + "</th>");
		}
		if (info.horzDim != null) {
			for (var i = 0; i < info.horzDim.groups.length; ++i) {
				buffer.push("<th>" + info.horzDim.groups[i].label + "</th>");
			}
			buffer.push("<th>" + $text("Qs.Chart.Grid.Total") + "</th>");
		}
		else {
			if (info.showCount) {
				buffer.push("<th>" + $text("Qs.Chart.Grid.Count") + "</th>");
				if (info.showPercent) {
					buffer.push("<th>" + $text("Qs.Chart.Grid.Percentage") + "</th>");
				}
			}
			buffer.push("<th>" + data.valueTitle + "</th>");
		}
		if (info.showPercent) {
			buffer.push("<th>" + $text("Qs.Chart.Grid.Percentage") + "</th>");
		}
		buffer.push("</tr>");
		Chart._fillGridHtml(info.root, [], true, info, buffer);
		buffer.push("</table>");
		
		panel.innerHTML = buffer.join("");
		Chart._gridTable = panel.firstChild;
		if (data.linkable) {
			Chart._data = data;
		}
	},

	_fillGridHtml: function(node, groups, isNewRow, info, buffer)
	{
		if (node.level > 0) {
			if (isNewRow) {
				buffer.push("<tr>");
				isNewRow = false;
			}
			var groupItem = info.dimensions[node.level - 1].map[node.group];
			buffer.push("<td class=GroupCell rowspan=" + node.rowSpan + ">" + groupItem.label + "</td>");
		}
		var hasHorzGroup = info.horzDim != null;
		var horzGroups = hasHorzGroup ? info.horzDim.groups : [];
		if (node.children == null) {
			for (var i = 0; i < horzGroups.length; ++i) {
				var horzGroup = horzGroups[i];
				var value = node.values[horzGroup.id];
				var valueHtml = Chart._getValueHtml(value, groups.concat(horzGroup.id), info);
				buffer.push("<td>" + valueHtml + "</td>");
			}
			if (info.showCount) {
				buffer.push("<td>" + node.count + "</td>");
				if (info.showPercent) {
					var percent = Chart._calcPercent(node.count, info.root.count);
					buffer.push("<td class=PercentageCell>" + percent + "</td>");
				}
			}
			var valueHtml = Chart._getValueHtml(node.sum, groups, info);
			buffer.push("<td" + (hasHorzGroup ? " class=TotalValueCell" : "") + ">" + valueHtml + "</td>");
			if (info.showPercent) {
				var percent = info.isZeroPercent ? "" : Chart._calcPercent(node.sum, info.root.sum);
				buffer.push("<td class='" + (hasHorzGroup ? "TotalValueCell " : "") + "PercentageCell'>" + percent + "</td>");
			}
			buffer.push("</tr>");
		}
		else {
			var list = [];
			for (var key in node.children) {
				list.push(node.children[key]);
			}
			var groupMap = info.dimensions[node.level].map;
			list.sort(function(a, b) {
				return groupMap[a.group].index - groupMap[b.group].index;
			});
			for (var i = 0; i < list.length; ++i) {
				Chart._fillGridHtml(list[i], groups.concat(list[i].group), i > 0 || isNewRow, info, buffer);
			}
			buffer.push("<tr>");
			var colSpan = info.vertDimCount - node.level;
			var className = node.level == 0 ? "GrandTotalGroupCell" : "SubTotalGroupCell";
			var text = node.level == 0 ? $text("Qs.Chart.Grid.GrandTotal") : $text("Qs.Chart.Grid.SubTotal");
			buffer.push("<td class=" + className + " colspan=" + colSpan + ">" + text + "</td>");
			for (var i = 0; i < horzGroups.length; ++i) {
				var horzGroup = horzGroups[i];
				var value = node.values[horzGroup.id];
				var nextGroups = groups.slice(0);
				nextGroups[info.dimensions.length - 1] = horzGroup.id;
				var valueHtml = Chart._getValueHtml(value, nextGroups, info);
				buffer.push("<td class=TotalValueCell>" + valueHtml + "</td>");
			}
			if (info.showCount) {
				buffer.push("<td class=TotalValueCell>");
				if (node.level == 0 && node.count != info.recordCount) {
					var total = Jui.cast.toString(info.recordCount, "#,##0");
					var hint = $text("Qs.Chart.Grid.ExtraHint").replace("${0}", total);
					buffer.push("<label class=ExtraValue title='" + hint + "'>(*)</label>&nbsp;");
				}
				buffer.push(Jui.cast.toString(node.count, "#,##0") + "</td>");
				if (info.showPercent) {
					var percent = Chart._calcPercent(node.count, info.root.count);
					buffer.push("<td class='TotalValueCell PercentageCell'>" + percent + "</td>");
				}
			}
			buffer.push("<td class=TotalValueCell>");
			if (node.level == 0 && node.count != info.recordCount) {
				var total = Chart._getValueHtml(info.summation, null, info);
				var hint = $text("Qs.Chart.Grid.ExtraHint").replace("${0}", total);
				buffer.push("<label class=ExtraValue title='" + hint + "'>(*)</label>&nbsp;");
			}
			buffer.push(Chart._getValueHtml(node.sum, groups, info) + "</td>");
			if (info.showPercent) {
				var dividend = info.isZeroPercent ? node.nonZeroDataRowCount : node.sum;
				var divisor = info.isZeroPercent ? node.dataRowCount : info.root.sum;
				var percent = Chart._calcPercent(dividend, divisor);
				buffer.push("<td class='TotalValueCell PercentageCell'>" + percent + "</td>");
			}
			buffer.push("</tr>");
		}
	},

	_calcRowSpan: function(node)
	{
		node.rowSpan = 1;
		node.nonZeroDataRowCount = node.children == null && node.sum != 0 ? 1 : 0;
		node.dataRowCount = node.children == null ? 1 : 0;
		if (node.children != null) {
			for (var key in node.children) {
				var child = node.children[key];
				node.rowSpan += Chart._calcRowSpan(child);
				node.nonZeroDataRowCount += child.nonZeroDataRowCount;
				node.dataRowCount += child.dataRowCount;
			}
		}
		return node.rowSpan;
	},
	
	_calcPercent: function(value, total)
	{
		return total == 0 ? "" : Jui.cast.toString(100 * value / total, "0.00");
	},
	
	_getValueHtml: function(value, groups, info)
	{
		if (value == null) {
			return "";
		}
		var text = info.hasFloatValue ? Jui.cast.toString(value, "#,##0.00") : value;
		if (groups == null || !info.linkable) {
			return text;
		}
		var groupText = Base64Util.encode(JSON.stringify(groups));
		return "<label class=QsLink onclick=Chart._doGridLinkClick() groups='" + groupText + "'>" + text + "</label>";
	},

	_getChartLink: function(rawData, groups)
	{
		var chartFilter = {
			chartId 	: rawData.chartId,
			schemaId 	: rawData.schemaId,
			parameters	: rawData.parameters,
			groups		: groups
		};
		var text = Base64Util.encode(JSON.stringify(chartFilter));
		return "JavaScript:Chart._openEntityList('" + rawData.unitCode + "', '" + text + "');";
	},

	_doGridLinkClick: function()
	{
		var label = event.srcElement;
		var chartFilter = {
			chartId		: Chart._data.chartId,
			schemaId	: Chart._data.schemaId,
			parameters	: Chart._data.parameters,
			groups		: JSON.parse(Base64Util.decodeToString(label.getAttribute("groups")))
		};
		Chart._openEntityList(Chart._data.unitCode, chartFilter);
	},
	
	_openEntityList: function(unitCode, chartFilter)
	{
		if (typeof(chartFilter) == "string") {
			chartFilter = JSON.parse(Base64Util.decodeToString(chartFilter));
		}
		var page = Utility.getPage(unitCode + ".List");
		Utility.openTab(page.code + ".page", {tempSchemaInfo:chartFilter}, page.title, page.icon);
	}
};

FusionCharts.setCurrentRenderer("javascript");
