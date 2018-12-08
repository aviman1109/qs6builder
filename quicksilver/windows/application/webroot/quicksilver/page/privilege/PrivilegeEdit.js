var PrivilegeEdit =
{
	doLoad: function()
	{
		form.getControl("FModuleId").onbeforedrop = Menu.doModuleIdBoxBeforeDrop;
		if (form.hasControl("FUnitId")) {
			form.setFieldDisabled("FModuleId");
		}
		if (form.hasControl("FUseExisting")) {
			form.getControl("FUseExisting").onchange = PrivilegeEdit.doUseExistingBoxChange;
			form.getControl("FSourcePrivilegeId").setRestoreOnEnable(true);
			form.getControl("FSourcePrivilegeId").setClearOnDisable(true);
			PrivilegeEdit.doUseExistingBoxChange();
		}
	},

	doUseExistingBoxChange: function()
	{
		var useExisting = form.getFieldValue("FUseExisting");
		form.setFieldEnabled("FSourcePrivilegeId", useExisting, true);
	}
};
