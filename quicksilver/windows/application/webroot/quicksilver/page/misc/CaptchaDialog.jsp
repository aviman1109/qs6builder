<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/misc/CaptchaDialog.js"/>
	</c:head>
	<c:body>
		<div style="padding:16px 16px 8px 16px;line-height:18px">
			<script>
				document.write(clientData.urlArgs.message);
			</script>
		</div>
		<div style="padding:8px;text-align:center">
			<script>
				var html 	= "<img id=image src='Qs.Misc.GetCaptcha.file?t=" + new Date().getTime() + "'"
							+ " onclick=CaptchaDialog.refreshImage()>";
				document.write(html);
			</script>
		</div>
		<div style="padding:8px;text-align:center">
			<script>
				CaptchaDialog.box = Jui.basic.InputBox.create({style:"width:160px"});
			</script>
		</div>
	</c:body>
</c:html>
