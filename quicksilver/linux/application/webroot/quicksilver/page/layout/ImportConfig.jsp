<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="List,TabStrip,Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/layout/ImportConfig.js"/>
		<c:css src="quicksilver/page/layout/ImportConfig.css"/>
	</c:head>
	<c:body onload="ImportConfig.doLoad()">
		<div id="TemplatePanel" class="QsDoubleSorter">
			<div id="TemplateLeftSorterPanel">
				<div><%=text("Qs.Import.FieldsNotSelected")%></div>
			</div>
			<div><div id="TemplateButtonPanel"></div></div>
			<div id="TemplateRightSorterPanel">
				<div><%=text("Qs.Import.FieldsSelected")%></div>
			</div>
		</div>
		<div id="DuplicationPanel">
			<div id="DuplicationListPanel"></div>
			<div id="DuplicationListButtonPanel" class="QsHorzButtonPanel"></div>
			<div class="QsDoubleSorter">
				<div id="DuplicationLeftSorterPanel">
					<div><%=text("Qs.Import.FieldsNotSelected")%></div>
				</div>
				<div><div id="DuplicationButtonPanel"></div></div>
				<div id="DuplicationRightSorterPanel">
					<div><%=text("Qs.Import.FieldsSelected")%></div>
				</div>
			</div>
		</div>
		<div id="MappingPanel">
			<div id="MappingListPanel"></div>
			<div id="MappingListButtonPanel" class="QsHorzButtonPanel"></div>
		</div>
	</c:body>
</c:html>
