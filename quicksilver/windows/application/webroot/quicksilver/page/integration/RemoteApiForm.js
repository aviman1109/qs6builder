var RemoteApiForm =
{
	doLoad: function()
	{
		form.getControl("FEnableRrConfig").onchange = RemoteApiForm.refreshControlStatus;
		RemoteApiForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var enableRrConfig = form.getFieldValue("FEnableRrConfig");
		form.setFieldVisible("FRequestFormat", enableRrConfig);
		form.setFieldVisible("FResponseFormat", enableRrConfig);
		form.setFieldVisible("FIsStandardRequest", enableRrConfig);
	}
};
