var ReportSolution =
{
	//---------------------------------------------------------------
	// events
	//---------------------------------------------------------------
	
	doFrameLoad: function()
	{
		var frame = ReportBody.frame;
		if (frame && frame.src && frame.src != "about:blank" && frame.contentWindow.contentPane) {
			var pane = frame.contentWindow.contentPane;
			ReportBody.refreshPageControl(pane.currentPageIndex, pane.reportTotalPage);
			pane.on("afterload", function() {
				ReportBody.refreshPageControl(pane.currentPageIndex, pane.reportTotalPage);
			});
			ReportBody.frameLoaded = true;
		}
	},

	//---------------------------------------------------------------
	// methods (called by ReportBody)
	//---------------------------------------------------------------
	
	getReportUrl: function(templateFile, parameters)
	{
		var url = "ReportServer?reportlet=/" + templateFile + "&__showtoolbar__=false";
		for (var key in parameters) {
			var value = parameters[key];
			if (value != null && typeof(value) != "string") {
				value = value + "";
			}
			url += "&" + key + "=" + ReportSolution._encodeURIComponent(value);
		}
		return url;
	},

	gotoFirstPage: function()
	{
		ReportBody.frame.contentWindow.contentPane.gotoFirstPage();	
	},
	
	gotoPreviousPage: function()
	{
		ReportBody.frame.contentWindow.contentPane.gotoPreviousPage();	
	},
	
	gotoNextPage: function()
	{
		ReportBody.frame.contentWindow.contentPane.gotoNextPage();	
	},
	
	gotoLastPage: function()
	{
		ReportBody.frame.contentWindow.contentPane.gotoLastPage();	
	},
	
	gotoPage: function(pageIndex)
	{
	   	ReportBody.frame.contentWindow.contentPane.gotoPage(pageIndex);
	},
	
	print: function(type) {
		var pane = ReportBody.frame.contentWindow.contentPane;
		if (type == "pdf") {
			pane.pdfPrint();
		}
		else if (type == "applet") {
			pane.appletPrint();
		}
		else {
			pane.flashPrint();
		}
	},
	
	fileExport: function(type) {
		var pane = ReportBody.frame.contentWindow.contentPane;
		if (type == "pdf") {
			pane.exportReportToPDF();
		}
		else if (type == "word") {
			pane.exportReportToWord();
		}
		else if (type == "excel-page") {
			pane.exportReportToExcel("page");
		}
		else if (type == "excel-sheet") {
			pane.exportReportToExcel("sheet");
		}
		else {
			pane.exportReportToExcel("simple");
		}
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