<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<script>
			var PV =
			{
				doLoad: function()
				{
					var image	= $elem("image");
					var pane	= $elem("pane");
					var cw		= pane.clientWidth;
					var ch		= pane.clientHeight;
					var iw		= image.width;
					var ih		= image.height;
					if (iw > 0 && ih > 0) {
						var ratio				= Math.min(cw / iw, ch / ih);
						pane.style.paddingTop	= ((ch - ih * ratio) / 2) + "px";
						image.style.width		= (iw * ratio) + "px"; 
						image.style.height		= (ih * ratio) + "px";
					}
					image.style.position = "static";
				}
			};
		</script>
	</c:head>
	<c:body onload="PV.doLoad()">
		<div style="overflow:hidden;width:100%;height:100%;padding:6px;box-sizing:border-box">
			<div id="pane" style="text-align:center;width:100%;height:100%;overflow:hidden">
				<script>
					var url = CommonBusiness.getPictureBoxUrl(clientData.urlArgs.pictureId);
					document.write("<img style='position:absolute;left:-2000px' id='image' src='" + url + "'>");
				</script>
			</div>
		</div>
	</c:body>
</c:html>
