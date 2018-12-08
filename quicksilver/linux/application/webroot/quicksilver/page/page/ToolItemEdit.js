var ToolItemEdit =
{
	doLoad: function()
	{
		var conditionalFields = [
			"FIcon", "FLabel", "FWidth", "FScale", "FEntityUnitId", "FSubItemSource",
			"FDictionaryId", "FSubItemRoutine",
			"FHandleType", "FHandlePageId", "FChartId", "FConfirmMessage", "FDefaultEventHandler"
		];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = ToolItemEdit.doTypeBoxChange;
		form.getControl("FSubItemSource").onchange = ToolItemEdit.doSubItemSourceBoxChange;
		form.getControl("FHandleType").onchange = ToolItemEdit.doHandleTypeBoxChange;
		ToolItemEdit.doTypeBoxChange();
		ToolItemEdit.doHandleTypeBoxChange();
	},

	doTypeBoxChange: function()
	{
		var type		= form.getFieldValue("FType");
		var isButton	= /Button/.test(type);
		var isDropdown	= /Combo/.test(type);
		var isBox		= /Box/.test(type);
		var isFloat		= /Percent|Double/.test(type);
		var isEntity	= type == "EntityBox";
		form.setFieldEnabled("FIcon", isButton);
		form.setFieldEnabled("FWidth", isBox && type != "CheckBox", true);
		form.setFieldEnabled("FLabel", isBox);
		form.setFieldEnabled("FScale", isFloat, true);
		form.setFieldEnabled("FEntityUnitId", isEntity, true);
		form.setFieldEnabled("FSubItemSource", isDropdown, true);
		form.setFieldEnabled("FHandleType", !/Splitter/.test(type), true);
		ToolItemEdit.doSubItemSourceBoxChange();
		ToolItemEdit.doHandleTypeBoxChange();
	},

	doSubItemSourceBoxChange: function()
	{
		var source = form.getFieldValue("FSubItemSource");
		form.setFieldEnabled("FDictionaryId", source == "Dictionary", true);
		form.setFieldEnabled("FSubItemRoutine", source == "JavaClass" || source == "Sql", true);
	},
	
	doHandleTypeBoxChange: function()
	{
		var handleType = form.getFieldValue("FHandleType");
		form.setFieldEnabled("FHandlePageId", handleType == "Form", true);
		form.setFieldEnabled("FChartId", handleType == "Chart", true);
		form.setFieldEnabled("FConfirmMessage", handleType == "Event");
		form.setFieldEnabled("FDefaultEventHandler", handleType == "JavaScript", true);
	}
};
