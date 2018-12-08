var FieldGroupForm =
{
	doLoad: function()
	{
		var title = [
			{
				control		: "InputBox",
				name		: "name",
				title		: $text("Qs.FieldGroup.Name"),
				required	: true,
				maxLength	: 50
			},
			{
				control		: "ComboBox",
				selectOnly	: true,
				name		: "parent",
				title		: $text("Qs.FieldGroup.Parent"),
				items		: clientData.urlArgs.topItems
			},
			{
				control		: "CheckBox",
				name		: "collapse",
				title		: $text("Qs.FieldGroup.Collapse")
			}
		];
		if (clientData.urlArgs.data != null) {
			title.splice(1, 1);
		}
		FieldGroupForm.form = Jui.option.Form.create({
			target		: "QsContent",
			columnCount	: 1,
			titleWidth	: 80,
			style		: "padding:24px 10px"
		});
		FieldGroupForm.form.loadTitle(title);
		FieldGroupForm.form.loadData(clientData.urlArgs.data || {});
	},
	
	doConfirm: function()
	{
		if (FieldGroupForm.form.validate()) {
			Utility.closeDialog(FieldGroupForm.form.getData());
		}
	}
};
