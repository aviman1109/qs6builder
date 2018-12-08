var PasswordReset =
{
	doLoad: function()
	{
		PasswordReset.passwordBox1 = Jui.basic.InputBox.create({
			target		: "PasswordCell1",
			type		: "password",
			onkeydown	: PasswordReset.doInputKeydown
		});
		PasswordReset.passwordBox2 = Jui.basic.InputBox.create({
			target		: "PasswordCell2",
			type		: "password",
			onkeydown	: PasswordReset.doInputKeydown
		});
		PasswordReset.button = Jui.basic.Button.create({
			target		: "ButtonCell",
			text		: $text("Public.Submit"),
			onclick		: PasswordReset.doSubmit
		});
		if (!clientData.valid) {
			PasswordReset.passwordBox1.setDisabled();
			PasswordReset.passwordBox2.setDisabled();
			PasswordReset.button.setDisabled();
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.User.PasswordReset.InvalidKey"));
		}
	},
	
	doSubmit: function()
	{
		var password1 = PasswordReset.passwordBox1.getValue();
		var password2 = PasswordReset.passwordBox2.getValue();
		var panel = $elem("ErrorMessage");
		Jui.dom.setInnerText(panel, "");
		if (Jui.string.isEmpty(password1)) {
			Jui.dom.setInnerText(panel, $text("Qs.User.PasswordReset.InputPasswordAlert"));
			PasswordReset.passwordBox1.focus();
			return;
		}
		if (Jui.string.isEmpty(password2)) {
			Jui.dom.setInnerText(panel, $text("Qs.User.PasswordReset.InputPasswordConfirmAlert"));
			PasswordReset.passwordBox2.focus();
			return;
		}
		if (password1 != password2) {
			Jui.dom.setInnerText(panel, $text("Qs.User.PasswordReset.PasswordNotEqualAlert"));
			PasswordReset.passwordBox1.focus();
			return;
		}
		
		var args = Jui.object.merge({password:password1}, clientData.urlArgs);
		var ajax = new Utility.Ajax("Qs.User.resetPassword", args);
		ajax.onfailure = function() {
			Jui.dom.setInnerText(panel, ajax.result.errorMessage);
		};
		ajax.onsuccess = function(ret) {
			Jui.message.alert($text("Qs.User.PasswordReset.Success"), function() {
				Utility.navigate(".");
			});
		};
		ajax.submit();
	},

	doInputKeydown: function()
	{
		if (event.keyCode == 13) {
			PasswordReset.doSubmit();
		}
	}
};
