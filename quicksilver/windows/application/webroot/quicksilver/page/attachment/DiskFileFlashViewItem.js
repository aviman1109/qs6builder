var DiskFileFlashViewItem =
{
	generatePreview: function(diskFile)
	{
		var buffer = [];
		buffer.push("<div id=PreviewPane style='width:100%;text-align:center'>");
		if (diskFile.deleted) {
			buffer.push(DiskFileFlashViewItem.getTextHtml("Qs.DiskFile.FileDeleted"));
		}
		else if (diskFile.isImage) {
			buffer.push(DiskFileFlashViewItem.getImageHtml(diskFile));
		}
		else if (!diskFile.preview.supported) {
			buffer.push(DiskFileFlashViewItem.getTextHtml("Qs.DiskFile.Preview.NotSupportable"));
		}
		else if (diskFile.preview.exists) {
			buffer.push(DiskFileFlashViewItem.getFlashHtml(diskFile));
		}
		else if (diskFile.preview.waiting) {
			buffer.push(DiskFileFlashViewItem.getWaitingHtml());
			DiskFileFlashViewItem.diskFileId = diskFile.id;
			DiskFileFlashViewItem.timeout = 2000;
			setTimeout(DiskFileFlashViewItem.checkFlashFileStatus, DiskFileFlashViewItem.timeout);
		}
		else if (diskFile.preview.retryAfter == null) {
			buffer.push(DiskFileFlashViewItem.getTextHtml("Qs.DiskFile.Preview.HasError"));
		}
		else {
			var minutes = Math.max(1, Math.ceil(diskFile.preview.retryAfter / 60));
			buffer.push(DiskFileFlashViewItem.getTextHtml("Qs.DiskFile.Preview.RetryAfter", minutes));
		}
		buffer.push("</div>");
		document.write(buffer.join(""));
	},

	getTextHtml: function(code)
	{
		return "<div style='padding-top:60px;font-size:18px'>" + $text.apply(window, arguments) + "</div>";
	},
	
	getImageHtml: function(diskFile)
	{
		var url = Utility.getUrl("Qs.DiskFile.ViewImageById.file", {diskFileId:diskFile.id});
		var html = "<div style='width:100%;height:100%;overflow:hidden;text-align:center'>"
				 +   "<img src='" + url + "' style='max-width:100%;max-height:100%'>"
				 + "</div>";
		return html;
	},

	getFlashHtml: function(diskFile)
	{
		var url = "quicksilver/lib/pdfjs/web/viewer.html?diskfileid=" + diskFile.id + "#disableautofetch=false";
		var locale = Jui.i18n.getLocale();
		if (!Jui.string.isEmpty(locale)) {
			var index = locale.indexOf("-");
			if (index != -1) {
				locale = locale.substring(0, index) + locale.substring(index).toUpperCase();
			}
			url += "&locale=" + locale;
		}
		return "<iframe class=QsFullSize src='" + url + "' frameborder=0></iframe>";
	},
	
	getWaitingHtml: function()
	{
		var html	= "<div style='padding-top:80px;font-size:18px;"
					+ 	"background-image:url(quicksilver/image/32/Progress.gif);"
					+	"background-repeat:no-repeat;background-position:center 30px"
					+ "'>"
					+ 	$text("Qs.DiskFile.Preview.WaitForGeneration")
					+ "</div>";
		return html;
	},

	adjustPreviewPaneHeight: function()
	{
		document.body.style.overflow = "hidden";
		document.body.style.height = "100%";
		var previewPane = document.getElementById("PreviewPane");
		var rect = previewPane.getBoundingClientRect();
		previewPane.style.height = (document.body.clientHeight - rect.top - 20) + "px";
	},
	
	checkFlashFileStatus: function()
	{
		var args = {diskFileId:DiskFileFlashViewItem.diskFileId};
		Utility.invoke("Qs.DiskFile.getFlashFileStatus", args, false, function(ret) {
			if (ret.status == "Success") {
				var diskFile = {id:DiskFileFlashViewItem.diskFileId};
				$elem("PreviewPane").innerHTML = DiskFileFlashViewItem.getFlashHtml(diskFile);
			}
			else if (ret.status == "Error") {
				$elem("PreviewPane").innerHTML = DiskFileFlashViewItem.getTextHtml("Qs.DiskFile.Preview.HasError");
			}
			else {
				DiskFileFlashViewItem.timeout = Math.min(10000, DiskFileFlashViewItem.timeout * 1.2);
				setTimeout(DiskFileFlashViewItem.checkFlashFileStatus, DiskFileFlashViewItem.timeout);
			}
		});
	}
};

Jui.event.attach(window, "load", DiskFileFlashViewItem.adjustPreviewPaneHeight);
Jui.event.attach(window, "resize", DiskFileFlashViewItem.adjustPreviewPaneHeight);
