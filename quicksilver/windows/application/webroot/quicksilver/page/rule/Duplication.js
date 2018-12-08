var Duplication =
{
	doLoad: function()
	{
		Duplication._createControls();
		if (/Warning/.test(clientData.pageCode)) {
			Jui.dom.setInnerText($elem("Message"), clientData.urlArgs.message);
		}
		else {
			var template = $text("Qs.Duplication.ConfirmMessage");
			var message = template.replace("${0}", clientData.urlArgs.unitName);
			Jui.dom.setInnerText($elem("Message"), message);
		}
	},
	
	doConfirm: function()
	{
		Utility.closeDialog(true);		
	},
	
	_createControls: function()
	{
		var listTitle = [
 			{
                 control	: "InputBox",
                 title		: $text("Qs.Duplication.List.Name"),
                 width		: 150,
                 name		: "name"
 			},
 			{
                 control	: "InputBox",
                 title		: $text("Qs.Duplication.List.Condition"),
                 width		: 150,
                 name		: "condition"
 			},
 			{
                 control	: "InputBox",
                 title		: $text("Qs.Duplication.List.Hint"),
                 width		: 100,
                 name		: "hint"
 			}
 		];
		var list = Jui.option.List.create({
			target			: "ListPanel",
			multiPage		: false,
			multiSelect		: false
		});
		list.loadTitle(listTitle);
		list.loadData(clientData.urlArgs.listData);
	}
};
