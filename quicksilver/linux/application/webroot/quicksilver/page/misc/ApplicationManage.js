var ApplicationManage =
{
	currentPath: "",
	
	doLoad: function()
	{
		if (clientData.isClusterEnabled) {
			var nodeBox = toolBar.getItem("Node");
			var items = nodeBox.getItems();
			if (items.length > 0) {
				nodeBox.setValue(items[0].value);
				console.log(items[0])
			}
		}
		else {
			toolBar.setItemVisible("Node", false);
			toolBar.setItemVisible("NodeLabel", false);
		}
		ApplicationManage.list = Jui.option.List.create({
			border		: "top",
			target		: "ListCell",
			multiPage	: false
		});
		var fields = [
		    {name:"type", title:$text("Qs.Application.File.Type"), control:"InputBox",	width:80},
			{name:"size", title:$text("Qs.Application.File.Size"), control:"InputBox", 	width:120, align:"right",	type:"bigint"},
			{name:"time", title:$text("Qs.Application.File.Time"), control:"DateBox", 	width:150, align:"center",	format:"yyyy-MM-dd HH:mm:ss"},
			{name:"html", title:$text("Qs.Application.File.Name"), control:"Html"}
		];
		ApplicationManage.list.loadTitle({keyField:"name", fields:fields});
		ApplicationManage.load("");
		Utility.setFileDropZone("QsContent", {multiple:true}, ApplicationManage.doFileDrop);
	},
	
	load: function(path)
	{
		var url = ApplicationManage.wrapUrl("Qs.Misc.getApplicationFileList");
		Utility.invoke(url, {path:path}, true, function(ret) {
			var link = function(path, name) {
				return "<label class=QsLink onclick=ApplicationManage.doLinkClick('" + Jui.$h(path) + "')>"
				  	+ Jui.$h(name) + "</label>";
			};
			ret.files.sort(function(a, b) {
				var key = a.type == b.type ? "name" : "type";
				return a[key] < b[key] ? -1 : 1;
			});
			for (var i = 0; i < ret.files.length; ++i) {
				var file = ret.files[i];
				if (file.type == "File") {
					file.html = "<label>" + Jui.$h(file.name) + "</label>";
				}
				else {
					file.html = link(path == "" ? file.name : path + "/" + file.name, file.name);
				}
			}
			var buffer = [];
			buffer.push(link("", "$HOME"));
			if (!Jui.string.isEmpty(path)) {
				var s = null;
				for (var i = 0, parts = path.split("/"); i < parts.length; ++i) {
					s = s == null ? parts[i] : s + "/" + parts[i];
					buffer.push(link(s, parts[i]));
				}
			}
			$elem("PathCell").innerHTML = $text("Qs.Application.File.CurrentPath") + buffer.join(" / ");
			ApplicationManage.currentPath = path;
			ApplicationManage.list.loadData(ret.files);
		});
	},
	
	doNodeChange: function()
	{
		if (toolBar.getItem("Node").getValue() != null) {
			ApplicationManage.load("");
		}
	},

	doLinkClick: function(path)
	{
		ApplicationManage.load(path);
	},

	doFileDrop: function(files, options)
	{
		var url 	= ApplicationManage.wrapUrl("Qs.Misc.UploadApplicationFile.data");
		var args	= {path:ApplicationManage.currentPath};
		var data	= {url:url, args:args, options:options, files:files};
		Utility.openDialog("Qs.Misc.FileBatchUpload.page", null, {data:data}, function() {
			ApplicationManage.doRefresh();
		});
	},
	
	doDownload: function()
	{
		var args = {
			path	: ApplicationManage.currentPath,
			files	: ApplicationManage.list.getSelectedKeys()
		};
		if (args.files.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.download(ApplicationManage.wrapUrl("Qs.Misc.downloadApplicationFile"), args);
	},
	
	doUpload: function()
	{
		var url		= ApplicationManage.wrapUrl("Qs.Misc.UploadApplicationFile.data");
		var args 	= {path:ApplicationManage.currentPath};
		var options	= {multiple:true};
		Utility.selectFileForBatchUpload(url, args, options, function() {
			ApplicationManage.doRefresh();
		});
	},
	
	doPackageUpload: function()
	{
		var url		= ApplicationManage.wrapUrl("Qs.Misc.UploadApplicationFilePackage.data");
		var args 	= {path:ApplicationManage.currentPath};
		var options	= {accept:"application/x-zip-compressed", namePattern:/\.zip$/};
		Utility.selectFileForBatchUpload(url, args, options, function() {
			ApplicationManage.doRefresh();
		});
	},
	
	doDelete: function()
	{
		Jui.message.confirm($text("Public.ListDeleteConfirm"), function() {
			var args = {
				path	: ApplicationManage.currentPath,
				files	: ApplicationManage.list.getSelectedKeys()
			};
			var url = ApplicationManage.wrapUrl("Qs.Misc.deleteApplicationFile");
			Utility.invoke(url, args, true, function(ret) {
				ApplicationManage.doRefresh();
			});
		});
	},
	
	doRefresh: function()
	{
		ApplicationManage.load(ApplicationManage.currentPath);
	},
	
	wrapUrl: function(url)
	{
		var node = clientData.isClusterEnabled ? toolBar.getItem("Node").getValue() : null;
		if (node != null) {
			url = "qsvd-" + node + "/" + url;
		}
		return url;
	}
};
