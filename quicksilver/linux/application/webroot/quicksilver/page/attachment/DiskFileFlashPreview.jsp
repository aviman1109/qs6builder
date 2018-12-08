<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/flash/Print2Flash.js"/>
	</c:head>
	<c:body toolbar="false">
		<script>
			var args = {diskFileId:clientData.urlArgs.diskFileId};
			var url = Utility.getUrl("Qs.DiskFile.GetPreviewFlash.file", args);
			Print2Flash.writeHtml(url);
		</script>
	</c:body>
</c:html>
