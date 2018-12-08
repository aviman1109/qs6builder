var SerialNumberPartList =
{
	doPreview: function()
	{
		var args = {serialNumberId:clientData.masterEntityId};
		Utility.invoke("Qs.SerialNumber.getSampleSerialNumber", args, true, function(ret) {
			alert($text("Qs.SerialNumber.Preview").replace("${0}", ret.sample));
		});
	},

	doMoveUp: function()
	{
		list.moveUp();
	},

	doMoveDown: function()
	{
		list.moveDown();
	},

	doSaveIndex: function()
	{
		var ids = list.getFieldValues("FId");
		if (ids.length == 0) {
			alert($text("Public.NoDataToSaveAlert"));
			return;
		}
		var args = {data:[]};
		for (var i = 0; i < ids.length; ++i) {
			args.data.push({FId:ids[i], FIndex:i + 1});
		}
		Utility.invoke("Qs.SerialNumberPart.save", args, true, function(ret){
			alert($text("Public.SaveSuccess"));
		});
	}
};
