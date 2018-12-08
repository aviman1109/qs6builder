<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Form,Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/rule/DuplicationForm.js"/>
		<c:css src="quicksilver/page/rule/DuplicationForm.css"/>
	</c:head>
	<c:body onload="DuplicationForm.doLoad()">
		<div class="FullZone">
			<div id="FormPanel"></div>
			
			<div class="QsBlockTitle"><%=text("Qs.Duplication.Field")%></div>
			<div class="QsDoubleSorter BlockContent">
				<div id="DuplicationLeftSorterPanel">
					<div><%=text("Public.NotSelected")%></div>
				</div>
				<div class="ButtonPanel"><div id="DuplicationButtonPanel"></div></div>
				<div id="DuplicationRightSorterPanel">
					<div><%=text("Public.Selected")%></div>
				</div>
			</div>
			
			<div class="QsBlockTitle"><%=text("Qs.Duplication.HintField")%></div>
			<div class="QsDoubleSorter BlockContent">
				<div id="HintLeftSorterPanel">
					<div><%=text("Public.NotSelected")%></div>
				</div>
				<div><div id="HintButtonPanel"></div></div>
				<div id="HintRightSorterPanel">
					<div><%=text("Public.Selected")%></div>
				</div>
			</div>
		</div>
	</c:body>
</c:html>
