var RemoteApiGroupForm =
{
	doLoad: function()
	{
		form.getControl("FAuthType").onchange = RemoteApiGroupForm.refreshControlStatus;
		RemoteApiGroupForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var authType = form.getFieldValue("FAuthType");
		form.setFieldVisible("FTokenApiId", authType == "Token");
	}
};
