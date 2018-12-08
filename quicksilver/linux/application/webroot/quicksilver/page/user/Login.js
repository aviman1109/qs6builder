var Login =
{
	checkBrowser: function()
	{
		if (!window.FormData || !window.FileReader) {
			Utility.navigate("Qs.Misc.BrowserInvalid.page");
		}
	},
	
	doLoad: function()
	{
		Login.createControls();
		$elem("FormPanel").style.display = "block";
		var loginName = Jui.browser.getCookie("LoginName") || "";
		if (Jui.string.isEmpty(Login.loginNameBox.getValue())) {
			Login.loginNameBox.focus();
		}
		else {
			Login.passwordBox.focus();
		}
	},

	createControls: function()
	{
		var loginName = Jui.browser.getCookie("LoginName") || "";
		Login.loginNameBox = Jui.basic.InputBox.create({
			target		: "LoginNameCell",
			style		: "width:100%",
			value		: loginName,
			onkeydown	: Login.doInputKeydown
		});
		Login.passwordBox = Jui.basic.InputBox.create({
			target		: "PasswordCell",
			type		: "password",
			style		: "width:100%",
			value		: "",
			onkeydown	: Login.doInputKeydown
		});
		Login.languageBox = Jui.basic.ComboBox.create({
			target		: "LanguageCell",
			style		: "width:100%",
			value		: clientData.language,
			items		: clientData.languageItems,
			onchange	: Login.doLanguageChange
		});
		Login.saveNameBox = Jui.basic.CheckBox.create({
			target		: "SaveNameCell",
			value		: !Jui.string.isEmpty(loginName)
		});
		$elem("SaveNameLabel").onclick = Login.doRemberNameLabelClick;
		$elem("LoginButton").onclick = Login.doSubmit;
		$elem("InstallPluginLabel").onclick = Login.doInstallWordPasterClick;

		if (clientData.isDomainLogin) {
			$elem("DomainRow").style.display = "table-row";
			Jui.basic.InputBox.create({
				target		: "DomainCell",
				style		: "width:100%",
				disabled	: true,
				value		: clientData.domain
			});
		}
		if (/jumpCode=(\w+)/.test(window.location.href)) {
			var jumpCode = RegExp.$1;
			if (jumpCode == "KickOut") {
				Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Auth.KickOut"));
			}
			else if (jumpCode == "CrowdOut") {
				Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Auth.CrowdOut"));
			}
			else if (jumpCode == "ReloginOut") {
				Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Auth.ReloginOut"));
			}
			else if (jumpCode == "SessionInvalid") {
				Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Auth.SessionInvalid"));
			}
			else if (jumpCode == "OuterLoginFailed") {
				Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Auth.OuterLoginFailed"));
			}
		}
		if (!Jui.array.isEmpty(Login.licenseWarnings)) {
			var buffer = [];
			buffer.push("<div>" + $text("Qs.Login.LicenseWarning") + "</div>");
			for (var i = 0; i < Login.licenseWarnings.length; ++i) {
				buffer.push("<li>" + $text.apply(null, Login.licenseWarnings[i]) + "</li>");
			}
			$elem("LicenseWarningPanel").innerHTML = buffer.join("");
			$elem("LicenseWarningPanel").style.display = "block";
		}
	},

	login: function(args)
	{
		if (Login.isLoggingIn) {
			return; //prevent double click on login button
		}
		var ajax = new Utility.Ajax("Qs.OnlineUser.login", args);
		ajax.onfailure = function() {
			Login.isLoggingIn = false;
			Jui.dom.setInnerText($elem("ErrorMessage"), ajax.result.errorMessage);
			Login.passwordBox.focus();
		};
		ajax.onsuccess = function(ret) {
			Jui.browser.setCookie("LoginName", Login.saveNameBox.getValue() ? Login.loginNameBox.getValue() : "");
			window.location.href = "Qs.MainFrame.page";
		};
		Login.isLoggingIn = true;
		ajax.submit();
	},
	
	doSubmit: function()
	{
		Jui.dom.setInnerText($elem("ErrorMessage"), "");
		if (Jui.string.isEmpty(Login.loginNameBox.getValue())) {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Login.InputLoginNameAlert"));
			Login.loginNameBox.focus();
			return;
		}
		if (Login.passwordBox.getValue() == "") {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Login.InputPasswordAlert"));
			Login.passwordBox.focus();
			return;
		}
		if (Jui.string.isEmpty(Login.languageBox.getValue())) {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Login.SelectLanguageAlert"));
			Login.languageBox.focus();
			return;
		}
		
		var args = {
			loginName: Login.loginNameBox.getValue(),
			password: Login.passwordBox.getValue(),
			language: Login.languageBox.getValue()
		};
		if (!Jui.object.isEmpty(Login.adDomainBox)) {
			args = Jui.object.merge(args,{addomain : Login.adDomainBox.getValue()}); 
		}
		Login.login(args);
		Jui.browser.setCookie("Language", args.language);
	},

	doLanguageChange: function()
	{
		var language = Login.languageBox.getValue();
		if (!Jui.string.isEmpty(language)) {
			Jui.browser.setCookie("Language", language);
			window.location.reload(true);
		}
	},
	
	doRemberNameLabelClick: function()
	{
		Login.saveNameBox.focus();
		Login.saveNameBox.setValue(!Login.saveNameBox.getValue());
	},

	doInputKeydown: function()
	{
		if (event.keyCode == 13) {
			Login.doSubmit();
		}
	},
	
	doInstallWordPasterClick: function()
	{
		Utility.openDialog("Qs.Misc.InstallWordPaster.page");
	}
};

Login.checkBrowser();
window.addEventListener("load", Login.doLoad);
Utility.addFunctionAlias(Login);
