<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	org.json.JSONArray tmp	= (org.json.JSONArray)result.getClientValue("queryFormJson");
	boolean hasTree			= result.getClientBoolean("hasTree");
	boolean hasQueryForm	= tmp != null && tmp.length() > 0;
	boolean hasLeft			= hasTree || hasQueryForm;
%>

<c:html>
	<c:head import="List,Tree,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/query/QueryForm.js"/>
		<c:script src="quicksilver/page/template/EntityList.js"/>
		<c:css src="quicksilver/page/query/QueryForm.css"/>
		<c:css src="quicksilver/page/template/EntityList.css"/>
	</c:head>
	<c:body splitter="true">
		<% if (hasLeft) { %>
			<div id=LeftZone class="LeftZone">
				<% if (hasTree && hasQueryForm) { %>
					<div class="TreeTitle QsRightBorder" onclick="EntityList.doLeftPanelSwitch()">
						<%=result.getClientString("relationUnitName")%>
					</div>
					<div class="QueryFormTitle QsRightBorder" onclick="EntityList.doLeftPanelSwitch()">
						<%=text("Qs.QueryForm")%>
					</div>
				<% } %>
				<% if (hasTree) { %>
					<div id=TreePanel class=QsRightBorder>
						<div id=TreeBodyPanel></div>
						<div id=TreeButtonPanel class=QsHorzButtonPanel></div>
					</div>
				<% } %>
				<% if (hasQueryForm) { %>
					<div id=QueryFormPanel class=QsRightBorder>
						<div id=QueryFormBodyPanel></div>
						<div id=QueryFormButtonPanel class=QsHorzButtonPanel></div>
					</div>
				<% } %>
			</div>
		<% } %>
		<div id=ListZone class="ListZone"></div>
		<% if (result.getClientBoolean("hasViewFrame")) { %>
			<div id=RightZone class=RightZone>
				<iframe id=ViewFrame class="QsFullSize QsLeftBorder" <%="frameborder=0"%>></iframe>
			</div>
		<% } %>
	</c:body>
</c:html>
