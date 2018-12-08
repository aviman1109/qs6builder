var SystemMessageList =
{
	doLoad: function()
	{
		list.ondoubleclick = SystemMessageList.doOpen;
		SystemMessageList.showNewItems();
	},
	
	doOpen: function()
	{
		var data = list.getSelectedData()[0];
		if (data == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		SystemMessage.open(data.FId, data.FUnitId, data.FEntityId);
		if (!data._FRead) {
			var newData = {
				FId		: data.FId, 
				FRead	: SystemMessageList.getReadIcon(true),
				_FRead	: true
			};
			list.updateData(newData);
		}
	},
	
	doReadAll: function()
	{
		Utility.invoke("Qs.SystemMessage.readAll", null, true, function(ret) {
			list.refresh();
			var wnd = Jui.window.getTop();
			if (wnd != null && wnd.MainFrame != null) {
				wnd.MainFrame.setSystemMessageCount(0);
			}
		});
	},

	processListTitle: function(json)
	{
		json = EntityList.$processListTitle(json);
		for (var i = 0; i < json.fields.length; ++i) {
			var field = json.fields[i];
			if (field.name == "FRead" || field.name == "FTimeout") {
				field.control = "Html";
				field.title = "";
			}
		}
		return json;
	},
	
	processListData: function(data)
	{
		for (var i = 0; i < data.records.length; ++i) {
			var row			= data.records[i];			
			row._FRead		= row.FRead;
			row._FTimeout	= row.FTimeout;
			row.FRead		= SystemMessageList.getReadIcon(row.FRead);
			row.FTimeout	= SystemMessageList.getTimeoutIcon(row.FTimeout, row.FTimeoutTime);
		}
		return data;
	},
	
	getReadIcon: function(read)
	{
		var icon = "quicksilver/image/16/" + (read ? "EmailRead.png" : "EmailNew.png");
		return "<img class=JuiListDataIcon src='" + icon + "'/>";
	},
	
	getTimeoutIcon: function(timeout, timeoutTime)
	{
		if (Jui.string.isEmpty(timeoutTime)) {
			return "";
		}
		var icon = "quicksilver/image/16/" + (timeout ? "ClockYellow.png" : "Clock.png");
		return "<img class=JuiListDataIcon src='" + icon + "'/>";
	},
	
	showNewItems: function()
	{
		var schemaBox = EntityList.getQuerySchemaBox();
		if (schemaBox != null) {
			schemaBox.setValue("9d91d631-5948-446b-bab4-da8c3ffd8d90");
		}
		var keywordBox = EntityList.getKeywordBox();
		if (keywordBox != null) {
			keywordBox.setValue();
		}
		if (EntityList.hasTree) {
			EntityList.tree.setCurrentId();
		}
		if (EntityList.hasQueryForm) {
			QueryForm.clear();
		}
		EntityList.query();
	}
};

EntityList.processListTitle = SystemMessageList.processListTitle;
EntityList.processListData = SystemMessageList.processListData;
EntityList.queryOnLoad = false;