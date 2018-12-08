var MultiEntityBoxItems =
{
	EntityList: null,
	
	doLoad: function()
	{
		MultiEntityBoxItems.createControls();
		var entityIds = clientData.urlArgs.entityIds;
		var args = {unitId:clientData.unitId, entityIds:entityIds};
		Utility.invoke("Qs.Misc.getMultiEntityBoxItemListData", args, true, function(ret) {
			var data = [];
			var map = Jui.array.toMap(ret.data, "value");
			for (var i = 0; i < entityIds.length; ++i) {
				var row = map[entityIds[i]];
				if (row != null) {
					data.push(row);
				}
			}
			MultiEntityBoxItems.sorter.load(data);
		});
	},
	
	doListFrameLoad: function()
	{
		var queryWindow = $elem("QueryFrame").contentWindow;
		queryWindow.list.ondoubleclick = MultiEntityBoxItems.doQueryListDoubleClick;
		MultiEntityBoxItems.EntityList = queryWindow.EntityList;
		if (!MultiEntityBoxItems.EntityList.hasTree && !MultiEntityBoxItems.EntityList.hasQueryForm) {
			toolBar.setItemVisible("LeftPaneSwitch", false);
		}
		toolBar.getItem("NavigateBackward").onclick = MultiEntityBoxItems.EntityList.doNavigationButtonClick;
		toolBar.getItem("NavigateForward").onclick = MultiEntityBoxItems.EntityList.doNavigationButtonClick;
		
		var schemaBox = toolBar.getItem("QuerySchema");
		schemaBox.loadItems(queryWindow.clientData.querySchemas || []);
	},
	
	processToolBarJson: function(json)
	{
		var schemaEmptyText;
		if (clientData.defaultSchema == null) {
			schemaEmptyText = $text("Qs.List.QuerySchemaEmptyText1");
		}
		else {
			schemaEmptyText = $text("Qs.List.QuerySchemaEmptyText2").replace("${0}", clientData.defaultSchema.name);
		}
		var keywordTitles = clientData.keywordTitles.join("/");
		json.left = json.left || [];
		
		json.left.unshift({
			name		: 'LeftPaneSwitch',
			control		: 'Button',
			icon		: 'quicksilver/image/16/FrameLeft.png',
			hint		: $text('Qs.List.SwitchLeftPane'),
			onclick		: MultiEntityBoxItems.doLeftPaneVisibilitySwitch
		});
		json.left.push({
			name		: 'NavigateBackward',
			control		: 'Button',
			icon		: 'quicksilver/image/16/PagePrevious.gif',
			hint		: $text('Qs.List.NavigateBackwardHint'),
			disabled	: true
		});
		json.left.push({
			name		: 'NavigateForward',
			control		: 'Button',
			icon		: 'quicksilver/image/16/PageNext.gif',
			hint		: $text('Qs.List.NavigateForwardHint'),
			disabled	: true
		});
		json.left.push({
			name		: "QuerySchema",
			control		: "ComboBox",
			hint		: $text("Qs.List.QuerySchemaHint"),
			emptyText	: schemaEmptyText,
			disabled	: Jui.cast.toBool(clientData.urlArgs.schemaLocked, false),
            selectOnly	: true,
            textAsValue	: false,
            onchange	: MultiEntityBoxItems.doQuerySchemaChange
		});
		json.left.push({
			name		: "QuerySchemaConfig",
			control		: "Button",
			icon		: "quicksilver/image/16/Config.png",
			hint		: $text("Qs.List.QueryBoxClearHint"),
			onclick		: MultiEntityBoxItems.doQuerySchemaConfig
		});
		json.left.push({
			name		: "Keyword",
			control		: "InputBox",
			hint		: $text("Qs.List.KeywordHint").replace("${0}", keywordTitles),
			emptyText	: keywordTitles,
	        onkeydown	: MultiEntityBoxItems.doKeywordKeyDown
		});
		json.left.push({
			name		: "QueryBoxClear",
			control		: "Button",
			icon		: "quicksilver/image/16/Clear.png",
			hint		: $text("Qs.List.QueryBoxClearHint"),
			onclick		: MultiEntityBoxItems.doQueryBoxClear
		});
		return json;
	},

	doNavigationButtonClick: function(event)
	{
		MultiEntityBoxItems.EntityList.doNavigationButtonClick(event);
	},

	doQuerySchemaChange: function(event)
	{
		MultiEntityBoxItems.EntityList.doQuerySchemaChange(event);
	},
	
	doQuerySchemaKeyDown: function(event)
	{
		MultiEntityBoxItems.EntityList.doQuerySchemaKeyDown(event);
	},
	
	doQuerySchemaConfig: function(event)
	{
		MultiEntityBoxItems.EntityList.doQuerySchemaConfig(event);
	},
	
	doQueryBoxClear: function(event)
	{
		MultiEntityBoxItems.EntityList.doQueryBoxClear(event);
	},

	doKeywordKeyDown: function(event)
	{
		MultiEntityBoxItems.EntityList.doKeywordKeyDown(event);
	},

	doLeftPaneVisibilitySwitch: function(event)
	{
		MultiEntityBoxItems.EntityList.doLeftZoneSwitch(event);
	},
	
	doConfirm: function()
	{
		var items 	= MultiEntityBoxItems.sorter.getData();
		var ids 	= Jui.array.extractProperty(items, "value");
		var names	= Jui.array.extractProperty(items, "text");
		Utility.closeDialog({ids:ids, names:names});
	},

	doQueryListDoubleClick: function(event)
	{
		if (!MultiEntityBoxItems.sorter.containsValue(event.id)) {
			MultiEntityBoxItems.sorter.add([{value:event.id, text:event.name}]);
		}
	},
	
	doAdd: function()
	{
		var data = $elem("QueryFrame").contentWindow.list.getSelectedPairs();
		for (var i = 0; i < data.length; ++i) {
			var item = data[i];
			if (!MultiEntityBoxItems.sorter.containsValue(item.id)) {
				MultiEntityBoxItems.sorter.add([{value:item.id, text:item.name}]);
			}
		}
	},
	
	doDelete: function()
	{
		MultiEntityBoxItems.sorter.deleteSelected();
	},
	
	loadQueryFrame: function()
	{
		var frame		= $elem("QueryFrame");
		var args		= Jui.object.merge({}, clientData.urlArgs, {showToolBar:false, isSelect:true});
		frame.onload	= MultiEntityBoxItems.doListFrameLoad;
		frame.src		= Utility.getUrl(clientData.unitCode + ".SelectList.page", args);
	},
	
	doMoveUp: function()
	{
		MultiEntityBoxItems.sorter.moveUp();
	},
	
	doMoveDown: function()
	{
		MultiEntityBoxItems.sorter.moveDown();
	},
	
	doMoveTop: function()
	{
		MultiEntityBoxItems.sorter.moveTop();
	},
	
	doMoveBottom: function()
	{
		MultiEntityBoxItems.sorter.moveBottom();
	},
	
	doSorterDoubleClick: function(event)
	{
		MultiEntityBoxItems.sorter.deleteSelected();
	},
	
	createControls: function()
	{
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick			: MultiEntityBoxItems.doAdd
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: MultiEntityBoxItems.doDelete
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: MultiEntityBoxItems.doMoveTop
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: MultiEntityBoxItems.doMoveUp
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: MultiEntityBoxItems.doMoveDown
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: MultiEntityBoxItems.doMoveBottom
		});
		MultiEntityBoxItems.sorter = Jui.option.Sorter.create({
			target			: "RightPanel",
			style			: "border:none",
			ondoubleclick	: MultiEntityBoxItems.doSorterDoubleClick
		});
	}
};

var processToolBarJson = MultiEntityBoxItems.processToolBarJson;
