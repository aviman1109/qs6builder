var UnitEdit =
{
	doLoad: function()
	{
		form.getControl("FModuleId").onbeforedrop = Menu.doModuleIdBoxBeforeDrop;
		if (form.getControl("FTable") == null) {
			return;
		}
		
		if (clientData.entityId != null) {
			form.setFieldDisabled("FDataSource");
			form.setFieldDisabled("FTable");
			form.setFieldDisabled("FKeyField");
			form.setFieldDisabled("FKeyType");
			form.setFieldDisabled("FNameField");
		}
		var fields = ["FModuleId", "FMasterUnitId", "FMasterField"];
		for (var i = 0; i < fields.length; ++i) {
			var box = form.getControl(fields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		fields = [
			"FIsTreeStructure", "FIsTreeCheckPrivilege", "FSupportEditType", "FSupportAttachment",
			"FSupportNote", "FSupportSort", "FSupportDepartment", "FSupportUser", "FRecordCreateInfo",
			"FRecordUpdateInfo", "FSupportBusinessLog", "FIsSlaveUnit", "FSupportDataPrivilege"
		];
		for (var i = 0; i < fields.length; ++i) {
			form.getControl(fields[i]).setClearOnDisable(true);
		}
		form.getControl("FIsTreeStructure").onchange = UnitEdit.doIsTreeStructureChange;
		form.getControl("FSupportSort").onchange = UnitEdit.doSupportSortChange;
		form.getControl("FIsSlaveUnit").onchange = UnitEdit.refreshControlStatus;
		form.getControl("FDataSource").onchange = UnitEdit.refreshControlStatus;
		UnitEdit.refreshControlStatus();
	},

	doIsTreeStructureChange: function()
	{
		var isTreeStructure = form.getFieldValue("FIsTreeStructure");
		form.setFieldEnabled("FIsTreeCheckPrivilege", isTreeStructure);
		if (isTreeStructure) {
			form.setFieldValue("FSupportSort", true);
		}
	},

	doSupportSortChange: function()
	{
		if (!form.getFieldValue("FSupportSort")) {
			form.setFieldValue("FIsTreeStructure", false);
		}
	},

	refreshControlStatus: function()
	{
		var isDefault = form.getFieldValue("FDataSource") == "default";
		var isNew = clientData.entityId == null;
		var isSlaveUnit = form.getFieldValue("FIsSlaveUnit");
		var isTreeStructure = form.getFieldValue("FIsTreeStructure");
		var supportWorkflow = form.getFieldValue("FSupportWorkflow");
		form.setFieldEnabled("FIsTreeCheckPrivilege", isTreeStructure);
		form.setFieldEnabled("FKeyType", !isDefault && isNew);
		form.setFieldEnabled("FModuleId", !isSlaveUnit, true);
		form.setFieldEnabled("FMasterUnitId", isSlaveUnit, true);
		form.setFieldEnabled("FMasterField", isSlaveUnit, true);
		form.setFieldEnabled("FSupportDataPrivilege", isDefault && !isSlaveUnit);
		form.setFieldEnabled("FSupportDepartment", isDefault);
		form.setFieldEnabled("FSupportUser", isDefault);
		form.setFieldEnabled("FRecordCreateInfo", isDefault);
		form.setFieldEnabled("FRecordUpdateInfo", isDefault);
		form.setFieldEnabled("FSupportWorkflow", isDefault && (isNew || !supportWorkflow));
		form.setFieldEnabled("FSupportBusinessLog", isDefault);
		form.setFieldEnabled("FIsTreeStructure", isDefault);
		form.setFieldEnabled("FSupportSort", isDefault);
		form.setFieldEnabled("FSupportEditType", isDefault);
		form.setFieldEnabled("FSupportAttachment", isDefault);
		form.setFieldEnabled("FSupportNote", isDefault);
		if (isDefault) {
			form.setFieldValue("FKeyType", "Uuid");
		}
		if (!isDefault) {
			form.setFieldEnabled("FSupportWorkflow", false);
		}
	},
	
	doExport: function(event)
	{
		var args = {content:event.id, unitIds:[clientData.entityId]};
		Utility.download("Qs.Unit.export", args);
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (clientData.entityId == null) {
		var data = form.getData();
		var ret = Utility.syncInvoke("Qs.Unit.checkBeforeCreate", {data:data});
		if (ret == null) {
			return false;
		}
		var argArray = null;
		if (ret.columns != null && ret.columns.length > 0) {
			argArray = ["Qs.Unit.TableAndColumnExistConfirm", data.FTable, ret.columns.join(" ")];
		}
		else if (ret.tableExist) {
			argArray = ["Qs.Unit.TableExistConfirm", data.FTable];
		}
		if (argArray != null && !confirm(Utility.formatText.apply(null, argArray))) {
			return false;
		}
	}
	return true;
};
