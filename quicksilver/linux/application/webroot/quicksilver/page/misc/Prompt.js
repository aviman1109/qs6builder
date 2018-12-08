var Prompt =
{
	title		: clientData.urlArgs.title,
	information	: clientData.urlArgs.information,
	allowEmpty	: clientData.urlArgs.allowEmpty,
	multiLine	: clientData.urlArgs.multiLine,
	text		: clientData.urlArgs.text,
	
	doLoad: function()
	{
		if (Prompt.multiLine) {
			Prompt.box = Jui.basic.TextBox.create({
				target	: "BoxPanel",
				style	: "width:100%;height:100%",
				value	: Prompt.text
			});
		}
		else {
			Prompt.box = Jui.basic.InputBox.create({
				target	: "BoxPanel",
				style	: "width:100%",
				value	: Prompt.text
			});
		}
	},
	
	doConfirm: function()
	{
		var text = Prompt.box.getValue();
		if (Jui.string.isEmpty(text) && !Prompt.allowEmpty) {
			Jui.message.alert($text("Qs.Misc.Prompt.InputAlert"), function() {
				Prompt.box.focus();
			});
			return;
		}
		Utility.closeDialog(text);
	}
};

if (Prompt.title != null) {
	document.title = Prompt.title;
}
