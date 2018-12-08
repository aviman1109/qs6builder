<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<c:html>
	<c:head import="List,TabStrip,Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/database/DatabaseMarkConfig.js"/>
		<c:css src="quicksilver/page/database/DatabaseMarkConfig.css"/>
	</c:head>
	<c:body onload="DatabaseMarkConfig.doLoad()">
		<div id="TemplatePanel" class="QsDoubleSorter">
			<div id="TemplateLeftSorterPanel">
				<div><%=text("Qs.DatabaseMarkList.MarkTableIgnoreNotSelected")%></div>
			</div>
			<div><div id="TemplateButtonPanel"></div></div>
			<div id="TemplateRightSorterPanel">
				<div><%=text("Qs.DatabaseMarkList.MarkTableIgnoreSelected")%></div>
			</div>
		</div>
		<div id="SqlMarkDuplicationPanel">
			<div id="SqlMarkDuplicationListPanel" ></div>
		</div>
	</c:body>
</c:html>
