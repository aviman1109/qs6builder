<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="org.json.*"%>
<%@page import="com.jeedsoft.quicksilver.constant.*"%>
<%@page import="com.jeedsoft.quicksilver.misc.*"%>
<%@page import="com.jeedsoft.quicksilver.i18n.*"%>
<%@page import="com.jeedsoft.common.basic.util.*"%>
<%@page import="com.jeedsoft.quicksilver.thirdpartycertification.*"%>

<%!
	public String getI18nText(String code)
	{
		return text(code).replaceAll("/", "<br><font color=gray>");
	}
%>

<%
	/*
	if (RequestUtil.isFromMobileDevice(request)) {
		response.sendRedirect("Mobile.html");
		return;
	}
	*/
	ServiceContext sc = getServiceContext();
	JSONArray languageItems = LanguageHome.getService().getComboBoxItemsJson(sc);
	boolean enableADServer = ThirdPartyCertificationHome.getService().isEnableADServer(sc);
	String adDomain = ThirdPartyCertificationHome.getService().getDisplayDomain(sc);
	JSONArray licenseWarnings = com.jeedsoft.quicksilver.application.license.LicenseManager.getWarnings();
	/*
	JSONObject thirdPartyParamter  = ThirdPartyCertificationHome.getService().getThirdPartySystemParamter(getServiceContext());
	boolean enableLoginPage        = JsonUtil.getBoolean(thirdPartyParamter, "enableThirdPartyLoginPage");
	boolean enableThirdParty       = JsonUtil.getBoolean(thirdPartyParamter, "enbleThirdPartyCertification");
	String thirdParty              = JsonUtil.getString(thirdPartyParamter,  "thirdPartyCertificationUrl", "");
	String loginPage 			   = JsonUtil.getString(thirdPartyParamter,  "thirdPartyLoginPageUrl","");
	if (enableLoginPage) {
		response.sendRedirect(loginPage);
		return;
	}
	*/
%>

<c:html>
	<c:head>	
		<title><%=QsParameter.getSystemName()%></title>
		<c:script src="quicksilver/page/system/Index.js"/>
		<c:css src="quicksilver/page/system/Index.css"/>
		<script>
			Index.licenseWarnings = <%=licenseWarnings%>;
		</script>
	</c:head>
	<c:body toolbar="false" onload="Index.doLoad()" style="margin:0px;padding:0px">
		<div class="TopLeftBar">
			<marquee scrolldelay="150">
				<%=QsParameter.getIndexTopLeftText()%>
			</marquee>
		</div>
		<div class="TopRightBar">
			<%=QsParameter.getIndexTopRightText()%>
		</div>
		<div class="Logo">
			<%=QsParameter.getIndexTopRightText()%>
		</div>
		<div class="FormPanel">
			<div class="FormTitle">
				<%=QsParameter.getSystemName()%> - <%=text("Qs.Index.Login")%>
			</div>
			<table class="FormTable">
				<tr>
					<td class="TitleCell"><%=getI18nText("Qs.Index.LoginName")%></td>
					<td class="InputCell"><script>
						Index.loginNameBox = Jui.basic.InputBox.create({
							style		: "width:100%",
							value		: "",
							onkeydown	: Index.doInputKeydown
						});
					</script></td>
					<td></td>
				</tr>
				<tr>
					<td class="TitleCell"><%=getI18nText("Qs.Index.Password")%></td>
					<td class="InputCell"><script>
						Index.passwordBox = Jui.basic.InputBox.create({
							type		: "password",
							style		: "width:100%",
							value		: "",
							onkeydown	: Index.doInputKeydown
						});
					</script></td>
					<td>
						<a class="JuiLink" href="Qs.User.PasswordForget.page">
							<%=text("Qs.Index.FindPassword")%>
						</a>
					</td>
				</tr>
				<tr>
					<td class="TitleCell"><%=getI18nText("Qs.Index.Language")%></td>
					<td class="InputCell"><script>
						Index.languageBox = Jui.basic.ComboBox.create({
							style		: "width:100%",
							value		: '<%=getActionContext().getLanguage()%>',
							items		: <%=languageItems%>,
							onchange	: Index.doLanguageChange
						});
					</script></td>
					<td></td>
				</tr>
				<% if (enableADServer) {%>
				<tr>
					<td class="TitleCell"><%=getI18nText("Qs.Index.ADDomain")%></td>
					<td class="InputCell"><script>
						Jui.basic.InputBox.create({
							style		: "width:100%",
							disabled	: true,
							value		: "<%=adDomain%>"
						});
					</script></td>
					<td></td>
				</tr>
				<% } %>
				<tr>
					<td class="TitleCell"><%=getI18nText("Qs.Index.Theme")%></td>
					<td class="InputCell"><script>
						Index.themeBox = Jui.basic.ComboBox.create({
							style: "width:100%",
							items: <%=comboBoxItems(QsDictionary.CLIENT_THEME)%>
						});
					</script></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2" style="padding-left:0px">
						<table><tr>
							<td class="CheckBoxCell">
								<script>Index.saveNameBox = Jui.basic.CheckBox.create()</script>
							</td>
							<td>
								<label onclick="Index.doRemberNameLabelClick()">
									<%=getI18nText("Qs.Index.RemberLoginName")%>
								</label>
							</td>
						</tr></table>
					</td>
				</tr>
			</table>
			<div id="ErrorMessage"></div>
			<div class="LoginButton" onclick="Index.doSubmit()" <%="unselectable='on' onselectstart='return false'"%>>
				<%=getI18nText("Qs.Index.LoginButton")%>
			</div>
		</div>
		<div class="LicenseWarningPanel" id="LicenseWarningPanel"></div>
		<div class="IndexBottomPanel">
			<label class="IndexBottomLink" onclick="Index.doInstallWordPasterClick()">
				<%=text("Qs.Index.InstallWordPaster")%>
			</label>
		</div>
	</c:body>
</c:html>
