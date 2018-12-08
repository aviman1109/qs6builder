<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/unit/KeywordFieldConfig.js"/>
		<c:css src="quicksilver/page/unit/KeywordFieldConfig.css"/>
	</c:head>
	<c:body onload="KeywordFieldConfig.doLoad()">
		<div id="KeywordTabBody">
			<div class="TabBodyTopRow">
				<div id="IsFullTextSearchCell"></div>
				<div><%=fieldTitle("Qs.Unit", "FIsFullTextSearch")%></div>
				<div id="SearchAttachmentCell"></div>
				<div><%=fieldTitle("Qs.Unit", "FSearchAttachment")%></div>
			</div>
			<div id="KeywordDoubleSorter" class="QsDoubleSorter">
				<div><div><%=text("Public.NotSelected")%></div></div>
				<div><div></div></div>
				<div><div><%=text("Public.Selected")%></div></div>
			</div>
		</div>
		<div id="EqualQueryTabBody">
			<div class="TabBodyTopRow">
				<div id="SupportEqualQueryCell"></div>
				<div><%=fieldTitle("Qs.Unit", "FSupportEqualQuery")%></div>
			</div>
			<div id="EqualQueryDoubleSorter" class="QsDoubleSorter">
				<div><div><%=text("Public.NotSelected")%></div></div>
				<div><div></div></div>
				<div><div><%=text("Public.Selected")%></div></div>
			</div>
		</div>
		<div id="ResultLimitTabBody">
			<div class="TabBodyTopRow">
				<div><%=fieldTitle("Qs.Unit", "FExtraQueryResultLimit")%></div>
				<div id="ResultLimitCell"></div>
			</div>
			<div><%=text("Qs.Keyword.ResultLimitDescription")%></div>
		</div>
	</c:body>
</c:html>
