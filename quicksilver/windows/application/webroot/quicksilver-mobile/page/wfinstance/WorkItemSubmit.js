Utility.defineScript("Qs.WorkItem.Submit",
{
	form: null,
	
	onload: function()
	{
		var page = this;
		var fields = [
		    {
		    	name		: "nodeName",
		    	control		: "InputBox",
		    	title		: $text("Wf.WorkItem.Section"),
		    	disabled	: true
		    },          
		    {
		    	name		: "result",
		    	control		: "InputBox",
		    	title		: $text("Wf.WorkItem.Result"),
		    	disabled	: true
		    },          
		    {
		    	name		: "comment",
		    	control		: "TextBox",
		    	title		: $text("Wf.WorkItem.Comment"),
		    	required	: page.args.isCommentRequired,
		    	rowSpan		: 5
		    }          
		];
		var data = {
			nodeName	: page.args.nodeName,
			result		: page.args.resultText
		};
		page.form = Jui.option.Form.create({target:Jui.basic.Page.getBody(page)});
		page.form.loadTitle(fields);
		page.form.loadData(data);
	},
	
	ondata: function(data)
	{
	},
	
	doConfirm: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (!page.form.validate()) {
			return;
		}
		var args = {
			workItemId		: page.args.workItemId,
			entityEventCode	: page.args.entityEventCode,
			result			: page.args.result,
			comment			: page.form.getFieldValue("comment")
		};
		if (page.args.form != null) {
			args.form = page.args.form;
		}
		Utility.invoke("Wf.WorkItem.finish", args, true, function(ret) {
			Jui.basic.Page.close(page, true);
		});
	},
	
	doViewProcessDetail: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		Utility.openPage("Wf.Process.MobileDetail", {processId:page.data.workflow.processId});
	}
});
