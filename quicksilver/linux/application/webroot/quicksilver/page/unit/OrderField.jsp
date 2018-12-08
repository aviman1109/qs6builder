<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Sorter,List">
		<c:script src="quicksilver/page/unit/OrderField.js"/>
		<c:css src="quicksilver/page/unit/OrderField.css"/>
	</c:head>
	<c:body onload="OrderField.doLoad()">
		<div class="QsDoubleSorter">
			<div id="LeftPanel">
				<div><%=text("Qs.OrderField.NonOrderField")%></div>
			</div>
			<div><div id="ButtonPanel" class="QsVertButtonPanel"></div></div>
			<div id="RightPanel">
				<div><%=text("Qs.OrderField.OrderField")%></div>
			</div>
		</div>
	</c:body>
</c:html>
