var ReportSolution =
{
	autoManage: true,

	//---------------------------------------------------------------

	// events
	//---------------------------------------------------------------
	
	doFrameLoad: function()
	{
	},

	//---------------------------------------------------------------
	// methods
	//---------------------------------------------------------------
	
	getReportUrl: function(templateFile, parameters)
	{
		var url = "qsvd-report/frameset?__parameterpage=false&isDesign=false&__report=" + templateFile;
		for (var key in parameters) {
			var value = parameters[key];
			if (value != null) {
				if (typeof(value) != "string") {
					value = value + "";
				}
				url += "&" + key + "=" + ReportSolution._encodeURIComponent(value);
			}
		}
		return url;
	},

	gotoFirstPage: function()
	{
	},
	
	gotoPreviousPage: function()
	{
	},
	
	gotoNextPage: function()
	{
	},
	
	gotoLastPage: function()
	{
	},
	
	gotoPage: function(pageIndex)
	{
	},
	
	print: function(type)
	{
	},
	
	fileExport: function(type)
	{
	},

	//---------------------------------------------------------------
	// private methods (called only in this script)
	//---------------------------------------------------------------
	
	_encodeURIComponent: function(text)
	{
	    if (text == null) {        
	        return "";        
	    }        
	    var result = "";        
	    for (var i = 0; i < text.length; i++) {        
	        var code = text.charCodeAt (i);         
	        if (code >= 128 || code == 91 || code == 93) {
	            result += "[" + code.toString(16) + "]";        
	        } else {        
	            result += text.charAt(i);        
	        }        
	    }        
	    return window.encodeURIComponent(result);     
	}
};