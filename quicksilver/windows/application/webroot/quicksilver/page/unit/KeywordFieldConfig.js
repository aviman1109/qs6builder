var KeywordFieldConfig =
{
	sorters: [],
	
	buttons: [],
	
	fullTextDropdownItems: [],
	
	doLoad: function()
	{
		var toolBarRightItemMap = Jui.array.toMap(clientData.toolBarJson.right, "name");
		KeywordFieldConfig.fullTextDropdownItems = toolBarRightItemMap["FullTextSearch"].items;
		KeywordFieldConfig.createControls();
		KeywordFieldConfig.loadData();
	},

	doSave: function()
	{
		KeywordFieldConfig.save(false);
	},
	
	doBuildIndex: function()
	{
		KeywordFieldConfig.save(true);
	},
	
	doDeleteIndex: function()
	{
		Jui.message.confirm($text("Public.LongWaitConfirm"), function() {
			var args = {unitId:clientData.unitId};
			Utility.invoke("Qs.FullText.deleteIndex", args, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
			});
		});
	},

	save: function(buildIndex)
	{
		var args = {
			unitId					: clientData.unitId,
			isFullTextSearch		: KeywordFieldConfig.isFullTextSearchBox.getValue(),
			searchAttachment		: KeywordFieldConfig.searchAttachmentBox.getValue(),
			supportEqualQuery		: KeywordFieldConfig.supportEqualQueryBox.getValue(),
			extraQueryResultLimit	: KeywordFieldConfig.resultLimitBox.getNumberValue(),
			keywordFieldNames		: KeywordFieldConfig.sorters[0].right.getValues(),
			equalQueryFieldNames	: KeywordFieldConfig.sorters[1].right.getValues(),
			buildIndex				: buildIndex
		};
		if (args.keywordFieldNames.length == 0) {
			KeywordFieldConfig.tabStrip.setIndex(0);
			Jui.message.alert($text("Qs.Keyword.SelectKeywordFieldAlert"));
			return;
		}
		if (args.supportEqualQuery && args.equalQueryFieldNames.length == 0) {
			KeywordFieldConfig.tabStrip.setIndex(1);
			Jui.message.alert($text("Qs.Keyword.SelectEqualQueryFieldAlert"), function() {
				KeywordFieldConfig.supportEqualQueryBox.focus();
			});
			return;
		}
		if (args.extraQueryResultLimit < 0 || args.extraQueryResultLimit > 10) {
			KeywordFieldConfig.tabStrip.setIndex(2);
			var message = $text("Public.InputRangedNumberAlert").replace("${0}", "0").replace("${1}", "10");
			Jui.message.alert(message, function() {
				KeywordFieldConfig.resultLimitBox.focus();
			});
			return;
		}
		if (!buildIndex || confirm($text("Public.LongWaitConfirm"))) {
			Utility.invoke("Qs.Keyword.saveFieldConfig", args, true, function() {
				Jui.message.hint($text(buildIndex ? "Public.OperationSuccess" : "Public.SaveSuccess"));
				if (!buildIndex) {
					Utility.closeDialog();
				}
			});
		}
	},
	
	doLeftButtonClick: function()
	{
		var sorters = KeywordFieldConfig.getSorters();
		sorters.left.add(sorters.right.getSelectedData());
		sorters.right.deleteSelected();
	},

	doRightButtonClick: function()
	{
		var sorters = KeywordFieldConfig.getSorters();
		sorters.right.add(sorters.left.getSelectedData());
		sorters.left.deleteSelected();
	},

	doUpButtonClick: function()
	{
		KeywordFieldConfig.getSorters().right.moveUp();
	},

	doDownButtonClick: function()
	{
		KeywordFieldConfig.getSorters().right.moveDown();
	},

	doTopButtonClick: function()
	{
		KeywordFieldConfig.getSorters().right.moveTop();
	},

	doBottomButtonClick: function()
	{
		KeywordFieldConfig.getSorters().right.moveBottom();
	},
	
	getSorters: function()
	{
		return KeywordFieldConfig.sorters[KeywordFieldConfig.tabStrip.getIndex()];
	},
	
	doSuppoerEqualQueryBoxChange: function()
	{
		var disabled = !KeywordFieldConfig.supportEqualQueryBox.getValue();
		var sorters = KeywordFieldConfig.sorters[1];
		var buttons = KeywordFieldConfig.buttons[1];
		sorters.left.setDisabled(disabled);
		sorters.right.setDisabled(disabled);
		buttons.moveLeft.setDisabled(disabled);
		buttons.moveRight.setDisabled(disabled);
		buttons.moveTop.setDisabled(disabled);
		buttons.moveUp.setDisabled(disabled);
		buttons.moveDown.setDisabled(disabled);
		buttons.moveBottom.setDisabled(disabled);
	},
	
	doIsFullTextSearchBoxChange: function()
	{
		var isFullTextSearch = KeywordFieldConfig.isFullTextSearchBox.getValue();
		KeywordFieldConfig.searchAttachmentBox.setDisabled(!isFullTextSearch);
		KeywordFieldConfig.fullTextDropdownItems[0].disabled = !isFullTextSearch;
		toolBar.getItem("FullTextSearch").setItems(KeywordFieldConfig.fullTextDropdownItems);
	},

	createControls: function()
	{
		KeywordFieldConfig.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		KeywordFieldConfig.tabStrip.load([
  			{text:$text("Qs.Keyword.TabTitle.Keyword"),		body:"KeywordTabBody"},
  			{text:$text("Qs.Keyword.TabTitle.EqualQuery"),	body:"EqualQueryTabBody"},
  			{text:$text("Qs.Keyword.TabTitle.ResultLimit"),	body:"ResultLimitTabBody"}
  		]);
		var panels = [$elem("KeywordDoubleSorter"), $elem("EqualQueryDoubleSorter")]; 
		for (var i = 0; i < panels.length; ++i) {
			var cells	= panels[i].children;
			var sorters = {};
			var buttons = {};
			sorters.left = Jui.option.Sorter.create({
				target			: cells[0], 
				ondoubleclick	: KeywordFieldConfig.doRightButtonClick
			});
			sorters.right = Jui.option.Sorter.create({
				target			: cells[2],
				ondoubleclick	: KeywordFieldConfig.doLeftButtonClick
			});
			buttons.moveRight = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveRight.png",
				onclick		 	: KeywordFieldConfig.doRightButtonClick
			});
			buttons.moveLeft = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveLeft.png",
				onclick			: KeywordFieldConfig.doLeftButtonClick
			});
			buttons.moveTop = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveTop.png",
				style			: "margin-top:12px",
				onclick			: KeywordFieldConfig.doTopButtonClick
			});
			buttons.moveUp = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveUp.png",
				onclick			: KeywordFieldConfig.doUpButtonClick
			});
			buttons.moveDown = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveDown.png",
				onclick			: KeywordFieldConfig.doDownButtonClick
			});
			buttons.moveBottom = Jui.basic.Button.create({
				target			: cells[1].firstChild,
				icon			: "quicksilver/image/16/MoveBottom.png",
				onclick			: KeywordFieldConfig.doBottomButtonClick
			});
			KeywordFieldConfig.sorters.push(sorters);
			KeywordFieldConfig.buttons.push(buttons);
		}
		KeywordFieldConfig.isFullTextSearchBox = Jui.basic.CheckBox.create({
			target		: "IsFullTextSearchCell",
			disabled	: !clientData.isSolrEnabled,
			value		: clientData.isSolrEnabled && clientData.isFullTextSearch,
			onchange	: KeywordFieldConfig.doIsFullTextSearchBoxChange
		});
		KeywordFieldConfig.searchAttachmentBox = Jui.basic.CheckBox.create({
			target			: "SearchAttachmentCell",
			clearOnDisable	: true,
			restoreOnEnable	: true,
			value			: clientData.searchAttachment
		});
		KeywordFieldConfig.supportEqualQueryBox = Jui.basic.CheckBox.create({
			target	: "SupportEqualQueryCell",
			value	: clientData.supportEqualQuery,
			onchange: KeywordFieldConfig.doSuppoerEqualQueryBoxChange
		});
		KeywordFieldConfig.resultLimitBox = Jui.basic.InputBox.create({
			target	: "ResultLimitCell",
			type	: "int",
			style	: "width:120px",
			value	: clientData.extraQueryResultLimit
		});
		KeywordFieldConfig.doIsFullTextSearchBoxChange();
		KeywordFieldConfig.doSuppoerEqualQueryBoxChange();
	},
	
	loadData: function()
	{
		var array = [clientData.keywordFields, clientData.equalQueryFields];
		for (var i = 0; i < array.length; ++i) {
			var allItems			= clientData.allFields;
			var selectedValues		= array[i];
			var allItemMap 			= Jui.array.toMap(allItems, "value");
			var selectedValueSet	= Jui.array.toSet(selectedValues);
			var leftData			= [];
			var rightData			= [];
			for (var j = 0; j < allItems.length; ++j) {
				if (!(allItems[j].value in selectedValueSet)) {
					leftData.push(allItems[j]);
				}
			}
			leftData.sort(function(a, b){return a.text.localeCompare(b.text);});
			for (var j = 0; j < selectedValues.length; ++j) {
				if (selectedValues[j] in allItemMap) {
					rightData.push(allItemMap[selectedValues[j]]);
				}
			}
			KeywordFieldConfig.sorters[i].left.load(leftData);
			KeywordFieldConfig.sorters[i].right.load(rightData);
		}
	}
};

Jui.use("Jui.option.MultiRowTabStrip");