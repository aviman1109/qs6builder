var WfVersionChartError =
{
	doLoad: function()
	{
		Jui.dom.setInnerText($elem("MessageRow"), clientData.urlArgs.message);
		
		var listData = [];
		for (var i = 0, errors = clientData.urlArgs.errors; i < errors.length; ++i) {
			listData.push({text:errors[i]});
		}
		WfVersionChartError.list = Jui.option.List.create({
			target		: "ListPanel",
			border		: "top",
			multiPage	: false,
			multiSelect	: false
		});
		WfVersionChartError.list.loadTitle([{name:"text", title:$text("Wf.Version.ErrorMessage")}]);
		WfVersionChartError.list.loadData(listData);
	}
};
