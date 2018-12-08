Utility.defineScript("Qs.Login",
{
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var s	= "<div class=QsLogin>"
				+ 	"<div class=QsLoginBackground>"
				+		"<div><img src='quicksilver-mobile/page/user/image/LoginBackground1.png'></div>"
				+		"<div><img src='quicksilver-mobile/page/user/image/LoginBackground2.png'></div>"
				+ 	"</div>"
				+	"<img class=QsLoginLogo src='quicksilver-mobile/page/user/image/LoginLogo.png'>"
				+	"<div class='QsLoginInputBox QsLoginNameBox'>"
				+		"<div><img src='quicksilver-mobile/page/user/image/LoginName.png'></div>"
				+		"<input id='LoginName' value='administrator' placeholder='" + $text("Qs.Mobile.Login.Name") + "'>"
				+   "</div>"
				+	"<div class='QsLoginInputBox QsLoginPasswordBox'>"
				+		"<div><img src='quicksilver-mobile/page/user/image/LoginPassword.png'></div>"
				+		"<input type=password id='Password' value='111111' placeholder='" + $text("Qs.Mobile.Login.Password") + "'>"
				+   "</div>"
				+	"<div class=QsLoginRemberName>"
				+		"<img src='quicksilver-mobile/page/user/image/LoginCheckBox.png'>"
				+		"<label>" + $text("Qs.Mobile.Login.RememberLoginName") + "</label>"
				+   "</div>"
				+	"<div class=QsLoginButton>"
				+		$text("Qs.Mobile.Login.LoginButtonText")
				+   "</div>"
				+	"<div class=QsLoginBottomZone>"
				+		"<div class=QsLoginLinkRow>"
				+			"<a href='javascript:void(0)'>"
				+				"<img src='quicksilver-mobile/page/user/image/LoginPasswordReset.png'>"
				+				$text("Qs.Mobile.Login.ForgetPassword")
				+			"</a>"
				+			"<a href='javascript:void(0)'>"
				+				"<img src='quicksilver-mobile/page/user/image/LoginConnectionConfig.png'>"
				+				$text("Qs.Mobile.Login.ConnectionConfig")
				+			"</a>"
				+   	"</div>"
				+		"<div class=QsLoginCopyrightRow>"
				+			"&copy; 2014 Chainsea Information Integration Co. Ltd."
				+   	"</div>"
				+		"<div class=QsLoginLineRow>"
				+   	"</div>"
				+   "</div>"
				+ "</div>";
		var pageBody = Jui.basic.Page.getBody(page);
		pageBody.innerHTML = s;
		var panel = pageBody.children[0];
		var logo = panel.children[1];
		logo.onclick = this.doLogoClick;
		var button = panel.children[5];
		button.onclick = this.doLoginClick;
	},

	doLoginClick: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var loginNameBox = Jui.basic.Page.getElementById(page, "LoginName");
		var passwordBox = Jui.basic.Page.getElementById(page, "Password");
		if (Jui.string.isEmpty(loginNameBox.value)) {
			alert($text("Public.InputAlert", $text("Qs.Mobile.Login.Name")));
			loginNameBox.focus();
			return;
		}
		if (Jui.string.isEmpty(passwordBox.value)) {
			alert($text("Public.InputAlert", $text("Qs.Mobile.Login.Password")));
			passwordBox.focus();
		}
		var args = {
			loginName	: loginNameBox.value,
			password	: passwordBox.value,
			language	: "zh-tw",
			platform	: "Phone"
		};
		var ajax = new Utility.Ajax("Qs.OnlineUser.login", args);
		ajax.onfailure = function() {
			alert(ajax.result.errorMessage); //TODO
			Index.passwordBox.focus();
		};
		ajax.onsuccess = function(ret) {
			//Jui.theme.setName(Index.themeBox.getValue());
			//Jui.browser.setCookie("LoginName", Index.saveNameBox.getValue() ? Index.loginNameBox.getValue() : "");
			Jui.basic.Page.close(page);
			page = null;
			var pageContainer = $elem("PageContainer");
			var tabContainer = $elem("TabContainer");
			Jui.dom.removeClass(pageContainer, "JuiPageContainerFullScreen");
			tabContainer.style.display = "block";
          	Mobile.loadTabBar();
		};
		ajax.submit();
	},

	doLogoClick: function()
	{
		//Qs.Login.doLoginClick();
		window.location.reload(true);
	}
});
