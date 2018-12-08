<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/user/UserPick.js"/>
		<c:css src="quicksilver/page/user/UserPick.css"/>
	</c:head>
	<c:body onload="UserPick.doLoad()">
		<div class="FullSize" style="padding: 3px 6px;overflow:hidden">
			<table class="MainTable">
				<col width=20/><col width=100/><col/><col width=150/>
				<tr>
					<td colspan=4><div class=QsBlockTitle><%=text("Qs.User.Pick.Specified")%></div></td>
				</tr>
				<tr>
					<td><input type="radio" id="User" name="Type" value="User"/></td>
					<td><label for="User"><script>document.write(UserPick.types.User)</script></label></td>
					<td id=UserBoxCell></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" id="Role" name="Type" value="Role"/></td>
					<td><label for="Role"><script>document.write(UserPick.types.Role)</script></label></td>
					<td id=RoleBoxCell></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" id="Department" name="Type" value="Department"/></td>
					<td><label for="Department"><script>document.write(UserPick.types.Department)</script></label></td>
					<td id=DepartmentBoxCell></td>
					<td style="padding-left:3px">
						<table><tr>
							<td><input type=checkbox id=DepartmentSub></td>
							<td><label for=DepartmentSub><%=text("Qs.User.Pick.IncludeSubDepartment")%></label></td>
						</tr></table>
					</td>
				</tr>
				<tr>
					<td colspan=4><div class=QsBlockTitle><%=text("Qs.User.Pick.RelateField")%></div></td>
				</tr>
				<tr>
					<td><input type="radio" id="UserField" name="Type" value="UserField"/></td>
					<td><label for="UserField"><script>document.write(UserPick.types.UserField)</script></label></td>
					<td id=UserFieldBoxCell></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" id="DepartmentField" name="Type" value="DepartmentField"/></td>
					<td><label for="DepartmentField"><script>document.write(UserPick.types.DepartmentField)</script></label></td>
					<td id=DepartmentFieldBoxCell></td>
					<td style="padding-left:3px">
						<table><tr>
							<td><input type=checkbox id=DepartmentFieldSub></td>
							<td><label for=DepartmentFieldSub><%=text("Qs.User.Pick.IncludeSubDepartment")%></label></td>
						</tr></table>
					</td>
				</tr>
				<tr>
					<td colspan=4><div class=QsBlockTitle><%=text("Qs.User.Pick.Workflow")%></div></td>
				</tr>
				<tr>
					<td><input type="radio" id="Initiator" name="Type" value="Initiator"/></td>
					<td><label for="Initiator"><script>document.write(UserPick.types.Initiator);</script></label></td>
					<td>
						<input type="radio" id="Participant" name="Type" value="Participant"/>
						<label for="Participant"><script>document.write(UserPick.types.Participant);</script></label>						
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" id="Executor" name="Type" value="Executor"/></td>
					<td><label for="Executor"><script>document.write(UserPick.types.Executor)</script></label></td>
					<td id=ExecutorBoxCell></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" id="RelevantData" name="Type" value="RelevantData"/></td>
					<td><label for="RelevantData"><script>document.write(UserPick.types.RelevantData)</script></label></td>
					<td id=RelevantDataBoxCell></td>
					<td></td>
				</tr>
				<tr>
					<td colspan=4><div class=QsBlockTitle><%=text("Qs.User.Pick.Advanced")%></div></td>
				</tr>
				<tr>
					<td><input type="radio" id="JavaClass" name="Type" value="JavaClass"/></td>
					<td><label for="JavaClass"><script>document.write(UserPick.types.JavaClass)</script></label></td>
					<td id=JavaClassBoxCell colspan=2></td>
				</tr>
				<tr>
					<td><input type="radio" id="Sql" name="Type" value="Sql"/></td>
					<td><label for="Sql"><script>document.write(UserPick.types.Sql)</script></label></td>
					<td id=SqlBoxCell colspan=2></td>
				</tr>
			</table>
		</div>
	</c:body>
</c:html>
