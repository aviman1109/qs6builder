var BasicEditableList =
{
	multiSelect: Jui.cast.toBool(clientData.multiSelect, true),
	
	doLoad: function()
	{
		window.list = Jui.option.List.create({
			target						: "QsContent",
			editable					: true,
			multiSelect					: BasicEditableList.multiSelect,
			boxChangeHandler			: CommonBusiness.doListBoxChange,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			pictureBoxSelectHandler		: CommonBusiness.doPictureBoxSelect,
			pictureBoxViewHandler		: CommonBusiness.doPictureBoxView
		});
	}
};

window.onload = BasicEditableList.doLoad;
