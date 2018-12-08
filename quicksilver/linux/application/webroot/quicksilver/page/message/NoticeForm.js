var NoticeForm =
{
	doLoad: function()
	{
		NoticeForm.createControls();
		if (clientData.entityId != null) {
			var data = clientData.data;
			NoticeForm.subject.setValue(data.FSubject);
			NoticeForm.sendSystemMessage.setValue(data.FSendSystemMessage);
			NoticeForm.sendShortMessage.setValue(data.FSendShortMessage);
			NoticeForm.sendEmail.setValue(data.FSendEmail);
			NoticeForm.systemMessageContent.setValue(data.FSystemMessageContent);
			NoticeForm.systemMessageFieldValues.setValue(data.FSystemMessageFieldValues);
			NoticeForm.shortMessageContent.setValue(data.FShortMessageContent);
			NoticeForm.emailCc.setValue(data.FEmailCc);
			NoticeForm.emailBcc.setValue(data.FEmailBcc);
			NoticeForm.emailContent.setValue(data.FEmailContent);
		}
	},

	doSave: function()
	{
		var data = {
			FId							: clientData.entityId,
			FSubject					: NoticeForm.subject.getValue(),
			FSendSystemMessage			: NoticeForm.sendSystemMessage.getValue(),
			FSendShortMessage			: NoticeForm.sendShortMessage.getValue(),
			FSendEmail					: NoticeForm.sendEmail.getValue(),
			FSystemMessageContent		: NoticeForm.systemMessageContent.getValue(),
			FSystemMessageFieldValues	: NoticeForm.systemMessageFieldValues.getValue(),
			FShortMessageContent		: NoticeForm.shortMessageContent.getValue(),
			FEmailCc					: NoticeForm.emailCc.getValue(),
			FEmailBcc					: NoticeForm.emailBcc.getValue(),
			FEmailContent				: NoticeForm.emailContent.getValue()
		};
		CommonBusiness.saveEntity("Qs.Notice", [data], null, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.setDialogResultAttribute("entityIds", ret.entityIds);
			Utility.navigate(window.location.href, {entityId:ret.entityIds[0]});
		});			
	},
	
	createControls: function()
	{
		NoticeForm.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		NoticeForm.tabStrip.load([
			{text:$text("Qs.FieldGroup.BasicInformation"),	body:"BasicPanel"},
			{text:$text("Qs.FieldGroup.AdvancedConfig"),	body:"AdvancedPanel"}
		]);

		NoticeForm.subject = Jui.basic.InputBox.create({
			target	: "SubjectCell",
			style	: "width:100%"
		});
		NoticeForm.sendSystemMessage = Jui.basic.CheckBox.create({
			target	: "SendSystemMessageCell"
		});
		NoticeForm.sendShortMessage = Jui.basic.CheckBox.create({
			target	: "SendShortMessageCell"
		});
		NoticeForm.sendEmail = Jui.basic.CheckBox.create({
			target	: "SendEmailCell",
			value	: true
		});
		NoticeForm.systemMessageContent = Jui.basic.TextBox.create({
			target	: "SystemMessageContentCell",
			style	: "width:100%;height:92px"
		});
		NoticeForm.shortMessageContent = Jui.basic.TextBox.create({
			target	: "ShortMessageContentCell",
			style	: "width:100%;height:92px"
		});
		NoticeForm.emailCc = Jui.basic.InputBox.create({
			target	: "EmailCcCell",
			style	: "width:100%"
		});
		NoticeForm.emailBcc = Jui.basic.InputBox.create({
			target	: "EmailBccCell",
			style	: "width:100%"
		});
		NoticeForm.emailContent = Jui.basic.HtmlBox.create({
			target	: "EmailContentCell",
			style	: "width:100%;height:344px"
		});
		NoticeForm.systemMessageFieldValues = Jui.basic.TextBox.create({
			target	: "SystemMessageFieldValuesCell",
			style	: "width:100%;height:92px"
		});
	}
};
