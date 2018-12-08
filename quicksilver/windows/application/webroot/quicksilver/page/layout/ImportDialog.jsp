<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="PercentBar">
		<c:script src="quicksilver/page/layout/ImportDialog.js"/>
		<c:css src="quicksilver/page/layout/ImportDialog.css"/>
	</c:head>
	<c:body onload="ImportDialog.doLoad()">
		<div class="FileZone">
			<div><%=text("Qs.Import.DataFile")%></div>
			<div id="InputCell"></div>
			<div id="ButtonCell"></div>
		</div>
		<div class="OptionZone">
			<div><%=text("Qs.Import.Duplication.Action")%></div>
			<div id="OptionCell"></div>
		</div>
		<div id="UploadZone">
			<div><%=text("Qs.Import.UploadProgress")%></div>
			<div>
				<div class="PercentBarCell" id="UploadPercentBarCell"></div>
			</div>
		</div>
		<div id="ImportZone">
			<div><%=text("Qs.Import.ImportProgress")%></div>
			<div>
				<div class="PercentBarCell" id="ImportPercentBarCell"></div>
				<div class="CountCell" id="CountCell"></div>
			</div>
		</div>
	</c:body>
</c:html>
