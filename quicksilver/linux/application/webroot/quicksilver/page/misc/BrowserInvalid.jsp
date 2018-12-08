<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<style>
			.Message
			{
				background-image	: url(quicksilver/image/64/BigAlert.gif);
				background-repeat	: no-repeat;
				background-position	: 0px 2px;
				width				: 600px;
				padding-left		: 80px;
				line-height			: 24px;
				overflow			: hidden;
				margin				: 100px auto 0px auto;
			}
			.BrowserList
			{
				padding-left		: 18px;
			}
		</style>
	</c:head>
	<c:body toolbar="false">
		<div class="Message">
			<%=text("Qs.Browser.NotSupported")%>
			<br>
			User-Agent: <%=StringUtil.escapeHtml(request.getHeader("User-Agent"))%>
		</div>
	</c:body>
</c:html>
