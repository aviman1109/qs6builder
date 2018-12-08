<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/lib/imgareaselect/scripts/jquery.min.js"/>
		<c:script src="quicksilver/lib/imgareaselect/scripts/jquery.imgareaselect.pack.js"/>
		<c:script src="quicksilver/page/attachment/AvatarEdit.js"/>
		<c:css src="quicksilver/lib/imgareaselect/css/imgareaselect-default.css"/>
		<c:css src="quicksilver/page/attachment/AvatarEdit.css"/>
	</c:head>
	<c:body onload="AvatarEdit.doLoad()">
		<div id="Origin" class="Container Origin"><div class="QsMiddleAlign"><img id="OriginImage"></div></div>
		<div class="Preview">
			<div><%=text("Public.Preview")%></div>
			<div class="Container Medium"><div><img id="MediumImage"></div></div>
			<div>128x128</div>
			<div class="Container Small"><div><img id="SmallImage"></div></div>
			<div>80x80</div>
		</div>
	</c:body>
</c:html>
