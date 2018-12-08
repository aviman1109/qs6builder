var CaptchaDialog =
{
	doConfirm: function()
	{
		var args = {text:CaptchaDialog.box.getValue()};
		if (Jui.string.isEmpty(args.text)) {
			Jui.message.alert($text("Qs.Misc.InputCaptchaAlert"), function() {
				CaptchaDialog.box.focus();
			});
			return;
		}
		Utility.invoke("Qs.Misc.verifyCaptcha", args, true, function(ret) {
			if (ret.pass) {
				Utility.closeDialog(true);
			}
			else {
				CaptchaDialog.refreshImage();
			}
		});
	},
	
	refreshImage: function()
	{
		document.getElementById("image").src = "Qs.Misc.GetCaptcha.file?t=" + new Date().getTime();
	}
};
