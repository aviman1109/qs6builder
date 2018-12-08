<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Form">
		<c:script src="quicksilver/page/user/PasswordModify.js"/>
	</c:head>
	<c:body onload="PasswordModify.doLoad()">
		<script>
			PasswordModify.form = Jui.option.Form.create({style:"padding:10px 20px 0px 20px"});
		</script>
	</c:body>
</c:html>
