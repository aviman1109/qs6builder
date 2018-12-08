<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/entity/EntityAssign.js"/>
		<c:css src="quicksilver/page/entity/EntityAssign.css"/>
	</c:head>
	<c:body onload="EntityAssign.doLoad()">
		<table>
			<tr>
				<td><input type="radio" name="radio" id="SelfRadio" checked onclick="EntityAssign.doRadioClick()"></td>
				<td><label for="SelfRadio"><%=text("Qs.EntityAssign.ToSelf")%></label></td>
			</tr>
			<tr>
				<td></td>
				<td><%=text("Qs.EntityAssign.ToSelfDescription")%></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="radio" name="radio" id="OtherRadio" onclick="EntityAssign.doRadioClick()"></td>
				<td><label for="OtherRadio"><%=text("Qs.EntityAssign.ToOther")%></label></td>
			</tr>
			<tr>
				<td></td>
				<td><%=text("Qs.EntityAssign.ToOtherDescription")%></td>
			</tr>
			<tr>
				<td></td>
				<td id="UserBoxCell"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><%=text("Qs.EntityAssign.Comment")%></td>
			</tr>
			<tr>
				<td></td>
				<td id="CommentBoxCell"></td>
			</tr>
		</table>
	</c:body>
</c:html>
