<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head import="Form">
		<c:script src="quicksilver/page/util/CommonBusiness.js"/>
		<c:script src="quicksilver/page/wfinstance/WorkItemTransfer.js"/>
	</c:head>
	<c:body onload="WorkItemTransfer.doLoad()">
		<div style="padding:20px 10px 10px 10px">
			<%=text("Wf.WorkItem.TransferInformation")%>
		</div>
	</c:body>
</c:html>
