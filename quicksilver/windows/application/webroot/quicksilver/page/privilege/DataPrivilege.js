var DataPrivilege =
{
	requiredMap: {},
	
	requiringMap: {},

	doLoad: function()
	{
		DataPrivilege.list = Jui.option.List.create({
			target					: "QsContent",
			editable				: true,
			boxChangeHandler		: DataPrivilege.doCheckBoxChange,
			entityBoxViewHandler	: CommonBusiness.doEntityBoxView
		});
		DataPrivilege.list.loadTitle(clientData.titleJson);
		DataPrivilege.list.loadData(clientData.dataJson);
		for (var i = 0; i < clientData.types.length; ++i) {
			var type = clientData.types[i];
			if (!Jui.string.isEmpty(type.requiredBits)) {
				var array = type.requiredBits.split(",");
				for (var j = 0; j < array.length; ++j) {
					var requiredBit = parseInt(array[j]);
					DataPrivilege.requiredMap[type.accessBit] = DataPrivilege.requiredMap[type.accessBit] || {};
					DataPrivilege.requiredMap[type.accessBit][requiredBit] = true;
					DataPrivilege.requiringMap[requiredBit] = DataPrivilege.requiringMap[requiredBit] || {}; 
					DataPrivilege.requiringMap[requiredBit][type.accessBit] = false;
				}
			} 
		}
	},
	
	doAdd: function()
	{
		CommonBusiness.selectEntity("Qs.User", {}, function(ret) {
			var userIds = {};
			for (var i = 0, data = DataPrivilege.list.getData(); i < data.length; ++i) {
				userIds[data[i].FUserId] = 1;
			}
			var data = [];
			for (var i = 0; i < ret.length; ++i) {
				if (!(ret[i].id in userIds)) {
					data.push({FUserId:ret[i].id, FUserName:ret[i].name});
				}
			}
			if (data.length > 0) {
				DataPrivilege.list.appendDataAndEdit(data);
			}
		});
	},
	
	doDelete: function()
	{
		var ids = DataPrivilege.list.getSelectedKeys();
		if (ids.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Jui.message.confirm($text("Public.ListDeleteConfirm"), function() {
			for (var i = ids.length - 1; i >= 0; --i) {
				if (Jui.string.isEmpty(ids[i])) {
					ids.splice(i, 1);
				} 
			}
			if (ids.length == 0) {
				Jui.message.hint($text("Public.DeleteSuccess"));
				DataPrivilege.list.deleteSelectedRows();
			}
			else {
				var args = Jui.object.merge({ids:ids}, clientData.urlArgs);
				Utility.invoke("Qs.Privilege.deleteDataPrivileges", args, true, function(ret) {
					Jui.message.hint($text("Public.DeleteSuccess"));
					DataPrivilege.list.deleteSelectedRows();
				});
			}
		});
	},
	
	doSave: function()
	{
		for (var i = 0, data = DataPrivilege.list.getData(), userIds = {}; i < data.length; ++i) {
			if (data[i].FUserId in userIds) {
				Jui.message.alert($text("Qs.DataPrivilege.DuplicatedUser").replace("${0}", data[i].FUserName));
				return;
			}
			userIds[data[i].FUserId] = 1;
		}
		var rows = DataPrivilege.list.getModifiedRows();
		var args = Jui.object.merge({data:[]}, clientData.urlArgs);
		for (var i = 0; i < rows.length; ++i) {
			var json = rows[i].data;
			var accessRight = 0;
			for (var j = 0; j < clientData.types.length; ++j) {
				if (json[clientData.types[j].accessBit]) {
					accessRight |= 1 << (clientData.types[j].accessBit - 1);
				}
			}
			args.data.push({FId:json.FId, FUserId:json.FUserId, FAccessRight:accessRight});
		}
		Utility.invoke("Qs.Privilege.saveDataPrivileges", args, true, function(ret) {
			DataPrivilege.doRefresh();
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},

	doRefresh: function()
	{
		var url = "Qs.Privilege.getDataPrivilegeListData";
		Utility.invoke(url, clientData.urlArgs, true, function(ret) {
			DataPrivilege.list.loadData(ret.data);
		});
	},
	
	doCheckBoxChange: function()
	{
		var name = this.getName();
		if (this.getValue() && DataPrivilege.requiredMap[name]) {
			DataPrivilege.list.getBackForm().updateData(DataPrivilege.requiredMap[name]);
		}
		else if (!this.getValue() && DataPrivilege.requiringMap[name]) {
			DataPrivilege.list.getBackForm().updateData(DataPrivilege.requiringMap[name]);
		}
	}
};

clientData.toolBarJson = {right:[
	{control:"Button", name:"Add", 		text:$text("Public.Add"), 		icon:"quicksilver/image/16/Add.png", 		onclick:DataPrivilege.doAdd},
	{control:"Button", name:"Delete", 	text:$text("Public.Delete"), 	icon:"quicksilver/image/16/Delete.png", 	onclick:DataPrivilege.doDelete},
	{control:"Button", name:"Save", 	text:$text("Public.Save"), 		icon:"quicksilver/image/16/Save.png", 		onclick:DataPrivilege.doSave},
	{control:"Button", name:"Refresh", 	text:$text("Public.Refresh"),	icon:"quicksilver/image/16/Refresh.png", 	onclick:DataPrivilege.doRefresh}
]};
