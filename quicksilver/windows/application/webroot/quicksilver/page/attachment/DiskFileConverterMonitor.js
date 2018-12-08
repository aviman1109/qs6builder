var DiskFileConverterMonitor =
{
	doLoad: function()
	{
		DiskFileConverterMonitor.refresh();
		setInterval(DiskFileConverterMonitor.refresh, 10000);
	},

	refresh: function()
	{
		Utility.invoke("Qs.DiskFile.getConversionMonitorData", null, false, function(ret) {
			if (ret.isRemote) {
				DiskFileConverterMonitor.showError();
			}
			else {
				DiskFileConverterMonitor.showTable(ret);
			}
		}, {ignoreError:true});
	},
	
	showTable: function(data)
	{
		$elem("RemotePanel").style.display = "none";
		$elem("LocalPanel").style.display = "block";
		for (var key in data) {
			var elem = document.getElementById(key);
			if (elem != null) {
				elem.innerHTML = Jui.cast.toString(data[key], "#,##0");
			}
		}
	},
	
	showError: function()
	{
		$elem("RemotePanel").style.display = "block";
		$elem("LocalPanel").style.display = "none";
	}
};

Jui.event.attach(window, "load", DiskFileConverterMonitor.doLoad);
