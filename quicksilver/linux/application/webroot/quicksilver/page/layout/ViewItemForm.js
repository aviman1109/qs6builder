var ViewItemForm =
{
	doLoad: function()
	{
		var fields = clientData.fields;
		fields.sort(function(a, b) {return a.text.localeCompare(b.text);});
		var htmlFields = [];
		for (var i = 0; i < fields.length; ++i) {
			if (fields[i].isHtmlBox) {
				htmlFields.push(fields[i]);
			}
		}
		form.getControl("FTitleField").loadItems(fields);
		form.getControl("FHtmlField").loadItems(htmlFields);
		
		var conditionalFields = [
 			"FCollapsed", "FFieldArrangeType", "FColumnCount", "FContentFontSize", "FHtmlField",
 			"FRelationId", "FRecordCount", "FHandlerClassName"
 		];
 		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
 		}
		form.getControl("FType").onchange = ViewItemForm.refreshControlStatus;
		form.getControl("FTitleType").onchange = ViewItemForm.refreshControlStatus;
		form.getControl("FFieldArrangeType").onchange = ViewItemForm.refreshControlStatus;
		ViewItemForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		var type = form.getFieldValue("FType");
		var titleType = form.getFieldValue("FTitleType");
		var fieldArrangeType = form.getFieldValue("FFieldArrangeType");
		form.setFieldEnabled("FTitleText", /Text/.test(titleType), true);
		form.setFieldEnabled("FTitleField", /Field/.test(titleType), true);
		form.setFieldEnabled("FCollapsed", type != "FieldGroup" || fieldArrangeType != "None");
		form.setFieldEnabled("FFieldArrangeType", type == "FieldGroup", true);
		form.setFieldEnabled("FColumnCount", type == "FieldGroup" && fieldArrangeType == "Table", true);
		form.setFieldEnabled("FContentFontSize", type == "FieldGroup");
		form.setFieldEnabled("FHtmlField", type == "HtmlField", true);
		form.setFieldEnabled("FRelationId", type == "List", true);
		form.setFieldEnabled("FRecordCount", type == "List", true);
		form.setFieldEnabled("FHandlerClassName", type == "Custom", true);
	}
};
