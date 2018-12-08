var SerialNumberEdit =
{
	fieldMap:{},
	
	doLoad: function()
	{
		form.getControl("FFieldId").onbeforedrop = SerialNumberEdit.doFieldIdBoxBeforeDrop;
	},
	
	doFieldIdBoxBeforeDrop: function()
	{
		var box = this;
		var unitId = form.getFieldValue("FUnitId");
		if (Jui.string.isEmpty(unitId)) {
			alert($text("Qs.SerialNumber.SelectUnitAlert"));
			return null;
		}
		if (SerialNumberEdit.fieldMap[unitId] == null) {
			Utility.syncInvoke("Qs.SerialNumber.getTextFields", {unitId:unitId}, function(ret) {
				SerialNumberEdit.fieldMap[unitId] = ret.data;
			});
		}
		box.loadItems(SerialNumberEdit.fieldMap[unitId]);
	},
	
	doEnable: function()
	{
		SerialNumberEdit.setEnabled(true);
	},
	
	doDisable: function()
	{
		SerialNumberEdit.setEnabled(false);
	},
	
	setEnabled: function(enabled)
	{
		if (clientData.entityId == null) {
			alert($text("Public.SaveDataFirstAlert"));
			return;
		}
		var args = {serialNumberId:clientData.entityId, enabled:enabled};
		Utility.invoke("Qs.SerialNumber.setEnabled", args, true, function(){
			EntityForm.addDialogResultEntityId(clientData.entityId);
			alert($text("Public.OperationSuccess"));
			Utility.navigate(window.location.href);
		});
	}
};
