var UnitPrivilegeList =
{
	doPrivilegeFieldConfig: function()
	{
		var args = {entityId:clientData.masterEntityId};
		var options = CommonBusiness.defaultDialogOptions.doubleSorter;
		Utility.openDialog("Qs.Privilege.UnitAccessFieldConfig.page", args, options);
	}
};
