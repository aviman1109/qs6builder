var FormForm =
{
	fields: clientData.fields,
	
	fieldMap: Jui.array.toMap(clientData.fields, "value"),
	
	groups: clientData.groups || [],
	
	selectedFields: clientData.selectedFields || [],
	
	hasGroup: null,
	
	groupModeItems: [],
	
	doLoad: function()
	{
		FormForm.groupModeItems = form.getControl("FGroupMode").getItems();
		FormForm.fields.sort(function(a, b) {return a.text.localeCompare(b.text);});
		FormForm.createControls();
		form.getControl("FPageId").onchange = FormForm.doPageChange;
		form.getControl("FPlatform").onchange = FormForm.doPlatformChange;
		form.getControl("FGroupMode").onchange = FormForm.doGroupModeChange;
		FormForm.doPageChange();
	},
	
	doPageChange: function()
	{
		var pageId = form.getFieldValue("FPageId");
		if (pageId != null) {
			var pageEditId = CommonBusiness.getFieldValue("Qs.Page", pageId, "FEditId");
			var isMobilePage = pageEditId == "5c6ae004-d69f-4c45-acb1-d1a049bd8aa9";
			form.setFieldValue("FPlatform", isMobilePage ? "Phone" : "Computer");
		}
		FormForm.refreshControlStatus();
	},
	
	doPlatformChange: function()
	{
		FormForm.refreshControlStatus();
	},
	
	doGroupModeChange: function()
	{
		FormForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		form.setFieldEnabled("FPlatform", form.getFieldValue("FPageId") == null, true);
		var isMobile = form.getFieldValue("FPlatform") == "Phone";
		var groupModeItems = FormForm.groupModeItems.slice(0, isMobile ? 2 : 3);
		form.getControl("FGroupMode").loadItems(groupModeItems);
		if (isMobile && form.getFieldValue("FGroupMode") == "Double") {
			form.setFieldValue("FGroupMode", "Single");
		}
		
		var mode = form.getFieldValue("FGroupMode");
		var hasGroup = mode == "Single" || mode == "Double";
		Jui.dom.tagAttribute($elem("SorterZone"), "noGroup", !hasGroup);
		if (FormForm.hasGroup != hasGroup) {
			if (FormForm.hasGroup != null) {
				if (FormForm.hasGroup) {
					FormForm.groups = FormForm.groupSorter.getData();
				}
				else {
					FormForm.selectedFields = FormForm.rightFieldSorter.getValues();
				}
			}
			if (hasGroup) {
				FormForm.groupSorter.load(FormForm.groups);
				FormForm.leftFieldSorter.clear();
				FormForm.rightFieldSorter.clear();
			}
			else {
				FormForm.loadFields(FormForm.selectedFields, {});
			}
			FormForm.hasGroup = hasGroup;
			toolBar.getItem("GroupAdd").setDisabled(!FormForm.hasGroup);
			toolBar.getItem("GroupEdit").setDisabled(!FormForm.hasGroup);
			toolBar.getItem("GroupDelete").setDisabled(!FormForm.hasGroup);
		}
	},

	doGroupAdd: function()
	{
		var topItems = [];
		var items = FormForm.groupSorter.getData();
		for (var i = 0; i < items.length; ++i) {
			if (items[i].level == 1) {
				topItems.push({value:i, text:items[i].text});
			}
		}
		var args = {topItems:topItems};
		Utility.openDialog("Qs.FieldGroup.Form.page", args, null, function(ret) {
			var item = {text:ret.name, level:ret.parent == null ? 1 : 2, data:{collapse:ret.collapse}};
			var index = -1;
			if (ret.parent != null) {
				var topLevelIndex = parseInt(ret.parent);
				for (var i = 0; i < items.length; ++i) {
					if (items[i].level == 1 && i > topLevelIndex) {
						items = items.slice(0, i).concat([item], items.slice(i));
						index = i;
						break;
					}
				}
			}
			if (index == -1) {
				items.push(item);
				index = items.length - 1;
			}
			FormForm.groupSorter.load(items);
			FormForm.groupSorter.selectByIndex(index);
			FormForm.doGroupClick();
		});
	},
	
	doGroupEdit: function()
	{
		var item = FormForm.groupSorter.getCurrentItem();
		if (item == null) {
			return;
		}
		var topItems = [];
		var items = FormForm.groupSorter.getData();
		var index = FormForm.groupSorter.getCurrentIndex();
		var data = {name:item.text, collapse:item.data.collapse};
		for (var i = items.length - 1; i >= 0; --i) {
			if (items[i].level == 1) {
				topItems.unshift({value:i, text:items[i].text});
				if (item.level > 1 && i < index) {
					data.parent = i;
				}
			}
		}
		var args = {topItems:topItems, data:data};
		Utility.openDialog("Qs.FieldGroup.Form.page", args, null, function(ret) {
			items[index].text = ret.name;
			items[index].level = ret.parent == null ? 1 : 2;
			items[index].data.collapse = ret.collapse;
			FormForm.groupSorter.load(items);
			FormForm.groupSorter.selectByIndex(index);
			FormForm.doGroupClick();
		});
	},
	
	doGroupDelete: function()
	{
		FormForm.groupSorter.deleteSelected();
		FormForm.leftFieldSorter.clear();
		FormForm.rightFieldSorter.clear();
	},
	
	doGroupClick: function()
	{
		var selectedFields = FormForm.groupSorter.getCurrentItem().data.fields || [];
		var usedFields = {};
		var items = FormForm.groupSorter.getData();
		for (var i = 0; i < items.length; ++i) {
			var item = items[i];
			var data = item.data.fields || [];
			for (var j = 0; j < data.length; ++j) {
				usedFields[data[j]] = item.text;
			}
		}
		FormForm.loadFields(selectedFields, usedFields);
	},

	doFieldLeftButtonClick: function()
	{
		var data = FormForm.rightFieldSorter.getSelectedData();
		if (data.length == 0) {
			return;
		}
		FormForm.leftFieldSorter.add(data);
		FormForm.rightFieldSorter.deleteSelected();
		FormForm.updateCurrentGroupFields();
	},

	doFieldRightButtonClick: function()
	{
		var data = FormForm.leftFieldSorter.getSelectedData();
		if (data.length == 0) {
			return;
		}
		if (FormForm.hasGroup) {
			var groups = FormForm.groupSorter.getData();
			outer:
			for (var i = 0; i < groups.length; ++i) {
				var groupData = groups[i].data;
				var groupFields = groupData.fields || [];
				for (var j = groupFields.length - 1; j >= 0; --j) {
					if (groupFields[j] == data[0].value) {
						groupFields.splice(j, 1);
						FormForm.groupSorter.updateItemByIndex(i, {data:groupData});
						break outer;
					}
				}
			}
		}
		data[0].text = FormForm.fieldMap[data[0].value].text;
		FormForm.rightFieldSorter.add(data);
		FormForm.leftFieldSorter.deleteSelected();
		FormForm.updateCurrentGroupFields();
	},

	doGroupMoveTopButtonClick: function()
	{
		FormForm.groupSorter.moveTop();
	},

	doGroupMoveUpButtonClick: function()
	{
		FormForm.groupSorter.moveUp();
	},

	doGroupMoveDownButtonClick: function()
	{
		FormForm.groupSorter.moveDown();
	},

	doGroupMoveBottomButtonClick: function()
	{
		FormForm.groupSorter.moveBottom();
	},

	doFieldMoveTopButtonClick: function()
	{
		FormForm.rightFieldSorter.moveTop();
		FormForm.updateCurrentGroupFields();
	},

	doFieldMoveUpButtonClick: function()
	{
		FormForm.rightFieldSorter.moveUp();
		FormForm.updateCurrentGroupFields();
	},

	doFieldMoveDownButtonClick: function()
	{
		FormForm.rightFieldSorter.moveDown();
		FormForm.updateCurrentGroupFields();
	},

	doFieldMoveBottomButtonClick: function()
	{
		FormForm.rightFieldSorter.moveBottom();
		FormForm.updateCurrentGroupFields();
	},
	
	updateCurrentGroupFields: function()
	{
		if (FormForm.hasGroup) {
			var item = FormForm.groupSorter.getCurrentItem();
			if (item != null) {
				item.data.fields = FormForm.rightFieldSorter.getValues();
				FormForm.groupSorter.updateCurrentItem({data:item.data});
			}
		}
	},
	
	loadFields: function(selectedFields, usedFields)
	{
		var selectedSet = Jui.array.toSet(selectedFields);
		var leftData = [];
		for (var i = 0; i < FormForm.fields.length; ++i) {
			var field = FormForm.fields[i];
			if (!(field.value in selectedSet)) {
				var groupName = usedFields[field.value];
				var text = groupName == null ? field.text : field.text + "(" + groupName + ")";
				leftData.push({value:field.value, text:text, disabled:groupName != null});
			}
		}
		leftData.sort(function(a, b){return (a.disabled ? 1 : 0) - (b.disabled ? 1 : 0);});
		var rightData = [];
		for (var i = 0; i < selectedFields.length; ++i) {
			if (selectedFields[i] in FormForm.fieldMap) {
				rightData.push(FormForm.fieldMap[selectedFields[i]]);
			}
		}
		FormForm.leftFieldSorter.load(leftData);
		FormForm.rightFieldSorter.load(rightData);
	},
	
	createControls: function()
	{
		$elem("FormZone").style.height = "auto";
		var html 	= "<div id=SorterZone class=SorterZone>"
					+ 	"<div id=GroupSorterPanel>"
					+ 		"<div>" + $text("Qs.FieldGroup") + "</div>"
					+	"</div>"
					+ 	"<div></div>"
					+ 	"<div id=LeftSorterPanel>"
					+ 		"<div>" + $text("Qs.Field.NotSelectedFields") + "</div>"
					+	"</div>"
					+	"<div class=QsMiddleAlign><div id=FieldButtonCell class=QsVertButtonPanel></div></div>"
					+	"<div id=RightSorterPanel>"
					+		"<div>" + $text("Qs.Field.SelectedFields") + "</div>"
					+	"</div>"
					+ "</div>";
		Jui.dom.insertHtml($elem("FormZone"), "AfterEnd", html);
		
		FormForm.groupSorter = Jui.option.Sorter.create({
			target			: "GroupSorterPanel",
			onclick			: FormForm.doGroupClick
		});
		FormForm.leftFieldSorter = Jui.option.Sorter.create({
			target			: "LeftSorterPanel",
			ondoubleclick	: FormForm.doFieldRightButtonClick
		});
		FormForm.rightFieldSorter = Jui.option.Sorter.create({
			target			: "RightSorterPanel",
			ondoubleclick	: FormForm.doFieldLeftButtonClick
		});

		Jui.basic.Button.create({
			target	: "GroupSorterPanel",
			icon	: "quicksilver/image/16/MoveTop.png",
			onclick	: FormForm.doGroupMoveTopButtonClick
		});
		Jui.basic.Button.create({
			target	: "GroupSorterPanel",
			icon	: "quicksilver/image/16/MoveUp.png",
			onclick	: FormForm.doGroupMoveUpButtonClick
		});
		Jui.basic.Button.create({
			target	: "GroupSorterPanel",
			icon	: "quicksilver/image/16/MoveDown.png",
			onclick	: FormForm.doGroupMoveDownButtonClick
		});
		Jui.basic.Button.create({
			target	: "GroupSorterPanel",
			icon	: "quicksilver/image/16/MoveBottom.png",
			onclick	: FormForm.doGroupMoveBottomButtonClick
		});
		
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveRight.png",
			onclick	: FormForm.doFieldRightButtonClick
		});
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveLeft.png",
			onclick	: FormForm.doFieldLeftButtonClick
		});
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveTop.png",
			style	: "margin-top:12px",
			onclick	: FormForm.doFieldMoveTopButtonClick
		});
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveUp.png",
			onclick	: FormForm.doFieldMoveUpButtonClick
		});
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveDown.png",
			onclick	: FormForm.doFieldMoveDownButtonClick
		});
		Jui.basic.Button.create({
			target	: "FieldButtonCell",
			icon	: "quicksilver/image/16/MoveBottom.png",
			onclick	: FormForm.doFieldMoveBottomButtonClick
		});
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (!FormForm.hasGroup && FormForm.rightFieldSorter.getValues().length == 0) {
		alert($text("Qs.Field.SelectAlert"));
		return false;
	}
	else if (FormForm.hasGroup) {
		var groups = FormForm.groupSorter.getData();
		if (groups.length == 0) {
			alert($text("Qs.Form.NoGroupAlert"));
			return false;
		}
		var isEmpty = true;
		for (var i = 0; i < groups.length; ++i) {
			if (!Jui.array.isEmpty(groups[i].data.fields)) {
				isEmpty = false;
				break;
			}
		}
		if (isEmpty) {
			alert($text("Qs.Form.NoGroupFieldAlert"));
			return false;
		}
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	data.hasGroup = FormForm.hasGroup;
	data.selectedFields = FormForm.rightFieldSorter.getValues();
	data.groups = FormForm.groupSorter.getData();
	return data;
};

Jui.use("Sorter");
