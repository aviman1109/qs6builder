Utility.defineScript("Qs.EntityForm",
{
	form: null,
	
	entityId: null,
	
	workflow: null,
	
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var body = Jui.basic.Page.getBody(page);
		this.form = Jui.option.Form.create({
			target					: body,
			comboBoxSelectHandler	: CommonBusiness.doComboBoxSelect,
			dateBoxSelectHandler	: CommonBusiness.doDateBoxSelect,
			entityBoxSelectHandler	: CommonBusiness.doEntityBoxSelect
		});
	},
	
	ondata: function(data)
	{
		this.data = data;
		this.entityId = data.entityId;
		this.workflow = data.workflow;
		if (!Jui.array.isEmpty(data.slavePages) && data.entityId != null) {
			for (var i = 0; i < data.slavePages.length; ++i) {
				var page = data.slavePages[i];
				data.formJson.title.push({
					control : "ComboButton",
					name	: "SlavePage-" + i,
					group	: $text("Qs.MobileForm.Group.RelevantContent"),
					text	: page.text,
					data	: page.code,
					onclick	: Qs.EntityForm.doSlavePageClick
				});
			}
		}
		if (data.workflow != null && !Jui.array.isEmpty(data.workflow.buttons)) {
			var hasNode	= !Jui.string.isEmpty(data.workflow.nodeName);
			var key		= hasNode ? "Qs.MobileForm.Group.WorkflowWithNode" : "Qs.MobileForm.Group.Workflow";
			var group	= $text(key, data.workflow.nodeName);
			for (var i = 0; i < data.workflow.buttons.length; ++i) {
				data.formJson.title.push(Jui.object.merge({
					control	: "Button",
					name	: "Workflow-" + i,
					group	: group
				}, data.workflow.buttons[i]));
			}
		}
		this.form.load(data.formJson);
	},
	
	doSave: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (!page.validate()) {
			return false;
		}
		var formData = page.getData();
		var relationData = {};
		CommonBusiness.saveEntity(page.data.unitCode, [formData], relationData, function() {
			alert($text("Public.SaveSuccess"));
			Jui.basic.Page.setResult(page, true);
		});
	},
	
	doDelete: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (page.data.entityId == null) {
			alert($text("Public.CannotDeleteNewDataAlert"));
			return;
		}
		if (!confirm($text("Public.DeleteConfirmTemplate").replace("${0}", page.data.unitName))) {
			return;
		}
		CommonBusiness.deleteEntity(page.data.unitCode, [page.data.entityId], function(ret) {
			alert($text("Public.DeleteSuccess"));
			Jui.basic.Page.close(page, true);
		});
	},
	
	doSlavePageClick: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var args = {masterEntityId: page.data.entityId};
		var slavePageCode = this.getArgs().data;
		Utility.openPage(slavePageCode, args);
	},
	
	validate: function()
	{
		return this.form.validate();
	},
	
	getData: function()
	{
		return this.form.getData();
	},
	
	//-------------------------------------------------------------------------
	// Workflow
	//-------------------------------------------------------------------------
	
	doOpenWorkItemHandlePage: function(event)
	{
		var button	= this;
		var page	= Jui.basic.Page.getCurrentPage();
		var info	= button.getArgs().handleInfo;
		var args	= {
			entityEventCode		: info.entityEventCode,
			isCommentRequired	: info.isCommentRequired,
			entityId			: page.data.entityId,
			workItemId			: page.data.workflow.workItemId,
			nodeName			: page.data.workflow.nodeName,
			result				: button.getId(),
			resultText			: button.getText(),
			isSubmit			: true,
			enableAllFields		: true
		};
		if (info.saveForm) {
			if (!page.validate()) {
				return;
			}
			args.form = page.getData();
		}
		Utility.openPage(info.pageCode, args, null, function() {
			alert($text("Public.OperationSuccess"));
			Jui.basic.Page.close(page, true);
		});
	},
	
	doViewProcessDetail: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		Utility.openPage("Wf.Process.MobileDetail", {processId:page.data.workflow.processId});
	}
});
