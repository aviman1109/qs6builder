var ChartEdit =
{
	querySchemaMap: {},
	
	dateFields: {},
	
	doLoad: function()
	{
		var map = {
			FChartCatalogId: {
				onbeforedrop: ChartEdit.doChartCatalogBeforeDrop
			},
			FUnitId: {
				clearOnDisable: true,
				restoreOnEnable: true,
				onchange: ChartEdit.doUnitIdChange
			},
			FDisplayType: {
				onchange: ChartEdit.refreshControlStatus
			},
			FLimitType: {
				onchange: ChartEdit.refreshControlStatus
			},
			FLimit: {
				clearOnDisable: true,
				restoreOnEnable: true
			},
			FSupportQuerySchema: {
				onchange: ChartEdit.doSupportQuerySchemaChange
			},
			FQuerySchemaId: {
				clearOnDisable: true,
				restoreOnEnable: true,
				onbeforedrop: ChartEdit.doQuerySchemaIdBeforeDrop
			},
			FGroupField1: {
				onchange: ChartEdit.doGroupField1Change
			},
			FGroupOption1: {
				clearOnDisable: true
			},
			FGroupField2: {
				clearOnDisable: true,
				onchange: ChartEdit.doGroupField2Change
			},
			FGroupTitle2: {
				clearOnDisable: true
			},
			FGroupOption2: {
				clearOnDisable: true
			},
			FGroupField3: {
				clearOnDisable: true,
				onchange: ChartEdit.doGroupField3Change
			},
			FGroupTitle3: {
				clearOnDisable: true
			},
			FGroupOption3: {
				clearOnDisable: true
			},
			FValueField: {
				onchange: ChartEdit.doValueFieldChange
			},
			FGridHorizontalExpand: {
				clearOnDisable: true,
				onchange: ChartEdit.refreshControlStatus
			},
			FGridShowCount: {
				clearOnDisable: true
			},
			FGridShowPercent: {
				clearOnDisable: true,
				onchange: ChartEdit.refreshControlStatus
			},
			FGridPercentType: {
				clearOnDisable: true
			},
			FSqlType: {
				onchange: ChartEdit.doSqlTypeChange
			},
			FSql: {
				clearOnDisable: true,
				restoreOnEnable: true,
				onchange: ChartEdit.doSqlChange
			}
		};
		for (var fieldName in map) {
			var control = form.getControl(fieldName);
			if (control != null) {
				var properties = map[fieldName];
				for (var propertyName in properties) {
					if (propertyName == "clearOnDisable") {
						control.setClearOnDisable(properties[propertyName]);
					}
					else if (propertyName == "restoreOnEnable") {
						control.setRestoreOnEnable(properties[propertyName]);
					}
					else {
						control[propertyName] = properties[propertyName];
					}
				}
			}
		}
		
		if (form.getControl("FHandler") != null) {
			ChartEdit.doSupportQuerySchemaChange();
		}
		else {
			ChartEdit.updateFieldBoxes(clientData.groupFields || [], clientData.valueFields || []);
			ChartEdit.refreshControlStatus();
		}
	},

	refreshControlStatus: function()
	{
		var limitType = form.getFieldValue("FLimitType");
		form.setFieldEnabled("FLimit", limitType == "Max" || limitType == "Min", true);
		
		var groupField1 = form.getFieldValue("FGroupField1");
		form.setFieldEnabled("FGroupOption1", groupField1 in ChartEdit.dateFields, true);

		var displayType = form.getFieldValue("FDisplayType");
		var isRoundChart = displayType == "Pie" || displayType == "Doughnut";
		var isGrid = displayType == "Grid";
		var isHorzExpand = form.getFieldValue("FGridHorizontalExpand");
		var isShowPercent = form.getFieldValue("FGridShowPercent");
		form.setFieldEnabled("FGroupField2", !isRoundChart);
		form.setFieldEnabled("FGroupField3", isGrid);
		form.setFieldEnabled("FGridHorizontalExpand", isGrid);
		form.setFieldEnabled("FGridShowCount", isGrid && !isHorzExpand);
		form.setFieldEnabled("FGridShowPercent", isGrid);
		form.setFieldEnabled("FGridPercentType", isGrid && isShowPercent && !isHorzExpand);
		
		var groupField2 = form.getFieldValue("FGroupField2");
		form.setFieldEnabled("FGroupTitle2", !Jui.string.isEmpty(groupField2), true);
		form.setFieldEnabled("FGroupOption2", groupField2 in ChartEdit.dateFields, true);
		
		var groupField3 = form.getFieldValue("FGroupField3");
		form.setFieldEnabled("FGroupTitle3", !Jui.string.isEmpty(groupField3), true);
		form.setFieldEnabled("FGroupOption3", groupField3 in ChartEdit.dateFields, true);

		form.setFieldRequired("FGroupField2", !Jui.string.isEmpty(groupField3) || isHorzExpand);

		if (form.hasControl("FSql")) {
			var sqlType = form.getFieldValue("FSqlType");
			form.setFieldEnabled("FSql", sqlType == "SupportQuerySchema" || sqlType == "Any", true);
			form.setFieldEnabled("FQuerySchemaId", sqlType == "SupportQuerySchema" || sqlType == "None", false);
		}
	},

	doChartCatalogBeforeDrop: function()
	{
		if (!ChartEdit.chartCatalogDropdownLoaded) {
			Utility.syncInvoke("Qs.ChartCatalog.getDropdownJson", null, function(ret) {
				form.getControl("FChartCatalogId").loadItems(ret.data);
				ChartEdit.chartCatalogDropdownLoaded = true;
			});
		}
	},
	
	doUnitIdChange: function()
	{
		if (!form.hasControl("FHandler")) {
			ChartEdit.doSqlChange();
		}
	},
	
	doSupportQuerySchemaChange: function()
	{
		form.setFieldEnabled("FUnitId", form.getFieldValue("FSupportQuerySchema"), true);
		form.setFieldEnabled("FQuerySchemaId", form.getFieldValue("FSupportQuerySchema"));
	},

	doGroupField1Change: function()
	{
		form.setFieldValue("FGroupTitle1", form.getFieldText("FGroupField1"));
		ChartEdit.refreshControlStatus();
	},

	doGroupField2Change: function()
	{
		form.setFieldValue("FGroupTitle2", form.getFieldText("FGroupField2"));
		ChartEdit.refreshControlStatus();
	},

	doGroupField3Change: function()
	{
		form.setFieldValue("FGroupTitle3", form.getFieldText("FGroupField3"));
		ChartEdit.refreshControlStatus();
	},

	doValueFieldChange: function()
	{
		form.setFieldValue("FValueTitle", form.getFieldText("FValueField"));
	},
	
	doSqlTypeChange: function()
	{
		ChartEdit.refreshControlStatus();
		ChartEdit.doSqlChange();
	},

	doSqlChange: function()
	{
		var args = {unitId:form.getFieldValue("FUnitId")};
		if (Jui.string.isEmpty(args.unitId)) {
			ChartEdit.updateFieldBoxes([], []);
			ChartEdit.refreshControlStatus();
			return;
		}
		if (form.hasControl("FSql") && !Jui.string.isEmpty(form.getFieldValue("FSql"))) {
			args.sql = form.getFieldValue("FSql");
		}
		Utility.invoke("Qs.Chart.getGroupAndValueFields", args, true, function(ret) {
			ChartEdit.updateFieldBoxes(ret.groupFields, ret.valueFields);
			ChartEdit.refreshControlStatus();
		});
	},

	updateFieldBoxes: function(groupFields, valueFields)
	{
		ChartEdit.dateFields = {};
		for (var i = 0; i < groupFields.length; ++i) {
			if (groupFields[i].isDate) {
				ChartEdit.dateFields[groupFields[i].value] = 1;
			}
		}
		form.getControl("FGroupField1").loadItems(groupFields, true);
		form.getControl("FGroupField2").loadItems(groupFields, true);
		form.getControl("FGroupField3").loadItems(groupFields, true);
		form.getControl("FValueField").loadItems(valueFields, true);
		if (Jui.string.isEmpty(form.getFieldValue("FGroupField1"))) {
			form.getControl("FGroupTitle1").setValue();
		}
		if (Jui.string.isEmpty(form.getFieldValue("FGroupField2"))) {
			form.getControl("FGroupTitle2").setValue();
		}
		if (Jui.string.isEmpty(form.getFieldValue("FGroupField3"))) {
			form.getControl("FGroupTitle3").setValue();
		}
		if (Jui.string.isEmpty(form.getFieldValue("FValueField"))) {
			form.getControl("FValueTitle").setValue();
		}
	},

	doQuerySchemaIdBeforeDrop: function()
	{
		var unitId = form.getFieldValue("FUnitId");
		if (unitId == null) {
			form.getControl("FQuerySchemaId").loadItems([]);
			return;
		}
		if (ChartEdit.querySchemaMap[unitId] == null) {
			var url = "Qs.QuerySchema.getComboBoxItems";
			var ret = Utility.syncInvoke(url, {unitId:unitId, showAll:true});
			if (ret == null) {
				return;
			}
			ChartEdit.querySchemaMap[unitId] = ret.data; 
		}
		form.getControl("FQuerySchemaId").loadItems(ChartEdit.querySchemaMap[unitId]);
	},
	
	doPreview: function()
	{
		if (EntityForm.validate()) {
			var args = {
				relationId		: clientData.relationId,
				masterUnitId	: clientData.masterUnitId,
				masterEntityId	: clientData.masterEntityId
			};
			CommonBusiness.saveEntity(clientData.unitCode, [form.getData()], args, function(json) {
				var entityId = json.entityIds[0];
				EntityForm.addDialogResultEntityId(entityId);
				Utility.openDialog("Qs.Chart.Show.page", {chartId:entityId});
				EntityForm.reload(entityId);
			});
		}
	}
};
