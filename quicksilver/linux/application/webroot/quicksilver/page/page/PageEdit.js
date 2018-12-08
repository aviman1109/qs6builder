var PageEdit =
{
	doLoad: function()
	{
		var fields = [
		    "FDialogWidth", "FDialogHeight",
		    "FQueryFormAutoQuery", "FHasViewFrame", "FQueryOnLoad", "FQuerySchemaId",
		    "FCreateQuerySchemaBox", "FCreateKeywordBox",
		    "FIcon", "FVisibleCondition", "FToolItemInitArguments", "FDialogMaximized"
		];
		for (var i = 0; i < fields.length; ++i) {
			var box = form.getControl(fields[i]);
			if (box != null) {
				box.setClearOnDisable(true);
				box.setRestoreOnEnable(true);
			}
		}
		form.getControl("FType").onchange			= PageEdit.doTypeBoxChange;
		form.getControl("FIsSlavePage").onchange	= PageEdit.doIsSlavePageBoxChange;
		form.getControl("FRelationId").onchange		= PageEdit.doRelationIdBoxChange;
		form.getControl("FUnitId").onchange			= PageEdit.doUnitIdBoxChange;
		form.getControl("FMasterUnitId").onchange	= PageEdit.doMasterUnitIdBoxChange;
		PageEdit.refreshControlStatus();
	},
	
	isMobile: function()
	{
		return form.getFieldValue("FEditId") == "5c6ae004-d69f-4c45-acb1-d1a049bd8aa9";
	},
	
	doTypeBoxChange: function()
	{
		if (!PageEdit.isMobile()) {
			var type = form.getFieldValue("FType");
			if (type == "EntityForm") {
				form.setFieldValue("FUrl", "quicksilver/page/template/EntityForm.jsp");
			}
			else if (type == "EntityView") {
				form.setFieldValue("FUrl", "quicksilver/page/template/EntityView.jsp");
			}
			else if (type == "EntityList") {
				form.setFieldValue("FUrl", "quicksilver/page/template/EntityList.jsp");
			}
			else if (type == "EditableList") {
				form.setFieldValue("FUrl", "quicksilver/page/template/EditableList.jsp");
			}
			else if (type == "Sort") {
				form.setFieldValue("FUrl", "quicksilver/page/template/Sorter.jsp");
			}
		}
		PageEdit.refreshControlStatus();
		PageEdit.refreshName();
		PageEdit.refreshTitle();
		PageEdit.refreshCode();
		PageEdit.refreshIcon();
		PageEdit.refreshActionMethodName();
	},

	doRelationIdBoxChange: function()
	{
		var relationId = form.getFieldValue("FRelationId");
		if (!Jui.string.isEmpty(relationId)) {
			Utility.invoke("Qs.Relation.getItem", {relationId:relationId}, true, function(ret) {
				var data = ret.data;
				form.setFieldValue("FUnitId", data.unitId2, data.unitName2);
				form.setFieldValue("FMasterUnitId", data.unitId1, data.unitName1);
				PageEdit.refreshName();
				PageEdit.refreshTitle();
				PageEdit.refreshCode();
				PageEdit.refreshIcon();
				PageEdit.refreshActionMethodName();
			});
		}
	},

	doUnitIdBoxChange: function()
	{
		PageEdit.refreshName();
		PageEdit.refreshTitle();
		PageEdit.refreshCode();
		PageEdit.refreshIcon();
		PageEdit.refreshActionMethodName();
	},

	doMasterUnitIdBoxChange: function()
	{
		PageEdit.refreshName();
		PageEdit.refreshCode();
	},

	doIsSlavePageBoxChange: function()
	{
		PageEdit.refreshControlStatus();
		PageEdit.refreshName();
		PageEdit.refreshCode();
	},

	refreshControlStatus: function()
	{
		var type			= form.getFieldValue("FType");
		var isSlavePage		= form.getFieldValue("FIsSlavePage");
		var isEntityPage	= /^Entity/.test(type) && type != "EntityForm";
		var isMobile		= PageEdit.isMobile();
		var isEntityList	= type == "EntityList";
		form.setFieldRequired("FUnitId", isEntityPage);
		form.setFieldRequired("FMasterUnitId", isSlavePage);
		form.setFieldEnabled("FVisibleCondition", isSlavePage);
		form.setFieldEnabled("FDialogWidth", !isMobile);
		form.setFieldEnabled("FDialogHeight", !isMobile);
		form.setFieldEnabled("FIcon", !isMobile);
		form.setFieldEnabled("FDialogMaximized", !isMobile);
		form.setFieldEnabled("FUrl", !isEntityList);
		form.setFieldEnabled("FQueryFormAutoQuery", isEntityList);
		form.setFieldEnabled("FHasViewFrame", isEntityList);
		form.setFieldEnabled("FQueryOnLoad", isEntityList);
		form.setFieldEnabled("FQuerySchemaId", isEntityList);
		form.setFieldEnabled("FCreateQuerySchemaBox", isEntityList);
		form.setFieldEnabled("FCreateKeywordBox", isEntityList);
		form.setFieldEnabled("FToolItemInitArguments", isEntityList);
	},

	refreshName: function()
	{
		var type			= form.getFieldValue("FType");
		var unitName		= form.getFieldText("FUnitId");
		var masterUnitName	= form.getFieldText("FMasterUnitId");
		var isSlavePage		= form.getFieldValue("FIsSlavePage");
		if (Jui.string.isEmpty(unitName)) {
			return;
		}
		else if (type == "EntityForm") {
			form.setFieldValue("FName", $text("Qs.Page.FormName"));
		}
		else if (type == "EntityView") {
			form.setFieldValue("FName", $text("Qs.Page.ViewName").replace("${0}", unitName));
		}
		else if (type == "EntityList" || type == "EditableList") {
			if (isSlavePage && !Jui.string.isEmpty(masterUnitName)) {
				var template = $text("Qs.Page.SlaveListName");
				form.setFieldValue("FName", template.replace("${0}", masterUnitName).replace("${1}", unitName));
			}
			else {
				form.setFieldValue("FName", $text("Qs.Page.ListTitle").replace("${0}", unitName));
			}
		}
		else if (type == "Sort") {
			form.setFieldValue("FName", $text("Qs.Page.SortName").replace("${0}", unitName));
		}
	},

	refreshTitle: function()
	{
		var type			= form.getFieldValue("FType");
		var unitName		= form.getFieldText("FUnitId");
		var masterUnitName	= form.getFieldText("FMasterUnitId");
		var isSlavePage		= form.getFieldValue("FIsSlavePage");
		if (type == "EntityForm") {
			form.setFieldValue("FTitle", isSlavePage ? $text("Qs.Page.FormTitle") : masterUnitName || unitName);
		}
		else if (type == "Sort") {
			form.setFieldValue("FTitle", $text("Qs.Page.SortTitle"));
		}
		else if (!Jui.string.isEmpty(unitName)) {
			form.setFieldValue("FTitle", unitName);
		}
	},

	refreshCode: function()
	{
		var isMobile		= PageEdit.isMobile();
		var type			= form.getFieldValue("FType");
		var unitId			= form.getFieldValue("FUnitId");
		var masterUnitId	= form.getFieldValue("FMasterUnitId");
		var isSlavePage		= form.getFieldValue("FIsSlavePage");
		var codeUnitId		= type == "EntityForm" ? masterUnitId || unitId : unitId;
		var unit			= codeUnitId == null ? null : Utility.getUnit(codeUnitId);
		if (unit == null) {
			return;
		}
		if (type == "EntityForm") {
			form.setFieldValue("FCode", unit.code + (isMobile ? ".MobileForm" : ".Form"));
		}
		else if (type == "EntityView") {
			form.setFieldValue("FCode", unit.code + ".View");
		}
		else if (type == "Sort") {
			form.setFieldValue("FCode", unit.code + ".Sort");
		}
		else if (type == "EntityList" || type == "EditableList") {
			var masterUnit = isSlavePage && !Jui.string.isEmpty(masterUnitId) ? Utility.getUnit(masterUnitId) : null;
			var tail = isMobile ? "MobileList" : "List";
			if (masterUnit != null) {
				form.setFieldValue("FCode", masterUnit.code + "." + unit.code.replace(/.*\./, "") + tail);
			}
			else {
				form.setFieldValue("FCode", unit.code + "." + tail);
			}
		}
	},

	refreshIcon: function()
	{
		var type 			= form.getFieldValue("FType");
		var unitId			= form.getFieldValue("FUnitId");
		var masterUnitId	= form.getFieldValue("FMasterUnitId");
		var isSlavePage		= form.getFieldValue("FIsSlavePage");
		if (type == "Sort") {
			form.setFieldValue("FIcon", "quicksilver/image/16/Sort.png");
		}
		else if (type == "EntityForm" && isSlavePage) {
			form.setFieldValue("FIcon", "quicksilver/image/unit/Form.png");
		}
		else if (type == "EntityForm" && masterUnitId != null) {
			form.setFieldValue("FIcon", Utility.getUnit(masterUnitId).icon);
		}
		else if (unitId != null) {
			form.setFieldValue("FIcon", Utility.getUnit(unitId).icon);
		}
	},

	refreshActionMethodName: function()
	{
		var isMobile		= PageEdit.isMobile();
		var type			= form.getFieldValue("FType");
		var unitId			= form.getFieldValue("FUnitId");
		var masterUnitId	= form.getFieldValue("FMasterUnitId");
		var actionUnitId	= type == "EntityForm" ? masterUnitId || unitId : unitId;
		var unit			= actionUnitId == null ? null : Utility.getUnit(actionUnitId);
		if (unit == null) {
			return;
		}
		if (type == "EntityForm") {
			form.setFieldValue("FActionMethodName", unit.code + (isMobile ? ".prepareMobileForm" : ".prepareForm"));
		}
		else if (type == "EntityView") {
			form.setFieldValue("FActionMethodName", unit.code + (isMobile ? ".prepareMobileView" : ".prepareView"));
		}
		else if (type == "EntityList") {
			form.setFieldValue("FActionMethodName", unit.code + (isMobile ? ".prepareMobileList" : ".prepareList"));
		}
		else if (type == "EditableList") {
			form.setFieldValue("FActionMethodName", unit.code + ".prepareEditableList");
		}
		else if (type == "Sort") {
			form.setFieldValue("FActionMethodName", unit.code + ".prepareSort");
		}
	}
};
