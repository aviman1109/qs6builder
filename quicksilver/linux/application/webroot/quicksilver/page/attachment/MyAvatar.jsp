<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/attachment/MyAvatar.js"/>
		<c:css src="quicksilver/page/attachment/MyAvatar.css"/>
	</c:head>
	<c:body onload="MyAvatar.doLoad()">
		<div class="Main">
			<div class="Item">
				<div class="Container Big"><img id="BigImage"></div>
				<div><%=text("Qs.Avatar.Big")%></div>
			</div>
			<div class="Item">
				<div class="Container Medium QsMiddleAlign"><img id="MediumImage"></div>
				<div><%=text("Qs.Avatar.Medium")%></div>
			</div>
			<div class="Item">
				<div class="Container Small QsMiddleAlign"><img id="SmallImage"></div>
				<div><%=text("Qs.Avatar.Small")%></div>
			</div>
		</div>
	</c:body>
</c:html>
