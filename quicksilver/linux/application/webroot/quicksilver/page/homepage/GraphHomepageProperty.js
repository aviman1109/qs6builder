var GHP =
{
	doLoad: function()
	{
		var formTitle = [
			{
                name		: "nodeWidth",
                title		: $text("Qs.GraphHomepage.NodeWidth"),
				control		: "InputBox",
				type		: "int",
                required	: true
			},
			{
                name		: "nodeHeight",
                title		: $text("Qs.GraphHomepage.NodeHeight"),
				control		: "InputBox",
				type		: "int",
                required	: true
			},
			{
                name		: "lineWidth",
                title		: $text("Qs.GraphHomepage.LineWidth"),
				control		: "InputBox",
				type		: "int",
                required	: true
			},
			{
                name		: "lineColor",
                title		: $text("Qs.GraphHomepage.LineColor"),
				control		: "InputBox",
				maxLength	: 6,
                required	: true
			},
			{
                name		: "backgroundImage",
                title		: $text("Qs.GraphHomepage.BackgroundImage"),
				control		: "InputBox",
				maxLength	: 100
			}
		];
		GHP.form = Jui.option.Form.create({
			target		: "QsContent",
			columnCount	: 1,
			titleWidth	: 120,
			style		: "padding:10px"
		});
		GHP.form.load({title:formTitle, data:clientData.urlArgs});
	},
	
	doConfirm: function()
	{
		if (!GHP.form.validate()) {
			return;
		}
		Utility.setDialogResult(GHP.form.getData());
		Utility.closeDialog();
	}
};
