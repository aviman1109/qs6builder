var WfButtonConfig =
{
	type: clientData.type,
	
	doLoad: function()
	{
		var data = clientData.urlArgs.data || {FType:"Button", FHandleType:"Default"};
		
		WfButtonConfig.basicForm = Jui.option.Form.create({
			target						: "FormPanel",
			titleWidth					: 100,
			columnCount					: 2,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			style						: "padding:0px"
		});
		WfButtonConfig.basicForm.loadTitle(clientData.basicFormTitle);
		WfButtonConfig.basicForm.loadData(data);
		
		if (WfButtonConfig.type == "ComboButton") {
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.Add"),
				onclick	: WfButtonConfig.doListAdd
			});
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.Modify"),
				onclick	: WfButtonConfig.doListModify
			});
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.Delete"),
				onclick	: WfButtonConfig.doListDelete
			});
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.MoveUp"),
				onclick	: WfButtonConfig.doListMoveUp
			});
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.MoveDown"),
				onclick	: WfButtonConfig.doListMoveDown
			});
			Jui.basic.Button.create({
				text	: $text("Public.MoveTop"),
				target	: "ButtonCell",
				onclick	: WfButtonConfig.doListMoveTop
			});
			Jui.basic.Button.create({
				target	: "ButtonCell",
				text	: $text("Public.MoveBottom"),
				onclick	: WfButtonConfig.doListMoveBottom
			});
			WfButtonConfig.list = Jui.option.List.create({
				target			: "ListPanel",
				border			: "all",
				multiPage		: false,
				ondoubleclick	: WfButtonConfig.doListDoubleClick
			});
			WfButtonConfig.list.loadTitle(clientData.buttonListTitle);
			WfButtonConfig.list.loadData(data.items || []);
		}
		if (WfButtonConfig.type == "Button") {
			var conditionalFields = ["FPageId", "FEntityEventCode", "FSaveForm", "FScript"];
	 		for (var i = 0; i < conditionalFields.length; ++i) {
	 			var fieldName = conditionalFields[i];
 	 			WfButtonConfig.basicForm.getControl(fieldName).setClearOnDisable(true);
 	 			WfButtonConfig.basicForm.getControl(fieldName).setRestoreOnEnable(true);
	 		}
			WfButtonConfig.basicForm.getControl("FHandleType").onchange = WfButtonConfig.doHandleTypeBoxChange;
			WfButtonConfig.doHandleTypeBoxChange();
		}
	},
	
	doConfirm: function()
	{
		if (WfButtonConfig.basicForm.validate()) {
			var ret = WfButtonConfig.basicForm.getData();
			if (WfButtonConfig.type == "ComboButton") {
				ret.items = WfButtonConfig.list.getData();
			}
			Utility.closeDialog(ret);
		}
	},
	
	doHandleTypeBoxChange: function()
	{
		var handleType = WfButtonConfig.basicForm.getFieldValue("FHandleType");
		WfButtonConfig.basicForm.setFieldEnabled("FPageId", /Form/.test(handleType), true);
		WfButtonConfig.basicForm.setFieldEnabled("FScript", handleType == "JavaScript", true);
		WfButtonConfig.basicForm.setFieldEnabled("FEntityEventCode", !/JavaScript/.test(handleType));
		WfButtonConfig.basicForm.setFieldEnabled("FSaveForm", handleType == "Default");
	},

	doListDoubleClick: function(event)
	{
		WfButtonConfig.configDropDownItem(event.index);
	},

	doListAdd: function(event)
	{
		Utility.openDialog("Wf.Button.Config.page", {type:"Button"}, null, function(ret) {
			WfButtonConfig.list.appendData(ret);
		});
	},

	doListModify: function()
	{
		WfButtonConfig.configDropDownItem(WfButtonConfig.list.getSelectedIndices()[0]);
	},

	doListDelete: function()
	{
		WfButtonConfig.list.deleteSelectedRows();
	},

	doListMoveUp: function()
	{
		WfButtonConfig.list.moveUp();
	},

	doListMoveDown: function()
	{
		WfButtonConfig.list.moveDown();
	},

	doListMoveTop: function()
	{
		WfButtonConfig.list.moveTop();
	},

	doListMoveBottom: function()
	{
		WfButtonConfig.list.moveBottom();
	},

	configDropDownItem: function(index)
	{
		if (index == null || index < 0) {
			alert($text("Public.SelectAlert"));
			return;
		}
		var args = {type:"Button", data:WfButtonConfig.list.getData()[index]};
		Utility.openDialog("Wf.Button.Config.page", args, null, function(ret) {
			WfButtonConfig.list.updateDataByIndex(ret, index);
		});
	}
};
