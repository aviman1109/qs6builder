var SystemMessage =
{
	open: function(messageId, unitId, entityId)
	{
		if (unitId != null && entityId != null) {
			var unit = Utility.getUnit(unitId);
			if (unit.code == "Wf.WorkItem") {
				Utility.invoke("Wf.WorkItem.getHandleInformation", {workItemId:entityId}, true, function(ret) {
					var args = Jui.object.merge({_messageId:messageId}, ret.args);
					unit = Utility.getUnit(ret.unitCode);
					Utility.openTab(ret.url, args, unit.name, unit.icon);
				});
			}
			else {
				var args = {entityId:entityId, _messageId:messageId};
				CommonBusiness.openEntity(unit.code, args, "Tab");
			}
		}
		else {
			CommonBusiness.openEntity("Qs.SystemMessage", {entityId:messageId});
		}
		Utility.invoke("Qs.SystemMessage.read", {entityId:messageId}, false, function(ret) {
			var wnd = Jui.window.getTop();
			if (ret.count != null && wnd != null && wnd.MainFrame != null) {
				wnd.MainFrame.setSystemMessageCount(ret.count);
			}
		});
	}
};
