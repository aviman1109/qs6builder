var RelationEdit =
{
	doLoad: function()
	{
		if (form.getFieldValue("FType") == "field") {
			form.setFieldDisabled("FUnitId1");
			form.setFieldDisabled("FUnitId2");
			form.setFieldDisabled("FTable");
			form.setFieldDisabled("FField1");
			form.setFieldDisabled("FField2");
			form.setFieldDisabled("FPrivilegeTypeId1");
			form.setFieldDisabled("FPrivilegeTypeId2");
		}
		else {
			form.setFieldRequired("FTable");
			form.getControl("FPrivilegeTypeId1").onbeforedrop = RelationEdit.doPrivilegeTypeIdBoxBeforeDrop;
			form.getControl("FPrivilegeTypeId2").onbeforedrop = RelationEdit.doPrivilegeTypeIdBoxBeforeDrop;
		}
	},

	doGenerateSlavePage: function()
	{
		if (clientData.entityId == null) {
			alert($text("Qs.Edit.SaveNewDataFirstAlert"));
			return;
		}
		var url = "Qs.Page.SlavePageGenerate.page";
		Utility.openDialog(url, {relationId:clientData.entityId});
	},

	doPrivilegeTypeIdBoxBeforeDrop: function()
	{
		var json = Utility.getCacheItem("RelationPrivilege");
		if (json == null) {
			var ret = Utility.syncInvoke("Qs.Relation.getPrivilegeTypeBoxDropdownJson");
			json = ret.json;
		}
		this.loadItems(json);
	}
};
