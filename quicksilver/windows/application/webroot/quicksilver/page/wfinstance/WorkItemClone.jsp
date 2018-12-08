<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Form">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfinstance/WorkItemClone.js"/>
	</c:head>
	<c:body onload="WorkItemClone.doLoad()">
		<div style="padding:20px 10px 10px 10px">
			<%=text("Wf.WorkItem.CloneInformation")%>
		</div>
	</c:body>
</c:html>
