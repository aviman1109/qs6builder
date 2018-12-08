<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/message/NoticeForm.js"/>
		<c:css src="quicksilver/page/message/NoticeForm.css"/>
	</c:head>
	<c:body onload="NoticeForm.doLoad()">
		<div id="BasicPanel">
			<table id="ContentTable" class="ContentTable">
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FSubject")%></td>
					<td id="SubjectCell"></td>
				</tr>
				<tr>
					<td></td>
					<td class=CheckBoxCell>
						<div id="SendSystemMessageCell"></div>
						<div><%=fieldTitle("Qs.Notice", "FSendSystemMessage")%></div>
						<div id="SendShortMessageCell"></div>
						<div><%=fieldTitle("Qs.Notice", "FSendShortMessage")%></div>
						<div id="SendEmailCell"></div>
						<div><%=fieldTitle("Qs.Notice", "FSendEmail")%></div>
					</td>
				</tr>
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FSystemMessageContent")%></td>
					<td id="SystemMessageContentCell"></td>
				</tr>
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FShortMessageContent")%></td>
					<td id="ShortMessageContentCell"></td>
				</tr>
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FEmailCc")%></td>
					<td id="EmailCcCell"></td>
				</tr>
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FEmailBcc")%></td>
					<td id="EmailBccCell"></td>
				</tr>
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FEmailContent")%></td>
					<td id="EmailContentCell"></td>
				</tr>
			</table>
		</div>
		<div id="AdvancedPanel">
			<table id="ContentTable" class="ContentTable">
				<tr>
					<td><%=fieldTitle("Qs.Notice", "FSystemMessageFieldValues")%></td>
					<td id="SystemMessageFieldValuesCell"></td>
				</tr>
			</table>
		</div>
	</c:body>
</c:html>
