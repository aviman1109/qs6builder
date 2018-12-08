var OrderField =
{
	doLoad: function()
	{
		OrderField.createControls();
		var allFields = clientData.allFields;
		var orderFields = clientData.orderFields;
		var allFieldMap = {};
		for (var i = 0; i < allFields.length; ++i) {
			allFieldMap[allFields[i].value] = allFields[i];
		}
		var orderFieldNameSet = {};
		var listData = [];
		for (var i = 0; i < orderFields.length; ++i) {
			var item = orderFields[i];
			orderFieldNameSet[item.FFieldName] = 1;
			if (item.FFieldName in allFieldMap) {
				item.FFieldTitle = allFieldMap[item.FFieldName].text;
				listData.push(item);
			}
		}
		var sorterData = [];
		for (var i = 0; i < allFields.length; ++i) {
			if (!(allFields[i].value in orderFieldNameSet)) {
				sorterData.push(allFields[i]);
			}
		}
		OrderField.sorter.load(sorterData);
		OrderField.list.loadTitle({keyField:"fieldName", fields:[
       		{name:"FFieldTitle", 	title:$text("Qs.OrderField.Name"), 		width:260, 	control:"InputBox", readOnly:true},
       		{name:"FDirection", 	title:$text("Qs.OrderField.Descend"), 	width:40,	control:"CheckBox", align:"center"}
       	]});
		OrderField.list.loadData(listData);
	},

	doSave: function()
	{
		var args = {contextId:clientData.contextId, fields:OrderField.list.getData()};
		Utility.invoke("Qs.Field.setOrderFields", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.closeDialog();
		});
	},
	
	doMoveUp: function()
	{
		OrderField.list.moveUp();
	},

	doMoveDown: function()
	{
		OrderField.list.moveDown();
	},

	doMoveTop: function()
	{
		OrderField.list.moveTop();
	},

	doMoveBottom: function()
	{
		OrderField.list.moveBottom();
	},

	doLeftButtonClick: function()
	{
		var listData = OrderField.list.getSelectedData();
		if (listData.length > 0) {
			var sorterData = [];
			for (var i = 0; i < listData.length; ++i) {
				var item = listData[i];
				sorterData.push({value:item.FFieldName, text:item.FFieldTitle});
			}
			OrderField.sorter.add(sorterData);
			OrderField.list.deleteSelectedRows();
		}
	},

	doRightButtonClick: function()
	{
		var sorterData = OrderField.sorter.getSelectedData();
		if (sorterData.length > 0) {
			var listData = [];
			for (var i = 0; i < sorterData.length; ++i) {
				var item = sorterData[i];
				listData.push({FFieldName:item.value, FFieldTitle:item.text, FDirection:0});
			}
			OrderField.list.appendData(listData);
			OrderField.sorter.deleteSelected();
		}
	},
	
	createControls: function()
	{
		OrderField.sorter = Jui.option.Sorter.create({
			target			: "LeftPanel",
			ondoubleclick	: OrderField.doRightButtonClick
		});
		OrderField.list = Jui.option.List.create({
			target			: "RightPanel",
			editable		: true,
			multiPage		: false,
			border			: "all"
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveRight.png",
			onclick			: OrderField.doRightButtonClick
		});
		Jui.basic.Button.create({
			target			: "ButtonPanel",
			icon			: "quicksilver/image/16/MoveLeft.png",
			onclick			: OrderField.doLeftButtonClick
		});
	}
};
