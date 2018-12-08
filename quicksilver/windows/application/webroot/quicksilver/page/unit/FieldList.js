var FieldList =
{
	doKeywordFieldConfig: function()
	{
		var args = {unitId:clientData.masterEntityId};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.Keyword.FieldConfig.page", args, options);
	},

	doPrivilegeFieldConfig: function()
	{
		var args = {entityId:clientData.masterEntityId};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.Privilege.UnitAccessFieldConfig.page", args, options);
	},

	doQueryFormConfig: function()
	{
		var args = {entityId:clientData.masterEntityId};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.QuerySchema.QueryFormConfig.page", args, options);
	},

	doOrderFieldConfig: function()
	{
		var args = {unitId:clientData.masterEntityId, contextId:clientData.masterEntityId};
		Utility.openDialog("Qs.Field.OrderConfig.page", args);
	},

	doCopyFieldConfig: function()
	{
		var args = {entityId:clientData.masterEntityId};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.Field.CopyConfig.page", args, options);
	},

	doGenerateSlavePage: function()
	{
		var args = {fieldId:list.getSelectedKeys()[0]};
		if (args.fieldId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		Utility.invoke("Qs.Field.checkBeforeGenerateSlavePage", args, true, function(ret) {
			var url = "Qs.Page.SlavePageGenerate.page";
			Utility.openDialog(url, {relationId:ret.relationId});
		});
	}
};
