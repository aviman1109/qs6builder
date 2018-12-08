<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	int[] ratio = (int[])result.getClientValue("topDownRatio");
	boolean hasList = result.containsClientKey("slaveUnitId");
%>

<c:html>
	<c:head import="Form,List,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfinstance/WorkItemSubmit.js"/>
		<c:script src="quicksilver/page/template/EntityForm.js"/>
		<c:css src="quicksilver/page/template/EntityForm.css"/>
		<c:css src="quicksilver/page/wfinstance/WorkItemSubmit.css"/>
	</c:head>
	<c:body>
		<div id="FormZone" class="FormZone" style="height:<%=hasList ? ratio[0] : 100%>%"></div>
		<% if (hasList) {%>
			<div id="ListZone" class="ListZone" style="top:<%=ratio[0]%>%">
				<div class="ButtonPanel">
					<div><%=result.getClientString("slaveUnitName")%></div>
					<div id=ListButtonCell class=QsLeftButtonPanel></div>
				</div>
				<div id="ListPanel" class="QsFullSize QsBorder QsShortShadow"></div>
			</div>			
		<% } %>
	</c:body>
</c:html>
