<%@include file="/quicksilver/page/include/Initialize.jsp"%>

<c:html>
	<c:head>
		<c:script src="quicksilver/page/attachment/DiskFileConverterMonitor.js"/>
		<c:css src="quicksilver/page/attachment/DiskFileConverterMonitor.css"/>
	</c:head>
	<c:body toolbar="false">
		<div id="RemotePanel">
			<div class="Title"><%=text("Qs.DiskFile.ConversionMonitor.RemoteConversion")%></div>
		</div>
		<div id="LocalPanel">
			<div class="Title"><%=text("Qs.DiskFile.ConversionMonitor.Title")%></div>
			<table class="DataTable">
				<colgroup>
					<col><col><col><col>
				</colgroup>
				<tr>
					<td colspan="2"></td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.Count")%></td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.Description")%></td>
				</tr>
				<tr>
					<td colspan="2"><%=text("Qs.DiskFile.ConversionMonitor.Process")%></td>
					<td id="currentProcess" class="CountCell GreenCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.ProcessDesc")%></td>
				</tr>
				<tr>
					<td rowspan="3"><%=text("Qs.DiskFile.ConversionMonitor.Current")%></td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentRunning")%></td>
					<td id="currentRunning" class="CountCell GreenCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentRunningDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentWaiting")%></td>
					<td id="currentWaiting" class="CountCell BlueCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentWaitingDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentTimeout")%></td>
					<td id="currentTimeout" class="CountCell RedCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.CurrentTimeoutDesc")%></td>
				</tr>
				<tr>
					<td rowspan="5"><%=text("Qs.DiskFile.ConversionMonitor.Finished")%></td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.Success")%></td>
					<td id="success" class="CountCell GreenCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.SuccessDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.ConversionFailed")%></td>
					<td id="conversionFailed" class="CountCell RedCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.ConversionFailedDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.ConversionTimeout")%></td>
					<td id="conversionTimeout" class="CountCell RedCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.ConversionTimeoutDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.QueueTimeout")%></td>
					<td id="queueTimeout" class="CountCell RedCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.QueueTimeoutDesc")%></td>
				</tr>
				<tr>
					<td><%=text("Qs.DiskFile.ConversionMonitor.QueueOverflow")%></td>
					<td id="queueOverflow" class="CountCell RedCell">0</td>
					<td><%=text("Qs.DiskFile.ConversionMonitor.QueueOverflowDesc")%></td>
				</tr>
			</table>
			<div class="Footer"><%=text("Qs.DiskFile.ConversionMonitor.AutoRefreshDesc")%></div>
		</div>
	</c:body>
</c:html>
