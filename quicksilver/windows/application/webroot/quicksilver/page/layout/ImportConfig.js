var ImportConfig =
{
	fieldMap: Jui.array.toMap(clientData.fields, "value"),
		
	templateFieldNames: clientData.templateFieldNames,
	
	duplicationGroups: [],
	
	templateSorters: {},
	
	duplicationSorters: {},
	
	doLoad: function()
	{
		ImportConfig._createControls();
		
		var title = $text("Qs.Import.FieldComposition");
		var listJson = {title:{fields:[{control:"InputBox", name:"titles", title:title}]}, data:[]};
		for (var i = 0, groupIndex = 0; i < clientData.duplicationConfigs.length; ++i) {
			var config = clientData.duplicationConfigs[i];
			if (config.groupIndex != groupIndex) {
				ImportConfig.duplicationGroups.push([]);
				listJson.data.push({});
				groupIndex = config.groupIndex;
			}
			var index = listJson.data.length - 1;
			ImportConfig.duplicationGroups[index].push(config.fieldName);
			var data = listJson.data[index];
			var fieldTitle = ImportConfig.fieldMap[config.fieldName].text;
			data.titles = (data.titles == null ? "" : data.titles + " + ") + fieldTitle;
		}
		ImportConfig.duplicationList.load(listJson);
		ImportConfig.duplicationList.selectByIndex(0);

		ImportConfig.mappingList.loadTitle({fields:[
			{
				control	: "InputBox",
				name	: "FColumnTitle",
				title	: $text("Qs.Import.Mapping.ColumnTitle"),
				width	: 230
			},
			{
				control	: "ComboBox",
				name	: "FFieldName",
				title	: $text("Qs.Import.Mapping.FieldName"),
				items	: clientData.fields,
				width	: 230
			},
			{
				control	: "CheckBox",
				name	: "FLocked",
				title	: $text("Qs.Import.Mapping.Locked"),
				width	: 26,
				disabled: true,
				align	: "center"
			}
		]});
		ImportConfig.mappingList.loadData(clientData.fieldMappings);

		ImportConfig.setSorterFields(ImportConfig.templateFieldNames, ImportConfig.templateSorters);
		var index = ImportConfig.duplicationList.getSelectedIndices()[0];
		if (index >= 0) {
			ImportConfig.setSorterFields(ImportConfig.duplicationGroups[index], ImportConfig.duplicationSorters);
		}
	},

	doSave: function()
	{
		var args = {
			unitId				: clientData.urlArgs.masterEntityId,
			templateFieldNames	: ImportConfig.templateFieldNames,
			duplicationConfigs	: [],
			fieldMappings		: []
		};
		var inputAlert = $text("Public.InputAlert");
		for (var i = 0, data = ImportConfig.duplicationList.getData(); i < data.length; ++i) {
			if (Jui.string.isEmpty(data[i].titles)) {
				ImportConfig.tabStrip.setIndex(1);
				ImportConfig.duplicationList.selectByIndex(i, true);
				Jui.message.alert(inputAlert.replace("${0}", $text("Qs.Import.FieldComposition")));
				return;
			}
		}
		for (var i = 0; i < ImportConfig.duplicationGroups.length; ++i) {
			for (var j = 0, names = ImportConfig.duplicationGroups[i]; j < names.length; ++j) {
				args.duplicationConfigs.push({FGroupIndex:i + 1, FFieldName:names[j], FIndex: j + 1});
			}
		}
		var columnTitleSet = {};
		for (var i = 0, data = ImportConfig.mappingList.getData(); i < data.length; ++i) {
			if (data[i].FColumnTitle in columnTitleSet) {
				var message = $text("Qs.Import.Mapping.DuplicatedAlert");
				return ImportConfig.showMappingError(i, "FColumnTitle", message);
			}
			columnTitleSet[data[i].FColumnTitle] = 1;
			if (Jui.string.isEmpty(data[i].FColumnTitle)) {
				var message = inputAlert.replace("${0}", $text("Qs.Import.Mapping.ColumnTitle"));
				return ImportConfig.showMappingError(i, "FColumnTitle", message);
			}
			else if (Jui.string.isEmpty(data[i].FFieldName)) {
				var message = inputAlert.replace("${0}", $text("Qs.Import.Mapping.FieldName"));
				return ImportConfig.showMappingError(i, "FFieldName", message);
			}
			if (!data[i].FLocked) {
				args.fieldMappings.push(data[i]);
			}
		}
		Utility.invoke("Qs.Import.saveConfig", args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
			ImportConfig.mappingList.clearModificationFlag();
		});
	},

	showMappingError: function(index, fieldName, message)
	{
		ImportConfig.tabStrip.setIndex(2);
		ImportConfig.mappingList.setEditIndex(index);
		Jui.message.alert(message, function() {
			ImportConfig.mappingList.getControl(fieldName).focus();
		});
	},

	doDownloadTemplate: function()
	{
		var args = {unitId:clientData.urlArgs.masterEntityId};
		Utility.download("Qs.Import.downloadTemplate", args);
	},

	doAddDuplicationButtonClick: function()
	{
		ImportConfig.duplicationGroups.push([]);
		ImportConfig.duplicationList.appendData([{}]);
		ImportConfig.duplicationList.selectByIndex(ImportConfig.duplicationList.length() - 1, true);
	},

	doDeleteDuplicationButtonClick: function()
	{
		var index = ImportConfig.duplicationList.getSelectedIndices()[0];
		if (index == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		if (ImportConfig.duplicationList.length() == 1) {
			Jui.message.alert($text("Qs.Import.AtLeastOneDuplicationGroup"));
			return;
		}
		ImportConfig.duplicationGroups.splice(index, 1);
		ImportConfig.duplicationList.deleteRowsByIndex(index);
		var newIndex = index > ImportConfig.duplicationList.length() - 1 ? index - 1 : index;
		ImportConfig.duplicationList.selectByIndex(newIndex, true);
	},

	doAddMappingButtonClick: function()
	{
		ImportConfig.mappingList.appendData([{FLocked:false}]);
		ImportConfig.mappingList.setEditIndex(ImportConfig.mappingList.length() - 1);
	},

	doDeleteMappingButtonClick: function()
	{
		if (ImportConfig.mappingList.getEditFieldValue("FLocked")) {
			Jui.message.alert($text("Qs.Import.Mapping.CannotDeleteLocked"));
			return;
		}
		ImportConfig.mappingList.deleteEditRow();
	},

	doLeftButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.left.add(sorters.right.getSelectedData());
		sorters.right.deleteSelected();
	},

	doRightButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.right.add(sorters.left.getSelectedData());
		sorters.left.deleteSelected();
	},

	doUpButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.right.moveUp();
	},

	doDownButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.right.moveDown();
	},

	doTopButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.right.moveTop();
	},

	doBottomButtonClick: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		sorters.right.moveBottom();
	},

	doRightSorterChange: function()
	{
		var sorters = ImportConfig.getCurrentSorters();
		if (ImportConfig.tabStrip.getIndex() == 0) {
			ImportConfig.templateFieldNames = sorters.right.getValues();
		}
		else {
			var index = ImportConfig.duplicationList.getSelectedIndices()[0];
			ImportConfig.duplicationGroups[index] = sorters.right.getValues();
			var json = {titles:sorters.right.getTexts().join(" + ")};
			ImportConfig.duplicationList.updateDataByIndex(json, index);
		}
	},

	doDuplicationListSelect: function()
	{
		var index = ImportConfig.duplicationList.getSelectedIndices()[0];
		if (index >= 0) {
			ImportConfig.setSorterFields(ImportConfig.duplicationGroups[index], ImportConfig.duplicationSorters);
		}
	},

	doMappingListEditRowChange: function()
	{
		var locked = ImportConfig.mappingList.getEditFieldValue("FLocked");
		ImportConfig.mappingList.getControl("FColumnTitle").setDisabled(locked);
		ImportConfig.mappingList.getControl("FFieldName").setDisabled(locked);
	},

	setSorterFields: function(fieldNames, sorters)
	{
		var selectedValueSet = {};
		for (var i = 0; i < fieldNames.length; ++i) {
			selectedValueSet[fieldNames[i]] = 1;
		}
		var leftData = [];
		for (var i = 0, fields = clientData.fields; i < fields.length; ++i) {
			if (!(fields[i].value in selectedValueSet)) {
				leftData.push(fields[i]);
			}
		}
		var rightData = [];
		for (var i = 0; i < fieldNames.length; ++i) {
			if (fieldNames[i] in ImportConfig.fieldMap) {
				rightData.push(ImportConfig.fieldMap[fieldNames[i]]);
			}
		}
		sorters.left.load(leftData);
		sorters.right.load(rightData);
	},
	
	getCurrentSorters: function()
	{
		var index = ImportConfig.tabStrip.getIndex();
		return index == 1 ? ImportConfig.duplicationSorters : ImportConfig.templateSorters;
	},
	
	_createControls: function()
	{
		ImportConfig.templateSorters.left = Jui.option.Sorter.create({
			target			: "TemplateLeftSorterPanel",
			ondoubleclick	: ImportConfig.doRightButtonClick
		});
		ImportConfig.templateSorters.right = Jui.option.Sorter.create({
			target			: "TemplateRightSorterPanel", 
			onchange		: ImportConfig.doRightSorterChange,
			ondoubleclick	: ImportConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick 		: ImportConfig.doRightButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: ImportConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: ImportConfig.doTopButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: ImportConfig.doUpButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: ImportConfig.doDownButtonClick
		});
		Jui.basic.Button.create({
			target			: "TemplateButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: ImportConfig.doBottomButtonClick
		});
		
		ImportConfig.duplicationList = Jui.option.List.create({
			target			: "DuplicationListPanel",
			border			: "all",
			multiPage		: false,
			multiSelect		: false,
			onselect		: ImportConfig.doDuplicationListSelect
		});
		Jui.basic.Button.create({
			target			: "DuplicationListButtonPanel",
			icon			: "quicksilver/image/16/Plus.gif",
			onclick 		: ImportConfig.doAddDuplicationButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationListButtonPanel",
			icon			: "quicksilver/image/16/Minus.gif",
			onclick 		: ImportConfig.doDeleteDuplicationButtonClick
		});
		ImportConfig.duplicationSorters.left = Jui.option.Sorter.create({
			target			: "DuplicationLeftSorterPanel",
			ondoubleclick	: ImportConfig.doRightButtonClick
		});
		ImportConfig.duplicationSorters.right = Jui.option.Sorter.create({
			target			: "DuplicationRightSorterPanel", 
			onchange		: ImportConfig.doRightSorterChange,
			ondoubleclick	: ImportConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick 		: ImportConfig.doRightButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: ImportConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: ImportConfig.doTopButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: ImportConfig.doUpButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: ImportConfig.doDownButtonClick
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: ImportConfig.doBottomButtonClick
		});

		ImportConfig.mappingList = Jui.option.List.create({
			target			: "MappingListPanel",
			border			: "all",
			editable		: true,
			multiPage		: false,
			multiSelect		: false,
			oneditrowchange	: ImportConfig.doMappingListEditRowChange
		});
		Jui.basic.Button.create({
			target			: "MappingListButtonPanel",
			icon			: "quicksilver/image/16/Plus.gif",
			onclick 		: ImportConfig.doAddMappingButtonClick
		});
		Jui.basic.Button.create({
			target			: "MappingListButtonPanel",
			icon			: "quicksilver/image/16/Minus.gif",
			onclick 		: ImportConfig.doDeleteMappingButtonClick
		});
		
		ImportConfig.tabStrip = Jui.option.TabStrip.create({
			target		: "QsContent"
		});
		ImportConfig.tabStrip.load([
			{text:$text("Qs.Import.TemplateConfig"),	body:"TemplatePanel"},
			{text:$text("Qs.Import.DuplicationConfig"),	body:"DuplicationPanel"},
			{text:$text("Qs.Import.MappingConfig"),		body:"MappingPanel"}
		]);
	}
};
