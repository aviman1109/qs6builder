<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,OutlookBar,Tree,Resizer,Marquee">
		<c:script src="quicksilver/lib/jocket/jocket.js"/>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/message/SystemMessage.js"/>
		<c:script src="quicksilver/page/system/MainFrame.js"/>
		<c:css src="quicksilver/page/system/MainFrame.css"/>
	</c:head>
	<c:body clazz="QsDarkBackground" toolbar="false">
		<div class="TopZone">
			<div class="LogoZone"></div>
			<div class="CustomZone" id="CustomZone"></div>
			<div class="UserZone">
				<%=text("Qs.Top.CurrentUser")%><%=escapeHtml(result.getServerString("userName"))%>
			</div>
		</div>
		<div class="ToolBarZone" id="ToolBarZone">
			<div class="MarqueeZone" id="MarqueeZone"></div>
		</div>
		<div class="MenuZone" id="MenuZone">
			<div class="SearchMenuPane" id="SearchMenuPane"></div>
		</div>
		<div class="TabZone" id="TabZone"></div>
	</c:body>
</c:html>
