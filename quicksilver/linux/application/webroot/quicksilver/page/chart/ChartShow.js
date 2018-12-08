var ChartShow =
{
	treeEntityId: clientData.treeEntityId,

	data: null,
	
	doLoad: function()
	{
		if ($elem("TreePanel") != null) {
			var treeTitle = clientData.treeParameterName;
			if (clientData.treeEntityId != null) {
				treeTitle += " - " + clientData.treeEntityName;
			}
			Jui.dom.setInnerText($elem("TreeTitle"), treeTitle);
			ChartShow.tree = Jui.option.Tree.create({
				target			: "TreePanel",
				onnodeclick		: ChartShow.doTreeNodeClick,
				onloadsubnodes	: ChartShow.doTreeLoadSubNodes
			});
			ChartShow.tree.load(clientData.treeJson);
			ChartShow.tree.expandLevel(1);
			Jui.dom.addClass($elem("RightZone"), "QsLeftBorder");
			Jui.option.Resizer.create({elements:["LeftZone", "RightZone"], transparent:false});
		}
		if (clientData.formJson != null) {
			$elem("FormPanel").style.display = "block";
			ChartShow.form = Jui.option.Form.create({
				target						: "FormPanel",
				titleWidth					: 100,
				controlWidth				: 200,
				columnCount					: clientData.formJson.title.length == 1 ? 1 : 2,
				style						: "height:auto",
				boxChangeHandler			: ChartShow.doFormChange,
				entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
				entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
				entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
				multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			});
			ChartShow.form.load(clientData.formJson);
			CommonBusiness.setParentDictionary(ChartShow.form);
			var data = clientData.formJson.data;
			var schemaId = clientData.urlArgs.schemaId || data["#querySchemaId"];
			var schemaName = clientData.urlArgs.schemaName || data["#querySchemaName"];
			ChartShow.form.setFieldValue("#querySchemaId", schemaId, schemaName);
			$elem("RightZone").style.paddingBottom = $elem("FormPanel").offsetHeight + "px";
		}
		ChartShow.loadChartIfParametersFilled();
	},
	
	loadChartIfParametersFilled: function()
	{
		var parameters = {};
		if (ChartShow.tree != null) {
			if (ChartShow.treeEntityId == null) {
				return;
			}
			parameters[clientData.treeParameterCode] = ChartShow.treeEntityId;
		}
		if (ChartShow.form != null) {
			if (!ChartShow.form.validate(false)) {
				return;
			}
			Jui.object.merge(parameters, ChartShow.form.getData());
		}
		Jui.object.merge(parameters, clientData.urlArgs.parameters);
		var args = {chartId:clientData.chartId, parameters:parameters};
		if ("#displayType" in parameters) {
			args.displayType = parameters["#displayType"];
			delete parameters["#displayType"];
		}
		if ("#querySchemaId" in parameters) {
			args.querySchemaId = parameters["#querySchemaId"];
			delete parameters["#querySchemaId"];
		}

		if (clientData.handlerPage != null) {
			$elem("ChartFrame").src = Utility.getUrl(clientData.handlerPage, args);
			return;
		}
		Chart.getData($elem("ChartPanel"), null, args, function(ret) {
			ChartShow.data = ret;
			ChartShow.loadChart(ret, args.displayType);
		});
	},

	loadChart: function(data, displayType)
	{
		Chart.show($elem("ChartPanel"), data, displayType);
		if (!data.isEmpty && !Jui.array.isEmpty(data.information)) {
			Jui.message.hint(data.information.join("\n"));
		}
	},

	doExportGrid: function()
	{
		var table = Chart.getGridTable();
		if (table == null) {
			Jui.message.alert($text("Qs.Chart.Grid.CannotExportAlert"));
			return;
		}
		var args = {cells:Utility.getTableCellsForExport(table)};
		Utility.download("Qs.Export.exportHtmlTable", args);
	},

	doTreeLoadSubNodes: function(event, callback)
	{
		var hasFruit	= clientData.fruitUnitId != null;
		var url			= clientData.treeUnitCode + (hasFruit ? ".getTreeDataWithFruits" : ".getTreeData");
		var args		= {parentId:event.id};
		if (hasFruit) {
			args.fruitUnitId	= clientData.fruitUnitId;
			args.relationField	= clientData.fruitRelationField;
		}
		Utility.invoke(url, args, true, function(ret){callback(ret.data);});
	},
	
	doTreeNodeClick: function(event)
	{
		if (clientData.fruitUnitId == null || event.json.iconType == "item") {
			ChartShow.treeEntityId = event.json.id;
			Jui.dom.setInnerText($elem("TreeTitle"), clientData.treeParameterName + " - " + event.json.text);
			ChartShow.loadChartIfParametersFilled();
		}
	},
	
	doFormChange: function()
	{
		var box = this;
		var displayTypeBox = ChartShow.form.getControl("#displayType");
		CommonBusiness.processBoxChange(box);
		if (box == displayTypeBox && ChartShow.data != null && clientData.handlerPage == null) {
			if (!Jui.string.isEmpty(displayTypeBox.getValue())) {
				ChartShow.loadChart(ChartShow.data, displayTypeBox.getValue());
			}
		}
		else {
			ChartShow.loadChartIfParametersFilled();
		}
	}
};