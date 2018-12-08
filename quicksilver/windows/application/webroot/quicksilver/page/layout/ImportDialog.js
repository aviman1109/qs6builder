var ImportDialog =
{
	processing: false,

	doLoad: function()
	{
		var optionItems = [
	        {value:"update", text:$text("Qs.Import.Duplication.Update")},
	        {value:"create", text:$text("Qs.Import.Duplication.Create")},
	        {value:"ignore", text:$text("Qs.Import.Duplication.Ignore")}
	    ];
		ImportDialog.inputBox = Jui.basic.InputBox.create({
			target			: "InputCell",
			readOnly		: true,
			style			: "width:100%"
		});
		ImportDialog.selectButton = Jui.basic.Button.create({
			target			: "ButtonCell",
			text			: $text("Qs.FileUpload.Browse"),
			onclick			: ImportDialog.doSelectFileButtonClick
		});
		ImportDialog.optionBox = Jui.basic.MultiCheckBox.create({
			target			: "OptionCell",
			multiSelect		: false,
			oneItemPerLine	: true,
			value			: "ignore",
			items			: optionItems
		});
		ImportDialog.uploadPercentBar = Jui.option.PercentBar.create({target:"UploadPercentBarCell"});
		ImportDialog.importPercentBar = Jui.option.PercentBar.create({target:"ImportPercentBarCell"});
	},

	doSelectFileButtonClick: function()
	{
		var options = {accept:".xls,.xlsx", namePattern:/\.xls(x?)/};
		Jui.upload.selectFile(options, function(files) {
			ImportDialog.file = files[0];
			ImportDialog.inputBox.setValue(files[0].name);
		});
	},
	
	doImport: function()
	{
		if (ImportDialog.file == null || Jui.string.isEmpty(ImportDialog.inputBox.getValue())) {
			Jui.message.alert($text("Qs.Import.SelectDataFileAlert"));
			return;
		}
		var args = {unitId:clientData.unitId, duplicationAction:ImportDialog.optionBox.getValue()};
		var ajax = new Utility.Ajax("Qs.Import.ImportData.data", args);
		ajax.onsuccess = ImportDialog.doUploadSuccess;
		ajax.onuploadprogress = ImportDialog.doUploadProgress;
		ajax.submitFile(ImportDialog.file);
		ImportDialog.setButtonDisabled(true);
		ImportDialog.uploadPercentBar.setValue(0);
		ImportDialog.importPercentBar.setValue(0);
	},

	doUploadProgress: function(event, ratio)
	{
		ImportDialog.uploadPercentBar.setValue(ratio);
	},

	doUploadSuccess: function(ret)
	{
		ImportDialog.uploadPercentBar.setValue(1);
		ImportDialog.importId = ret.importId;
		Utility.setDialogResult(true);
		setTimeout(ImportDialog.getImportPorgress, 1000);
	},
	
	getImportPorgress: function()
	{
		var args = {importId:ImportDialog.importId};
		Utility.invoke("Qs.Import.getImportProgress", args, false, function(ret) {
			var finishedCount = ret.successCount + ret.errorCount + ret.ignoreCount;
			var ratio = ret.totalCount == 0 ? 0 : finishedCount / ret.totalCount;
			ImportDialog.importPercentBar.setValue(ratio);
			ImportDialog.processing = !ret.finished;
			var html = [];
			for (var key in Jui.array.toSet(["success", "error", "ignore"])) {
				var count = ret[key + "Count"];
				var i18nKey = "Qs.Import." + key.substr(0, 1).toUpperCase() + key.substr(1) + "Count";
				var s = $text(i18nKey).replace("${0}", count);
				if (ret.finished && count > 0) {
					s = "<label class=QsLink onclick='ImportDialog.downloadResult()' type=" + key + ">"
					  + s + "</label>";
				}
				html.push(s);
			}
			$elem("CountCell").innerHTML = html.join(", ");
			if (ImportDialog.processing) {
				setTimeout(ImportDialog.getImportPorgress, 1000);
			}
			else {
				Jui.message.alert($text("Qs.Import.Finished"));
				ImportDialog.setButtonDisabled(false);
			}
		});
	},
	
	setButtonDisabled: function(disabled)
	{
		ImportDialog.processing = disabled;
		toolBar.getItem("Import").setDisabled(disabled);
		ImportDialog.selectButton.setDisabled(disabled);
		if (!disabled) {
			ImportDialog.file = null;
			ImportDialog.inputBox.setValue();
		}
	},

	doDownloadTemplate: function()
	{
		var args = {unitId:clientData.unitId};
		Utility.download("Qs.Import.downloadTemplate", args);
	},

	downloadResult: function()
	{
		var args = {importId:ImportDialog.importId, resultType:event.srcElement.getAttribute("type")};
		Utility.download("Qs.Import.downloadResult", args);
	}
};

window.canClose = function()
{
	if (ImportDialog.processing) {
		return confirm($text("Qs.Import.CloseDialogConfirm"));;
	}
};
