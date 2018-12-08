var CommonBusiness =
{
	//-----------------------------------------------------------------------
	// data
	//-----------------------------------------------------------------------
	
	defaultDialogOptions:
	{
		form			: {defaultWidth:1050, defaultHeight:500},
		info			: {defaultWidth:1239, defaultHeight:600},
		view			: {defaultWidth:900,  defaultHeight:600},
		sort			: {defaultWidth:480,  defaultHeight:600},
		sortAndEdit		: {defaultWidth:900,  defaultHeight:600},
		doubleSorter	: {defaultWidth:600,  defaultHeight:600},
		select			: {defaultWidth:900,  defaultHeight:600}
	},
	
	defaultFormDialogOptions			: {defaultWidth:1050, defaultHeight:500},
	defaultInfoDialogOptions			: {defaultWidth:1239, defaultHeight:600},
	defaultViewDialogOptions			: {defaultWidth:900,  defaultHeight:600},
	defaultSortDialogOptions			: {defaultWidth:480,  defaultHeight:600},
	defaultSortAndEditDialogOptions		: {defaultWidth:900,  defaultHeight:600},
	defaultDoubleSorterDialogOptions	: {defaultWidth:600,  defaultHeight:600},
	defaultSelectDialogOptions			: {defaultWidth:900,  defaultHeight:600},

	//-----------------------------------------------------------------------
	// entity
	//-----------------------------------------------------------------------
	
	getCurrentUser: function()
	{
		var key = "user.currentUser";
		var user = Utility.getCacheItem(key);
		if (user == null) {
			user = Utility.syncInvoke("Qs.OnlineUser.getCurrentUserInformation");
			Utility.setCacheItem(key, user);
		}
		return user;
	},

	getFieldTitle: function(unitCode, fieldName)
	{
		var key = "fieldTitle." + unitCode + "." + fieldName;
		var fieldTitle = Utility.getCacheItem(key);
		if (fieldTitle == null) {
			var args = {unitCode:unitCode, fieldName:fieldName};
			var ret = Utility.syncInvoke("Qs.Field.getTitle", args);
			if (ret != null) {
				fieldTitle = ret.fieldTitle;
				Utility.setCacheItem(key, fieldTitle);
			}
		}
		return fieldTitle;
	},
	
	getFieldValue: function(unitCode, entityId, fieldName)
	{
		return CommonBusiness.getEntity(unitCode, entityId, [fieldName])[fieldName];
	},

	getEntity: function(unitCode, entityId, fieldNames, callback)
	{
		var args = {entityId:entityId, fieldNames:fieldNames};
		if (callback == null) {
			return Utility.syncInvoke(unitCode + ".getItem", args);
		}
		Utility.invoke(unitCode + ".getItem", args, false, function(ret) {
			callback(ret);
		});
	},

	getEntityName: function(unitCode, entityId)
	{
		var args = {unitCode:unitCode, entityId:entityId};
		return Utility.syncInvoke("Qs.Misc.getEntityName", args).name;
	},

	doFireServerEventButtonClick: function(event)
	{
		var isButton		= this instanceof Jui.basic.Button;
		var entityEventCode = isButton ? this.getArgs().name : event.id;
		var validateForm	= isButton ? this.getArgs().validateForm : event.validateForm;
		var confirmMessage	= isButton ? this.getArgs().confirmMessage : event.confirmMessage;
		var args 			= {entityEventCode:entityEventCode, saveForm:false};
		if (typeof(form) == "object" && typeof(EntityForm) == "object") {
			if (validateForm && !EntityForm.validate()) {
				return;
			}
			args.entityIds = [clientData.entityId];
			args.data = [EntityForm.getData()];
		}
		else if (typeof(list) == "object") {
			args.entityIds = list.getSelectedKeys();
			if (args.entityIds.length == 0) {
				alert($text("Public.SelectAlert"));
				return;
			}
		}
		if (!Jui.string.isEmpty(confirmMessage) && !confirm(confirmMessage)) {
			return;
		}
		Utility.invoke(clientData.unitCode + ".confirm", args, true, function(json) {
			Jui.message.hint($text("Public.OperationSuccess"));
			if (typeof(form) == "object" && typeof(EntityForm) == "object") {
				EntityForm.reload(clientData.entityId);
			}
			else if (typeof(list) == "object") {
				CommonBusiness.updateListRow(list, clientData.unitCode, clientData.listId, args.entityIds);
			}
		});
	},
	
	doOpenFormButtonClick: function()
	{
		var page = this.getArgs().handlePage;
		var url = page.code + ".page";
		args = {enableAllFields: true, addConfirmButton:true, entityEventCode:this.getArgs().name, showWorkflow:false};
		if (typeof(form) == "object") {
			args.entityId = clientData.entityId;
		}
		else if (typeof(list) == "object") {
			args.entityId = list.getSelectedKeys()[0];
			if (args.entityId == null) {
				alert($text("Public.SelectAlert"));
				return;
			}
		}
		Utility.openDialog(url, args, CommonBusiness.defaultDialogOptions.form, function() {
			alert($text("Public.OperationSuccess"));
			if (typeof(form) == "object" && typeof(EntityForm) == "object") {
				EntityForm.reload(args.entityId);
			}
			else if (typeof(list) == "object") {
				CommonBusiness.updateListRow(list, clientData.unitCode, clientData.listId, args.entityId);
			}
		});
	},
	
	doOpenChartButtonClick: function(event)
	{
		var isButton	= this instanceof Jui.basic.Button;
		var chartId		= isButton ? this.getArgs().chartId : event.name;
		var args 		= {chartId:chartId};
		if (typeof(EntityList) == "object") {
			var box = EntityList.getQuerySchemaBox();
			if (box != null && box.getValue()) {
				args.schemaId = box.getValue();
				args.schemaName = box.getText();
			}
		}
		Utility.openTab("Qs.Chart.Show.page", args, $text("Qs.Menu.Chart"), "quicksilver/image/unit/Chart.png");
	},

	openEntity: function(unitCode, args, mode, dialogCallback, dialogOrTabOptions)
	{
		var unit = Utility.getUnit(unitCode);
		if (unit == null) {
			return;
		}
		args = Jui.object.merge({unitCode:unitCode}, args);
		var url = unit.infoPageCode + ".page";
		var infoPage = Utility.getPage(unit.infoPageCode);
		var firstSlavePage = Utility.getPage(unit.firstSlavePageCode);
		var defaultDialog = unit.isSlaveUnit || mode == "Dialog";
		if (Utility.isInDialog() || unit.openMode == "Dialog" || unit.openMode == "System" && defaultDialog) {
			var options = Jui.object.merge({maximize:firstSlavePage.dialogMaximized}, dialogOrTabOptions);
			var isSingle = unit.infoPageCode == unit.firstSlavePageCode;
			var defaultDialogOptions = CommonBusiness.defaultDialogOptions[isSingle ? "form" : "info"];
			var w = options.width || infoPage.dialogWidth || defaultDialogOptions.defaultWidth;
			var h = options.height || infoPage.dialogHeight || defaultDialogOptions.defaultHeight;
			options.width = Math.max(100, w);
			options.height = Math.max(100, h);
			Utility.openDialog(url, args, options, dialogCallback);
		}
		else {
			Utility.openTab(url, args, unit.name, unit.icon, null, null, null, dialogOrTabOptions);
		}
	},
	
	saveEntity: function(unitCode, data, args, callback)
	{
		args = Jui.object.merge({data:data}, args);
		return Utility.invoke(unitCode + ".save", args, true, callback);
	},
	
	deleteEntity: function(unitCode, entityId, callback)
	{
		var args = {entityIds:Jui.array.make(entityId)};
		return Utility.invoke(unitCode + ".delete", args, true, callback);
	},
	
	openViewPage: function(unitCode, entityId)
	{
		if (Utility.isInDialog()) {
			CommonBusiness.openViewDialog(unitCode, entityId);
		}
		else {
			var unit = Utility.getUnit(unitCode);
			Utility.openTab(unitCode + ".View.page", {entityId:entityId}, unit.name, unit.icon);
		}
	},
	
	openViewDialog: function(unitCode, entityId)
	{
		var options = CommonBusiness.defaultDialogOptions.view;
		Utility.openDialog(unitCode + ".View.page", {entityId:entityId}, options);
	},
	
	tryOpenViewPage: function(unitCode, entityId, forList, failCallback)
	{
		var unit = Utility.getUnit(unitCode);
		if (unit.hasViewPage && unit.openTypeForList == "view") {
			CommonBusiness.openViewPage(unitCode, entityId);
		}
		else if (unit.hasViewPage && unit.openTypeForList == "conditional") {
			var args = {unitCode:unitCode, entityId:entityId, forList:forList};
			Utility.invoke("Qs.Misc.isOpenViewPage", args, true, function(ret) {
				if (ret.isOpenViewPage) {
					CommonBusiness.openViewPage(unitCode, entityId);
				}
				else {
					failCallback();
				}
			});
		}
		else {
			failCallback();
		}
	},
	
	showEntityChart: function(chartId, entityId)
	{
		var args = {chartId:chartId, parameters:{entityId:entityId}};
		if (Utility.isInTab()) {
			var page = Utility.getPage("Qs.Chart.Show");
			Utility.openTab("Qs.Chart.Show.page", args, page.title, page.icon);
		}
		else {
			Utility.openDialog("Qs.Chart.Show.page", args);
		}
	},

	setRelation: function(unitCode, relationId, entityId1, entityId2, callback)
	{
		var args = {
			relationId	: relationId,
			entityId1	: entityId1,
			entityId2	: Jui.array.make(entityId2)
		};
		Utility.invoke(unitCode + ".setRelation", args, true, callback);
	},
	
	unsetRelation: function(unitCode, relationId, entityId1, entityId2, callback)
	{
		var args = {
			relationId	: relationId,
			entityId1	: entityId1,
			entityId2	: Jui.array.make(entityId2)
		};
		Utility.invoke(unitCode + ".unsetRelation", args, true, callback);
	},
	
	setParentDictionary: function(form)
	{
		var controls = form.getControls();
		var dictionaryMap = {};
		outer:
		for (var i = 0; i < controls.length; ++i) {
			var control = controls[i];
			var args = control.getArgs();
			if (args.dictionaryId == null || args.parentField == null || !form.hasControl(args.parentField)) {
				continue;
			}
			var parentControl = form.getControl(args.parentField);
			if (!(parentControl instanceof Jui.basic.ComboBox)) {
				console.error("Invalid parent field: %s", args.parentField);
				continue;
			}
			var names = {};
			names[control.getName()] = 1;
			for (var c = parentControl; c != null; c = c.parentDictionaryBox) {
				if (c.getName() in names) {
					console.error("Circular parent dictionary reference: %s", control.getName());
					continue outer;
				}
			}
			if (parentControl.subDictionaryBoxes == null) {
				parentControl.subDictionaryBoxes = []; 
			}
			parentControl.subDictionaryBoxes.push(control);
			control.parentDictionaryBox = parentControl;
		}
	},
	
	selectEntity: function(unitCode, args, callback)
	{
		var pageCode = unitCode + ".SelectList";
		var options = Jui.util.clone(CommonBusiness.defaultDialogOptions.select);
		args = Jui.object.merge({isSelect:true}, args);
		if (Utility.isInTab()) {
			options.openInTab = true;
			options.maximize = true;
		}
		
		Utility.openDialog(pageCode + ".page", args, options, function(ret) {
			if (Jui.array.isArray(ret)) {
				var entityIds = Jui.array.extractProperty(ret, "id");
				var entityNames = Jui.array.extractProperty(ret, "name");
				CommonBusiness.addToLastUse(unitCode, entityIds, entityNames);
			}
			else {
				CommonBusiness.addToLastUse(unitCode, ret.id, ret.name);
			}
			if (callback != null) {
				callback(ret);
			}
		}, null, options);
	},
	
	addToCollection: function(unitCode, schemaId, entityId, entityName, showMessage)
	{
		if (Jui.string.isEmpty(entityName)) {
			return;
		}
		var args = {
			unitCode	: unitCode,
			schemaId	: schemaId,
			entityIds	: Jui.array.make(entityId),
			entityNames	: Jui.array.make(entityName)
		};
		Utility.invoke("Qs.QuerySchema.addToCollection", args, true, function() {
			if (/^00000000-0000-0000-0013-00000000000[1-3]$/.test(schemaId)) {
				CommonBusiness.deleteEntityBoxDropdownListCache(unitCode);
			}
			if (showMessage) {
				alert($text("Qs.QuerySchema.AddToCollectionSuccess"));
			}
		});
	},
	
	addToLastUse: function(unitCode, entityId, entityName)
	{
		var unit = Utility.getUnit(unitCode);
		if (unit.supportCollection) {
			var schemaId = "00000000-0000-0000-0013-000000000001";
			CommonBusiness.addToCollection(unitCode, schemaId, entityId, entityName);
		}
	},
	
	viewBill: function(billId, unitId, entityId, batchId)
	{
		var width 		= 830;
		var height 		= 600;
		var left 		= (window.screen.availWidth - width) >> 1;
		var top 		= (window.screen.availHeight - height) >> 1;
		var features	= "status=1,toolbar=0,menubar=0,location=0,resizable=1,center=1,width=" + width
						+ ",height=" + height + ",left=" + left + ",top=" + top;
		if (!Jui.string.isEmpty(billId)) {
			var args = {billId:billId, entityId:entityId, batchId:batchId || ""};
			Utility.openWindow("Qs.Bill.Show.page", args, "_blank", features);
		}
		else {
			Utility.invoke("Qs.Bill.getDefaultItem", {unitId:unitId}, true, function(ret) {
				var args = {billId:ret.billId, entityId:entityId, batchId:batchId || ""};
				Utility.openWindow("Qs.Bill.Show.page", args, "_blank", features);
			});
		}
	},
	
	//-----------------------------------------------------------------------
	// list
	//-----------------------------------------------------------------------
	
	appendListRow: function(list, unitCode, listId, entityId)
	{
		CommonBusiness.loadListRow(list, unitCode, listId, entityId, true);
	},
	
	updateListRow: function(list, unitCode, listId, entityId)
	{
		CommonBusiness.loadListRow(list, unitCode, listId, entityId, false);
	},
	
	loadListRow: function(list, unitCode, listId, entityId, isNew)
	{
		var args = {listId:listId, entityIds:Jui.array.make(entityId)};
		Utility.invoke(unitCode + ".getListDataById", args, true, function(ret) {
			isNew ? list.appendData(ret.data) : list.updateData(ret.data);
		});
	},
	
	loadTreeNode: function(tree, unitCode, entityId)
	{
		var args = {entityIds:Jui.array.make(entityId)};
		Utility.invoke(unitCode + ".getTreeDataById", args, true, function(ret) {
			tree.update(ret.data);
		});
	},
	
	configQuerySchema: function(unitId, schemaBox, tempSchema, parentSchemaId)
	{
		var args = {unitId:unitId};
		if (Utility.isUuid(schemaBox.getValue())) {
			args.schemaId = schemaBox.getValue();
		}
		args.parentSchemaId = parentSchemaId;
		Utility.openDialog("Qs.QuerySchema.Config.page", args, null, function(ret) {
			if (ret.listChanged) {
				var data = CommonBusiness.getQuerySchemaDropdownJson(unitId, parentSchemaId);
				if (data != null) {
					//TODO if schema is deleted
					if (tempSchema != null) {
						data = Jui.util.clone(data);
						var items = [{value:tempSchema.id, text:tempSchema.name}];
						data.unshift({items:items});
					}
					schemaBox.loadItems(data);
				}
			}
			if (ret.schemaId != null) {
				schemaBox.setValue(ret.schemaId, ret.schemaName);
				schemaBox.fireEvent("onchange");
			}
		});
	},

	getQuerySchemaDropdownJson: function(unitId, parentSchemaId)
	{
		var args = {unitId:unitId, parentSchemaId:parentSchemaId};
		var ret = Utility.syncInvoke("Qs.QuerySchema.getComboBoxItems", args);
		return ret && ret.data;
	},

	checkListValueDuplication: function(list, fieldNames, callback)
	{
		if (!Jui.array.isArray(fieldNames)) {
			fieldNames = [fieldNames];
		}
		for (var i = 0, rows = list.getData(fieldName), sets = {}; i < rows.length; ++i) {
			for (var j = 0, row = rows[i]; j < fieldNames.length; ++j) {
				var fieldName = fieldNames[j];
				var fieldValue = row[fieldName];
				if (i == 0) {
					sets[fieldName] = {};
				}
				if (!Jui.string.isEmpty(fieldValue) && fieldValue in sets[fieldName]) {
					if (callback != null) {
						callback();
					}
					list.setEditIndex(i);
					alert($text("Public.ListDuplicationAlert").replace("${0}", list.getFieldTitle(fieldName)));
					list.setFieldFocus(fieldName);
					return false;
				}
				sets[fieldName][fieldValue] = 1;
			}
		}
		return true;
	},
	
	checkListValueEmptyAndDuplication: function(list, fieldNames, callback)
	{
		if (!Jui.array.isArray(fieldNames)) {
			fieldNames = [fieldNames];
		}
		for (var i = 0, rows = list.getData(fieldName), sets = {}; i < rows.length; ++i) {
			for (var j = 0, row = rows[i]; j < fieldNames.length; ++j) {
				var fieldName = fieldNames[j];
				var fieldValue = row[fieldName];
				if (i == 0) {
					sets[fieldName] = {};
				}
				if (Jui.string.isEmpty(fieldValue)) {
					if (callback != null) {
						callback();
					}
					list.setEditIndex(i);
					alert($text("Public.InputAlert").replace("${0}", list.getFieldTitle(fieldName)));
					list.setFieldFocus(fieldName);
					return false;
				}
				if (fieldValue in sets[fieldName]) {
					if (callback != null) {
						callback();
					}
					list.setEditIndex(i);
					alert($text("Public.ListDuplicationAlert").replace("${0}", list.getFieldTitle(fieldName)));
					list.setFieldFocus(fieldName);
					return false;
				}
				sets[fieldName][fieldValue] = 1;
			}
		}
		return true;
	},
	
	//-----------------------------------------------------------------------
	// workflow
	//-----------------------------------------------------------------------
	
	createAndStartProcess: function(workflowCode, entityId, callback)
	{
		var args = {workflowCode:workflowCode, entityId:entityId};
		Utility.invoke("Wf.Process.createAndStart", args, true, function(ret) {
			if (callback != null) {
				callback(ret);
			}
		});
	},
	
	//-----------------------------------------------------------------------
	// event
	//-----------------------------------------------------------------------
	
	doEditBoxChange: function()
	{
		CommonBusiness.processBoxChange(this);
	},
	
	doListBoxChange: function()
	{
		CommonBusiness.processBoxChange(this);
	},
	
	doListEditRowChange: function()
	{
		CommonBusiness.processListEditRowChange(this);
	},
	
	reloadSubDictionaryItems: function(box)
	{
		if (box.subDictionaryBoxes != null) {
			for (var i = 0; i < box.subDictionaryBoxes.length; ++i) {
				var subBox = box.subDictionaryBoxes[i];
				if (Jui.string.isEmpty(box.getValue())) {
					subBox.loadItems([], true);
				}
				else {
					var args = {dictionaryId:subBox.getArgs().dictionaryId, parentValue:box.getValue()};
					Utility.invoke("Qs.Dictionary.getComboBoxItemsJson", args, true, function(ret) {
						subBox.loadItems(ret.data, true);
						subBox.fireEvent("onchange");
					});
				}
			}
		}
	},
	
	processListEditRowChange: function(list)
	{
		var map = list.getBackForm().getControlMap();
		for (var fieldName in map) {
			CommonBusiness.processBoxChange(map[fieldName], true, false);		
		}
	},

	_eval: function(data, expression)
	{
		var keySet = Jui.array.toSet(Jui.util.getIdentifiers(expression));
		var buffer = [];
		for (var key in data) {
			if (key in keySet) {
				var value = data[key];
				if (typeof value === "string") {
					value = "'" + Jui.string.replaceForEval(value) + "'";
				}
				buffer.push("var " + key + " = " + value);
			}
		}
		buffer.push(expression);
		var expr = buffer.join(";");
		try {
			var result = eval(expr);
			return typeof result === "undefined" ? null : result;
		}
		catch (e) {
			console.error("Invalid form expression: " + expr, e);
		}
	},
	
	processBoxChange: function(box, ignoreFieldValue, isLoad)
	{
		try {
			if (box.getForm == null) {
				return;
			}
			var form = box.getForm();
			if (box.subDictionaryBoxes != null && !isLoad) {
				var queue = box.subDictionaryBoxes.slice();
				while (queue.length > 0) {
					var subBox = queue.shift();
					subBox.loadItems([], true);
					if (subBox.subDictionaryBoxes != null) {
						queue.concat(subBox.subDictionaryBoxes);
					}
				}
			}
			var linkage = box.getArgs().linkage;
			if (linkage == null) {
				return;
			}
			var boxValue = box.getValue();
			if (!ignoreFieldValue && linkage.hasServerLinkage) {
				var args = {fieldId:linkage.fieldId, form:form.getData()};
				Utility.invoke("Qs.FieldLinkage.getLinkageData", args, true, function(ret) {
					form.updateData(ret.data);
				});
			}
			
			var data = form.getData();
			for (var fieldName in data) {
				var value = data[fieldName];
				var box = form.getControl(fieldName);
				if (box instanceof Jui.basic.InputBox && box.isNumberType()) {
					data[fieldName] = box.getNumberValue();
				}
			}
			for (var i = 0, items = linkage.items || []; i < items.length; ++i) {
				var item = items[i];
				if (!ignoreFieldValue && !Jui.string.isEmpty(item.valueExpression) && !Jui.string.isEmpty(boxValue)) {
					var value = CommonBusiness._eval(data, item.valueExpression);
					if (typeof value !== "undefined") {
						if (value != null && typeof value == "object") {
							form.setFieldValue(item.linkFieldName, value.value, value.text);
						}
						else {
							form.setFieldValue(item.linkFieldName, value);
						}
					}
				}
				if (!ignoreFieldValue && !Jui.string.isEmpty(item.nullExpression) && Jui.string.isEmpty(boxValue)) {
					var value = CommonBusiness._eval(data, item.nullExpression);
					if (typeof value !== "undefined") {
						form.setFieldValue(item.linkFieldName, value);
					}
				}
				if (!Jui.string.isEmpty(item.visibleExpression)) {
					var visible = CommonBusiness._eval(data, item.visibleExpression);
					if (typeof value !== "undefined") {
						form.setFieldVisible(item.linkFieldName, visible);
					}
				}
				if (!Jui.string.isEmpty(item.statusExpression)) {
					var status = CommonBusiness._eval(data, item.statusExpression);
					if (typeof value !== "undefined") {
						form.setFieldEnabled(item.linkFieldName, status);
					}
				}
				if (!Jui.string.isEmpty(item.requireExpression)) {
					var required = CommonBusiness._eval(data, item.requireExpression);
					if (typeof value !== "undefined") {
						form.setFieldRequired(item.linkFieldName, required);
					}
				}
				if (!Jui.string.isEmpty(item.titleExpression) && form.setFieldTitle) {
					var title = CommonBusiness._eval(data, item.titleExpression);
					if (typeof value !== "undefined") {
						form.setFieldTitle(item.linkFieldName, title);
					}
				}
			}
		}
		catch (e) {
			Jui.message.error("Error in CommonBusiness.processBoxChange: " + e.message);
			console.log(e.stack);
		}
	},
	
	doAutoComplete: function(event)
	{
		var box = this;
		if (box instanceof Jui.basic.InputBox && box.getArgs().checkDuplicationOnInput) {
			var args = {
				unitId		: clientData.unitId,
				entityId	: clientData.entityId,
				fieldName	: box.getArgs().name,
				text		: event.text
			};
			Utility.invoke("Qs.Duplication.getAutoCompleteItems", args, false, function(ret) {
				box.setAutoCompleteItems(event.sequence, ret.items);
			});
		}
		else if (box instanceof Jui.basic.EntityBox) {
			var args = {
				unitCode	: box.getEntityType(),
				text		: event.text
			};
			if (box.getArgs().hasSelectListFilterSql && box.getForm() != null) {
				args.fieldId = box.getArgs().id;
				args.forms = {};
				CommonBusiness._fillFormDataForEntityBoxFilterSql(box, args.forms);
			}
			Utility.invoke("Qs.Keyword.getAutoCompleteItems", args, false, function(ret) {
				box.setAutoCompleteItems(event.sequence, ret.items);
			});
		}
	},

	getTempSchemaQueryArguments: function(box)
	{
		if (box.getArgs().hasSelectListFilterSql && box.getForm() != null) {
			var tempSchemaInfo = {entityBoxFieldId:box.getArgs().id, forms:{}};
			CommonBusiness._fillFormDataForEntityBoxFilterSql(box, tempSchemaInfo.forms);
			return {tempSchemaInfo:tempSchemaInfo};
		}
	},
	
	doEntityBoxSelect: function(event)
	{
		var box = this;
		var args = {multiSelect:false}; 
		if (event != null && event.type == "key") {
			args.keyword = box.getText();
			args.isEnterSelect = true;
		}
		if (box.getAttribute("basicQueryArguments") != null) {
			args.basicQueryArguments = box.getAttribute("basicQueryArguments");
		}
		//TODO remove it later
		else if (box.userData != null && box.userData.basicQueryArguments != null) {
			args.basicQueryArguments = box.userData.basicQueryArguments;
		}
		Jui.object.merge(args, CommonBusiness.getTempSchemaQueryArguments(box));
		CommonBusiness.selectEntity(box.getEntityType(), args, function(ret) {
			if (ret != null) {
				box.setValue(ret.id, ret.name);
				box.fireEvent("onchange");
			}
		});
	},
	
	doEntityBoxBeforeDrop: function()
	{
		var box = this;
		if (box.getArgs().hasSelectListFilterSql && box.getForm() != null) {
			var args = {isQueryDropdown:true, fieldId:box.getArgs().id, forms:{}};
			CommonBusiness._fillFormDataForEntityBoxFilterSql(box, args.forms);
			Utility.syncInvoke("Qs.QuerySchema.getEntityBoxDropdownListData", args, function(ret) {
				box.loadItems(ret.data);
			});
			return;
		}
		
//		var cacheKey = "EntityBoxDropdownList." + this.getEntityType().replace(/\./g, "-");
//		var items = Utility.getCacheItem(cacheKey);
//		if (items == null) {
//			var args = {unitCode:this.getEntityType()};
//			var ret = Utility.syncInvoke("Qs.QuerySchema.getEntityBoxDropdownListData", args);
//			if (ret == null) {
//				return;
//			}
//			items = ret.data;
//			Utility.setCacheItem(cacheKey, items);
//		}
//		box.loadItems(items);
		
		var args = {unitCode:this.getEntityType()};
		var ret = Utility.syncInvoke("Qs.QuerySchema.getEntityBoxDropdownListData", args);
		if (ret != null) {
			box.loadItems(ret.data);
		}
	},

	doMultiEntityBoxSelect: function(event)
	{
		var box  = this;
		var args = {fieldId:box.id, unitCode:box.getEntityType(), entityIds: box.getValues()};
		if (box.getArgs().selectDialogArgs != null) {
			Jui.object.merge(args, box.getArgs().selectDialogArgs);
		}
		if (box.getAttribute("basicQueryArguments") != null) {
			args.basicQueryArguments = box.getAttribute("basicQueryArguments");
		}
		Jui.object.merge(args, CommonBusiness.getTempSchemaQueryArguments(box));
		Utility.openDialog("Qs.Entity.MultiEntityBoxItems.page", args, {width:1200, height:600}, function(ret) {
			box.setValues(ret.ids, ret.names);
			box.fireEvent("onchange");
		});
	},
	
	_fillFormDataForEntityBoxFilterSql: function(box, args)
	{
		var data = {};
		var form = box.getForm();
		if (form != null) {
			data.form = form.getData();
			var master = form.getOwner() instanceof Jui.option.List ? form.getOwner().getOwner() : null;
			if (Jui.option && Jui.option.Form && Jui.master instanceof Jui.option.Form) {
				data.masterForm = master.getData();
			}
		}
		for (var i = 0, fields = box.getArgs().selectListFilterFields || []; i < fields.length; ++i) {
			var pair = fields[i].split(".");
			var prefix = pair[0];
			var fieldName = pair[1];
			if (args[prefix] == null) {
				args[prefix] = {};
			}
			var value = data[prefix] && data[prefix][fieldName];
			args[prefix][fieldName] = typeof value == "undefined" ? null : value;
		}
		if (args.masterForm != null && typeof EntityForm == "object") {
			args.masterUnitId = clientData.unitId;
		}
	},
	
	doEntityBoxView: function()
	{
		var box = this;
		var entityId = box.getValue();
		CommonBusiness.tryOpenViewPage(box.getEntityType(), entityId, false, function() {
			CommonBusiness.openEntity(box.getEntityType(), {entityId:entityId}, "Dialog", function() {
				box.fireEvent("onchange");
			});
		});
	},
	
	getPictureBoxUrl: function(pictureId)
	{
		return Utility.getUrl("Qs.Picture.View.file", {pictureId:pictureId});
	},
	
	doPictureBoxView: function()
	{
		return Utility.openDialog("Qs.Picture.View.page", {pictureId:this.getValue()});
	},
	
	doPictureBoxSelect: function(event)
	{
		var box = this;
		if (box.getArgs().isAvatar) {
			var args = {fileSelectOptions:box.getFileSelectOptions()};
			var options = {data:{file:event.file}};
			Utility.openDialog("Qs.Picture.AvatarEdit.page", args, options, function(ret) {
				box.setValue(ret.pictureId);
				box.fireEvent("onchange");
			});
		}
		else {
			var ajax = new Utility.Ajax("Qs.Picture.Upload.data");
			ajax.showAnimation = true;
			ajax.onsuccess = function(ret) {
				box.setValue(ret.pictureId);
				box.fireEvent("onchange");
			};
			ajax.submitFile(event.file);
		}
	},
	
	doEntityBoxPopupClick: function(args)
	{
		CommonBusiness.addToLastUse(this.getEntityType(), args.value, args.text);
	},
	
	deleteEntityBoxDropdownListCache: function(unitCode)
	{
		var cacheKey = "EntityBoxDropdownList." + unitCode.replace(/\./g, "-");
		Utility.deleteCacheItem(cacheKey);
	},
	
	doComboBoxBeforeDrop: function()
	{
		var parentBox 		= this.parentDictionaryBox;
		var initItems		= this.getArgs().items;
		var oldParentValue	= this.parentDictionaryValue;
		var newParentValue	= parentBox == null ? null : parentBox.getValue();
		if (parentBox != null && Jui.string.isEmpty(newParentValue)) {
			this.loadItems([], true);
		}
		else if (parentBox == null && initItems == null || parentBox != null && newParentValue != oldParentValue) {
			var parentValue = parentBox == null ? null : parentBox.getValue();
			var cacheKey = "Dictionary." + this.getArgs().dictionaryId;
			if (!Jui.string.isEmpty(parentValue)) {
				cacheKey += "." + parentValue;	
			}
			var items = Utility.getCacheItem(cacheKey);
			if (items == null) {
				var args = {dictionaryId:this.getArgs().dictionaryId, parentValue:parentValue};
				var ret = Utility.syncInvoke("Qs.Dictionary.getComboBoxItemsJson", args);
				if (ret == null) {
					return;
				}
				items = ret.data;
				Utility.setCacheItem(cacheKey, items);
			}
			if (parentBox != null) {
				this.parentDictionaryValue = parentValue;
			}
			this.loadItems(items);
		}
	},
	
	//-----------------------------------------------------------------------
	// controls
	//-----------------------------------------------------------------------

	createUpDownButtons: function(target, eventHandlers)
	{
		var buttons = {};
		buttons.moveTop = Jui.basic.Button.create({
			target	: target,		
			icon	: "quicksilver/image/16/MoveTop.png",
			onclick	: eventHandlers.doMoveTop
		});
		buttons.moveUp = Jui.basic.Button.create({
			target	: target,		
			icon	: "quicksilver/image/16/MoveUp.png",
			onclick	: eventHandlers.doMoveUp
		});
		buttons.moveDown = Jui.basic.Button.create({
			target	: target,		
			icon	: "quicksilver/image/16/MoveDown.png",
			onclick	: eventHandlers.doMoveDown
		});
		buttons.moveBottom = Jui.basic.Button.create({
			target	: target,		
			icon	: "quicksilver/image/16/MoveBottom.png",
			onclick	: eventHandlers.doMoveBottom
		});
		return buttons;
	}
};

//-----------------------------------------------------------------------
// Operation
//-----------------------------------------------------------------------

var Operation = {};

Operation.execute = function(code, options, userArgs, preFunc, postFunc)
{
	if (preFunc != null && preFunc() == false) {
		return;
	}
	options = options || {};
	var args = {code:code};
	if (clientData.pageType == "Edit") {
		if (options.validateForm && !form.validate()) {
			return;
		}
		args.entityIds = [clientData.entityId];
		args.forms = [form.getData()];
	}
	else if (clientData.pageType == "List") {
		var selectionMode = options.selectionMode || "single";
		args.entityIds = list.getSelectedKeys();
		if (selectionMode != "none" && (args.entityIds.length == 0 || args.entityIds[0] == null)) {
			alert($text("Public.SelectAlert"));
			return;
		}
		args.masterUnitId = clientData.masterUnitId;
		args.masterEnitityId = clientData.masterEntityId;
	}
	Jui.object.merge(args, userArgs, true);
	Utility.invoke("Qs.Operation.execute", args, true, function(ret) {
		if (!Jui.string.isEmpty(options.successMessage)) {
			alert(options.successMessage);
		}
		if (postFunc != null && postFunc(ret) == false) {
			return;
		}
		if (options.refresh != false) {
			if (clientData.pageType == "Edit") {
				EntityForm.reload(ret.entityIds[0]);
			}
			else if (clientData.pageType == "List") {
				list.refresh();
			}
		}
	});
};
