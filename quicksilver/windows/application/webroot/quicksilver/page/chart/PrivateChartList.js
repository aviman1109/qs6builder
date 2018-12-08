var PrivateChartList =
{
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
	},
	
	doSaveIndex: function()
	{
		var args = {chartIds:list.getKeys()};
		Utility.invoke("Qs.Chart.savePrivateChartIndex", args, true, function(ret) {
			alert($text("Public.SaveSuccess"));
			Utility.setDialogResult(true);
		});
	}
};

EntityList.addArguments = {editId:"a46b22eb-9d2a-41a2-8982-282d50304e8f", multiAdd:false};

EntityList.multiPage = false;

EntityList.showCollection = false;

EntityList.onSaveSuccess = EntityList.onDeleteSuccess = function()
{
	Utility.setDialogResult(true);
};
