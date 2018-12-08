var SingleBox =
{
	title			: clientData.urlArgs.title,
	information		: clientData.urlArgs.information,
	allowEmpty		: clientData.urlArgs.allowEmpty,
	boxArgs			: clientData.urlArgs.boxArgs,
	boxType			: clientData.urlArgs.boxType,
	
	doLoad: function()
	{
		SingleBox.box = Jui.basic[SingleBox.boxType].create(Jui.object.merge({
			target	: "BoxPanel",
			style	: "width:100%"
		}, SingleBox.boxArgs));
	},
	
	doConfirm: function()
	{
		var value = SingleBox.box.getValue();
		if (Jui.string.isEmpty(value) && !SingleBox.allowEmpty) {
			Jui.message.alert($text("Qs.Misc.Prompt.InputAlert"), function() {
				SingleBox.box.focus();
			});
			return;
		}
		Utility.closeDialog({value:value});
	}
};

if (SingleBox.title != null) {
	document.title = SingleBox.title;
}
