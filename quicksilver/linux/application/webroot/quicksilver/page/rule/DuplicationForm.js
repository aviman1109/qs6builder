var DuplicationForm = 
{
	leftSorters: [],
	
	rightSorters: [],

	doLoad: function()
	{
		DuplicationForm._createControls();
		for (var i = 0, fields = clientData.editJson.title; i < fields.length; ++i) {
			delete fields[i].group1; 
			delete fields[i].group2; 
		}
		DuplicationForm.form.load(clientData.editJson);
		DuplicationForm.setSorterData(0, clientData.allFields, clientData.duplicationFieldNames);
		DuplicationForm.setSorterData(1, clientData.allFields, clientData.hintFieldNames);
	},
	
	setSorterData: function(index, allFields, fieldNames)
	{
		var allItemMap = {};
		for (var i = 0; i < allFields.length; ++i) {
			allItemMap[allFields[i].value] = allFields[i];
		}
		var fieldNameSet = {};
		for (var i = 0; i < fieldNames.length; ++i) {
			fieldNameSet[fieldNames[i]] = 1;
		}
		var leftData = [];
		for (var i = 0; i < allFields.length; ++i) {
			if (!(allFields[i].value in fieldNameSet)) {
				leftData.push(allFields[i]);
			}
		}
		var rightData = [];
		for (var i = 0; i < fieldNames.length; ++i) {
			if (fieldNames[i] in allItemMap) {
				rightData.push(allItemMap[fieldNames[i]]);
			}
		}
		DuplicationForm.leftSorters[index].load(leftData);
		DuplicationForm.rightSorters[index].load(rightData);
	},

	doLeftButtonClick: function(index)
	{
		var data = DuplicationForm.rightSorters[index].getSelectedData();
		DuplicationForm.leftSorters[index].add(data);
		DuplicationForm.rightSorters[index].deleteSelected();
	},

	doRightButtonClick: function(index)
	{
		var data = DuplicationForm.leftSorters[index].getSelectedData();
		DuplicationForm.rightSorters[index].add(data);
		DuplicationForm.leftSorters[index].deleteSelected();
	},

	doUpButtonClick: function(index)
	{
		DuplicationForm.rightSorters[index].moveUp();
	},

	doDownButtonClick: function(index)
	{
		DuplicationForm.rightSorters[index].moveDown();
	},

	doTopButtonClick: function(index)
	{
		DuplicationForm.rightSorters[index].moveTop();
	},

	doBottomButtonClick: function(index)
	{
		DuplicationForm.rightSorters[index].moveBottom();
	},

	doSave: function()
	{
		if (!DuplicationForm.form.validate()) {
			return;
		}
		for (var i = 0; i < DuplicationForm.rightSorters.length; ++i) {
			if (DuplicationForm.rightSorters[i].getValues().length == 0) {
				var key = i == 0 ? "Qs.Duplication.Field" : "Qs.Duplication.HintField";
				Jui.message.alert(Utility.formatText("Public.SelectAlertTemplate", $text(key)));
				return false;
			}
		}
		var args = {
			relationId		: clientData.relationId,
			masterUnitId	: clientData.masterUnitId,
			masterEntityId	: clientData.masterEntityId
		};
		var data = DuplicationForm.form.getData();
		data.duplicationFieldNames = DuplicationForm.rightSorters[0].getValues();
		data.hintFieldNames = DuplicationForm.rightSorters[1].getValues();
		CommonBusiness.saveEntity("Qs.Duplication", [data], args, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.closeDialog({entityIds:json.entityIds});
		});
	},
	
	_createControls: function()
	{
		DuplicationForm.form = Jui.option.Form.create({
			target			: "FormPanel",
			compact			: true,
			columnCount		: 2,
			titleWidth		: 120
		});
		DuplicationForm.leftSorters[0] = Jui.option.Sorter.create({
			target			: "DuplicationLeftSorterPanel",
			ondoubleclick	: "DuplicationForm.doRightButtonClick(0)"
		});
		DuplicationForm.rightSorters[0] = Jui.option.Sorter.create({
			target			: "DuplicationRightSorterPanel",
			ondoubleclick	: "DuplicationForm.doLeftButtonClick(0)"
		});
		DuplicationForm.leftSorters[1] = Jui.option.Sorter.create({
			target			: "HintLeftSorterPanel",
			ondoubleclick	: "DuplicationForm.doRightButtonClick(1)"
		});
		DuplicationForm.rightSorters[1] = Jui.option.Sorter.create({
			target			: "HintRightSorterPanel",
			ondoubleclick	: "DuplicationForm.doLeftButtonClick(1)"
		});
		
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick			: "DuplicationForm.doRightButtonClick(0)"
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: "DuplicationForm.doLeftButtonClick(0)"
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: "DuplicationForm.doTopButtonClick(0)"
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: "DuplicationForm.doUpButtonClick(0)"
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: "DuplicationForm.doDownButtonClick(0)"
		});
		Jui.basic.Button.create({
			target			: "DuplicationButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: "DuplicationForm.doBottomButtonClick(0)"
		});
		
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick			: "DuplicationForm.doRightButtonClick(1)"
		});
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: "DuplicationForm.doLeftButtonClick(1)"
		});
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: "DuplicationForm.doTopButtonClick(1)"
		});
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: "DuplicationForm.doUpButtonClick(1)"
		});
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: "DuplicationForm.doDownButtonClick(1)"
		});
		Jui.basic.Button.create({
			target			: "HintButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: "DuplicationForm.doBottomButtonClick(1)"
		});
	}
};
