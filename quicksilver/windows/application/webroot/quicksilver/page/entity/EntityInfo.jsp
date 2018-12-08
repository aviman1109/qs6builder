<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Tree,Resizer">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/entity/EntityInfo.js"/>
		<c:css src="quicksilver/page/entity/EntityInfo.css"/>
	</c:head>
	<c:body toolbar="false" onload="EntityInfo.doLoad()">
		<div class="TopZone">
			<div class="TypeAndNameCell" id="TypeAndName"></div>
			<div class="SlavePageNameCell" id="SlavePageNameCell"></div>
			<div class="HintCell" id="HintCell">
				<div class="HintContent" id="HintContent"></div>
				<div class="HintClose" id="HintClose"></div>
			</div>
		</div>
		<div class="BottomZone QsLongShadow QsDarkBackground">
			<div id="LeftZone" class="LeftZone QsTopRightBorder QsBackground"></div>
			<div id="ContentZone" class="ContentZone QsTopLeftBorder QsBackground"></div>
		</div>
	</c:body>
</c:html>
