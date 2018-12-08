var MenuNumberForm =
{
	countStatusDictionaryMap: {},
	
	doLoad: function()
	{
		var conditionalFields = [
 			"FUserFieldId", "FStatusFieldId", "FStatusValues", "FFilterSql", "FQuerySql"
 		];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = MenuNumberForm.doTypeChange;
		form.getControl("FUserFieldId").onbeforedrop = null;
		form.getControl("FUserFieldId").loadItems(clientData.userFieldItems);
		form.getControl("FStatusFieldId").onbeforedrop = null;
		form.getControl("FStatusFieldId").loadItems(clientData.statusFieldItems);
		form.getControl("FStatusFieldId").onchange = MenuNumberForm.doStatusFieldChange;
		MenuNumberForm.doTypeChange();
		MenuNumberForm.doStatusFieldChange();
		var statusValues = clientData.editJson.data.FStatusValues;
		if (!Jui.string.isEmpty(statusValues)) {
			form.getControl("FStatusValues").setValues(statusValues.split(","));
		}
	},

	doStatusFieldChange: function()
	{
		MenuNumberForm.refreshControlStatus();
		MenuNumberForm.refreshStatusValues();
	},

	doTypeChange: function()
	{
		MenuNumberForm.refreshControlStatus();
		MenuNumberForm.refreshStatusValues();
	},
	
	refreshControlStatus: function()
	{
		var type			= form.getFieldValue("FType");
		var statusFieldId	= form.getFieldValue("FStatusFieldId");
		form.setFieldEnabled("FUserFieldId", type == "Field", true);
		form.setFieldEnabled("FStatusFieldId", type == "Field");
		form.setFieldEnabled("FStatusValues", type == "Field" && statusFieldId != null, true);
		form.setFieldEnabled("FFilterSql", type == "Field");
		form.setFieldEnabled("FQuerySql", type == "Custom", true);
	},
	
	refreshStatusValues: function()
	{
		var map = clientData.statusValueItemsMap;
		var items = map == null ? null : map[form.getFieldValue("FStatusFieldId")];
		form.getControl("FStatusValues").loadItems(items || []);
	}
};
