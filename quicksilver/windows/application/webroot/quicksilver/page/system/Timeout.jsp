<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="com.jeedsoft.quicksilver.constant.QsParameter"%>

<c:html>
	<c:head>
		<title><%=QsParameter.getSystemName()%> - <%=text("Qs.OnlineUser.Timeout.Title")%></title>
		<c:script src="quicksilver/page/system/Timeout.js"/>
	</c:head>
	<c:body toolbar="false" onload="Timeout.doLoad()">
		<div class="QsMiddleAlign" style="width:100%;height:90%;text-align:center">
			<%=request.getAttribute("reason")%>
		</div>
	</c:body>
</c:html>
