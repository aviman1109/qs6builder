<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:css src="quicksilver/page/system/About.css"/>
	</c:head>
	<c:body>
		<div class="SystemName">
			<%=result.getClientString("systemName")%>
		</div>
		<table class="PropertyTable">
			<col width="110"><col>
			<tr>
				<td><%=text("Qs.About.LicenseTo")%></td>
				<td><%=result.getClientString("licenseTo")%></td>
			</tr>
			<tr>
				<td><%=text("Qs.About.ExpireDate")%></td>
				<td><%=result.getClientString("expireDate")%></td>
			</tr>
			<tr>
				<td><%=text("Qs.About.MaxConcurrent")%></td>
				<td><%=result.getClientString("maxConcurrent")%></td>
			</tr>
			<tr>
				<td><%=text("Qs.About.MaxRegistered")%></td>
				<td><%=result.getClientString("maxRegistered")%></td>
			</tr>
			<tr>
				<td><%=text("Qs.About.MaxRecentLogin")%></td>
				<td><%=result.getClientString("maxRecentLogin")%></td>
			</tr>
			<tr>
				<td><%=text("Qs.About.VersionInfo")%></td>
				<td><%=result.getClientString("version")%></td>
			</tr>
		</table>
		<div class="Copyright">
			Copyright <label style="font-family:Arial">&copy;</label> <%=text("Qs.System.Copyright")%>, All rights reserved.
		</div>
		<div class="PoweredBy"></div>
	</c:body>
</c:html>
