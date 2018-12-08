var UserPickList =
{
	buttons: {},
	
	listData: [],
	
	unitId: null,
	
	isWorkflow: true,
	
	manualNodes: [],
	
	initialize: function(panel, unitId, isWorkflow, json, manualNodes)
	{
		UserPickList.unitId = unitId;
		UserPickList.isWorkflow = isWorkflow;
		UserPickList.manualNodes = manualNodes;
		panel.innerHTML = "<div class=UserPickListPanel>"
						+	"<div id=RecipientButtonCell class=QsRightButtonPanel></div>"
						+	"<div id=RecipientListCell></div>"
						+ "</div>";
		UserPickList.buttons.add = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.Add"),
			onclick	: UserPickList.doAdd
		});
		UserPickList.buttons.modify = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.Modify"),
			onclick	: UserPickList.doModify
		});
		UserPickList.buttons.remove = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.Delete"),
			onclick	: UserPickList.doDelete
		});
		UserPickList.buttons.moveUp = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.MoveUp"),
			onclick	: UserPickList.doMoveUp
		});
		UserPickList.buttons.moveDown = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.MoveDown"),
			onclick	: UserPickList.doMoveDown
		});
		UserPickList.buttons.moveTop = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.MoveTop"),
			onclick	: UserPickList.doMoveTop
		});
		UserPickList.buttons.moveBottom = Jui.basic.Button.create({
			target	: "RecipientButtonCell",
			text	: $text("Public.MoveBottom"),
			onclick	: UserPickList.doMoveBottom
		});
		UserPickList.list = Jui.option.List.create({
			target			: "RecipientListCell",
			border			: "all",
			multiPage		: false,
			ondoubleclick	: UserPickList.doDoubleClick
		});
		UserPickList.listData = Jui.util.clone(json.data) || [];
		var activityMap = Jui.array.toMap(UserPickList.manualNodes || [], "value");
		for (var i = 0; i < UserPickList.listData.length; ++i) {
			var item = UserPickList.listData[i];
			if (item.type == "Executor") {
				if (item.value in activityMap) {
					item.text = activityMap[item.value].text;
				}
				else {
					delete item.value;
				}
			}
		}
		UserPickList.list.loadTitle(json.title);
		UserPickList.list.loadData(UserPickList.listData);
	},

	setEnabled: function(enabled)
	{
		for (var key in UserPickList.buttons) {
			UserPickList.buttons[key].setDisabled(!enabled);
		}
		if (enabled) {
			UserPickList.list.loadData(UserPickList.listData);
		}
		else {
			UserPickList.list.clear();
		}
	},
	
	doAdd: function()
	{
		var args = {
			unitId		: UserPickList.unitId,
			isWorkflow	: UserPickList.isWorkflow,
			manualNodes	: UserPickList.manualNodes
		};
		Utility.openDialog("Qs.User.Pick.page", args, null, function(ret) {
			UserPickList.list.appendData(ret);
		});
	},
	
	open: function(index)
	{
		var data = UserPickList.list.getData()[index];
		var args = Jui.object.merge({
			unitId		: UserPickList.unitId,
			isWorkflow	: UserPickList.isWorkflow,
			manualNodes	: UserPickList.manualNodes
		}, data);
		Utility.openDialog("Qs.User.Pick.page", args, null, function(ret) {
			UserPickList.list.updateDataByIndex(ret, index);
		});
	},
	
	doModify: function()
	{
		var index = UserPickList.list.getSelectedIndices()[0];
		if (index == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		UserPickList.open(index);
	},
	
	doDoubleClick: function(event)
	{
		UserPickList.open(event.index);
	},
	
	doDelete: function()
	{
		if (!UserPickList.list.deleteSelectedRows()) {
			alert($text("Public.SelectAlert"));
		}
	},
	
	doMoveUp: function()
	{
		UserPickList.list.moveUp();
	},
	
	doMoveDown: function()
	{
		UserPickList.list.moveDown();
	},
	
	doMoveTop: function()
	{
		UserPickList.list.moveTop();
	},
	
	doMoveBottom: function()
	{
		UserPickList.list.moveBottom();
	},
	
	getData: function()
	{
		var recipients = UserPickList.list.getData();
		for (var i = 0; i < recipients.length; ++i) {
			delete recipients[i].text;
		}
		return recipients;
	}
};

Jui.use("List");
