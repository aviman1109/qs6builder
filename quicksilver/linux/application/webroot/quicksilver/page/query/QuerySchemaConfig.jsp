<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Condition,Form,Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/query/QuerySchemaConfig.js"/>
		<c:css src="quicksilver/page/query/QuerySchemaConfig.css"/>
	</c:head>
	<c:body onload="QuerySchemaConfig.doLoad()">
		<div id="LeftZone" class="LeftZone"></div>
		<div class="RightZone">
			<div class="TopBlockTitle">
				<%=text("Qs.QuerySchema.Block.Basic")%>
			</div>
			<div class="TopBlockContent" id="FormPanel">
			</div>
			<div class="BlockTitle" id="ConditionTitle">
				<%=text("Qs.QuerySchema.Block.Condition")%>
			</div>
			<div class="BlockContent" id="ConditionContent">
			</div>
			<div class="BlockTitle" id="CollectionTitle" style="display:none">
				<%=text("Qs.QuerySchema.Block.CollectionConfig")%>
			</div>
			<div class="BlockContent" id="CollectionContent" style="display:none">
				<table><col width="85"><col>
					<tr>
						<td><%=text("Qs.QuerySchema.Share")%></td>
						<td id="ShareBoxCell"></td>
					</tr>
				</table>
			</div>
			<div class="BlockTitle">
				<%=text("Qs.QuerySchema.Block.Order")%>
			</div>
			<div class="BlockContent">
				<table id="OrderTable" class="OrderTable">
					<tr class="OrderTableTitleRow">
						<td><%=text("Qs.QuerySchema.Order.Field")%></td>
						<td><%=text("Qs.QuerySchema.Order.Direction")%></td>
						<td><%=text("Public.Operation")%></td>
					</tr>
				</table>
			</div>
		</div>
	</c:body>
</c:html>
