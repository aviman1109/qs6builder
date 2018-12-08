var Error = 
{
	hasStackTrace: !Jui.string.isEmpty(stackTrace),
	
	initialize: function()
	{
		window._ignoreError = true;
		if (typeof(clientData) == "undefined") {
			clientData = {};
		}
		if (Error.hasStackTrace) {
			clientData.toolBarJson = {right:[{
				name	: "Switch",
				control	: "Button",
				icon	: "quicksilver/image/16/Switch.gif",
				text	: "Switch",
				onclick	: Error.doSwitch
			}]};
		}
	},

	doLoad: function(isExpected)
	{
		if (Error.hasStackTrace) {
			Jui.basic.TextBox.create({
				target	: "DetailZone",
				wrap	: "off",
				style	: "width:100%;height:100%",
				value	: stackTrace
			});
			Error.setDetailVisible(!isExpected);
		}
	},
	
	doSwitch: function()
	{
		Error.setDetailVisible($elem("DetailZone").style.display == "none");
	},
	
	setDetailVisible: function(visible)
	{
		var button = toolBar.getItem("Switch");
		$elem("DetailZone").style.display = visible ? "block" : "none";
		button.setText($text(visible ? "Qs.Error.HideDetail" : "Qs.Error.ShowDetail"));
	}
};

Error.initialize();
