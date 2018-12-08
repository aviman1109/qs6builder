var FileBatchUpload =
{
	fileMap: {},
	
	serial: 0,
	
	queue: [],
	
	currentId: null,

	options: {},
	
	multiple: true,
	
	hasDescription: false,
	
	doLoad: function()
	{
		var data = Utility.getCurrentDialog().getData();
		FileBatchUpload.options = data.options || {};
		FileBatchUpload.multiple = Jui.cast.toBool(FileBatchUpload.options.multiple, true);
		FileBatchUpload.hasDescription = Jui.cast.toBool(FileBatchUpload.options.hasDescription, false);

		FileBatchUpload.list = Jui.option.List.create({
			target		: "QsContent",
			editable	: FileBatchUpload.hasDescription,
			multiPage	: false,
			multiSelect	: false
		});
		var fields = [
  			{name:"name",		 title:$text("Qs.Misc.FileBatchUpload.FileName"), 	 	width:360, 	control:"InputBox", disabled:true},
		    {name:"size",		 title:$text("Qs.Misc.FileBatchUpload.FileSize"),	  	width:100, 	control:"InputBox", align:"right", disabled:true},
		    {name:"progress",	 title:$text("Qs.Misc.FileBatchUpload.UploadProgress"),	width:100, 	control:"Html", align:"center"},
		    {name:"tail",		 title:"",												width:50, 	control:"Html", align:"center"}
		];
		if (FileBatchUpload.hasDescription) {
			var field = {name:"description", title:$text("Qs.Misc.FileBatchUpload.Description"), width:200, maxLength:100, control:"InputBox"};
			fields.splice(2, 0, field);
		}
		FileBatchUpload.list.loadTitle({keyField:"id", fields:fields});
		if (data.files != null) {
			FileBatchUpload.addFiles(data.files);
		}
		Utility.setFileDropZone("QsContent", FileBatchUpload.options, function(files) {
			if (!FileBatchUpload.multiple && FileBatchUpload.list.length() > 0) {
				Jui.message.alert($text("Qs.Misc.FileBatchUpload.NotMultipleAlert"));
				return;
			}
			FileBatchUpload.addFiles(files);
		});
	},
	
	doSelectFile: function()
	{
		if (!FileBatchUpload.multiple && FileBatchUpload.list.length() > 0) {
			Jui.message.alert($text("Qs.Misc.FileBatchUpload.NotMultipleAlert"));
			return;
		}
		Utility.selectFile(FileBatchUpload.options, function(files) {
			FileBatchUpload.addFiles(files);
		});
	},
	
	doUpload: function()
	{
		FileBatchUpload.startUpload();
	},

	doDelete: function(event)
	{
		Jui.event.stop();
		var index = FileBatchUpload.list.getEventIndex();
		FileBatchUpload.list.deleteRowsByIndex(index);
	},

	doCancel: function(event)
	{
		Jui.event.stop();
		FileBatchUpload.ajax.abort();
	},
	
	doViewError: function(event)
	{
		var index	= FileBatchUpload.list.getEventIndex();
		var id		= FileBatchUpload.list.getFieldValueByIndex("id", index);
		var item	= FileBatchUpload.fileMap[id];
		Utility.Ajax.showError(item.result);
	},
	
	addFiles: function(files)
	{
		var data = [];
		for (var i = 0; i < files.length; ++i) {
			var file = files[i];
			var id = ++FileBatchUpload.serial;
			FileBatchUpload.fileMap[id] = {
				file		: file,
				status		: "new"
			};
			data.push({
				id			: id,
				name		: file.name,
				size		: Jui.cast.toFileSizeText(file.size),
				progress	: Jui.i18n.getText("Qs.Misc.FileBatchUpload.Ready"),
				tail		: "<label class=QsLink onclick=FileBatchUpload.doDelete(event)>"
							+   Jui.i18n.getText("Qs.Misc.FileBatchUpload.Delete")
							+ "</label>"
			});
		}
		FileBatchUpload.list.appendData(data);
	},

	startUpload: function()
	{
		var queue = [];
		for (var i = 0, array = FileBatchUpload.list.getFieldValues("id"); i < array.length; ++i) {
			var id = array[i];
			if (FileBatchUpload.fileMap[id].status == "new") {
				queue.push({id:id, index:i});
			}
		}
		if (queue.length == 0) {
			Jui.message.alert($text("Qs.Misc.FileBatchUpload.NoReadyFileAlert"));
			return;
		}
		FileBatchUpload.queue = queue;
		FileBatchUpload.uploadNext();
	},

	uploadNext: function()
	{
		if (Jui.array.isEmpty(FileBatchUpload.queue)) {
			FileBatchUpload.currentId = null;
			return;
		}
		var idItem 					= FileBatchUpload.queue.shift();
		var id						= idItem.id;
		var item					= FileBatchUpload.fileMap[id];
		var data 					= Utility.getCurrentDialog().getData();
		var description				= FileBatchUpload.list.getFieldValueByIndex("description", idItem.index);
		var args					= Jui.object.merge({description:description}, data.args);
		var ajax 					= new Utility.Ajax(data.url, args);
		ajax.onsuccess 				= FileBatchUpload.doAjaxSuccess;
		ajax.onfailure 				= FileBatchUpload.doAjaxFailure;
		ajax.onuploadprogress		= FileBatchUpload.doUploadProgress;
		item.status					= "uploading";
		FileBatchUpload.currentId	= id;
		FileBatchUpload.ajax		= ajax;
		var json 					= {
			id			: id,
			progress	: Jui.option.PercentBar.getHtml({style:"width:100%"}),
			tail		: "<label class=QsLink onclick=FileBatchUpload.doCancel(event)>"
						+   Jui.i18n.getText("Qs.Misc.FileBatchUpload.Cancel")
						+ "</label>"
		};
		FileBatchUpload.list.updateData(json);
		var percentBarCell = FileBatchUpload.list.getCell(id, "progress");
		Jui.option.PercentBar.initialize(percentBarCell.firstChild);
		ajax.submitFile(item.file);
	},
	
	doAjaxSuccess: function()
	{
		var item = FileBatchUpload.fileMap[FileBatchUpload.currentId];
		var json = {
			id		: FileBatchUpload.currentId,
			tail	: Jui.i18n.getText("Qs.Misc.FileBatchUpload.Success")
		};
		FileBatchUpload.list.updateData(json);
		item.status = "success";
		Utility.getCurrentDialog().setResult(true);
		FileBatchUpload.uploadNext();
	},
	
	doAjaxFailure: function()
	{
		var json = {id:FileBatchUpload.currentId};
		var item = FileBatchUpload.fileMap[FileBatchUpload.currentId];
		if (this.isAbort()) {
			json.tail 	= Jui.i18n.getText("Qs.Ajax.Aborted");
			item.status	= "abort";
		}
		else if (this.isTimeout()) {
			json.tail 	= Jui.i18n.getText("Qs.Ajax.Timeout");
			item.status	= "timeout";
		}
		else {
			json.tail	= "<label class=QsLink onclick=FileBatchUpload.doViewError(event)>"
						+   Jui.i18n.getText("Qs.Misc.FileBatchUpload.Failed")
						+ "</label>";
			item.status	= "error";
			item.result = this.result;
		}
		FileBatchUpload.list.updateData(json);
		FileBatchUpload.uploadNext();
	},
	
	doUploadProgress: function(event, ratio)
	{
		var percentBarCell = FileBatchUpload.list.getCell(FileBatchUpload.currentId, "progress");
		Jui.$owner(percentBarCell.firstChild).setValue(ratio);
	}
};

window.canClose = function()
{
	if (FileBatchUpload.status == "uploading") {
		return confirm($text("Qs.Misc.FileBatchUpload.CloseConfirm"));;
	}
};
