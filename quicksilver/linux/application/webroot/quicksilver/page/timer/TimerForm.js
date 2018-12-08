var TimerForm =
{
	doLoad: function()
	{
		toolBar.getItem("Enable").setDisabled(clientData.entityId == null || form.getFieldValue("FEnabled"));
		toolBar.getItem("Disable").setDisabled(clientData.entityId == null || !form.getFieldValue("FEnabled"));

		var conditionalFields = ["FIntervalType", "FIntervalLength", "FBaseTime", "FArguments"];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = TimerForm.doTypeChange;
		form.getControl("FSystemStartupAction").onchange = TimerForm.doSystemStartupActionChange;
		TimerForm.doTypeChange();
		TimerForm.doSystemStartupActionChange();
	},
	
	doTypeChange: function()
	{
		var type = form.getFieldValue("FType");
		form.setFieldEnabled("FArguments", type == "JavaClass");
	},

	doSystemStartupActionChange: function()
	{
		var action = form.getFieldValue("FSystemStartupAction");
		form.setFieldEnabled("FIntervalType", action != "RunOnce", true);
		form.setFieldEnabled("FIntervalLength", action != "RunOnce", true);
		form.setFieldEnabled("FMonthEnd", action != "RunOnce" && action != "Complement");
		form.setFieldEnabled("FBaseTime", action != "RunOnce");
		form.setFieldEnabled("FAllowConcurrentRun", action != "Run" && action != "RunOnce");
		form.setFieldEnabled("FAllowOverlapRun", action != "Run" && action != "RunOnce");
		if (action == "Run" || action == "RunOnce") {
			form.setFieldValue("FAllowConcurrentRun", true);
			form.setFieldValue("FAllowOverlapRun", true);
		}
	},
	
	doEnable: function()
	{
		Utility.invoke("Qs.Timer.enable", {timerId:clientData.entityId}, true, function(){
			EntityForm.addDialogResultEntityId(clientData.entityId);
			alert($text("Public.OperationSuccess"));
			EntityForm.reload(clientData.entityId);
		});
	},
	
	doDisable: function()
	{
		Utility.invoke("Qs.Timer.disable", {timerId:clientData.entityId}, true, function(){
			EntityForm.addDialogResultEntityId(clientData.entityId);
			alert($text("Public.OperationSuccess"));
			EntityForm.reload(clientData.entityId);
		});
	},
	
	doExecute: function()
	{
		if (confirm($text("Qs.Timer.ExecuteConfirm"))) {
			Utility.invoke("Qs.Timer.runManually", {timerId:clientData.entityId}, true, function(){
				EntityForm.addDialogResultEntityId(clientData.entityId);
				alert($text("Qs.Timer.SubmitExecuteSuccess"));
				EntityForm.reload(clientData.entityId);
			});
		}
	}
};
