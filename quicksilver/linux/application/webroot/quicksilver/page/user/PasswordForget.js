var PasswordForget =
{
	doLoad: function()
	{
		PasswordForget.loginNameBox = Jui.basic.InputBox.create({
			target		: "LoginNameCell",
			onkeydown	: PasswordForget.doInputKeydown
		});
		PasswordForget.emailBox = Jui.basic.InputBox.create({
			target		: "EmailCell",
			onkeydown	: PasswordForget.doInputKeydown
		});
		Jui.basic.Button.create({
			target		: "ButtonCell",
			text		: $text("Public.Submit"),
			onclick		: PasswordForget.doSubmit
		});
	},
	
	doSubmit: function()
	{
		var args = {
			loginName	: PasswordForget.loginNameBox.getValue(),
			email		: PasswordForget.emailBox.getValue()
		};
		var panel = $elem("ErrorMessage");
		Jui.dom.setInnerText(panel, "");
		if (Jui.string.isEmpty(args.loginName)) {
			Jui.dom.setInnerText(panel, $text("Qs.Index.InputLoginNameAlert"));
			PasswordForget.loginNameBox.focus();
			return;
		}
		if (Jui.string.isEmpty(args.email)) {
			Jui.dom.setInnerText(panel, $text("Qs.User.PasswordForget.InputEmailAlert"));
			PasswordForget.emailBox.focus();
			return;
		}
		
		var ajax = new Utility.Ajax("Qs.User.sendPasswordResetEmail", args);
		ajax.onfailure = function() {
			Jui.dom.setInnerText(panel, ajax.result.errorMessage);
		};
		ajax.onsuccess = function(ret) {
			Jui.message.alert($text("Qs.User.PasswordForget.MailSendSuccess"), function() {
				Utility.navigate(".");
			});
		};
		ajax.submit();
	},

	doInputKeydown: function()
	{
		if (event.keyCode == 13) {
			PasswordForget.doSubmit();
		}
	}
};
