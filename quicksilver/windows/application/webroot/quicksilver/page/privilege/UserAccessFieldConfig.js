var UserAccessFieldConfig =
{
	fieldMap: {},
	
	doLoad: function()
	{
		var items = [
		    {value:"Field", 		text:$text("Qs.Privilege.UserAccessField.Field")},
		    {value:"Relation", 		text:$text("Qs.Privilege.UserAccessField.Relation")},
		    {value:"RelationField", text:$text("Qs.Privilege.UserAccessField.RelationField")}
		];
		var condition = {fieldName:"FUnitId1", operator:"Equal", value:"00000000-0000-0000-0001-000000001002"};
		list.oneditrowchange = UserAccessFieldConfig.refreshBoxStatus;
		list.loadTitle([{
			name			: "FType",
			title			: $text("Qs.Privilege.UserAccessField.Type"),
			control			: "ComboBox",
			selectOnly		: true,
			required		: true,
			items			: items,
			width			: 110,
			onchange		: UserAccessFieldConfig.doTypeChange
		}, {
			name			: "FRelationId",
			textField		: "FRelationName",
			title			: $text("Qs.Privilege.UserAccessField.Relation"),
			control			: "EntityBox",
			entityType		: "Qs.Relation",
			width			: 200,
			clearOnDisable	: true,
			userData		: {basicQueryArguments:{conditions:[condition]}}
		}, {
			name			: "FFieldName",
			textField		: "FFieldTitle",
			title			: $text("Qs.Privilege.UserAccessField.Field"),
			control			: "EntityBox",
			entityType		: "Qs.Field",
			hasMagnifier	: false,
			hasLink			: false,
			selectOnly		: true,
			clearOnDisable	: true,
			onbeforedrop	: UserAccessFieldConfig.doFieldBeforeDrop
		}]);
		list.loadData(clientData.listData);
	},

	doSave: function()
	{
		var data = list.getData();
		var message = $text("Public.InputAlert");
		for (var i = 0; i < data.length; ++i) {
			var row = data[i];
			if (row.FType == null) {
				Jui.message.alert(message.replace("${0}", $text("Qs.Privilege.UserAccessField.Type")));
				list.setEditIndex(i, true);
				return;
			}
			if (/Relation/.test(row.FType) && Jui.string.isEmpty(row.FRelationId)) {
				Jui.message.alert(message.replace("${0}", $text("Qs.Privilege.UserAccessField.Relation")));
				list.setEditIndex(i, true);
				return;
			}
			if (/Field/.test(row.FType) && Jui.string.isEmpty(row.FFieldName)) {
				Jui.message.alert(message.replace("${0}", $text("Qs.Privilege.UserAccessField.Field")));
				list.setEditIndex(i, true);
				return;
			}
		}
		var args = {fields:data};
		Utility.invoke("Qs.Privilege.setUserAccessFields", args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.closeDialog();
		});
	},
	
	doAdd: function()
	{
		list.appendDataAndEdit({FType:"Field"});
		UserAccessFieldConfig.refreshBoxStatus();		
	},
	
	doDelete: function()
	{
		list.deleteSelectedRows();
	},
	
	doTypeChange: function()
	{
		UserAccessFieldConfig.refreshBoxStatus();
		var form = list.getBackForm();
		form.setFieldValue("FRelationId");
		form.setFieldValue("FFieldName");
	},
	
	doFieldBeforeDrop: function()
	{
		var form = list.getBackForm();
		var type = form.getFieldValue("FType");
		if (type == "Field") {
			form.getControl("FFieldName").loadItems(clientData.fields);
		}
		else if (form.getFieldValue("FRelationId") != null) {
			var args = {relationId:form.getFieldValue("FRelationId")};
			if (UserAccessFieldConfig.fieldMap[args.relationId] == null) {
				Utility.syncInvoke("Qs.Privilege.getPrivilegableFields", args, function(ret) {
					UserAccessFieldConfig.fieldMap[args.relationId] = ret.fields;
				});
			}
			form.getControl("FFieldName").loadItems(UserAccessFieldConfig.fieldMap[args.relationId]);
		}
		else {
			form.getControl("FFieldName").loadItems([]);
		}
	},
	
	doRelationChange: function()
	{
		list.getBackForm().setFieldValue("FFieldName", null);
	},
	
	refreshBoxStatus: function()
	{
		var form = list.getBackForm();
		var type = form.getFieldValue("FType");
		form.setFieldEnabled("FRelationId", type != "Field");
		form.setFieldEnabled("FFieldName", type != "Relation");
	}
};
