var PrivilegeTypeEdit =
{
	doLoad: function()
	{
		EntityForm.validate = function() {
			if (!form.validate()) {
				return false;
			}
			if (form.getFieldValue("FIsDataPrivilege")) {
				var accessBit = form.getFieldValue("FAccessBit");
				if (accessBit < 1 || accessBit > 20) {
					alert($text("Qs.PrivilegeType.AccessBitOutOfRange"));
					form.setFieldFocus("FAccessBit");
					return false;
				}
				var requiredBits = form.getFieldValue("FRequiredBits");
				if (!/^(\d+(,\d+)*)?$/.test(requiredBits)) {
					alert($text("Qs.PrivilegeType.RequiredBitsInvalid"));
					form.setFieldFocus("FRequiredBits");
					return false;
				}
			}
			return true;
		};
		form.getControl("FIsDataPrivilege").onchange = PrivilegeTypeEdit.doIsDataPrivilegeChange;
		form.getControl("FAccessBit").setClearOnDisable(true);
		form.getControl("FAccessBit").setRestoreOnEnable(true);
		form.getControl("FRequiredBits").setClearOnDisable(true);
		form.getControl("FRequiredBits").setRestoreOnEnable(true);
		PrivilegeTypeEdit.doIsDataPrivilegeChange();
	},

	doIsDataPrivilegeChange: function()
	{
		var enabled = form.getControl("FIsDataPrivilege").getValue();
		form.setFieldEnabled("FAccessBit", enabled, true);
		form.setFieldEnabled("FRequiredBits", enabled);
	}
};
