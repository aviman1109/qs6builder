var LocalApiForm =
{
	doLoad: function()
	{
		form.getControl("FHandleType").onchange = LocalApiForm.refreshControlStatus;
		form.getControl("FEnableRrConfig").setClearOnDisable(true);
		form.getControl("FEnableRrConfig").setRestoreOnEnable(true);
		form.getControl("FEnableRrConfig").onchange = LocalApiForm.refreshControlStatus;
		LocalApiForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var isPartialHandle = form.getFieldValue("FHandleType") == "Partial";
		form.setFieldEnabled("FEnableRrConfig", isPartialHandle);
		
		var enableRrConfig = form.getFieldValue("FEnableRrConfig");
		form.setFieldVisible("FRequestFormat", enableRrConfig);
		form.setFieldVisible("FResponseFormat", enableRrConfig);
		form.setFieldVisible("FIsStandardResponse", enableRrConfig);
	}
};
