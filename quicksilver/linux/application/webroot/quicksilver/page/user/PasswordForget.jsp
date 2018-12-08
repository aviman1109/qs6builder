<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/user/PasswordForget.js"/>
		<c:css src="quicksilver/page/user/PasswordForget.css"/>
	</c:head>
	<c:body toolbar="false" onload="PasswordForget.doLoad()">
		<div class="ContentRoot QsMiddleAlign">
			<div>
				<table class="FormTable QsBorder QsLongShadow">
					<tr>
						<td colspan="2"><%=text("Qs.User.PasswordForget.SendMail")%></td>
					</tr>
					<tr>
						<td colspan="2"><div class="Line"></div></td>
					</tr>
					<tr>
						<td><%=text("Qs.User.PasswordForget.LoginName")%></td>
						<td id="LoginNameCell"></td>
					</tr>
					<tr>
						<td><%=text("Qs.User.PasswordForget.Email")%></td>
						<td id="EmailCell"></td>
					</tr>
					<tr>
						<td colspan="2" id="ButtonCell"></td>
					</tr>
				</table>
				<div id="ErrorMessage"></div>
			</div>
		</div>
	</c:body>
</c:html>
