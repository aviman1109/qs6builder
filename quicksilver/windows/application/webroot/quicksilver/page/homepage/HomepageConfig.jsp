<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,Layout">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/homepage/HomepageConfig.js"/>
		<c:css src="quicksilver/page/homepage/HomepageConfig.css"/>
	</c:head>
	<c:body onload="HomepageConfig.doLoad()">
		<div id="TabZone" class="TabZone">
			<div class="FormatTabBody" id="FormatTabBody" style="display:none">
				<div class="FormatsPanel" id="FormatsPanel">
				</div>
				<div class="FormatBoxRow">
					<div><%=text("Qs.Homepage.Config.Format")%></div>
					<div id="FormatBoxCell" class="FormatBoxCell"></div>
				</div>
			</div>
			<div class="ModuleTabBody" id="ModuleTabBody" style="display:none">
				<div class="ModulePanel SystemModulePanel" id="SystemModulePanel">
					<div class="ModulesTitle"><%=text("Qs.Homepage.Config.SystemItem")%></div>
					<div class="ModulesContent QsBorder" id="SystemModuleCell"></div>
				</div>
				<div class="ModulePanel UserModulePanel" id="UserModulePanel">
					<div class="ModulesTitle"><%=text("Qs.Homepage.Config.UserItem")%></div>
					<div class="ModulesContent QsBorder" id="UserModuleCell"></div>
				</div>
			</div>
		</div>
		<div id="LayoutZone" class="LayoutZone">
		</div>
	</c:body>
</c:html>
