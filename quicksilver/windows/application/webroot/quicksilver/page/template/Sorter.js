var Sorter =
{
	//-----------------------------------------------------------------------
	// data
	//-----------------------------------------------------------------------

	saveMethod: clientData.saveMethod,

	data: clientData.data,

	//-----------------------------------------------------------------------
	// page
	//-----------------------------------------------------------------------

	doLoad: function()
	{
		Sorter.sorter = Jui.option.Sorter.create({target:"SorterPanel"});
		Sorter.sorter.load(Sorter.data);
	},

	doRefresh: function()
	{
	},

	doSave: function()
	{
		var args = {
			entityIds	: Sorter.sorter.getValues(), 
			indices		: Sorter.sorter.getIndices(),
			levels		: Sorter.sorter.getLevels(),
			serials		: Sorter.sorter.getTreeSerials()
		};
		if (args.entityIds.length == 0) {
			Jui.message.alert($text("Public.NoDataToSaveAlert"));
			return;
		}
		Utility.invoke(Sorter.saveMethod, args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.closeDialog(true);
		});
	},

	doMoveUp: function()
	{
		Sorter.sorter.moveUp();
	},

	doMoveDown: function()
	{
		Sorter.sorter.moveDown();
	},

	doMoveTop: function()
	{
		Sorter.sorter.moveTop();
	},

	doMoveBottom: function()
	{
		Sorter.sorter.moveBottom();
	},

	doReturn: function()
	{
		window.close();
	}
};

window.onload = Sorter.doLoad;
