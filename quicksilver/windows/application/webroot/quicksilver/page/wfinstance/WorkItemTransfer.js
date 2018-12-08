var WorkItemTransfer =
{
	doLoad: function()
	{
		WorkItemTransfer.form = Jui.option.Form.create({
			target						: "QsContent",
			columnCount					: 1,
			style						: "height:auto",
			boxChangeHandler			: CommonBusiness.doEditBoxChange,
			autoCompleteHandler			: CommonBusiness.doAutoComplete,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			entityBoxPopupClickHandler	: CommonBusiness.doEntityBoxPopupClick
		});
		WorkItemTransfer.form.loadTitle([
		    {
		    	name		: "userId",
		    	title		: $text("Wf.WorkItem.TransferUser"),
		    	control		: "EntityBox",
		    	required	: true,
		    	entityType	: "Qs.User"
		    },
		    {
		    	name		: "comment",
		    	title		: $text("Wf.WorkItem.TransferComment"),
		    	control		: "TextBox",
		    	colSpan		: 0,
		    	rowSpan		: 3
		    }
		]);
	},
	
	doConfirm: function()
	{
		if (WorkItemTransfer.form.validate()) {
			Utility.closeDialog(WorkItemTransfer.form.getData());
		}
	}
};
