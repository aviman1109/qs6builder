var ToolSubItemForm =
{
	doLoad: function()
	{
		var conditionalFields = ["FHandlePageId", "FChartId", "FEventHandler"];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FHandleType").onchange = ToolSubItemForm.doHandleTypeBoxChange;
		ToolSubItemForm.doHandleTypeBoxChange();
	},
	
	doHandleTypeBoxChange: function()
	{
		var handleType = form.getFieldValue("FHandleType");
		form.setFieldEnabled("FHandlePageId", handleType == "Form", true);
		form.setFieldEnabled("FChartId", handleType == "Chart", true);
		form.setFieldEnabled("FConfirmMessage", handleType == "Event");
		form.setFieldEnabled("FEventHandler", handleType == "JavaScript", true);
	}
};
