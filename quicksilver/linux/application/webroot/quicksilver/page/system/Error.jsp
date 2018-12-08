<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="com.jeedsoft.common.basic.util.*"%>

<%
	String message = (String)request.getAttribute("message");
	String stackTrace = (String)request.getAttribute("stackTrace");
%>

<c:html>
	<c:head>
		<title><%=text("Qs.Error.Title")%></title>
		<script>
			var stackTrace = "<%=StringUtil.escapeJs(stackTrace)%>";
		</script>
		<c:script src="quicksilver/page/system/Error.js"/>
		<c:css src="quicksilver/page/system/Error.css"/>
	</c:head>
	<c:body onload='<%="Error.doLoad(true)"%>'>
		<div id="TitleZone">
			<span><%=StringUtil.escapeXml(message)%></span>
		</div>
		<div id="DetailZone"></div>
	</c:body>
</c:html>
