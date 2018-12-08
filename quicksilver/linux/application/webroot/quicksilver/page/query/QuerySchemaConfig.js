var QuerySchemaConfig = 
{
	schemaId: clientData.schemaId,
	
	hasPublicPrivilege: clientData.hasPublicPrivilege,
	
	hasSqlPrivilege: clientData.hasPublicPrivilege || clientData.hasSqlPrivilege,

	ORDER_DIRECTIONS:
	[
		{value:"0", text:$text("Qs.QuerySchema.Order.Ascending")},
		{value:"1", text:$text("Qs.QuerySchema.Order.Descending")}
	],
	
	doLoad: function()
	{
		QuerySchemaConfig.sorter = Jui.option.Sorter.create({
			target	: "LeftZone",
			style	: "width:100%;height:100%",
			onclick	: QuerySchemaConfig.doSorterClick
		});
		QuerySchemaConfig.condition = Jui.option.Condition.create({
			target						: "ConditionContent",
			onloadunit					: QuerySchemaConfig.doConditionLoadUnit,
			onloadselect				: QuerySchemaConfig.doConditionLoadSelect,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect
		});
		QuerySchemaConfig.form = Jui.option.Form.create({
			target		: "FormPanel",
			compact		: true,
			columnCount	: 2,
			titleWidth	: 88
		});
		QuerySchemaConfig.shareBox = Jui.basic.CheckBox.create({target:"ShareBoxCell"});

		if (!QuerySchemaConfig.hasPublicPrivilege) {
			for (var fields = clientData.editTitle, i = fields.length - 1; i >= 0; --i) {
				if (fields[i].name == "FPublic") {
					fields.splice(i, 1);
				}
			}
		}
		if (!QuerySchemaConfig.hasSqlPrivilege) {
			for (var fields = clientData.editTitle, i = fields.length - 1; i >= 0; --i) {
				if (fields[i].name == "FSqlSource" || fields[i].name == "FSql") {
					fields.splice(i, 1);
				}
			}
		}
		var form = QuerySchemaConfig.form;
		form.loadTitle(clientData.editTitle);
		form.getControl("FType").onchange = QuerySchemaConfig.doTypeChange;
		form.getControl("FParentId").onbeforedrop = QuerySchemaConfig.doParentIdBeforeDrop;
		form.getControl("FParentId").onview = QuerySchemaConfig.doParentIdView;
		form.setFieldEnabled("FPublic", QuerySchemaConfig.hasPublicPrivilege);
		if (QuerySchemaConfig.hasSqlPrivilege) {
			form.getControl("FSqlSource").onchange = QuerySchemaConfig.doSqlSourceChange;
			form.getControl("FSqlSource").setClearOnDisable(true);
			form.getControl("FSql").setClearOnDisable(true);
		}
		if (clientData.parentSchemaId != null) {
			form.setFieldEnabled("FParentId", false);
		}
		QuerySchemaConfig.setSchema(clientData.schema);
		QuerySchemaConfig.loadSorter(clientData);
		Utility.setDialogResult({listChanged:false});
	},
	
	doTypeChange: function()
	{
		var isCollection = QuerySchemaConfig.form.getFieldValue("FType") == "collection";
		$elem("ConditionTitle").style.display = isCollection ? "none" : "block";
		$elem("ConditionContent").style.display = isCollection ? "none" : "block";
		$elem("CollectionTitle").style.display = isCollection ? "block" : "none";
		$elem("CollectionContent").style.display = isCollection ? "block" : "none";
		if (QuerySchemaConfig.hasSqlPrivilege) {
			QuerySchemaConfig.form.setFieldEnabled("FSqlSource", !isCollection);
			QuerySchemaConfig.doSqlSourceChange();
		}
	},
	
	doParentIdBeforeDrop: function()
	{
		Utility.syncInvoke("Qs.QuerySchema.getParentBoxItems", {unitId:clientData.unitId}, function(ret) {
			QuerySchemaConfig.form.getControl("FParentId").loadItems(ret.data);
		});
	},
	
	doParentIdView: function()
	{
		var args = {
			unitId		: clientData.unitId,
			schemaId	: QuerySchemaConfig.form.getFieldValue("FParentId")
		};
		Utility.openDialog("Qs.QuerySchema.Config.page", args);
	},
	
	doSqlSourceChange: function()
	{
		var source = QuerySchemaConfig.form.getFieldValue("FSqlSource");
		var enabled = source == "Text" || source == "JavaClass";
		QuerySchemaConfig.form.setFieldEnabled("FSql", enabled, true);
	},
	
	doSelectAndSort: function()
	{
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.QuerySchema.Sort.page", {unitId:clientData.unitId}, options, function(ret) {
			QuerySchemaConfig.refreshSorter();
		});
	},

	doSave: function()
	{
		if (!QuerySchemaConfig.form.validate()) {
			return;
		}
		var ret = QuerySchemaConfig.save(QuerySchemaConfig.schemaId, false);
		if (ret != null) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.setDialogResultAttribute("listChanged", true);
			QuerySchemaConfig.schemaId = ret.schemaId;
			QuerySchemaConfig.refreshSorter();
		}
	},
	
	doExecute: function()
	{
		var ret = QuerySchemaConfig.save(null, true);
		if (ret != null) {
			var schemaName = QuerySchemaConfig.form.getFieldValue("FName");
			Utility.setDialogResultAttribute("schemaId", ret.schemaId);
			Utility.setDialogResultAttribute("schemaName", schemaName || $text("Qs.QuerySchema.TempSchemaName"));
			Utility.closeDialog();
		}
	},
	
	doAdd: function()
	{
		QuerySchemaConfig.sorter.unselect();
		QuerySchemaConfig.loadSchema(null);
	},
	
	doCopy: function()
	{
		if (QuerySchemaConfig.sorter.getSelectedData()[0] == null) {
			Jui.message.alert($text("Qs.QuerySchema.SelectExistAlert"));
			return;
		}
		QuerySchemaConfig.schemaId = null;
		QuerySchemaConfig.sorter.unselect();
		QuerySchemaConfig.condition.setDisabled(false);
		var nameBox = QuerySchemaConfig.form.getControl("FName");
		nameBox.setValue("");
		nameBox.setDisabled(false);
		nameBox.focus();
		QuerySchemaConfig.form.setFieldEnabled("FType", true);
		if (!QuerySchemaConfig.hasPublicPrivilege) {
			QuerySchemaConfig.form.setFieldValue("FPublic", false);	
		}
		if (clientData.parentSchemaId != null) {
			QuerySchemaConfig.form.getControl("FParentId").setValue(clientData.parentSchemaId, clientData.parentSchemaName);
		}
		for (var i = 1, rows = $elem("OrderTable").rows; i < rows.length; ++i) {
			var row = rows[i];
			row.fieldBox.setDisabled(false);
			row.directionBox.setDisabled(false);
			row.deleteButton.setDisabled(i == 1);
			row.addButton.setDisabled(false);
		}
	},
	
	doDelete: function()
	{
		var item = QuerySchemaConfig.sorter.getSelectedData()[0];
		if (item == null) {
			Jui.message.alert($text("Qs.QuerySchema.SelectExistAlert"));
			return;
		}
		Jui.message.confirm($text("Qs.QuerySchema.DeleteConfirm").replace("${0}", item.text), function() {
			Utility.invoke("Qs.QuerySchema.delete", {entityIds:[item.value]}, true, function(json) {
				Utility.setDialogResultAttribute("listChanged", true);
				QuerySchemaConfig.loadSchema(null);
				QuerySchemaConfig.refreshSorter();
			});
		});
	},
	
	doReturn: function()
	{
		Utility.closeDialog();
	},
	
	doConditionLoadUnit: function(event)
	{
		var args = {unitId:event.unitId};
		return Utility.syncInvoke("Qs.Condition.getUnitJson", args).data;
	},
	
	doConditionLoadSelect: function(event)
	{
		var args = {dictionaryId:event.selectId};
		return Utility.syncInvoke("Qs.Dictionary.getComboBoxItemsJson", args, function(ret) {
			return ret.data;
		});
	},
	
	doSorterClick: function(event)
	{
		if (event.value != QuerySchemaConfig.schemaId) {
			QuerySchemaConfig.loadSchema(event.value);
		}
	},
	
	save: function(schemaId, isTemp)
	{
		if (QuerySchemaConfig.condition.validate()) {
			var basic = {
				FUnitId	: clientData.unitId,
				FId		: schemaId,
				FTemp	: isTemp,
				FShare	: QuerySchemaConfig.shareBox.getValue()
			};
			var args = {
				basic		: Jui.object.merge(basic, QuerySchemaConfig.form.getData()),
				condition	: QuerySchemaConfig.condition.getData(),
				order		: []
			};
			if (isTemp && Jui.string.isEmpty(args.basic.FName)) {
				args.basic.FName = $text("Qs.QuerySchema.TempSchemaName");
			}
			for (var rows = $elem("OrderTable").rows, i = 1; i < rows.length; ++i) {
				var fieldName = rows[i].fieldBox.getValue();
				var direction = rows[i].directionBox.getValue();
				if (!Jui.string.isEmpty(fieldName)) {
					args.order.push({fieldName:fieldName, direction:direction});
				}
			}
			return Utility.syncInvoke("Qs.QuerySchema.save", args);
		}
	},
	
	refreshSorter: function()
	{
		var args = {unitId:clientData.unitId, parentSchemaId:clientData.parentSchemaId};
		Utility.invoke("Qs.QuerySchema.getConfigSorterData", args, true, function(ret) {
			QuerySchemaConfig.loadSorter(ret);
		});
	},

	loadSorter: function(data)
	{
		var sorterItems = [];
		if (clientData.privateItems != null && data.privateItems.length > 0) {
			sorterItems.push({level:1, isTitle:true, text:$text("Qs.QuerySchema.PrivateQuerySchema")});
			for (var i = 0; i < data.privateItems.length; ++i) {
				var item = data.privateItems[i];
				sorterItems.push({level:2, value:item.value, text:item.text});
			}
		}
		if (data.publicItems != null && data.publicItems.length > 0) {
			sorterItems.push({level:1, isTitle:true, text:$text("Qs.QuerySchema.PublicQuerySchema")});
			for (var i = 0; i < data.publicItems.length; ++i) {
				var item = data.publicItems[i];
				sorterItems.push({level:2, value:item.value, text:item.text});
			}
		}
		QuerySchemaConfig.sorter.load(sorterItems);
		if (QuerySchemaConfig.schemaId != null) {
			QuerySchemaConfig.sorter.select(QuerySchemaConfig.schemaId);
		}
	},

	loadSchema: function(schemaId)
	{
		if (schemaId == null) {
			QuerySchemaConfig.setSchema(Jui.util.clone(clientData.defaultSchema));
		}
		else {
			var args = {unitId:clientData.unitId, schemaId:schemaId};
			Utility.invoke("Qs.QuerySchema.getItemData", args, true, function(ret) {
				QuerySchemaConfig.setSchema(ret.data);
			});
		}
	},
	
	setSchema: function(schema)
	{
		var form = QuerySchemaConfig.form;
		QuerySchemaConfig.schemaId = schema.id;
		form.loadData(schema.editData);
		QuerySchemaConfig.condition.load(schema.condition);
		QuerySchemaConfig.shareBox.setValue(schema.share);
		var orderTable = $elem("OrderTable");
		for (var i = orderTable.rows.length - 1; i > 0; --i) {
			orderTable.deleteRow(i);
		}
		var hasOrder = schema.order != null && schema.order.length > 0;
		var order = hasOrder ? schema.order : [{fieldName:null, direction:0}];
		for (var i = 0; i < order.length; ++i) {
			QuerySchemaConfig.addOrder(order[i]);
		}
		if ((clientData.parentSchemaId != null  && clientData.parentSchemaId != QuerySchemaConfig.schemaId)) {
			form.getControl("FParentId").setValue(clientData.parentSchemaId, clientData.parentSchemaName);
		}
		QuerySchemaConfig.doTypeChange();
	},
	
	addOrder: function(order, disabled)
	{
		var orderTable = $elem("OrderTable");
		var row = orderTable.insertRow(-1);
		var cell = row.insertCell(-1);
		row.fieldBox = Jui.basic.ComboBox.create({
			target	: cell,
			items	: clientData.orderableFields,
			value	: order.fieldName
		});
		cell = row.insertCell(-1);
		row.directionBox = Jui.basic.ComboBox.create({
			target	: cell,
			items	: QuerySchemaConfig.ORDER_DIRECTIONS,
			value	: order.direction,
			style	: "width:100px"
		});
		
		cell = row.insertCell(-1);
		row.deleteButton = Jui.basic.Button.create({
			target	: cell,
			text	: $text("Public.Delete"),
			onclick	: QuerySchemaConfig.doDeleteOrderClick
		});
		row.addButton = Jui.basic.Button.create({
			target	: cell,
			text	: $text("Public.Add"),
			onclick	: QuerySchemaConfig.doAddOrderClick,
			style	: "margin-left:6px"
		});
		var text = orderTable.rows.length == 2 ? $text("Public.Clear") : $text("Public.Delete");
		orderTable.rows[1].deleteButton.setText(text);
	},
	
	doAddOrderClick: function()
	{
		QuerySchemaConfig.addOrder({fieldName:null, direction:0});
	},
	
	doDeleteOrderClick: function()
	{
		var orderTable = $elem("OrderTable");
		var row = Jui.dom.getAncestorByTagName("TR", this.element);
		if (orderTable.rows.length == 2) {
			row.fieldBox.setValue();
			row.directionBox.setValue();
			return;
		}
		var orderTable = $elem("OrderTable");
		orderTable.deleteRow(row.rowIndex);
		var text = orderTable.rows.length == 2 ? $text("Public.Clear") : $text("Public.Delete");
		orderTable.rows[1].deleteButton.setText(text);
	}
};
