<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/user/PasswordReset.js"/>
		<c:css src="quicksilver/page/user/PasswordForget.css"/>
	</c:head>
	<c:body toolbar="false" onload="PasswordReset.doLoad()">
		<div class="ContentRoot QsMiddleAlign">
			<div>
				<table class="FormTable QsBorder QsLongShadow">
					<tr>
						<td colspan="2"><%=text("Qs.User.PasswordReset")%></td>
					</tr>
					<tr>
						<td colspan="2"><div class="Line"></div></td>
					</tr>
					<tr>
						<td><%=text("Qs.User.PasswordReset.Password")%></td>
						<td id="PasswordCell1"></td>
					</tr>
					<tr height="30">
						<td><%=text("Qs.User.PasswordReset.PasswordConfirm")%></td>
						<td id="PasswordCell2"></td>
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
