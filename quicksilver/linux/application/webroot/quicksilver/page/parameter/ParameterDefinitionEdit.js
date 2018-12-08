var ParameterDefinitionEdit =
{
	doLoad: function()
	{
		form.getControl("FParameterGroupId").onbeforedrop = ParameterDefinitionEdit.doParameterGroupBoxBeforeDrop;
		form.getControl("FDictionaryId").setClearOnDisable(true);
		form.getControl("FEntityUnitId").setClearOnDisable(true);
		form.getControl("FScale").setClearOnDisable(true);
		form.getControl("FRequired").setClearOnDisable(true);
		form.getControl("FType").onchange = ParameterDefinitionEdit.doTypeBoxChange;
		ParameterDefinitionEdit.doTypeBoxChange();
	},

	doParameterGroupBoxBeforeDrop: function()
	{
		if (!ParameterDefinitionEdit.parameterGroupDropdownLoaded) {
			Utility.syncInvoke("Qs.ParameterGroup.getDropdownJson", {level:2}, function(ret) {
				form.getControl("FParameterGroupId").loadItems(ret.data);
				ParameterDefinitionEdit.parameterGroupDropdownLoaded = true;
			});
		}
	},

	doTypeBoxChange: function()
	{
		var type = form.getFieldValue("FType");
		form.setFieldEnabled("FDictionaryId", /ComboBox/.test(type), true);
		form.setFieldEnabled("FEntityUnitId", type == "EntityBox", true);
		form.setFieldEnabled("FScale", /Double|Percent/.test(type), true);
		form.setFieldEnabled("FRequired",  type != "CheckBox");
	}
};
