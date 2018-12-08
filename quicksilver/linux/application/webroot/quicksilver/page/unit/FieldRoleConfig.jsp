<%@include file="/quicksilver/page/include/Initialize.jsp"%>
<%@page import="com.jeedsoft.quicksilver.constant.*"%>

<c:html>
	<c:head import="Sorter">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/unit/FieldRoleConfig.js"/>
		<c:css src="quicksilver/page/unit/FieldRoleConfig.css"/>
		<script>
			FieldRoleConfig.comboBoxItems = <%=comboBoxItems(QsDictionary.FIELD_ROLE_CONTROL)%>;
		</script>
	</c:head>
	<c:body onload="FieldRoleConfig.doLoad()">
		<div class="ContentRoot">
			<div id="SorterPanel">
				<div id="ComboBoxPanel"></div>
			</div>
			<div class="ButtonOuterPanel QsMiddleAlign"><div id="ButtonPanel" class="QsVertButtonPanel"></div></div>
		</div>
	</c:body>
</c:html>
