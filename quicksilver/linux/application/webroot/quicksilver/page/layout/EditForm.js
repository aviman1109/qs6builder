var EditForm =
{
	doLoad: function()
	{
		FieldSelect.createControls();
		FieldSelect.loadFields(clientData.fields, clientData.selectedFields);
		form.getControl("FCustomizeFields").onchange = EditForm.doCustomFieldsBoxChange;
		EditForm.doCustomFieldsBoxChange();
	},
	
	doCustomFieldsBoxChange: function()
	{
		var disabled = !form.getFieldValue("FCustomizeFields");
		FieldSelect.leftSorter.setDisabled(disabled);
		FieldSelect.rightSorter.setDisabled(disabled);
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (form.getFieldValue("FCustomizeFields") && FieldSelect.rightSorter.getValues().length == 0) {
		alert($text("Qs.Field.SelectAlert"));
		return false;
	}
	return true;
};
