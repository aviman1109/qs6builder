var VersionEntityForm =
{
	doLoad: function()
	{
		var form = Jui.option.Form.create({
			target						: "QsContent",
			columnCount					: 3,
			inputBoxEmptyAsNull			: true,
			boxChangeHandler			: CommonBusiness.doEditBoxChange,
			autoCompleteHandler			: CommonBusiness.doAutoComplete,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			entityBoxPopupClickHandler	: CommonBusiness.doEntityBoxPopupClick,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			pictureBoxSelectHandler		: CommonBusiness.doPictureBoxSelect,
			pictureBoxViewHandler		: CommonBusiness.doPictureBoxView,
			pictureBoxUrlFunction		: CommonBusiness.getPictureBoxUrl
		});
		form.load(clientData.editJson);
	},
	
	doRestore: function()
	{
		if (confirm($text("Qs.Version.RestoreConfirm"))) {
			Utility.invoke("Qs.Version.restore", {versionId:clientData.versionId}, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
				Utility.closeDialog(true);
			});
		}
	}
};
