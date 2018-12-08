var PasswordModify =
{
	doLoad: function()
	{
		var formJson = {
			title:[
	 			{name:"UserName",		control:"InputBox", type:"string",		title:$text("Qs.ModifyPassword.UserName"), disabled:true},
	 			{name:"LoginName",		control:"InputBox", type:"string",		title:$text("Qs.ModifyPassword.LoginName"), disabled:true},
	 			{name:"OldPassword",	control:"InputBox", type:"password",	title:$text("Qs.ModifyPassword.OldPassword")},
	 			{name:"NewPassword1",	control:"InputBox", type:"password",	title:$text("Qs.ModifyPassword.NewPassword1")},
	 			{name:"NewPassword2",	control:"InputBox", type:"password",	title:$text("Qs.ModifyPassword.NewPassword2")}
			],
			data:{
	 			UserName	: clientData.userName,
	 			LoginName	: clientData.loginName
			}
		};
		if (!clientData.requireOldPassword) {
			formJson.title.splice(2, 1);
		}
		PasswordModify.form.load(formJson);
		var returnButton = toolBar.getItem("Return");
		returnButton.onclick = PasswordModify.closeDialog;
	},
	
	doConfirm: function()
	{
		var newPassword1 = PasswordModify.form.getFieldValue("NewPassword1");
		var newPassword2 = PasswordModify.form.getFieldValue("NewPassword2");
		if (Jui.string.isEmpty(newPassword1)) {
			Jui.message.alert($text("Qs.ModifyPassword.InputAlert"));
		}
		else if (newPassword1 != newPassword2) {
			Jui.message.alert($text("Qs.ModifyPassword.DifferentAlert"));
		}
		else {
			var args = {userId:clientData.userId, newPassword:newPassword1};
			if (clientData.requireOldPassword) {
				args.oldPassword = PasswordModify.form.getFieldValue("OldPassword");
			}
			Utility.invoke("Qs.User.modifyPassword", args, true, function() {
				Jui.message.alert($text("Qs.ModifyPassword.Success"), function() {
					Utility.closeDialog({modifyPassword:true});
				});
			});
		}
	},
	
	closeDialog : function() {
		Utility.closeDialog({modifyPassword:false});
	}
};
