var EditableList =
{
	multiSelect: Jui.cast.toBool(clientData.multiSelect, true),
		
	arguments: clientData.arguments,
	
	basicQueryArguments: clientData.urlArgs.basicQueryArguments,
	
	//-----------------------------------------------------------------------
	// page
	//-----------------------------------------------------------------------

	doLoad: function()
	{
		window.list = Jui.option.List.create({
			target						: "ListPanel",
			editable					: true,
			multiSelect					: EditableList.multiSelect,
			inputBoxEmptyAsNull			: true,
			boxChangeHandler			: CommonBusiness.doListBoxChange,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			pictureBoxSelectHandler		: CommonBusiness.doPictureBoxSelect,
			pictureBoxViewHandler		: CommonBusiness.doPictureBoxView
		});
		list.loadTitle(clientData.titleJson);
		if (clientData.dataJson != null) {
			list.loadData(clientData.dataJson);
		}
		else if (EditableList.autoLoad != false) {
			EditableList.doRefresh();
		}
	},

	validate: function()
	{
		return list.validate();
	},

	//-----------------------------------------------------------------------
	// button
	//-----------------------------------------------------------------------

	doAdd: function()
	{
		list.appendDataAndEdit(clientData.initDataJson || {});
	},

	doDelete: function()
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Jui.message.confirm($text("Public.ListDeleteConfirm"), function() {
			for (var i = entityIds.length - 1; i >= 0; --i) {
				if (Jui.string.isEmpty(entityIds[i])) {
					entityIds.splice(i, 1);
				} 
			}
			if (entityIds.length == 0) {
				Jui.message.hint($text("Public.DeleteSuccess"));
				list.deleteSelectedRows();
				return;
			}
			var args = Jui.object.merge({entityIds:entityIds}, EditableList.arguments);
			Utility.invoke(clientData.deleteMethod, args, true, function(ret){
				Jui.message.hint($text("Public.DeleteSuccess"));
				list.deleteSelectedRows();
				if (EditableList.onDeleteSuccess != null) {
					EditableList.onDeleteSuccess();
				}
			});
		});
	},

	doSave: function()
	{
		var args = Jui.object.merge({data:list.getData()}, EditableList.arguments);
		if (args.data.length == 0 && clientData.allowEmptyList == false) {
			Jui.message.alert($text("Public.NoDataToSaveAlert"));
		}
		else if (EditableList.validate()) {
			for (var i = 0; i < args.data.length; ++i) {
				args.data[i].FIndex = i + 1;
			}
			Utility.invoke(clientData.saveMethod, args, true, function(ret){
				Jui.message.hint($text("Public.SaveSuccess"));
				EditableList.doRefresh();
				if (EditableList.onSaveSuccess) {
					EditableList.onSaveSuccess(ret);
				}			
			});
		}
	},

	doRefresh: function()
	{
		if (!Jui.string.isEmpty(clientData.loadMethod)) {
			var args = Jui.object.merge({}, EditableList.arguments, EditableList.basicQueryArguments);
			Utility.invoke(clientData.loadMethod, args, true, function(ret) {
				list.loadData(ret.data);
			});
		}
	},

	doExcelExport: function()
	{
		var args = Jui.object.merge({format:"xls"}, EditableList.arguments);
		Utility.download(clientData.exportMethod, args);
	},

	doSqlExport: function()
	{
		var args = Jui.object.merge({format:"sql"}, EditableList.arguments);
		Utility.download(clientData.exportMethod, args);
	},

	doMoveUp: function()
	{
		list.moveUp();
	},

	doMoveDown: function()
	{
		list.moveDown();
	},

	doMoveTop: function()
	{
		list.moveTop();
	},

	doMoveBottom: function()
	{
		list.moveBottom();
	}
};

window.onload = EditableList.doLoad;
