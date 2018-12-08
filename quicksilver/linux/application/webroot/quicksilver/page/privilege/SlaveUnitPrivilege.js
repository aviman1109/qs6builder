var SlaveUnitPrivilege =
{
	doLoad: function()
	{
		SlaveUnitPrivilege.cmbCreate = Jui.basic.ComboBox.create({
			target			: "CreateComboBoxCell",
			name			: "createPrivilegeTypeId",
			items			: clientData.privilegeTypeBoxItems,
			value			: clientData.createPrivilegeTypeId
		});
		SlaveUnitPrivilege.cmbRead = Jui.basic.ComboBox.create({
			target			: "ReadComboBoxCell",
			name			: "readPrivilegeTypeId",
			items			: clientData.privilegeTypeBoxItems,
			value			: clientData.readPrivilegeTypeId
		});
		SlaveUnitPrivilege.cmbReadUser = Jui.basic.ComboBox.create({
			target			: "ReadUserComboBoxCell",
			name			: "readUserFieldName",
			items			: clientData.fieldNameBoxItems,
			value			: clientData.readUserFieldName,
			clearOnDisable	: true,
			disabled		: Jui.string.isEmpty(clientData.readUserFieldName)
		});
		SlaveUnitPrivilege.cmbUpdate = Jui.basic.ComboBox.create({
			target			: "UpdateComboBoxCell",
			name			: "updatePrivilegeTypeId",
			items			: clientData.privilegeTypeBoxItems,
			value			: clientData.updatePrivilegeTypeId
		});
		SlaveUnitPrivilege.cmbUpdateUser = Jui.basic.ComboBox.create({
			target			: "UpdateUserComboBoxCell",
			name			: "updateUserFieldName",
			items			: clientData.fieldNameBoxItems,
			value			: clientData.updateUserFieldName,
			clearOnDisable	: true,
			disabled		: Jui.string.isEmpty(clientData.updateUserFieldName)
		});
		SlaveUnitPrivilege.cmbDelete = Jui.basic.ComboBox.create({
			target			: "DeleteComboBoxCell",
			name			: "deletePrivilegeTypeId",
			items			: clientData.privilegeTypeBoxItems,
			value			: clientData.deletePrivilegeTypeId
		});
		SlaveUnitPrivilege.cmbDeleteUser = Jui.basic.ComboBox.create({
			target			: "DeleteUserComboBoxCell",
			name			: "deleteUserFieldName",
			items			: clientData.fieldNameBoxItems,
			value			: clientData.deleteUserFieldName,
			clearOnDisable	: true,
			disabled		: Jui.string.isEmpty(clientData.deleteUserFieldName)
		});

		Jui.basic.CheckBox.create({
			target			: "CreateCheckBoxCell",
			value			: true,
			disabled		: true,
			comboBox		: SlaveUnitPrivilege.cmbCreate
		});
		Jui.basic.CheckBox.create({
			target			: "ReadCheckBoxCell",
			value			: true,
			disabled		: true,
			comboBox		: SlaveUnitPrivilege.cmbRead
		});
		Jui.basic.CheckBox.create({
			target			: "ReadUserCheckBoxCell",
			value			: !Jui.string.isEmpty(clientData.readUserFieldName),
			onchange		: SlaveUnitPrivilege.doCheckBoxChange,
			comboBox		: SlaveUnitPrivilege.cmbReadUser
		});
		Jui.basic.CheckBox.create({
			target			: "UpdateCheckBoxCell",
			value			: true,
			disabled		: true,
			comboBox		: SlaveUnitPrivilege.cmbUpdate
		});
		Jui.basic.CheckBox.create({
			target			: "UpdateUserCheckBoxCell",
			value			: !Jui.string.isEmpty(clientData.updateUserFieldName),
			onchange		: SlaveUnitPrivilege.doCheckBoxChange,
			comboBox		: SlaveUnitPrivilege.cmbUpdateUser
		});
		Jui.basic.CheckBox.create({
			target			: "DeleteCheckBoxCell",
			value			: true,
			disabled		: true,
			comboBox		: SlaveUnitPrivilege.cmbDelete
		});
		Jui.basic.CheckBox.create({
			target			: "DeleteUserCheckBoxCell",
			value			: !Jui.string.isEmpty(clientData.deleteUserFieldName),
			onchange		: SlaveUnitPrivilege.doCheckBoxChange,
			comboBox		: SlaveUnitPrivilege.cmbDeleteUser
		});
	},
	
	doCheckBoxChange: function()
	{
		this.getArgs().comboBox.setDisabled(!this.getValue());
	},
	
	doSave: function()
	{
		var args = {unitId:clientData.urlArgs.masterEntityId, data:{}};
		for (var i = 0, rows = document.getElementById("MainTable").rows; i < rows.length; ++i) {
			var cells = rows[i].cells;
			var box = Jui.$owner(cells[cells.length - 1].firstChild);
			if (!box.isDisabled()) {
				if (Jui.string.isEmpty(box.getValue())) {
					var title = cells[2].innerText;
					Jui.message.alert($text("Public.InputAlert").replace("${0}", title), function() {
						box.focus();
					});
					return;
				}
				args.data[box.getName()] = box.getValue();
			}
		}
		Utility.invoke("Qs.Privilege.saveSlaveUnitPrivilege", args, true, function(ret){
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	}
};
