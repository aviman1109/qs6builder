<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/privilege/SlaveUnitPrivilege.js"/>
		<c:css src="quicksilver/page/privilege/SlaveUnitPrivilege.css"/>
	</c:head>
	<c:body onload="SlaveUnitPrivilege.doLoad()">
		<table id="MainTable">
			<tr>
				<td><%=text("Qs.SlaveUnitPrivilege.Create")%></td>
				<td id="CreateCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.MasterPrivilege")%></td>
				<td id="CreateComboBoxCell"></td>
			</tr>

			<tr>
				<td><%=text("Qs.SlaveUnitPrivilege.Read")%></td>
				<td id="ReadCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.MasterPrivilege")%></td>
				<td id="ReadComboBoxCell"></td>
			</tr>
			<tr>
				<td></td>
				<td id="ReadUserCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.User")%></td>
				<td id="ReadUserComboBoxCell"></td>
			</tr>
			
			<tr>
				<td><%=text("Qs.SlaveUnitPrivilege.Update")%></td>
				<td id="UpdateCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.MasterPrivilege")%></td>
				<td id="UpdateComboBoxCell"></td>
			</tr>
			<tr>
				<td></td>
				<td id="UpdateUserCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.User")%></td>
				<td id="UpdateUserComboBoxCell"></td>
			</tr>

			<tr>
				<td><%=text("Qs.SlaveUnitPrivilege.Delete")%></td>
				<td id="DeleteCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.MasterPrivilege")%></td>
				<td id="DeleteComboBoxCell"></td>
			</tr>
			<tr>
				<td></td>
				<td id="DeleteUserCheckBoxCell"></td>
				<td><%=text("Qs.SlaveUnitPrivilege.User")%></td>
				<td id="DeleteUserComboBoxCell"></td>
			</tr>
		</table>
	</c:body>
</c:html>
