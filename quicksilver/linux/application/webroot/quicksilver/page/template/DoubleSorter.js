var DoubleSorter =
{
	entityId		: clientData.entityId || clientData.urlArgs.entityId,
	leftTitle		: clientData.leftTitle,
	rightTitle		: clientData.rightTitle,
	loadMethod		: clientData.loadMethod,
	saveMethod		: clientData.saveMethod,
	allowEmpty		: Jui.cast.toBool(clientData.allowEmpty, false),
	closeAfterSave	: Jui.cast.toBool(clientData.closeAfterSave, true),
	extraArguments	: {},
	sortable		: true,
	sorters			: {},
	buttons			: {},

	//-----------------------------------------------------------------------
	// event handlers
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		DoubleSorter.sorters.left = Jui.option.Sorter.create({
			target			: "LeftSorterPanel",
			ondoubleclick	: DoubleSorter.doLeftSorterDoubleClick
		});
		DoubleSorter.sorters.right = Jui.option.Sorter.create({
			target			: "RightSorterPanel",
			ondoubleclick	: DoubleSorter.doRightSorterDoubleClick
		});
		DoubleSorter.buttons.moveRight = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick			: DoubleSorter.doRightButtonClick
		});
		DoubleSorter.buttons.moveLeft = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: DoubleSorter.doLeftButtonClick
		});
		if (DoubleSorter.sortable) {
			DoubleSorter.buttons.moveTop = Jui.basic.Button.create({
				target	: "ButtonPanel",
				icon	: "quicksilver/image/16/MoveTop.png",
				style	: "margin-top:12px",
				onclick	: DoubleSorter.doMoveTop
			});
			DoubleSorter.buttons.moveUp = Jui.basic.Button.create({
				target	: "ButtonPanel",
				icon	: "quicksilver/image/16/MoveUp.png",
				onclick	: DoubleSorter.doMoveUp
			});
			DoubleSorter.buttons.moveDown = Jui.basic.Button.create({
				target	: "ButtonPanel",
				icon	: "quicksilver/image/16/MoveDown.png",
				onclick	: DoubleSorter.doMoveDown
			});
			DoubleSorter.buttons.moveBottom = Jui.basic.Button.create({
				target	: "ButtonPanel",
				icon	: "quicksilver/image/16/MoveBottom.png",
				onclick	: DoubleSorter.doMoveBottom
			});
		}
		DoubleSorter.doRefresh();
	},
	
	doSave: function()
	{
		var args = DoubleSorter.getSaveArguments();
		if (args.selectedValues.length == 0 && !DoubleSorter.allowEmpty) {
			Jui.message.alert($text("Public.SelectAlertTemplate").replace("${0}", DoubleSorter.rightTitle));
			return;
		}
		Utility.invoke(DoubleSorter.saveMethod, args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
			if (DoubleSorter.closeAfterSave) {
				Utility.closeDialog();
			}
		});
	},

	doRefresh: function()
	{
		var args = DoubleSorter.getLoadArguments();
		Utility.invoke(DoubleSorter.loadMethod, args, true, function(json) {
			var allItems		= json.allItems;
			var selectedValues	= json.selectedValues;
			var allItemMap		= {};
			allItems.sort(function(a, b) {return a.text.localeCompare(b.text);});
			for (var i = 0; i < allItems.length; ++i) {
				allItemMap[allItems[i].value] = allItems[i];
			}
			var selectedValueSet = {};
			for (var i = 0; i < selectedValues.length; ++i) {
				selectedValueSet[selectedValues[i]] = 1;
			}
			var leftData = [];
			var rightData = [];
			for (var i = 0; i < allItems.length; ++i) {
				(allItems[i].value in selectedValueSet ? rightData : leftData).push(allItems[i]);
			}
			if (DoubleSorter.sortable) {
				rightData = [];
				for (var i = 0; i < selectedValues.length; ++i) {
					if (selectedValues[i] in allItemMap) {
						rightData.push(allItemMap[selectedValues[i]]);
					}
				}
			}
			DoubleSorter.sorters.left.load(leftData);
			DoubleSorter.sorters.right.load(rightData);
			if (DoubleSorter.doAfterLoad != null) {
				DoubleSorter.doAfterLoad(json);
			}
		});
	},

	doMoveUp: function()
	{
		DoubleSorter.moveUp();
	},
	
	doMoveDown: function()
	{
		DoubleSorter.moveDown();
	},
	
	doMoveTop: function()
	{
		DoubleSorter.moveTop();
	},
	
	doMoveBottom: function()
	{
		DoubleSorter.moveBottom();
	},
	
	doLeftSorterDoubleClick: function()
	{
		DoubleSorter.moveRight();
	},
	
	doRightSorterDoubleClick: function()
	{
		DoubleSorter.moveLeft();
	},
	
	doLeftButtonClick: function()
	{
		DoubleSorter.moveLeft();
	},
	
	doRightButtonClick: function()
	{
		DoubleSorter.moveRight();
	},
	
	//-----------------------------------------------------------------------
	// methods
	//-----------------------------------------------------------------------
	
	getLoadArguments: function()
	{
		var args = {entityId:DoubleSorter.entityId};
		return Jui.object.merge(args, DoubleSorter.extraArguments);
	},
	
	getSaveArguments: function()
	{
		var args = {entityId:DoubleSorter.entityId, selectedValues:DoubleSorter.sorters.right.getValues()};
		return Jui.object.merge(args, DoubleSorter.extraArguments);
	},
	
	moveLeft: function()
	{
		var data = DoubleSorter.sorters.right.getSelectedData();
		DoubleSorter.sorters.left.add(data);
		DoubleSorter.sorters.right.deleteSelected();
	},
	
	moveRight: function()
	{
		var data = DoubleSorter.sorters.left.getSelectedData();
		DoubleSorter.sorters.right.add(data);
		DoubleSorter.sorters.left.deleteSelected();
	},
	
	moveUp: function()
	{
		DoubleSorter.sorters.right.moveUp();
	},
	
	moveDown: function()
	{
		DoubleSorter.sorters.right.moveDown();
	},
	
	moveTop: function()
	{
		DoubleSorter.sorters.right.moveTop();
	},
	
	moveBottom: function()
	{
		DoubleSorter.sorters.right.moveBottom();
	}
};

Utility.addFunctionAlias(DoubleSorter);
window.onload = DoubleSorter.doLoad;
