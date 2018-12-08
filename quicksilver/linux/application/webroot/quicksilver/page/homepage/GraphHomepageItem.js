var GHI =
{
	doLoad: function()
	{
		var editTitle = [
			{
                name		: "text",
                title		: $text("Qs.GraphHomepage.NodeName"),
				control		: "InputBox",
				maxLength	: 50,
                required	: true
			},
			{
                name		: "icon",
                title		: $text("Qs.GraphHomepage.NodeIcon"),
				control		: "InputBox",
				maxLength	: 100
			},
	       	{
                control		: "EntityBox",
                title		: $text("Qs.GraphHomepage.NodePage"),
                name		: "pageId",
                textField	: "pageName",
                entityType	: "Qs.Page",
                required	: false
            },
	       	{
                name		: "url",
                title		: $text("Qs.GraphHomepage.NodeUrl"),
				control		: "InputBox",
				maxLength	: 200
            }
		];
		GHI.form = Jui.option.Form.create({
			target						: "QsContent",
			columnCount					: 1,
			titleWidth					: 50,
			style						: "padding:10px",
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop
		});
		GHI.form.load({title:editTitle, data:clientData.urlArgs});
	},
	
	doConfirm: function()
	{
		if (!GHI.form.validate()) {
			return;
		}
		Utility.setDialogResult(GHI.form.getData());
		Utility.closeDialog();
	}
};
