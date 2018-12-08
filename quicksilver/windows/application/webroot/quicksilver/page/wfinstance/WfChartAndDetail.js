var WfChartAndDetail =
{
	doLoad: function()
	{
		WfChartAndDetail.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		WfChartAndDetail.tabStrip.load([
			{text:$text("Wf.ProcessChart.Chart"),	body:"ChartBody"},
			{text:$text("Wf.ProcessChart.Detail"),	body:"DetailBody"}
		]);
		
		WfChartAndDetail.chart = Jui.graph.Workflow.create({
			target		: "ChartBody",
			isDesignMode: false,
		});
		WfChartAndDetail.chart.load(clientData.chartJson);
		
		WfChartAndDetail.list = Jui.option.List.create({
			target			: "DetailBody",
			multiPage		: false,
			multiSelect		: false,
			border			: "all",
			ondoubleclick	: WfChartAndDetail.doListDoubleClick
		});
		WfChartAndDetail.list.load(clientData.listJson);
	},

	doListDoubleClick: function(event)
	{
		Utility.openDialog("Wf.Process.CommentForm.page", {data:event.data});
	},
	
	doViewEntity: function()
	{
		if (clientData.entityId != null) {
			CommonBusiness.openEntity(clientData.unitCode, {entityId:clientData.entityId}, "Dialog");
		}
	},
	
	doSuspend: function()
	{
		var args = {processId:clientData.processId};
		Utility.invoke("Wf.Process.suspend", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.setDialogResult(true);
			window.location.reload();
		});
	},
	
	doResume: function()
	{
		var args = {processId:clientData.processId};
		Utility.invoke("Wf.Process.resume", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.setDialogResult(true);
			window.location.reload();
		});
	},
	
	doTerminate: function()
	{
		if (confirm($text("Wf.Process.TerminateConfirm"))) {
			var args = {processId:clientData.processId};
			Utility.invoke("Wf.Process.terminate", args, true, function(ret) {
				Jui.message.hint($text("Public.OperationSuccess"));
				Utility.setDialogResult(true);
				window.location.reload();
			});
		}
	}
};
