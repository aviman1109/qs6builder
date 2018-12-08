var SortAndEdit =
{
	//-----------------------------------------------------------------------
	// data
	//-----------------------------------------------------------------------

	entityId: null,

	//-----------------------------------------------------------------------
	// event
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		SortAndEdit.sorter = Jui.option.Sorter.create({
			target	: "LeftZone",
			onclick	: SortAndEdit.doSorterClick
		});
		SortAndEdit.form = Jui.option.Form.create({
			target						: "RightZone",
			columnCount					: 2,
			titleWidth					: 80,
			boxChangeHandler			: CommonBusiness.doEditBoxChange,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop
		});
		SortAndEdit.loadSorter(clientData);
		SortAndEdit.loadEdit(clientData);
		Utility.setDialogResultAttribute("modified", false);
	},
	
	doMoveUp: function()
	{
		SortAndEdit.sorter.moveUp();
	},
	
	doMoveDown: function()
	{
		SortAndEdit.sorter.moveDown();
	},
	
	doSaveIndex: function()
	{
		var args = Jui.object.merge({
			entityIds	: SortAndEdit.sorter.getValues(), 
			indices		: SortAndEdit.sorter.getIndices(),
			levels		: SortAndEdit.sorter.getLevels(),
			serials		: SortAndEdit.sorter.getTreeSerials()
		}, clientData.postArgs);
		Utility.invoke(clientData.saveIndexMethod, args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.setDialogResultAttribute("modified", true);
		});
	},
	
	doAdd: function(event)
	{
		if (SortAndEdit.form.isModified() && !confirm($text("Public.DiscardEdit"))) {
			return;
		}
		SortAndEdit.sorter.unselect();
		SortAndEdit.setEntityId(null, this instanceof Jui.basic.ComboButton ? event.id : null);
	},
	
	doSave: function()
	{
		if (SortAndEdit.form.validate()) {
			var data = [SortAndEdit.form.getData()];
			CommonBusiness.saveEntity(clientData.unitCode, data, clientData.postArgs, function(ret) {
				Jui.message.hint($text("Public.SaveSuccess"));
				Utility.setDialogResultAttribute("modified", true);
				SortAndEdit.setEntityId(ret.entityIds[0]);
				SortAndEdit.refreshSorter();
			});
		}
	},
	
	doDelete: function()
	{
		var item = SortAndEdit.sorter.getSelectedData()[0];
		if (item == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Jui.message.confirm($text("Public.SortAndEdit.DeleteConfirm").replace("${0}", item.text), function() {
			CommonBusiness.deleteEntity(clientData.unitCode, item.value, function(ret) {
				Jui.message.hint($text("Public.DeleteSuccess"));
				Utility.setDialogResultAttribute("modified", true);
				SortAndEdit.setEntityId(null);
				SortAndEdit.refreshSorter();
			});
		});
	},
	
	doSorterClick: function(event)
	{
		if (event.value != SortAndEdit.entityId) {
			SortAndEdit.setEntityId(event.value);
		}
	},

	//-----------------------------------------------------------------------
	// method
	//-----------------------------------------------------------------------

	loadSorter: function(data)
	{
		SortAndEdit.sorter.load(data.sorterJson);
		SortAndEdit.sorter.select(data.entityId);
	},
	
	loadEdit: function(data)
	{
		if (data.editJson != null) {
			SortAndEdit.form.load(data.editJson);
			return;
		}
		if (data.editTitleJson != null) {
			SortAndEdit.form.loadTitle(data.editTitleJson);
		}
		if (data.editDataJson != null) {
			SortAndEdit.form.loadData(data.editDataJson);
		}
	},
	
	setEntityId: function(entityId, editId)
	{
		SortAndEdit.entityId = entityId;
		var args = {unitId:clientData.unitId, editId:editId, entityId:entityId};
		args = Jui.object.merge(args, clientData.postArgs);
		Utility.invoke(clientData.getFormJsonMethod, args, true, function(ret) {
			SortAndEdit.loadEdit(ret);
		});
	},
	
	refreshSorter: function()
	{
		Utility.invoke(clientData.getSorterJsonMethod, clientData.postArgs, true, function(ret) {
			SortAndEdit.loadSorter(ret);
			if (SortAndEdit.entityId != null) {
				SortAndEdit.sorter.select(SortAndEdit.entityId);
			}
		});
	}
};

window.onload = SortAndEdit.doLoad;
