<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="com.jeedsoft.quicksilver.constant.*"%>

<c:html>
	<c:head>	
		<c:script src="quicksilver/page/user/Login.js"/>
		<c:css src="quicksilver/page/user/Login.css"/>
	</c:head>
	<c:body toolbar="false" style="margin:0px;padding:0px">
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
		<div class="FormPanel" id="FormPanel">
			<div class="FormTitle">
				<%=QsParameter.getSystemName()%> - <%=text("Qs.Index.Login")%>
			</div>
			<table class="FormTable">
				<tr>
					<td class="TitleCell"><%=text("Qs.Index.LoginName")%></td>
					<td class="InputCell" id="LoginNameCell"></td>
					<td></td>
				</tr>
				<tr>
					<td class="TitleCell"><%=text("Qs.Index.Password")%></td>
					<td class="InputCell" id="PasswordCell"></td>
					<td>
						<a class="JuiLink" href="Qs.User.PasswordForget.page">
							<%=text("Qs.Index.FindPassword")%>
						</a>
					</td>
				</tr>
				<tr>
					<td class="TitleCell"><%=text("Qs.Index.Language")%></td>
					<td class="InputCell" id="LanguageCell"></td>
					<td></td>
				</tr>
				<tr id="DomainRow">
					<td class="TitleCell"><%=text("Qs.Index.ADDomain")%></td>
					<td class="InputCell" id="DomainCell"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2" style="padding-left:0px">
						<table><tr>
							<td id="SaveNameCell"></td>
							<td><label id="SaveNameLabel"><%=text("Qs.Index.RemberLoginName")%></label></td>
						</tr></table>
					</td>
				</tr>
			</table>
			<div id="ErrorMessage"></div>
			<div id="LoginButton" <%="unselectable='on' onselectstart='return false'"%>>
				<%=text("Qs.Index.LoginButton")%>
			</div>
		</div>
		<div id="LicenseWarningPanel"></div>
		<div class="BottomPanel">
			<label id="InstallPluginLabel"><%=text("Qs.Index.InstallWordPaster")%></label>
		</div>
	</c:body>
</c:html>
