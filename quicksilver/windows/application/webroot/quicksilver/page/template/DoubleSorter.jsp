<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Sorter">
		<c:script src="quicksilver/page/template/DoubleSorter.js"/>
	</c:head>
	<c:body>
		<div class="QsDoubleSorter">
			<div id="LeftSorterPanel">
				<div><script>document.write(DoubleSorter.leftTitle);</script></div>
			</div>
			<div><div id="ButtonPanel"></div></div>
			<div id="RightSorterPanel">
				<div><script>document.write(DoubleSorter.rightTitle);</script></div>
			</div>
		</div>
	</c:body>
</c:html>
