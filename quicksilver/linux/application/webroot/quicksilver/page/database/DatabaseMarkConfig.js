var DatabaseMarkConfig = 
{
	ignoreTables: clientData.ignoreTables,

	templateSorters: {},

	tableColumnMap: clientData.tableColumnMap,

	duplicationConfigsMap: clientData.duplicationConfigsMap,

	duplicationConfigsMapTemp: {},

	allNeedToSetTableList: clientData.duplicationTables,
	
	doLoad: function()
	{
		DatabaseMarkConfig._createControls();
		DatabaseMarkConfig.setSorterTables(DatabaseMarkConfig.ignoreTables, DatabaseMarkConfig.templateSorters);
		DatabaseMarkConfig.sqlMarkDuplicationList.loadTitle({fields:[ 
		    {
			    control      : "InputBox",
				name         : "FTableTitle",
				title        : $text("Qs.DatabaseMarkList.MarkTableName"),
				width        : 250
			},
			{
				control      : "MultiCheckComboBox",
				name         : "FColumn",
				title        : $text("Qs.Import.FieldComposition"),
				onchange     : DatabaseMarkConfig.doListOptionChange
			} 
		]});
		DatabaseMarkConfig.setSqlMarkDuplicationList();
	},

	doSave: function(event)
	{
		var args = {
			ignoreTables : DatabaseMarkConfig.ignoreTables,
			duplicationConfigsMap : DatabaseMarkConfig.duplicationConfigsMap
		};
		Utility.invoke("Qs.DatabaseMark.saveConfig", args, true, function(ret) {
		    Jui.message.hint($text("Public.SaveSuccess"));
		});
	},

	getAllTables: function()
	{
		var allTablesArray = [];
		var tables         = clientData.tables;
		for(var i = 0; i < tables.length; ++i){
			var table = tables[i];
			allTablesArray.push({"value":table, "text":table});
		}
		return allTablesArray;
	},
	
	setSqlMarkDuplicationList: function()
	{
		var list = DatabaseMarkConfig.sqlMarkDuplicationList;
		list.getControl("FColumn").loadItems(DatabaseMarkConfig.getAllItems());
		var dpconfigsSetted = DatabaseMarkConfig.duplicationConfigsMap;
		var allNeedToSetTableList = DatabaseMarkConfig.allNeedToSetTableList;
		var dpData = [];
		var ignoreTableSet =Jui.array.toSet(DatabaseMarkConfig.ignoreTables || []);  
		for (var i = 0; i < allNeedToSetTableList.length; ++i) {
			 var tableName = allNeedToSetTableList[i];
			 if (tableName in ignoreTableSet) {
				continue;
			 }
			 var data = {FTableTitle : tableName};
			 if (tableName in dpconfigsSetted) {
				data.FColumn = dpconfigsSetted[tableName] + "";
			 }
			 dpData.push(data);
		}
		DatabaseMarkConfig.sqlMarkDuplicationList.loadData(dpData);
	},
	
	doListOneEditRowChange: function(event)
	{
		var list      = DatabaseMarkConfig.sqlMarkDuplicationList;
		var index     = list.getEditIndex();
		var tableName = list.getSelectedFieldValues("FTableTitle")[0];
		var values    = [];
		list.getControl("FColumn").loadItems(DatabaseMarkConfig.getDropdownItems()[tableName]);
	    if (tableName in DatabaseMarkConfig.duplicationConfigsMap) {
			values = DatabaseMarkConfig.duplicationConfigsMap[tableName];
		}
		list.getControl("FColumn").setValues(values);
	},
	
	getDropdownItems: function()
	{
		var items = {};
		for (var table in DatabaseMarkConfig.tableColumnMap) {
			var options = [];
			for (var i = 0, columns = DatabaseMarkConfig.tableColumnMap[table]; i < columns.length; ++i) {
				options.push({text:columns[i], value:columns[i]});
			}
			items[table] = options;
		}
		return items;
	},
	
	doListOptionChange: function()
	{
		var list      = DatabaseMarkConfig.sqlMarkDuplicationList;
		var index     = list.getEditIndex();
		var tableName = list.getSelectedFieldValues("FTableTitle")[0];
		DatabaseMarkConfig.duplicationConfigsMap[tableName] = this.getValues();
	},
	
	getAllItems: function()
	{
		var items = [];
		var columnsSet = {};
		var ignoreTableSet = Jui.array.toSet(DatabaseMarkConfig.ignoreTables || []);
		var tables = [];
		for (var tableName in DatabaseMarkConfig.tableColumnMap) {
			if (tableName in ignoreTableSet) {
				continue;
			}
			for (var i = 0, columns = DatabaseMarkConfig.tableColumnMap[tableName]; i < columns.length; ++i) {
				if (!columnsSet[columns[i]]) {
					tables.push(columns[i]);
					columnsSet[columns[i]] = true;
				}  
			}
		}
		tables.sort();
		for (var i = 0; i< tables.length; ++i) {
			items.push({text:tables[i], value:tables[i]});
		}
		return items;
	},

	doLeftButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		var array = sorters.right.getSelectedData();
		sorters.left.add(sorters.right.getSelectedData());
		sorters.right.deleteSelected();
		DatabaseMarkConfig.updateOptionItemsSelected(array, "delIgnore");
	},

	doRightButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		var array = sorters.left.getSelectedData();
		sorters.right.add(sorters.left.getSelectedData());
		sorters.left.deleteSelected();
		DatabaseMarkConfig.updateOptionItemsSelected(array, "addIgnore")
	},

	doUpButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		sorters.right.moveUp();
	},

	doDownButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		sorters.right.moveDown();
	},

	doTopButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		sorters.right.moveTop();
	},

	doBottomButtonClick: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		sorters.right.moveBottom();
	},

	doRightSorterChange: function()
	{
		var sorters = DatabaseMarkConfig.getCurrentSorters();
		DatabaseMarkConfig.ignoreTables = sorters.right.getValues();
	},

	setSorterTables: function(tableNames, sorters)
	{
		var selectedValueSet = Jui.array.toSet(tableNames) || {};
		var rightData        = [];
		var leftData         = [];
		var tables           = DatabaseMarkConfig.getAllTables();
		for (var i = 0; i < tables.length; ++i) {
			if (tables[i].value in selectedValueSet) {
				rightData.push(tables[i]);
			}
			else {
				leftData.push(tables[i]);
			}
		}
		sorters.left.load(leftData);
		sorters.right.load(rightData);
	},

	getCurrentSorters: function() 
	{
		return DatabaseMarkConfig.templateSorters;
	},

	updateOptionItemsSelected: function(array, action)
	{
		var saveTemp = DatabaseMarkConfig.duplicationConfigsMapTemp;
		for (var i = 0; i < array.length; ++i) {
			 var tableName = array[i].text;
			 if (tableName in DatabaseMarkConfig.tableColumnMap) {
				if (action == "addIgnore") {
					saveTemp[tableName] = DatabaseMarkConfig.duplicationConfigsMap[tableName];
					delete DatabaseMarkConfig.duplicationConfigsMap[tableName];
				}
				else if (action == "delIgnore") {
					DatabaseMarkConfig.duplicationConfigsMap[tableName] = saveTemp[tableName];
					delete saveTemp[tableName];
				}
			}
		}
		DatabaseMarkConfig.setSqlMarkDuplicationList();
	},

	_createControls: function()
	{
		DatabaseMarkConfig.templateSorters.left = Jui.option.Sorter.create({
			target          : "TemplateLeftSorterPanel",
			ondoubleclick   : DatabaseMarkConfig.doRightButtonClick
		});
		DatabaseMarkConfig.templateSorters.right = Jui.option.Sorter.create({
		    target          : "TemplateRightSorterPanel",
		    onchange        : DatabaseMarkConfig.doRightSorterChange,
		    ondoubleclick   : DatabaseMarkConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveRight.png",
			onclick         : DatabaseMarkConfig.doRightButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveLeft.png",
			onclick         : DatabaseMarkConfig.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveTop.png",
			style           : "margin-top:12px",
			onclick         : DatabaseMarkConfig.doTopButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveUp.png",
			onclick         : DatabaseMarkConfig.doUpButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveDown.png",
			onclick         : DatabaseMarkConfig.doDownButtonClick
		});
		Jui.basic.Button.create({
			target          : "TemplateButtonPanel",
			icon            : "quicksilver/image/16/MoveBottom.png",
			onclick         : DatabaseMarkConfig.doBottomButtonClick
		});
		
		DatabaseMarkConfig.tabStrip = Jui.option.TabStrip.create({
			target          : "QsContent"
		});
		DatabaseMarkConfig.sqlMarkDuplicationList = Jui.option.List.create({
			target          : "SqlMarkDuplicationListPanel",
			border          : "all",
			multiPage       : false,
			multiSelect     : false,
			oneditrowchange : DatabaseMarkConfig.doListOneEditRowChange,
			editable	    : true		
		});
		DatabaseMarkConfig.tabStrip.load([ 
		    {text:$text("Qs.DatabaseMarkList.MarkTableIgnoreSet"),  body:"TemplatePanel"},
		    {text:$text("Qs.Import.DuplicationConfig"),             body:"SqlMarkDuplicationPanel"} 
		]);
	}
};