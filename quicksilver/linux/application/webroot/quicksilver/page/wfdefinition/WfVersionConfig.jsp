<%@page import="com.jeedsoft.quicksilver.i18n.*"%>
<%@page import="com.jeedsoft.quicksilver.constant.*"%>
<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="TabStrip,Form,List">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfdefinition/WfVersionConfig.js"/>
		<c:css src="quicksilver/page/wfdefinition/WfVersionConfig.css"/>
		<script>
			WfVersionConfig.relevantDataTypeItems = <%=comboBoxItems(QsDictionary.WF_RELEVANTDATA_TYPE)%>;
		</script>
	</c:head>
	<c:body onload="WfVersionConfig.doLoad()">
		<div id="BasicBody"></div>
		<div id="RelevantDataBody" class="ButtonAndListPanel">
			<div id="RelevantDataButtonPanel" class="QsRightButtonPanel"></div>
			<div id="RelevantDataListPanel"></div>
		</div>
		<div id="EventBody" class="ButtonAndListPanel">
			<div id="EventButtonPanel" class="QsRightButtonPanel"></div>
			<div id="EventListPanel"></div>
		</div>
		<div id="NoticeBody"></div>
	</c:body>
</c:html>
