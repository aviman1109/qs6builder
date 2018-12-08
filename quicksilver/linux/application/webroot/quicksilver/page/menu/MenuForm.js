var MenuForm =
{
	doLoad: function()
	{
		var conditionalFields = [
 			"FTabTitle", "FPageId", "FQuerySchemaId", "FQuerySchemaLocked", "FArguments",
 			"FExternalPageUrl", "FOpenMode", "FFunctionName", "FSubMenuRoutine", "FReplaceByChildren"
 		];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FTabTitleSource").onchange	= MenuForm.refreshControlStatus;
		form.getControl("FSubMenuSource").onchange	= MenuForm.refreshControlStatus;
		form.getControl("FType").onchange			= MenuForm.refreshControlStatus;
		MenuForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var type			= form.getFieldValue("FType");
		var tabTitleSource	= form.getFieldValue("FTabTitleSource");
		var source			= form.getFieldValue("FSubMenuSource");
		form.setFieldEnabled("FTabTitle", tabTitleSource == "Custom", true);
		form.setFieldEnabled("FPageId", type == "InternalPage", true);
		form.setFieldEnabled("FQuerySchemaId", type == "InternalPage");
		form.setFieldEnabled("FQuerySchemaLocked", type == "InternalPage");
		form.setFieldEnabled("FArguments", type == "InternalPage");
		form.setFieldEnabled("FExternalPageUrl", type == "ExternalPage", true);
		form.setFieldEnabled("FOpenMode", type == "ExternalPage");
		form.setFieldEnabled("FEncrypt", type == "ExternalPage");
		form.setFieldEnabled("FFunctionName", type == "Function", true);
		form.setFieldEnabled("FSubMenuRoutine", source == 'JavaClass' || source == 'Sql', true);
		form.setFieldEnabled("FReplaceByChildren", source == 'JavaClass' || source == 'Sql');
	}
};
