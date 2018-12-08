var SerialNumberPartEdit =
{
	doLoad: function()
	{
		var conditionalFields = ["FFixedText", "FDateStyle", "FSerialLength", "FSerialResetType"];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FFieldId").setClearOnDisable(true);
		form.getControl("FRelateFieldId").setClearOnDisable(true);

		form.getControl("FType").onchange = SerialNumberPartEdit.doTypeBoxChange;
		form.getControl("FFieldId").onchange = SerialNumberPartEdit.doFieldIdBoxChange;
		form.getControl("FFieldId").onbeforedrop = null;
		form.getControl("FRelateFieldId").onbeforedrop = null;
		form.getControl("FFieldId").loadItems(clientData.fieldMap[""]);
		SerialNumberPartEdit.doTypeBoxChange();
	},

	doTypeBoxChange: function()
	{
		var type = form.getFieldValue("FType");
		form.setFieldEnabled("FFixedText", type == "FixedText", true);
		form.setFieldEnabled("FDateStyle", type == "Date", true);
		form.setFieldEnabled("FFieldId", type == "Field", true);
		form.setFieldEnabled("FSerialLength", type == "Serial", true);
		form.setFieldEnabled("FSerialResetType", type == "Serial", true);
		SerialNumberPartEdit.doFieldIdBoxChange();
	},
	
	doFieldIdBoxChange: function()
	{
		var fieldId = form.getFieldValue("FFieldId");
		var items = clientData.fieldMap[fieldId];
		form.setFieldEnabled("FRelateFieldId", items != null, true);
		form.getControl("FRelateFieldId").loadItems(items);
	}
};
