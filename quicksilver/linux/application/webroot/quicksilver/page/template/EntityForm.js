var EntityForm =
{
	//-----------------------------------------------------------------------
	// data
	//-----------------------------------------------------------------------
	
	creationEditData: clientData.urlArgs.creationEditData || {},
	
	multiAdd: clientData.urlArgs.multiAdd != false,
	
	slaveButtons: {},
	
	closeAfterSave: clientData.urlArgs.closeAfterSave,

	alertOnDiscard: Jui.cast.toBool(clientData.urlArgs.alertOnDiscard, clientData.alertOnDiscard), 

	basicArguments: {
		relationId		: clientData.relationId,
		masterEntityId	: clientData.masterEntityId
	},
	
	workItemUnitId: "00000000-0000-0000-0001-000000003005",
		
	//-----------------------------------------------------------------------
	// page
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		EntityForm.createControls();
		
		if (clientData.urlArgs.enableAllFields) {
			var fields = clientData.editJson.title;
			for (var i = 0; i < fields.length; ++i) {
				delete fields[i].disabled;
			}
		}
		if (clientData.workflow != null && !clientData.urlArgs.isSubmit) {
			var fields = clientData.editJson.title;
			for (var i = 0; i < fields.length; ++i) {
				fields[i].group1 = fields[i].group1 || $text("Qs.FieldGroup.BasicInformation");
			}
		}
		form.load(clientData.editJson);
		if (clientData.entityId == null) {
			for (var i = 0; i < clientData.editJson.title.length; ++i) {
				var field = clientData.editJson.title[i];
				var value = form.getFieldValue(field.name);
				if (field.defaultValueExpression != null && Jui.string.isEmpty(value)) {
					form.setFieldValue(field.name, eval(field.defaultValueExpression));
				}
			}
		}
		CommonBusiness.setParentDictionary(form);
		
		if (clientData.workflow != null) {
			if (!clientData.urlArgs.isSubmit || form.hasTab()) {
				var tabTitle = $text("Wf.WorkItem.EditTabTitle");
				var panel = form.getTabStrip().add({id:"Workflow", text:tabTitle}, false);
				WorkItemSubmit.createControlsForRead(panel);
			}
			else if (!clientData.urlArgs.noComment) {
				WorkItemSubmit.createControlsForSubmit($elem("FormZone"), true);
			}
		}
		
		var data = clientData.editJson.data;
		for (var fieldName in data) {
			if (!Jui.string.isEmpty(data[fieldName]) && form.hasControl(fieldName)) {
				var ignoreFieldValue = clientData.entityId != null || clientData.isCopy;
				CommonBusiness.processBoxChange(form.getControl(fieldName), ignoreFieldValue, true);		
			}
		}
		if (clientData.slaveListTitleJson != null) {
			list.load({title:clientData.slaveListTitleJson, data:clientData.slaveListDataJson || []});
			var saveButton = toolBar.getItem("Save");
			if (saveButton == null || saveButton.isDisabled()) {
				for (var key in EntityForm.slaveButtons) {
					EntityForm.slaveButtons[key].setDisabled(true);
				}
			}
		}
		if (EntityForm.alertOnDiscard) {
			setTimeout(function() {
				EntityForm._initData = EntityForm.getData();
				Jui.event.addCustomEventListener(EntityForm.getInfoWindow(), "beforeclose", EntityForm.doBeforeClose, true);
			}, 1000);
		}
	},
	
	clearModificationFlag: function()
	{
		EntityForm._initData = EntityForm.getData();
	},

	doBeforeClose: function()
	{
		if (JSON.stringify(EntityForm._initData) != JSON.stringify(EntityForm.getData())) {
			return confirm($text("Public.DiscardModificationConfirm"));
		}
		return true;
	},
	
	validate: function()
	{
		if (!form.validate()) {
			return false;
		}
		return clientData.slaveUnitId == null || list.validate();
	},
	
	getData: function()
	{
		var data = form.getData();
		if (clientData.isCopy) {
			data.isCopy = true;
			data.srcEntityId = clientData.srcEntityId;
		}
		else if (clientData.entityId == null) {
			Jui.object.merge(data, EntityForm.creationEditData);
		}
		else if (clientData.updateTimeMillis != null) {
			data.updateTimeMillis = clientData.updateTimeMillis;
		}
		if (clientData.slaveUnitId != null) {
			data.slaveUnitId 		= clientData.slaveUnitId;
			data.slaveRelationId	= clientData.slaveRelationId;
			data.slaveEntities 		= list.getData();
			for (var i = 0; i < data.slaveEntities.length; ++i) {
				data.slaveEntities[i].FIndex = i + 1;
			}
		}
		return data;
	},
	
	doCopy: function(args)
	{
		if (clientData.entityId == null) {
			Jui.message.alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		args = Jui.object.merge({isCopy:true, entityId:clientData.entityId, multiAdd:false}, args);
		CommonBusiness.openEntity(clientData.unitCode, args, "Dialog");
	},
	
	doConvert: function(destUnitCode)
	{
		if (clientData.entityId == null) {
			Jui.message.alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		var args = {isConvert:true, srcUnitId:clientData.unitId, srcEntityId:clientData.entityId};
		CommonBusiness.openEntity(destUnitCode, args, "Dialog");
	},

	doDelete: function()
	{
		if (clientData.entityId == null) {
			alert($text("Public.CannotDeleteNewDataAlert"));
			return;
		}
		if (!confirm($text("Public.FormDeleteConfirm").replace("${0}", clientData.unitName))) {
			return;
		}
		CommonBusiness.deleteEntity(clientData.unitCode, [clientData.entityId], function(ret) {
			Jui.message.hint($text("Public.DeleteSuccess"));
			EntityForm.deleteDialogResultEntityId(clientData.entityId);
			Utility.close();
		});
	},

	doSave: function(expandToTab)
	{
		if (!EntityForm.validate()) {
			return;
		}
		var relationData = {
			relationId		: clientData.relationId,
			masterUnitId	: clientData.masterUnitId,
			masterEntityId	: clientData.masterEntityId
		};
		var data = EntityForm.getData();
		expandToTab = expandToTab == true && Utility.isInDialog(); 
		if (!clientData.checkBeforeSave) {
			EntityForm.save(data, relationData, expandToTab);
			return;
		}
		var args = Jui.object.merge({unitId:clientData.unitId, entityId:clientData.entityId, data:data}, relationData);
		Utility.invoke("Qs.Duplication.getDuplicationJsonBeforeSave", args, true, function(ret) {
			if (ret.data.length == 0) {
				EntityForm.save(data, relationData, expandToTab);
				return;
			}
			var args = {unitName:clientData.unitName, listData:ret.data};
			Utility.openDialog("Qs.Duplication.Confirm.page", args, null, function() {
				EntityForm.save(data, relationData, expandToTab);
			});
		});
	},

	save: function(data, relationData, expandToTab)
	{
		CommonBusiness.saveEntity(clientData.unitCode, [data], relationData, function(json) {
			EntityForm.clearModificationFlag();
			Utility.refreshMenuNumbers(clientData.unitId);
			var entityId = json.entityIds[0];
			EntityForm.addDialogResultEntityId(entityId);
			if (EntityForm.closeAfterSave) {
				Jui.message.hint($text("Public.SaveSuccess"));
				Utility.closeDialog();
				return;
			}
			else if (!expandToTab && !EntityForm.slientSave) {
				if (clientData.entityId != null || !EntityForm.multiAdd || !clientData.queryAddNext) {
					Jui.message.hint($text("Public.SaveSuccess"));
				}
				else if (confirm($text("Public.SaveSuccessAndAddNext"))) {
					entityId = null;
				}
			}
			if (EntityForm.onSaveSuccess != null && EntityForm.onSaveSuccess(entityId) == false) {
				return;
			}
			if (expandToTab) {
				var unit = Utility.getUnit(clientData.unitCode);
				var url = unit.infoPageCode + ".page";
				var args = {unitCode:clientData.unitCode, entityId:entityId};
				Utility.closeDialog();
				Utility.openTab(url, args, unit.name, unit.icon);
			}
			else {
				EntityForm.reload(entityId);
			}
		});
	},
	
	reload: function(entityId)
	{
		var wnd = EntityForm.getInfoWindow();
		var args = wnd.clientData.urlArgs;
		if (args.isCopy) {
			delete args.isCopy;
		}
		if (entityId == null) {
			delete args.entityId;
		}
		else {
			args = Jui.object.merge({entityId:entityId}, args);
		}
		Utility.navigate(wnd.location.href, args, wnd);
	},
	
	doReturn: function()
	{
		Utility.closeDialog();
	},
	
	setFieldValue: function(fieldName, value, confirmMessage)
	{
		if (clientData.entityId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		if (!Jui.string.isEmpty(confirmMessage) && !confirm(confirmMessage)) {
			return;
		}
		var args = {entityId:clientData.entityId, fieldName:fieldName, value:value};
		Utility.invoke(clientData.unitCode + ".setFieldValue", args, true, function(ret) {
			EntityForm.addDialogResultEntityId(clientData.entityId);
			Jui.message.hint($text("Public.OperationSuccess"));
			var wnd = EntityForm.getInfoWindow();
			Utility.navigate(wnd.location.href, null, wnd);
		});
	},
	
	showEntityChart: function(chartId)
	{
		if (clientData.entityId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		CommonBusiness.showEntityChart(chartId, clientData.entityId);
	},
	
	executeOperation: function(code, saveForm)
	{
		var args = {entityIds:[clientData.entityId]};
		if (saveForm) {
			if (!EntityForm.validate()) {
				return;
			}
			args.forms = [EntityForm.getData()];
		}
		CommonBusiness.executeOperation(code, args.entityIds, args.forms, function(ret) {
			if (ret.refreshPage) {
				EntityForm.reload(ret.entityIds[0]);
			}
		});
	},
	
	getInfoWindow: function()
	{
		if (parent == null || !/Qs\.Entity\.Info\.page/.test(parent.location.href)) {
			return window;
		}
		else {
			return parent.EntityInfo.isSubPageWindow(window) ? parent : window;
		}
	},
	
	addDialogResultEntityId: function(entityId)
	{
		if (Utility.isInDialog()) {
			var result = Utility.getDialogResult() || {};
			var oldIds = result.entityIds || [];
			var newIds = [];
			for (var i = 0; i < oldIds.length; ++i) {
				if (oldIds[i] == entityId) {
					return;
				}
				newIds.push(oldIds[i]);
			}
			newIds.push(entityId);
			result.entityIds = newIds;
			Utility.setDialogResult(result);
		}
	},
	
	deleteDialogResultEntityId: function(entityId)
	{
		if (Utility.isInDialog()) {
			var result = Utility.getDialogResult() || {};
			var oldIds = result.entityIds || [];
			var newIds = [];
			for (var i = 0; i < oldIds.length; ++i) {
				if (oldIds[i] != entityId) {
					newIds.push(oldIds[i]);
				}
			}
			result.entityIds = newIds;
			Utility.setDialogResult(result);
		}
	},
	
	doMessage: function(event)
	{
		var data = event.data;
		if (data.action == "InstantActivityFinished") {
			EntityForm._stopWaitingForInstantActivity(data.args.activityId);
		}
	},
	
	//-----------------------------------------------------------------------
	// list
	//-----------------------------------------------------------------------

	doListAdd: function()
	{
		var initDataJson = this.getArgValue("initDataJson");
		var list = form.getControlByButton(this);
		list.appendDataAndEdit(initDataJson);
	},
	
	doListDelete: function()
	{
		var list = form.getControlByButton(this);
		if (list.getSelectedKeys().length == 0) {
			alert($text("Public.SelectAlert"));
			return;
		}
		list.deleteSelectedRows();
	},
	
	doListMoveUp: function()
	{
		form.getControlByButton(this).moveUp();
	},
	
	doListMoveDown: function()
	{
		form.getControlByButton(this).moveDown();
	},
	
	doListMoveTop: function()
	{
		form.getControlByButton(this).moveTop();
	},
	
	doListMoveBottom: function()
	{
		form.getControlByButton(this).moveBottom();
	},
	
	//TODO remove doSlaveListXXX
	
	doSlaveListAdd: function()
	{
		list.appendDataAndEdit(clientData.slaveListInitDataJson || {});
	},
	
	doSlaveListDelete: function()
	{
		if (list.getSelectedKeys().length == 0) {
			alert($text("Public.SelectAlert"));
			return;
		}
		list.deleteSelectedRows();
	},
	
	doSlaveListMoveUp: function()
	{
		list.moveUp();
	},

	doSlaveListMoveDown: function()
	{
		list.moveDown();
	},

	doSlaveListMoveTop: function()
	{
		list.moveTop();
	},

	doSlaveListMoveBottom: function()
	{
		list.moveBottom();
	},

	//-----------------------------------------------------------------------
	// workflow
	//-----------------------------------------------------------------------
	
	finishWorkItem: function(relevantDataValue, entityEventCode)
	{
		if (!confirm($text("Public.OperationConfirm"))) {
			return;
		}
		var args = {
			workItemId		: clientData.workflow.workItemId,
			result			: relevantDataValue,
			entityEventCode	: entityEventCode
		};
		Utility.invoke("Wf.WorkItem.finish", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.refreshMenuNumbers(clientData.unitId, EntityForm.workItemUnitId);
			if (ret.instantActivity == null) {
				EntityForm._closeOrReload();
			}
			else {
				EntityForm._waitForInstantActivity(ret.instantActivity);
			}
		});
	},
	
	cloneWorkItem: function()
	{
		Utility.openDialog("Wf.WorkItem.Clone.page", null, null, function(ret) {
			var args = {workItemId:clientData.workflow.workItemId, userIds:ret.userIds, comment:ret.comment};
			Utility.invoke("Wf.WorkItem.clone", args, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
				EntityForm.reload(clientData.entityId);
			});
		});
	},

	transferWorkItem: function()
	{
		Utility.openDialog("Wf.WorkItem.Transfer.page", null, null, function(ret) {
			var args = {workItemId:clientData.workflow.workItemId, userId:ret.userId, comment:ret.comment};
			Utility.invoke("Wf.WorkItem.transfer", args, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
				EntityForm.reload(clientData.entityId);
			});
		});
	},
	
	drawWorkItem: function()
	{
		if (confirm($text("Wf.WorkItem.DrawConfirm"))) {
			var args = {workItemId:clientData.workflow.workItemId};
			Utility.invoke("Wf.WorkItem.draw", args, true, function(ret) {
				Jui.message.hint($text("Wf.WorkItem.DrawSuccess"));
				EntityForm.reload(clientData.entityId);
			});
		}
	},
	
	createAndStartProcess: function(workflowCode)
	{
		if (EntityForm.validate()) {
			var args = {relationId:clientData.relationId, masterEntityId:clientData.masterEntityId};
			CommonBusiness.saveEntity(clientData.unitCode, [EntityForm.getData()], args, function(json) {
				var entityId = json.entityIds[0];
				EntityForm.addDialogResultEntityId(entityId);
				CommonBusiness.createAndStartProcess(workflowCode, entityId, function(ret) {
					if (ret != null) {
						Jui.message.hint($text("Wf.Process.StartSuccess"));
					}
					Utility.refreshMenuNumbers(clientData.unitId, EntityForm.workItemUnitId);
					EntityForm.reload(entityId);
				});
			});
		}
	},
	
	viewFlowCharts: function()
	{
		var args = {unitId:clientData.unitId, entityId:clientData.entityId};
		Utility.invoke("Wf.Process.getEntityProcessListJson", args, true, function(ret) {
			if (ret.list.length == 0) {
				alert($text("Wf.Process.NoRelevantProcess"));
				return;
			}
			args = {entityId:ret.list[0].FId}; //TODO select if multiple
			Utility.openDialog("Wf.Process.ChartAndDetail.page", args, null, function() {
				EntityForm.reload(clientData.entityId);
			});
		});
	},
	
	viewCurrentFlowChart: function()
	{
		var args = {entityId:clientData.workflow.processId};
		Utility.openDialog("Wf.Process.ChartAndDetail.page", args, null, function() {
			EntityForm.reload(clientData.entityId);
		});
	},
	
	_waitForInstantActivity: function(activity)
	{
		var wnd			= EntityForm.getInfoWindow();
		var start		= new Date().getTime();
		var countdown	= Math.max(3, activity.countdown);
		var html 		= "<div class=QsFullSize style='position:fixed'>"
						+ 	"<div class='QsFullSize' style='position:absolute;background-color:#808080;opacity:0.4'></div>"
						+ 	"<div class='QsMiddleAlign QsFullSize' style='position:absolute;text-align:center;'>"
						+	  "<span style='font-weight:bold;font-size:32px;color:#FF0000;background-color:#FFFFFF;padding:6px'></span>"
						+	"</div>"
						+ "</div>";
		EntityForm._instantActivityWaitingMask = Jui.dom.insertHtml(wnd.document.body, "BeforeEnd", html);
		var maskTextElem = EntityForm._instantActivityWaitingMask.lastChild.lastChild;
		Jui.dom.setInnerText(maskTextElem, $text("Wf.Activity.InstantWaitCountdown", countdown));
		EntityForm._instantActivityId = activity.id;
		EntityForm._instantActivityCountdownTimer = setInterval(function() {
			var EXTRA_WAITING = 2;
			var seconds = Math.max(-EXTRA_WAITING, countdown - Math.round((new Date().getTime() - start) / 1000));
			if (seconds == -EXTRA_WAITING) {
				clearInterval(EntityForm._instantActivityCountdownTimer);
				delete EntityForm._instantActivityCountdownTimer;
				Utility.invoke("Wf.Activity.setInstantActivityTimeout", {activityId:activity.id}, false, function(ret) {
					EntityForm.reload(clientData.entityId || EntityForm._newEntityId);
				});
			}
			else if (seconds <= 0) {
				Jui.dom.setInnerText(maskTextElem, $text("Wf.Activity.QueryInstantResult"));
			}
			else {
				Jui.dom.setInnerText(maskTextElem, $text("Wf.Activity.InstantWaitCountdown", seconds));
			}
		}, 1000);
	},
	
	_stopWaitingForInstantActivity: function(activityId)
	{
		if (activityId == EntityForm._instantActivityId && EntityForm._instantActivityCountdownTimer != null) {
			clearInterval(EntityForm._instantActivityCountdownTimer);
			delete EntityForm._instantActivityCountdownTimer;
			var maskTextElem = EntityForm._instantActivityWaitingMask.lastChild.lastChild;
			Jui.dom.setInnerText(maskTextElem, $text("Wf.Activity.InstantActivityFinished"));
			setTimeout(function() {
				EntityForm.reload(clientData.entityId || EntityForm._newEntityId);
			}, 2000);
		}
	},
	
	_closeOrReload: function()
	{
		if (clientData.workflow.closeDialogAfterFinish) {
			EntityForm.addDialogResultEntityId(clientData.entityId);
			Utility.close();
		}
		else {
			EntityForm.reload(clientData.entityId);
		}
	},

	//-----------------------------------------------------------------------
	// business operation
	//-----------------------------------------------------------------------
	
	doConfirm: function()
	{
		if (!EntityForm.validate()) {
			return;
		}
		if (clientData.urlArgs.isSubmit) {
			var args = {
				entityEventCode	: clientData.urlArgs.entityEventCode,
				workItemId		: clientData.workflow.workItemId,
				result			: clientData.urlArgs.result,
				comment			: clientData.urlArgs.noComment ? "" : WorkItemSubmit.commentBox.getValue(),
				form			: EntityForm.getData(),
				enableAllFields	: true
			};
			if (Jui.string.isEmpty(args.comment) && !clientData.urlArgs.noComment && clientData.isCommentRequired) {
				if (form.hasTab()) {
					form.getTabStrip().setCurrentTabById("Workflow");
				}
				alert($text("Wf.WorkItem.InputCommentAlert"));
				WorkItemSubmit.commentBox.focus();
				return;
			}
			Utility.invoke("Wf.WorkItem.finish", args, true, function(ret) {
				Utility.refreshMenuNumbers(clientData.unitId, EntityForm.workItemUnitId);
				EntityForm.clearModificationFlag();
				Utility.closeDialog(ret);
			});
		}
		else {
			var args = {
				entityEventCode	: clientData.urlArgs.entityEventCode,
				entityIds		: clientData.batchModifyIds || [clientData.entityId],
				data			: [EntityForm.getData()]
			};
			Utility.invoke(clientData.unitCode + ".confirm", args, true, function(json) {
				Utility.refreshMenuNumbers(clientData.unitId);
				Utility.closeDialog(clientData.entityId);
			});
		}
	},
	
	doWorkflowButtonClick: function(event)
	{
		var isButton = this instanceof Jui.basic.Button;
		var page = isButton ? this.getArgs().page : event.page;
		var args = {
			entityEventCode		: (isButton ? this.getArgs().entityEventCode : event.entityEventCode),
			entityId			: clientData.entityId,
			workItemId			: clientData.workflow.workItemId,
			result				: isButton ? this.getId() : event.id,
			resultText			: isButton ? this.getText() : event.text,
			noComment			: page.noComment,
			isSubmit			: true,
			enableAllFields		: true,
			addConfirmButton	: true
		};
		var saveForm = isButton ? this.getArgs().saveForm : event.saveForm;
		if (saveForm) {
			if (!EntityForm.validate()) {
				return;
			}
			args.form = EntityForm.getData();
		}
		Utility.openDialog(page.code + ".page", args, CommonBusiness.defaultDialogOptions.form, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			if (saveForm) {
				EntityForm.clearModificationFlag();
			}
			if (ret.instantActivity == null) {
				EntityForm._closeOrReload();
			}
			else {
				EntityForm._waitForInstantActivity(ret.instantActivity);				
			}
		});
	},
	
	doAssign: function()
	{
		if (!EntityForm.validate()) {
			return;
		}
		Utility.openDialog("Qs.Entity.Assign.page", {unitCode:clientData.unitCode}, null, function(data) {
			var args = {entityIds:[clientData.entityId], forms:[EntityForm.getData()], data:data};
			Utility.invoke(clientData.unitCode + ".assign", args, true, function(ret) {
				Jui.message.hint($text("Public.OperationSuccess"));
				EntityForm.addDialogResultEntityId(ret.entityIds[0]);
				EntityForm.reload(ret.entityIds[0]);
			});
		});
	},
	
	doExecute: function(saveForm)
	{
		saveForm = saveForm != false;
		if (saveForm && !EntityForm.validate()) {
			return;
		}
		if (!confirm($text("Public.ExecuteConfirm").replace("${0}", clientData.unitName))) {
			return;
		}
		var args = {entityIds:[clientData.entityId], forms:[saveForm ? EntityForm.getData() : null]};
		Utility.invoke(clientData.unitCode + ".execute", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.refreshMenuNumbers(clientData.unitId);
			EntityForm.addDialogResultEntityId(ret.entityIds[0]);
			EntityForm.reload(ret.entityIds[0]);
		});
	},
	
	doSubmit: function()
	{
		if (!EntityForm.validate()) {
			return;
		}
		if (!confirm($text("Public.SubmitConfirm", clientData.unitName))) {
			return;
		}
		var args = {entityIds:[clientData.entityId], forms:[EntityForm.getData()]};
		Utility.invoke(clientData.unitCode + ".submit", args, true, function(ret) {
			Jui.message.hint($text("Public.SubmitedMessage").replace("${0}", clientData.unitName));
			Utility.refreshMenuNumbers(clientData.unitId, EntityForm.workItemUnitId);
			EntityForm.addDialogResultEntityId(ret.entityIds[0]);
			if (ret.instantActivities[0] == null) {
				EntityForm.reload(ret.entityIds[0]);
			}
			else {
				if (clientData.entityId == null) {
					EntityForm._newEntityId = ret.entityIds[0];
				}
				EntityForm._waitForInstantActivity(ret.instantActivities[0]);
			}
		});
	},
	
	doFinish: function(saveForm)
	{
		saveForm = saveForm == true;
		if (saveForm && !EntityForm.validate()) {
			return;
		}
		if (!confirm($text("Public.FinishConfirm").replace("${0}", clientData.unitName))) {
			return;
		}
		var args = {entityIds:[clientData.entityId], forms:[saveForm ? EntityForm.getData() : null]};
		Utility.invoke(clientData.unitCode + ".finish", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.refreshMenuNumbers(clientData.unitId);
			EntityForm.addDialogResultEntityId(ret.entityIds[0]);
			EntityForm.reload(ret.entityIds[0]);
		});
	},
	
	doDiscard: function(saveForm)
	{
		saveForm = saveForm == true;
		if (saveForm && !EntityForm.validate()) {
			return;
		}
		if (!confirm($text("Public.DiscardConfirm").replace("${0}", clientData.unitName))) {
			return;
		}
		var args = {entityIds:[clientData.entityId], forms:[saveForm ? EntityForm.getData() : null]};
		Utility.invoke(clientData.unitCode + ".discard", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.refreshMenuNumbers(clientData.unitId);
			EntityForm.addDialogResultEntityId(ret.entityIds[0]);
			EntityForm.reload(ret.entityIds[0]);
		});
	},
	
	doRevise: function()
	{
		if (clientData.entityId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		if (!confirm($text("Public.ReviseConfirm").replace("${0}", clientData.unitName))) {
			return;
		}
		Utility.invoke(clientData.unitCode + ".revise", {entityIds:[clientData.entityId]}, true, function() {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.refreshMenuNumbers(clientData.unitId);
			EntityForm.reload(clientData.entityId);
		});
	},
	
	doBillPrint: function(event)
	{
		if (clientData.entityId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		CommonBusiness.viewBill(event.name, clientData.unitId, clientData.entityId);
	},
	
	//-----------------------------------------------------------------------
	// initialization
	//-----------------------------------------------------------------------

	createControls: function()
	{
		if (!Jui.cast.toBool(clientData.editable, true)) {
			Utility.showWarningBar($text("Qs.Form.ReadOnlyMessage"));
		}
		
		var columnCount = clientData.urlArgs.columnCount || clientData.columnCount || 0;
		if (columnCount == 0) {
			try {
				for (var w = window; ; w = w.parent) {
					columnCount = w.QS_FORM_COLUMN_COUNT || 0;
					if (columnCount > 0 || w == window.top) {
						break;
					}
				}
			}
			catch (e) {
			}
		}
		window.form = Jui.option.Form.create({
			target						: "FormZone",
			columnCount					: columnCount || 3,
			inputBoxEmptyAsNull			: true,
			boxChangeHandler			: CommonBusiness.doEditBoxChange,
			autoCompleteHandler			: CommonBusiness.doAutoComplete,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			entityBoxPopupClickHandler	: CommonBusiness.doEntityBoxPopupClick,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			pictureBoxSelectHandler		: CommonBusiness.doPictureBoxSelect,
			pictureBoxViewHandler		: CommonBusiness.doPictureBoxView,
			pictureBoxUrlFunction		: CommonBusiness.getPictureBoxUrl
		});

		if ($elem("ListPanel") != null) {
			EntityForm.slaveButtons.add = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/Add.png",
				text	: $text("Qs.ToolItem.Add"),
				onclick	: EntityForm.doSlaveListAdd
			});
			EntityForm.slaveButtons.remove = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/Delete.png",
				text	: $text("Qs.ToolItem.Delete"),
				onclick	: EntityForm.doSlaveListDelete
			});
			EntityForm.slaveButtons.moveUp = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/MoveUp.png",
				text	: $text("Qs.ToolItem.MoveUp"),
				onclick	: EntityForm.doSlaveListMoveUp
			});
			EntityForm.slaveButtons.moveDown = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/MoveDown.png",
				text	: $text("Qs.ToolItem.MoveDown"),
				onclick	: EntityForm.doSlaveListMoveDown
			});
			EntityForm.slaveButtons.moveTop = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/MoveTop.png",
				text	: $text("Qs.ToolItem.MoveTop"),
				onclick	: EntityForm.doSlaveListMoveTop
			});
			EntityForm.slaveButtons.moveBottom = Jui.basic.Button.create({
				target	: "ListButtonCell",
				icon	: "quicksilver/image/16/MoveBottom.png",
				text	: $text("Qs.ToolItem.MoveBottom"),
				onclick	: EntityForm.doSlaveListMoveBottom
			});
			window.list = Jui.option.List.create({
				target						: "ListPanel",
				editable					: true,
				oneditrowchange				: CommonBusiness.doListEditRowChange,
				boxChangeHandler			: CommonBusiness.doListBoxChange,
				entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
				entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
				entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
				multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect
			});
			Jui.option.Resizer.create({elements:["FormZone", "ListZone"], offset:-7});
		}
	}
};

//clientData.editJson = clientData.formJson; //compatible for old versions
Utility.addFunctionAlias(EntityForm);
window.addEventListener("message", EntityForm.doMessage);
window.onload = EntityForm.doLoad;

(function() {
	if (clientData.urlArgs.addConfirmButton) {
		var right = clientData.toolBarJson.right || [];
		var hasConfirm = false;
		for (var i = 0; i < right.length; ++i) {
			if (right[i].id == "Confirm") {
				hasConfirm = true;
				break;
			}
		}
		if (!hasConfirm) {
			right.unshift({
	            control	: "Button",
	            id		: "Confirm",
	            icon	: "quicksilver/image/16/Confirm.gif",
	            text	: $text("Qs.ToolItem.Confirm"),
	            onclick : EntityForm.doConfirm
			});
			clientData.toolBarJson.right = right;
		}
	}
})();
