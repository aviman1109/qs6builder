var FieldGridColumnForm =
{
	doLoad: function()
	{
		var conditionalFields = [
			"FControls"
		];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = FieldGridColumnForm.doTypeBoxChange;
		FieldGridColumnForm.refreshControlStatus();
	},
	
	doTypeBoxChange: function()
	{
		FieldGridColumnForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var type = form.getFieldValue("FType");
		form.setFieldEnabled("FControls", type == "Control", true);
	}
};
