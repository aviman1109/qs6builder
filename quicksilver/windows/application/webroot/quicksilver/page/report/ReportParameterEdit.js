var ReportParameterEdit =
{
	treeFieldMap: {},
	
	doLoad: function()
	{
		var map = {
			FType: {
				onchange:ReportParameterEdit.refreshControlStatus
			},
			FRequired: {
				clearOnDisable:true
			},
			FEntityUnitId: {
				clearOnDisable:true, restoreOnEnable:true,
				onchange:ReportParameterEdit.doEntityUnitChange
			},
			FDictionaryId: {
				clearOnDisable:true, restoreOnEnable:true
			},
			FParentCode: {
				clearOnDisable:true, restoreOnEnable:true
			},
			FScale: {
				clearOnDisable:true, restoreOnEnable:true
			},
			FShowInTree: {
				clearOnDisable:true, onchange:ReportParameterEdit.doShowInTreeChange
			},
			FTreeField: {
				clearOnDisable:true, onbeforedrop:ReportParameterEdit.doTreeFieldBeforeDrop
			},
			FCheckPrivilege: {
				clearOnDisable:true, onchange:ReportParameterEdit.doCheckPrivilegeChange
			},
			FPrivilegeId: {
				clearOnDisable:true
			}
		};
		for (var fieldName in map) {
			var control = form.getControl(fieldName);
			var properties = map[fieldName];
			for (var propertyName in properties) {
				control[propertyName] = properties[propertyName];
			}
		}
		ReportParameterEdit.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var type = form.getFieldValue("FType");
		var showInTree = form.getFieldValue("FShowInTree");
		var checkPrivilege = form.getFieldValue("FCheckPrivilege");
		form.setFieldEnabled("FRequired", type != "CheckBox");
		form.setFieldEnabled("FScale", /Percent|Double/.test(type), true);
		form.setFieldEnabled("FDictionaryId", /ComboBox/.test(type), true);
		form.setFieldEnabled("FParentCode", /^ComboBox/.test(type));
		form.setFieldEnabled("FEntityUnitId", /EntityBox/.test(type), true);
		form.setFieldEnabled("FShowInTree", type == "EntityBox");
		form.setFieldEnabled("FTreeField", type == "EntityBox" && showInTree);
		form.setFieldEnabled("FCheckPrivilege", type == "EntityBox");
		form.setFieldEnabled("FPrivilegeId", type == "EntityBox" && checkPrivilege, true);
	},
	
	doEntityUnitChange: function()
	{
		form.setFieldValue("FTreeField", null);
	},
	
	doShowInTreeChange: function()
	{
		form.setFieldEnabled("FTreeField", form.getFieldValue("FShowInTree"));
	},
	
	doCheckPrivilegeChange: function()
	{
		form.setFieldEnabled("FPrivilegeId", form.getFieldValue("FCheckPrivilege"), true);
	},

	doTreeFieldBeforeDrop: function()
	{
		var unitId = form.getFieldValue("FEntityUnitId");
		if (unitId == null) {
			form.getControl("FTreeField").loadItems([]);
			return;
		}
		if (ReportParameterEdit.treeFieldMap[unitId] == null) {
			var url = "Qs.ReportParameter.getTreeFields";
			var ret = Utility.syncInvoke(url, {unitId:unitId});
			if (ret == null) {
				return;
			}
			ReportParameterEdit.treeFieldMap[unitId] = ret.fields; 
		}
		form.getControl("FTreeField").loadItems(ReportParameterEdit.treeFieldMap[unitId]);
	}
};
