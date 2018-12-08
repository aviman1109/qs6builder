var FieldRoleConfig =
{
	buttons: {},
	
	doLoad: function()
	{
		FieldRoleConfig.createControls();
		FieldRoleConfig.filterBox.setValue(clientData.filterByRole ? "Partial" : "All");
		if (clientData.roles != null) {
			FieldRoleConfig.sorter.load(clientData.roles);
		}
		FieldRoleConfig.doFilterBoxChange();
	},

	doSave: function()
	{
		var args = {
			fieldId			: clientData.urlArgs.masterEntityId,
			filterByRole	: FieldRoleConfig.filterBox.getValue() == "Partial",
			roleIds			: FieldRoleConfig.sorter.getValues()
		};
		Utility.invoke("Qs.Field.setRoles", args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},

	doAddButtonClick: function()
	{
		CommonBusiness.selectEntity("Qs.Role", null, function(ret) {
			var values = Jui.array.toSet(FieldRoleConfig.sorter.getValues());
			var data = [];
			for (var i = 0; i < ret.length; ++i) {
				if (!(ret[i].id in values)) {
					data.push({value:ret[i].id, text:ret[i].name});
				}
			}
			FieldRoleConfig.sorter.add(data);
		});
	},

	doDeleteButtonClick: function()
	{
		FieldRoleConfig.sorter.deleteSelected();
	},

	doMoveUpButtonClick: function()
	{
		FieldRoleConfig.sorter.moveUp();
	},

	doMoveDownButtonClick: function()
	{
		FieldRoleConfig.sorter.moveDown();
	},

	doMoveTopButtonClick: function()
	{
		FieldRoleConfig.sorter.moveTop();
	},

	doMoveBottomButtonClick: function()
	{
		FieldRoleConfig.sorter.moveBottom();
	},

	doFilterBoxChange: function()
	{
		var disabled = FieldRoleConfig.filterBox.getValue() != "Partial";
		if (disabled && !FieldRoleConfig.sorter.isDisabled()) {
			FieldRoleConfig.sorterData = FieldRoleConfig.sorter.getData();
			FieldRoleConfig.sorter.clear();
		}
		else if (!disabled && FieldRoleConfig.sorter.isDisabled()) {
			FieldRoleConfig.sorter.load(FieldRoleConfig.sorterData);
		}
		FieldRoleConfig.sorter.setDisabled(disabled);
		for (var key in FieldRoleConfig.buttons) {
			FieldRoleConfig.buttons[key].setDisabled(disabled);
		}
	},
	
	createControls: function()
	{
		FieldRoleConfig.filterBox = Jui.basic.ComboBox.create({
			target			: "ComboBoxPanel",
			style			: "width:100%",
			items			: FieldRoleConfig.comboBoxItems,
			onchange		: FieldRoleConfig.doFilterBoxChange
		});
		FieldRoleConfig.sorter = Jui.option.Sorter.create({
			target			: "SorterPanel",
			ondoubleclick	: FieldRoleConfig.doSorterDoubleClick
		});
		FieldRoleConfig.buttons.add = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/Add.png",
			onclick			: FieldRoleConfig.doAddButtonClick
		});
		FieldRoleConfig.buttons.remove = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/Delete.png",
			onclick			: FieldRoleConfig.doDeleteButtonClick
		});
		FieldRoleConfig.buttons.moveTop = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveTop.png",
			style			: "margin-top:12px",
			onclick			: FieldRoleConfig.doMoveTopButtonClick
		});
		FieldRoleConfig.buttons.moveUp = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveUp.png",
			onclick			: FieldRoleConfig.doMoveUpButtonClick
		});
		FieldRoleConfig.buttons.moveDown = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveDown.png",
			onclick			: FieldRoleConfig.doMoveDownButtonClick
		});
		FieldRoleConfig.buttons.moveBottom = Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveBottom.png",
			onclick			: FieldRoleConfig.doMoveBottomButtonClick
		});
	}
};
