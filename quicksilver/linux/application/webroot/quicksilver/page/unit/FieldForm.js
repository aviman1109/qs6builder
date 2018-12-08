var FieldForm =
{
	hintTitle: null,
	
	sizeTitle: null,
	
	unitId: clientData.unitId,
	
	doLoad: function()
	{
		FieldForm.hintTitle = form.getFieldTitle("FHint");
		FieldForm.sizeTitle = form.getFieldTitle("FSize");
		FieldForm.typesHidden = Jui.array.toSet([
			"InputBox-Key", "InputBox-Uuid"
		]);
		FieldForm.typesCannotRequire = Jui.array.toSet([
			"CheckBox", "InputBox-Key", "InputBox-Uuid"
		]);
		FieldForm.typesCannotQuery = Jui.array.toSet([
		    "InputBox-Uuid", "List"
		]);
		FieldForm.typesHasSize = Jui.array.toSet([
			"InputBox-Text", "InputBox-Email", "InputBox-Phone", "InputBox-Address", "InputBox-Url",
			"InputBox-Password", "TextBox", "HtmlBox", "MultiCheckBox", "RadioBox",
			"ComboBox-Inputable", "ComboBox-SelectOnly", "Grid"
		]);
		FieldForm.typesHasScale = Jui.array.toSet([
			"InputBox-Double", "InputBox-Percent"
		]);
		FieldForm.typesHasDictionary = Jui.array.toSet([
			"MultiCheckBox", "RadioBox", "ComboBox-Inputable", "ComboBox-SelectOnly"
		]);
		FieldForm.typesHasParentField = Jui.array.toSet([
 			"RadioBox", "ComboBox-Inputable", "ComboBox-SelectOnly"
 		]);
		FieldForm.typesHasI18n = Jui.array.toSet([
			"InputBox-Text", "InputBox-Address", "TextBox", "HtmlBox"
		]);
		FieldForm.typesHasEntityUnit = Jui.array.toSet([
			"EntityBox", "MultiEntityBox", "InputBox-Key", "List"
		]);
		FieldForm.typesHasRelationTable = Jui.array.toSet([
  			"MultiEntityBox", "MultiCheckBox"
  		]);
		FieldForm.typesHasFilterSql = Jui.array.toSet([
		    "EntityBox", "MultiEntityBox"
		]);
		FieldForm.virtualSourceTypes = Jui.array.toSet([
			"join", "template", "sql", "table"
		]);
		FieldForm.typesCannotDisplayOnList = Jui.array.toSet([
			"List"
		]);
		var conditionalFields = [
			"FSize", "FScale", "FDictionaryId", "FParentField", "FLocalTextField", "FRelationCapacity",
			"FSelectListConstantFilterSql", "FSelectListVariableFilterSql",
			"FVisible", "FReadOnly", "FRequired", "FQueryable", "FSupportI18n"
		];
		for (var i = 0; i < conditionalFields.length; ++i) {
			var box = form.getControl(conditionalFields[i]);
			box.setClearOnDisable(true);
			box.setRestoreOnEnable(true);
		}
		form.getControl("FType").onchange = FieldForm.doTypeBoxChange;
		form.getControl("FSourceType").onchange = FieldForm.doSourceTypeBoxChange;
		form.getControl("FSupportLocalText").onchange = FieldForm.doSupportLocalTextBoxChange;
		form.getControl("FRelationId").onbeforedrop = FieldForm.doRelationIdBoxBeforeDrop;
		FieldForm.refreshControlStatus();
		if (clientData.entityId != null) {
			form.setFieldDisabled("FName");
			form.setFieldDisabled("FSourceType");
		}
	},

	doGenerateSlavePage: function()
	{
		if (clientData.entityId == null) {
			alert($text("Qs.Edit.SaveNewDataFirstAlert"));
			return;
		}
		var url = "Qs.Field.checkBeforeGenerateSlavePage";
		Utility.invoke(url, {fieldId:clientData.entityId}, true, function(ret) {
			url = "Qs.Page.SlavePageGenerate.page";
			Utility.openDialog(url, {relationId:ret.relationId});
		});
	},
	
	refreshControlStatus: function()
	{
		var type = form.getFieldValue("FType");
		if (type == "MultiEntityBox") {
			form.setFieldValue("FSupportLocalText", true);
		}
		else if (type != "EntityBox") {
			form.setFieldValue("FSupportLocalText", false);
		}
		
		var isNew 				= clientData.entityId == null;
		var sourceType 			= form.getFieldValue("FSourceType");
		var isVirtualField 		= sourceType in FieldForm.virtualSourceTypes;
		var isVisibleType		= !(type in FieldForm.typesHidden);
		var canQuery			= !(type in FieldForm.typesCannotQuery);
		var canRequire			= !(type in FieldForm.typesCannotRequire);
		var canDisplayOnList	= !(type in FieldForm.typesCannotDisplayOnList);
		var hasRelationTable	= type in FieldForm.typesHasRelationTable;
		var hasFilterSql		= type in FieldForm.typesHasFilterSql;
		var supportLocalText	= form.getFieldValue("FSupportLocalText");
		var hasSize				= type in FieldForm.typesHasSize && !isVirtualField || supportLocalText;
		form.setFieldEnabled("FVisible", isVisibleType);
		form.setFieldEnabled("FRequired", type == "List" || canRequire && !isVirtualField);
		form.setFieldEnabled("FReadOnly", isVisibleType);
		form.setFieldEnabled("FQueryable", sourceType != "template" && canQuery);
		form.setFieldEnabled("FSize",  hasSize, true);
		form.setFieldEnabled("FScale", type in FieldForm.typesHasScale, true);
		form.setFieldEnabled("FDictionaryId", type in FieldForm.typesHasDictionary, true);
		form.setFieldEnabled("FParentField", type in FieldForm.typesHasParentField);
		form.setFieldEnabled("FEntityUnitId", type in FieldForm.typesHasEntityUnit, true);
		form.setFieldEnabled("FRelationTable", isNew && hasRelationTable, true);
		form.setFieldEnabled("FRelationCapacity", hasRelationTable, true);
		form.setFieldEnabled("FSupportI18n", type in FieldForm.typesHasI18n);
		form.setFieldEnabled("FSupportLocalText", type == "EntityBox");
		form.setFieldEnabled("FLocalTextField", supportLocalText, true);
		form.setFieldVisible("FRelationId", type == "List");
		form.setFieldVisible("FSelectListConstantFilterSql", hasFilterSql);
		form.setFieldVisible("FSelectListVariableFilterSql", hasFilterSql);
		form.setFieldEnabled("FLabelColor", isVisibleType);
		form.setFieldEnabled("FColSpan", isVisibleType, true);
		form.setFieldEnabled("FRowSpan", isVisibleType, true);
		form.setFieldEnabled("FListWidth", isVisibleType, true);
		form.setFieldEnabled("FJoinField", sourceType == "join", true);
		form.setFieldEnabled("FSourceField", sourceType == "join", true);
		form.setFieldVisible("FSource", sourceType == "sql" || sourceType == "template", true);
		form.setFieldRequired("FHint", type == "Button" || type == "Label");
		form.setFieldVisible("FListWidth", isVisibleType && canDisplayOnList);
		form.setFieldVisible("FListAlign", isVisibleType && canDisplayOnList);

		if (type == "Button") {
			form.setFieldTitle("FHint", $text("Qs.Field.HintTitle.Button"));
		}
		else if (type == "Label") {
			form.setFieldTitle("FHint", $text("Qs.Field.HintTitle.Label"));
		}
		else {
			form.setFieldTitle("FHint", FieldForm.hintTitle);
		}
		if (supportLocalText) {
			form.setFieldTitle("FSize", $text("Qs.Field.SizeTitle.LocalText"));
		}
		else {
			form.setFieldTitle("FSize", FieldForm.sizeTitle);
		}
		
		if (!hasRelationTable) {
			form.setFieldValue("FRelationTable", null);
		}
	},
	
	doTypeBoxChange: function()
	{
		var type = form.getFieldValue("FType");
		var sourceType = form.getFieldValue("FSourceType");

		if (type == "List") {
			form.setFieldValue("FSourceType", "table");
		}
		else if (sourceType == "table") {
			form.setFieldValue("FSourceType", "local");
		}

		if (type == "EntityBox") {
			form.setFieldValue("FSourceType", "local");
		}
		else if (type == "Button" || type == "Label") {
			form.setFieldValue("FSourceType", "constant");
		}
		
		if (type == "PictureBox") {
			form.setFieldValue("FEntityUnitId", clientData.pictureUnitId, clientData.pictureUnitName);
		}
		else if (type != "MultiEntityBox"){
			form.setFieldValue("FEntityUnitId");
		}
		
		if (type == "DateBox-MonthDay") {
			form.getControl("FSize").setValue(5);
		}
		
		FieldForm.refreshControlStatus();
	},
	
	doSourceTypeBoxChange: function()
	{
		var type = form.getFieldValue("FType");
		var sourceType = form.getFieldValue("FSourceType");
		if (sourceType == "table") {
			form.setFieldValue("FType", "List");
		}
		else if (type == "List" && sourceType != "table") {
			form.setFieldValue("FType", null);
		}
		else if (type == "EntityBox" && sourceType != "local") {
			form.setFieldValue("FType", null);
		}
		else if ((type == "Button" || type == "Label") && sourceType != "constant") {
			form.setFieldValue("FType", null);
		}
		FieldForm.refreshControlStatus();
	},
	
	doSupportLocalTextBoxChange: function()
	{
		FieldForm.refreshControlStatus();
	},
	
	doRelationIdBoxBeforeDrop: function()
	{
		var box = this;
		var args = {masterUnitId:FieldForm.unitId, slaveUnitId:form.getFieldValue("FEntityUnitId")};
		if (args.slaveUnitId == null) {
			box.loadItems([]);
		}
		else {
			Utility.syncInvoke("Qs.Field.getRelationDropdownJson", args, function(ret) {
				box.loadItems(ret.items);
			});
		}
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	var sizeBox = form.getControl("FSize");
	if (!sizeBox.isDisabled() && (sizeBox.getValue() == "0" || sizeBox.getValue() == "")) {
		alert($text("Qs.Field.InvalidSize"));
		sizeBox.focus();
		return false;
	}
	if (clientData.entityId == null) {
		var data = form.getData();
		var ret = Utility.syncInvoke("Qs.Field.checkBeforeCreate", {data:data});
		if (ret == null) {
			return false;
		}
		if (ret.columnExists && !confirm(Utility.formatText("Qs.Field.ColumnExistConfrm", data.FName))) {
			return false;
		}
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	if (data.FType != "List") {
		delete data.FRelationId;
	}
	return data;
};
