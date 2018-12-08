<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<%
	int sorterWidth = result.getServerInt("sorterWidth", 180);
%>

<c:html>
	<c:head import="Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/entity/MultiEntityBoxItems.js"/>
		<c:css src="quicksilver/page/entity/MultiEntityBoxItems.css"/>
	</c:head>
	<c:body splitter="true" onload="MultiEntityBoxItems.doLoad()">
		<div class="ContentRoot">
			<div id="LeftPanel">
				<iframe id=QueryFrame <%="frameborder=0"%>></iframe>
				<script>MultiEntityBoxItems.loadQueryFrame();</script>
			</div>
			<div class="QsMiddleAlign QsLeftBorder QsRightBorder"><div id="ButtonPanel" class="QsVertButtonPanel"></div></div>
			<div id="RightPanel"></div>
		</div>
	</c:body>
</c:html>
