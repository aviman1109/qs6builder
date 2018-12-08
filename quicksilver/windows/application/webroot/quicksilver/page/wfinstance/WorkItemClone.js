var WorkItemClone =
{
	doLoad: function()
	{
		WorkItemClone.form = Jui.option.Form.create({
			target						: "QsContent",
			columnCount					: 1,
			style						: "height:auto",
			boxChangeHandler			: CommonBusiness.doEditBoxChange,
			autoCompleteHandler			: CommonBusiness.doAutoComplete,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			entityBoxPopupClickHandler	: CommonBusiness.doEntityBoxPopupClick,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect
		});
		WorkItemClone.form.loadTitle([
		    {
		    	name		: "userIds",
		    	title		: $text("Wf.WorkItem.CloneUser"),
		    	control		: "MultiEntityBox",
		    	required	: true,
		    	entityType	: "Qs.User"
		    },
		    {
		    	name		: "comment",
		    	title		: $text("Wf.WorkItem.CloneComment"),
		    	control		: "TextBox",
		    	rowSpan		: 3
		    }
		]);
	},
	
	doConfirm: function()
	{
		if (WorkItemClone.form.validate()) {
			var data = WorkItemClone.form.getData();
			data.userIds = WorkItemClone.form.getControl("userIds").getValues();
			Utility.closeDialog(data);
		}
	}
};
