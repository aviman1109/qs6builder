var Index =
{
	checkBrowser: function()
	{
		if (!window.FormData || !window.FileReader) {
			Utility.navigate("Qs.Misc.BrowserInvalid.page");
		}
	},
	
	doLoad: function()
	{
		/* 2017-07-27 disable third-party login
		if (/checkToken=(\w+)/.test(window.location.href)) {
			var args = {
				loginName	: Base64Util.decodeToString(Index._getThirdPartyUrlParameterValue('loginName')),
				language	: Base64Util.decodeToString(Index._getThirdPartyUrlParameterValue('language')),
				checkToken	: Base64Util.decodeToString(Index._getThirdPartyUrlParameterValue('checkToken')),
			};
			Index._login(args);
			return;
		}
		*/
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
		}
		var loginName = Jui.browser.getCookie("LoginName") || "";
		if (Jui.string.isEmpty(loginName)) {
			Index.loginNameBox.focus();
		}
		else {
			Index.saveNameBox.setValue(true);
			Index.loginNameBox.setValue(loginName);
			Index.passwordBox.focus();
		}
		Index.themeBox.setValue(Jui.theme.getName());
		if (!Jui.array.isEmpty(Index.licenseWarnings)) {
			var buffer = [];
			buffer.push("<div>" + $text("Qs.Index.LicenseWarning") + "</div>");
			for (var i = 0; i < Index.licenseWarnings.length; ++i) {
				buffer.push("<li>" + $text.apply(null, Index.licenseWarnings[i]) + "</li>");
			}
			$elem("LicenseWarningPanel").innerHTML = buffer.join("");
			$elem("LicenseWarningPanel").style.display = "block";
		}
	},
	
	/* 2017-07-27 disable third-party login
	_getThirdPartyUrlParameterValue : function(parameter)
	{
		var reg = new RegExp("[\\?&]" + parameter + "=([^&]*)", "i");
		return reg.test(window.location.search) ? RegExp.$1 : null;
	},
	*/

	doSubmit: function()
	{
		Jui.dom.setInnerText($elem("ErrorMessage"), "");
		if (Jui.string.isEmpty(Index.loginNameBox.getValue())) {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Index.InputLoginNameAlert"));
			Index.loginNameBox.focus();
			return;
		}
		if (Index.passwordBox.getValue() == "") {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Index.InputPasswordAlert"));
			Index.passwordBox.focus();
			return;
		}
		if (Jui.string.isEmpty(Index.languageBox.getValue())) {
			Jui.dom.setInnerText($elem("ErrorMessage"), $text("Qs.Index.SelectLanguageAlert"));
			Index.languageBox.focus();
			return;
		}
		
		/* 2017-07-27 disable third-party login
		var loginName = Index.loginNameBox.getValue();
		var password = Index.passwordBox.getValue();
		if (Index.enableThirdParty && loginName.toLocaleLowerCase() != 'administrator') {
			var url = Index.thirdParty + "?" + "loginName=" + Base64Util.encode(loginName) + "&password=" + Base64Util.encode(password);
			Utility.navigate(url);
			return;
		}
		*/
		var args = {
			loginName: Index.loginNameBox.getValue(),
			password: Index.passwordBox.getValue(),
			language: Index.languageBox.getValue()
		};
		if (!Jui.object.isEmpty(Index.adDomainBox)) {
			args = Jui.object.merge(args,{addomain : Index.adDomainBox.getValue()}); 
		}
		Index._login(args);
		Jui.browser.setCookie("Language", args.language);
	},
	
	_login : function(args)
	{
		if (Index.isLoggingIn) {
			return; //prevent double click on login button
		}
		var ajax = new Utility.Ajax("Qs.OnlineUser.login", args);
		ajax.onfailure = function() {
			Index.isLoggingIn = false;
			Jui.dom.setInnerText($elem("ErrorMessage"), ajax.result.errorMessage);
			/* 2017-07-27 disable third-party login
			if (Index.enableLoginPage) {
				Utility.navigate(Index.loginPage);
			}
			*/
			Index.passwordBox.focus();
		};
		ajax.onsuccess = function(ret) {
			Jui.theme.setName(Index.themeBox.getValue());
			Jui.browser.setCookie("LoginName", Index.saveNameBox.getValue() ? Index.loginNameBox.getValue() : "");
			window.location.href = "Qs.MainFrame.page";
		};
		Index.isLoggingIn = true;
		ajax.submit();
	},

	doLanguageChange: function()
	{
		var language = Index.languageBox.getValue();
		if (!Jui.string.isEmpty(language)) {
			Jui.browser.setCookie("Language", language);
			window.location.reload(true);
		}
	},
	
	doRemberNameLabelClick: function()
	{
		Index.saveNameBox.focus();
		Index.saveNameBox.setValue(!Index.saveNameBox.getValue());
	},

	doOpenNewWindowLabelClick: function()
	{
		chkOpenNewWindow.focus();
		chkOpenNewWindow.setValue(!chkOpenNewWindow.getValue());
	},

	doInputKeydown: function()
	{
		if (event.keyCode == 13) {
			Index.doSubmit();
		}
	},
	
	doInstallWordPasterClick: function()
	{
		Utility.openDialog("Qs.Misc.InstallWordPaster.page");
	}
};

Index.checkBrowser();
