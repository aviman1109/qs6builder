var ActionError = 
{
	initialize: function()
	{
		window._ignoreError = true;
		window.onload = ActionError.doLoad;
		if (Jui.string.isEmpty(clientData.urlArgs.stackTrace)) {
			var buttons = clientData.toolBarJson.right;
			for (var i = 0; i < buttons.length; ++i) {
				if (buttons[i].name == "Switch") {
					buttons.splice(i, 1);
					break;
				}
			}
		}
	},
	
	doLoad: function()
	{
		if (!Jui.string.isEmpty(clientData.urlArgs.stackTrace)) {
			Jui.basic.TextBox.create({
				target	: "DetailZone",
				wrap	: "off",
				style	: "width:100%;height:100%",
				value	: clientData.urlArgs.stackTrace
			});
		}
	},
	
	doSwitch: function()
	{
		var visible = $elem("DetailZone").style.display == "none";
		var button = toolBar.getItem("Switch");
		$elem("DetailZone").style.display = visible ? "block" : "none";
		button.setText($text(visible ? "Qs.Error.HideDetail" : "Qs.Error.ShowDetail"));
		Jui.basic.Dialog.getCurrent().setSize(0, visible ? 400 : 125);			
	}
};

ActionError.initialize();
