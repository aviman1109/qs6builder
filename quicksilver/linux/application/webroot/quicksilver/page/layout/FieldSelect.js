var FieldSelect =
{
	leftSorter: null,
	
	rightSorter: null,
	
	createControls: function()
	{
		$elem("FormZone").style.height = "auto";
		var top = $elem("FormZone").offsetHeight - 8;
		var html =	"<div class='QsDoubleSorter QsWideDoubleSorter'"
				 + 	" style='position:absolute;top:" + top + "px;bottom:0px;height:auto'>"
				 +		"<div id=LeftSorterPanel>"
				 +			"<div>" + $text("Qs.Field.NotSelectedFields") + "</div>"
				 +		"</div>"
				 +		"<div>"
				 +			"<div id=ButtonPanel></div>"
				 +		"</div>"
				 +		"<div id=RightSorterPanel>"
				 +			"<div>" + $text("Qs.Field.SelectedFields") + "</div>"
				 +		"</div>"
				 +	"</div>";
		var pane = Jui.dom.insertHtml($elem("FormZone"), "AfterEnd", html);
		
		FieldSelect.leftSorter = Jui.option.Sorter.create({
			target			: "LeftSorterPanel",
			multiSelect		: true,
			ondoubleclick	: FieldSelect.doRightButtonClick
		});
		FieldSelect.rightSorter = Jui.option.Sorter.create({
			target			: "RightSorterPanel",
			multiSelect		: true,
			ondoubleclick	: FieldSelect.doLeftButtonClick
		});
		
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveRight.png",
			onclick	: FieldSelect.doRightButtonClick
		});
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveLeft.png",
			onclick	: FieldSelect.doLeftButtonClick
		});
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveTop.png",
			style	: "margin-top:8px",
			onclick	: FieldSelect.doMoveTopButtonClick
		});
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveUp.png",
			onclick	: FieldSelect.doMoveUpButtonClick
		});
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveDown.png",
			onclick	: FieldSelect.doMoveDownButtonClick
		});
		Jui.basic.Button.create({
			target	: "ButtonPanel",
			icon	: "quicksilver/image/16/MoveBottom.png",
			onclick	: FieldSelect.doMoveBottomButtonClick
		});
		return pane;
	},
	
	loadFields: function(fields, selectedFields)
	{
		var fieldMap = Jui.array.toMap(fields, "value");
		var selectedSet = Jui.array.toSet(selectedFields);
		var leftData = [];
		for (var i = 0; i < fields.length; ++i) {
			var field = fields[i];
			if (!(field.value in selectedSet)) {
				leftData.push(field);
			}
		}
		var rightData = [];
		for (var i = 0; i < selectedFields.length; ++i) {
			if (selectedFields[i] in fieldMap) {
				rightData.push(fieldMap[selectedFields[i]]);
			}
		}
		FieldSelect.leftSorter.load(leftData);
		FieldSelect.rightSorter.load(rightData);
	},

	doLeftButtonClick: function()
	{
		var data = FieldSelect.rightSorter.getSelectedData();
		if (data.length > 0) {
			FieldSelect.leftSorter.add(data);
			FieldSelect.rightSorter.deleteSelected();
		}
	},

	doRightButtonClick: function()
	{
		var data = FieldSelect.leftSorter.getSelectedData();
		if (data.length > 0) {
			FieldSelect.rightSorter.add(data);
			FieldSelect.leftSorter.deleteSelected();
		}
	},

	doMoveTopButtonClick: function()
	{
		FieldSelect.rightSorter.moveTop();
	},

	doMoveUpButtonClick: function()
	{
		FieldSelect.rightSorter.moveUp();
	},

	doMoveDownButtonClick: function()
	{
		FieldSelect.rightSorter.moveDown();
	},

	doMoveBottomButtonClick: function()
	{
		FieldSelect.rightSorter.moveBottom();
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (FieldSelect.rightSorter.getValues().length == 0) {
		alert($text("Qs.Field.SelectAlert"));
		return false;
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	data.selectedFields = FieldSelect.rightSorter.getValues();
	return data;
};

Jui.use("Sorter");
