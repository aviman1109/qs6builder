var FieldSelectWithList =
{
	fieldMap: {},
	
	sorter: null,
	
	list: null,
	
	createControls: function(listTitle)
	{
		$elem("FormZone").style.height = "auto";
		var top = $elem("FormZone").offsetHeight - 8;
		var html =	"<div class='QsSorterAndList'"
				 + 	" style='position:absolute;top:" + top + "px;bottom:0px;height:auto'>"
				 +		"<div>"
				 +			"<div>" + $text("Qs.Field.NotSelectedFields") + "</div>"
				 +		"</div>"
				 +		"<div>"
				 +			"<div></div>"
				 +		"</div>"
				 +		"<div>"
				 +			"<div>" + $text("Qs.Field.SelectedFields") + "</div>"
				 +		"</div>"
				 +	"</div>";
		var pane = Jui.dom.insertHtml($elem("FormZone"), "AfterEnd", html);
		
		FieldSelectWithList.sorter = Jui.option.Sorter.create({
			target			: pane.firstChild,
			multiSelect		: true,
			ondoubleclick	: FieldSelectWithList.doRightButtonClick
		});
		FieldSelectWithList.list = Jui.option.List.create({
			target			: pane.lastChild,
			multiPage		: false,
			showRowNumber	: false,
			editable		: true,
			border			: "all"
		});
		FieldSelectWithList.list.loadTitle(listTitle);
		
		var buttonPane = pane.children[1].firstChild;
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveRight.png",
			onclick	: FieldSelectWithList.doRightButtonClick
		});
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveLeft.png",
			onclick	: FieldSelectWithList.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveTop.png",
			style	: "margin-top:8px",
			onclick	: FieldSelectWithList.doMoveTopButtonClick
		});
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveUp.png",
			onclick	: FieldSelectWithList.doMoveUpButtonClick
		});
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveDown.png",
			onclick	: FieldSelectWithList.doMoveDownButtonClick
		});
		Jui.basic.Button.create({
			target	: buttonPane,
			icon	: "quicksilver/image/16/MoveBottom.png",
			onclick	: FieldSelectWithList.doMoveBottomButtonClick
		});
		return pane;
	},
	
	loadFields: function(fields, selectedFields)
	{
		FieldSelectWithList.fieldMap = Jui.array.toMap(fields, "value");
		var selectedSet = Jui.array.toSet(Jui.array.extractProperty(selectedFields, "name"));
		var sorterData = [];
		for (var i = 0; i < fields.length; ++i) {
			var field = fields[i];
			if (!(field.value in selectedSet)) {
				sorterData.push(field);
			}
		}
		var listData = [];
		for (var i = 0; i < selectedFields.length; ++i) {
			if (selectedFields[i].name in FieldSelectWithList.fieldMap) {
				listData.push(selectedFields[i]);
			}
		}
		FieldSelectWithList.sorter.load(sorterData);
		FieldSelectWithList.list.loadData(listData);
	},

	doLeftButtonClick: function()
	{
		var fieldNames = FieldSelectWithList.list.getSelectedFieldValues("name");
		if (fieldNames.length > 0) {
			var sorterData = [];
			for (var i = 0; i < fieldNames.length; ++i) {
				sorterData.push(FieldSelectWithList.fieldMap[fieldNames[i]]);
			}
			FieldSelectWithList.sorter.add(sorterData);
			FieldSelectWithList.list.deleteSelectedRows();
		}
	},

	doRightButtonClick: function()
	{
		var fieldNames = FieldSelectWithList.sorter.getSelectedValues();
		if (fieldNames.length > 0) {
			var listData = [];
			for (var i = 0; i < fieldNames.length; ++i) {
				listData.push({name:fieldNames[i]});
			}
			FieldSelectWithList.list.appendData(listData);
			FieldSelectWithList.sorter.deleteSelected();
		}
	},

	doMoveTopButtonClick: function()
	{
		FieldSelectWithList.list.moveTop();
	},

	doMoveUpButtonClick: function()
	{
		FieldSelectWithList.list.moveUp();
	},

	doMoveDownButtonClick: function()
	{
		FieldSelectWithList.list.moveDown();
	},

	doMoveBottomButtonClick: function()
	{
		FieldSelectWithList.list.moveBottom();
	}
};

Jui.use("Sorter", "List");
