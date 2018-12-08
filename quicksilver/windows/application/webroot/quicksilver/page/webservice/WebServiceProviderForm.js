var WebServiceProviderForm =
{
	doLoad: function()
	{
		var fields = ["FShareAccount", "FSharePassword", "FPrivateAccountParameterId", "FPrivatePasswordParameterId"];
		for (var i = 0; i < fields.length; ++i) {
			var box = form.getControl(fields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FAccountMode").onchange = WebServiceProviderForm.doAccountModeChange;
		WebServiceProviderForm.doAccountModeChange();
	},

	doAccountModeChange: function()
	{
		var mode = form.getFieldValue("FAccountMode");
		form.setFieldEnabled("FShareAccount", mode == "Share", true);
		form.setFieldEnabled("FSharePassword", mode == "Share");
		form.setFieldEnabled("FPrivateAccountParameterId", mode == "Private", true);
		form.setFieldEnabled("FPrivatePasswordParameterId", mode == "Private");
	}
};
