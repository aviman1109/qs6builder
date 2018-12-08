var DatabaseMarkList = 
{
	doCompare: function(event) 
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length != 2) {
			Jui.message.alert($text("Qs.DatabaseMarkList.compareWarn"));
			return;
		}
		var args = {entityIds:entityIds};
		Utility.download("Qs.DatabaseMark.exportDiffSqlContent", args);
	},
	
	doOpenCompareConfig: function() 
	{
		var url = "Qs.DatabaseMark.CompareConfig.page";
		if (Utility.isInTab()) {
			Utility.openTab(url, null, $text("Qs.DatabaseMarkList.dbMarkTitle"), "quicksilver/image/unit/Unit.gif");
		}
		else {
			Utility.openDialog(url, null);
		}
	}
};