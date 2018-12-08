<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	String type = result.getClientString("type"); 
%>

<c:html>
	<c:head import="Form,List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfButtonConfig.js"/>
		<c:css src="quicksilver/page/wfdefinition/WfButtonConfig.css"/>
	</c:head>
	<c:body onload="WfButtonConfig.doLoad()">
		<div id="FormPanel"></div>
		<% if (type.equals("ComboButton")) { %> 
			<div class="ButtonPanel">
				<label><%=text("Wf.Button.DropdownItem")%></label>
				<div id="ButtonCell" class="QsRightButtonPanel"></div>
			</div>
			<div id="ListPanel"></div>
		<% } %>
	</c:body>
</c:html>
