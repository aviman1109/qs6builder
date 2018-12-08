var UnitConvertForm =
{
	srcFields: [],
	
	destFields: [],
	
	doLoad: function()
	{
		form.getControl("FSrcUnitId").onchange = UnitConvertForm.doSrcUnitIdBoxChange;
		form.getControl("FDestUnitId").onchange = UnitConvertForm.doDestUnitIdBoxChange;
		UnitConvertForm.createControls();
		UnitConvertForm.srcFields = clientData.mappingListJson.title[0].items;
		UnitConvertForm.destFields = clientData.mappingListJson.title[1].items;
	},
	
	doSrcUnitIdBoxChange: function()
	{
		var args = {unitId:form.getFieldValue("FSrcUnitId")};
		UnitConvertForm.srcFields = [];
		if (args.unitId != null) {
			Utility.invoke("Qs.UnitCopy.getAvailableFields", args, true, function(ret) {
				UnitConvertForm.srcFields = ret.fields;
				UnitConvertForm.mappingList.getControl("FSrcFieldName").loadItems(ret.fields);
				UnitConvertForm.mappingList.loadData(UnitConvertForm.mappingList.getData());
			});
		}
	},
	
	doDestUnitIdBoxChange: function()
	{
		var args = {unitId:form.getFieldValue("FDestUnitId")};
		UnitConvertForm.destFields = [];
		if (args.unitId != null) {
			Utility.invoke("Qs.UnitCopy.getAvailableFields", args, true, function(ret) {
				UnitConvertForm.destFields = ret.fields;
				UnitConvertForm.mappingList.getControl("FDestFieldName").loadItems(ret.fields);
				UnitConvertForm.mappingList.loadData(UnitConvertForm.mappingList.getData());
			});
		}
	},
	
	createControls: function()
	{
		$elem("FormZone").style.height = "auto";
		var html = "<div class=MappingPanel>"
				 + 	 "<div class=ButtonRow>"
				 + 	   "<div>" + $text("Qs.UnitConvert.FieldMapping") + "</div>"
				 + 	   "<div id=ButtonCell class=QsRightButtonPanel></div>"
				 +	 "</div>"
				 +	 "<div id=MappingListCell>"
				 +	 "</div>"
				 + "</div>";
		Jui.dom.insertHtml($elem("FormZone"), "AfterEnd", html);
		
		var args = {target:"ButtonCell"};
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.Default"),		onclick:UnitConvertForm.doDefaultClick}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.Add"),			onclick:UnitConvertForm.doListAdd}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.Delete"),		onclick:UnitConvertForm.doListDelete}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.MoveUp"),		onclick:UnitConvertForm.doListMoveUp}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.MoveDown"),	onclick:UnitConvertForm.doListMoveDown}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.MoveTop"),		onclick:UnitConvertForm.doListMoveTop}, args));
		Jui.basic.Button.create(Jui.object.merge({text:$text("Public.MoveBottom"),	onclick:UnitConvertForm.doListMoveBottom}, args));
		UnitConvertForm.mappingList = Jui.option.List.create({
			target		: "MappingListCell",
			editable	: true,
			border		: "all"
		});
		if (clientData.mappingListJson != null) {
			UnitConvertForm.mappingList.load(clientData.mappingListJson);
		}
	},

	doDefaultClick: function()
	{
		if (!EntityForm.$validate()) {
			return;
		}
		if (UnitConvertForm.mappingList.length() > 0 && !confirm($text("Qs.UnitConvert.UseDefaultMappingConfirm"))) {
			return;
		}
		var destMap = Jui.array.toMap(UnitConvertForm.destFields, "text");
		var data = [];
		for (var i = 0, srcFields = UnitConvertForm.srcFields; i < srcFields.length; ++i) {
			var destField = destMap[srcFields[i].text];
			if (destField != null && destField.value != "FId") {
				data.push({FSrcFieldName:srcFields[i].value, FDestFieldName:destField.value});
			}
		}
		UnitConvertForm.mappingList.loadData(data);
	},
	
	doListAdd: function()
	{
		UnitConvertForm.mappingList.appendDataAndEdit({});
	},
	
	doListDelete: function()
	{
		UnitConvertForm.mappingList.deleteSelectedRows();
	},
	
	doListMoveUp: function()
	{
		UnitConvertForm.mappingList.moveUp();
	},
	
	doListMoveDown: function()
	{
		UnitConvertForm.mappingList.moveDown();
	},
	
	doListMoveTop: function()
	{
		UnitConvertForm.mappingList.moveTop();
	},
	
	doListMoveBottom: function()
	{
		UnitConvertForm.mappingList.moveBottom();
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (!UnitConvertForm.mappingList.validate()) {
		return false;
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	data.mappings = UnitConvertForm.mappingList.getData();
	return data;
};
