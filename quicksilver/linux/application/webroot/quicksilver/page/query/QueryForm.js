var QueryForm =
{
	controlMap: {},
	
	RECENT_ITEM_COUNT: clientData.queryFormRecentCount,
	
	ICON_RECENT				: "quicksilver/image/other/Collapse.png",
	ICON_RECENT_DISABLED	: "quicksilver/image/other/Expand.png",
	ICON_TREE				: "quicksilver/image/other/Collapse.png",
	ICON_TREE_DISABLED		: "quicksilver/image/other/Expand.png",
	
	getHtml: function(fields)
	{
		var recentTypes = {"EntityBox":1, "ComboBox":1, "TextBox":1, "InputBox":1};
		var numberTypes = {"int":1, "bigint":1, "double":1, "percent":1};
		var buffer = [];
		for (var i = 0; i < fields.length; ++i) {
			var field = fields[i];
			var control = field.control;
			var rangable = Jui.cast.toBool(field["queryForm.hasRange"], true);
			var ranged = rangable && (control == "DateBox" || (control == "InputBox" && field.type in numberTypes));
			var nameHtml = " _name=" + field.name + " ";
			if (field.autoComplete) {
				field.onAutoComplete = CommonBusiness.doAutoComplete;
			}
			buffer.push("<div class=QueryFormTitleRow>");
			buffer.push("<div class=QueryFormTitleCell>" + field.title + "</div>");
			if (control in recentTypes && !ranged) {
				buffer.push("<div class=QueryFormIconCell>");
				buffer.push("<img id=" + field.name + "_RecentSwitchIcon " + nameHtml
						+ " src='" + QueryForm.ICON_RECENT + "' onclick=QueryForm.doRecentSwitchClick()>");
				buffer.push("</div>");
			}
			if (field.isTree) {
				buffer.push("<div class=QueryFormIconCell>");
				buffer.push("<img id=" + field.name + "_TreeSwitchIcon " + nameHtml
						+ " src='" + QueryForm.ICON_TREE + "' onclick=QueryForm.doTreeSwitchClick()>");
				buffer.push("</div>");
			}
			buffer.push("</div>");
			buffer.push("<div class=QueryFormControlRow>");
			if (ranged) {
				buffer.push("<div class=QueryFormRangeCell" + nameHtml + "_mark=fromBox>" + Jui.basic[control].getHtml(field) + "</div>");
				buffer.push("<div class=QueryFormDashCell>-</div>");
				buffer.push("<div class=QueryFormRangeCell" + nameHtml + "_mark=toBox>" + Jui.basic[control].getHtml(field) + "</div>");
			}
			else {
				buffer.push("<div" + nameHtml + "_mark=box>" + Jui.basic[control].getHtml(field) + "</div>");
			}
			buffer.push("</div>");
			if (field.control in recentTypes && !ranged) {
				buffer.push("<div class=QueryFormControlRow><div class=QueryFormRecentCell" + nameHtml + "_mark=recent>");
				buffer.push(Jui.basic.MultiCheckBox.getHtml());
				buffer.push("</div></div>");
			}
			if (field.isTree) {
				QueryForm.treeArgs = {
					multiSelect		: true,
					onloadsubnodes	: QueryForm.doTreeLoadSubNodes,
					onSelect		: QueryForm.doBoxChange
				};
				buffer.push("<div class=QueryFormControlRow><div class=QueryFormTreeCell" + nameHtml + "_mark=tree>");
				buffer.push(Jui.option.Tree.getHtml(QueryForm.treeArgs));
				buffer.push("</div></div>");
			}
		}
		return buffer.join("");
	},
	
	initialize: function(panel, fields)
	{
		var fieldMap = Jui.array.toMap(fields, "name");
		var controlMap = {};
		var requireQuery = false;
		for (var i = 0, rows = panel.children; i < rows.length; ++i) {
			for (var j = 0, cells = rows[i].children; j < cells.length; ++j) {
				var cell = cells[j];
				var mark = cell.getAttribute("_mark");
				if (mark != null) {
					var fieldName = cell.getAttribute("_name");
					var field = fieldMap[fieldName];
					var info = controlMap[fieldName] || {field:field};
					if (mark == "recent") {
						info.recentBox = Jui.basic.MultiCheckBox.initialize(cell.firstChild);
						info.recentBox.onchange = QueryForm.doBoxChange;
						info.recentRow = cell.parentElement;
						requireQuery = true;
					}
					else if (mark == "tree") {
						info.tree = Jui.option.Tree.initialize(cell.firstChild, QueryForm.treeArgs);
						info.tree.dataUrl = field.entityType + ".getTreeData";
						info.tree.name = fieldName;
						info.treeRow = cell.parentElement;
						requireQuery = true;
					}
					else if (mark != null) {
						var box = Jui.basic[field.control].initialize(cell.firstChild, field);
						box.onkeydown = QueryForm.doBoxKeyDown;
						box.onchange = QueryForm.doBoxChange;
						if (box instanceof Jui.basic.EntityBox) {
							box.onselect = CommonBusiness.doEntityBoxSelect;
							box.onview = CommonBusiness.doEntityBoxView;
							box.onbeforedrop = CommonBusiness.doEntityBoxBeforeDrop;
							box.onautocomplete = CommonBusiness.doAutoComplete;
						}
						info[mark] = box;
					}
					controlMap[fieldName] = info;
				}
			}
		}
		QueryForm.controlMap = controlMap;
		
		if (requireQuery) {
			Utility.invoke("Qs.QuerySchema.getQueryFormDetail", {unitId:clientData.unitId}, true, function(ret) {
				for (var i = 0; i < ret.recent.hidden.length; ++i) {
					var fieldName = ret.recent.hidden[i];
					QueryForm.switchRecent(fieldName);
				}
				for (var i = 0; i < ret.tree.hidden.length; ++i) {
					var fieldName = ret.tree.hidden[i];
					QueryForm.switchTree(fieldName);
				}
				for (var fieldName in ret.recent.data) {
					if (fieldName in controlMap) {
						controlMap[fieldName].recentBox.loadItems(ret.recent.data[fieldName] || []);
					}
				}
				for (var fieldName in ret.tree.data) {
					if (fieldName in controlMap) {
						controlMap[fieldName].tree.load(ret.tree.data[fieldName] || []);
					}
				}
			});
		}
	},
	
	doTreeLoadSubNodes: function(event, callback)
	{
		Utility.invoke(this.dataUrl, {parentId:event.id}, true, function(ret) {
			callback(ret.data);
		});
	},
	
	clear: function()
	{
		for (var fieldName in QueryForm.controlMap) {
			var item = QueryForm.controlMap[fieldName];
			if (item.box != null) {
				item.box.setValue();
			}
			if (item.fromBox != null) {
				item.fromBox.setValue();
			}
			if (item.toBox != null) {
				item.toBox.setValue();
			}
			if (item.recentBox != null) {
				item.recentBox.setValue();
			}
			if (item.tree != null) {
				item.tree.clearSelection();
			}
		}
	},
	
	doRecentSwitchClick: function()
	{
		var fieldName = event.srcElement.getAttribute("_name");
		var visible = QueryForm.switchRecent(fieldName);
		var args = {unitId:clientData.unitId, fieldName:fieldName, control:"recent", visible:visible};
		Utility.invoke("Qs.QuerySchema.setQueryFormControlVisibility", args, true);
	},
	
	doTreeSwitchClick: function()
	{
		var fieldName = event.srcElement.getAttribute("_name");
		var visible = QueryForm.switchTree(fieldName);
		var args = {unitId:clientData.unitId, fieldName:fieldName, control:"tree", visible:visible};
		Utility.invoke("Qs.QuerySchema.setQueryFormControlVisibility", args, true);
	},

	switchRecent: function(fieldName)
	{
		var info = QueryForm.controlMap[fieldName];
		if (info != null && info.recentRow != null) {
			var image = document.getElementById(fieldName + "_RecentSwitchIcon"); 
			var visible = info.recentRow.style.display == "none";
			image.src = visible ? QueryForm.ICON_RECENT : QueryForm.ICON_RECENT_DISABLED;
			info.recentRow.style.display = visible ? "" : "none";
			return visible;
		}
	},
	
	switchTree: function(fieldName)
	{
		var info = QueryForm.controlMap[fieldName];
		if (info != null && info.treeRow != null) {
			var image = document.getElementById(fieldName + "_TreeSwitchIcon"); 
			var visible = info.treeRow.style.display == "none";
			image.src = visible ? QueryForm.ICON_TREE : QueryForm.ICON_TREE_DISABLED;
			info.treeRow.style.display = visible ? "" : "none";
			return visible;
		}
	},
	
	getConditions: function(updateRecent)
	{
		var conditions = [];
		var queryFormRecent = {};
		for (var fieldName in QueryForm.controlMap) {
			var info = QueryForm.controlMap[fieldName];
			var field = info.field;
			var control = field.control;
			var parts = [];
			var newRecentItems = [];
			
			var recentValues = info.recentBox && info.recentBox.getValues();
			if (recentValues != null && recentValues.length > 0 && info.recentRow.style.display != "none") {
				if (control == "EntityBox") {
					var operator = Jui.util.coalesce(field["queryForm.operator"], field.isTree ? "InWithSub" : "In");
					var recentText = info.recentBox.getTexts().join(",");
					parts.push({fieldName:fieldName, operator:operator, value:JSON.stringify(recentValues), text:recentText});
				}
				else {
					for (var i = 0, items = info.recentBox.getSelectedItems(); i < items.length; ++i) {
						var item = items[i];
						var operator = control == "ComboBox" ? "Equal" : "Contain";
						parts.push({fieldName:fieldName, operator:operator, value:item.value, text:item.text}); //TODO text?
					}
				}
				newRecentItems = newRecentItems.concat(info.recentBox.getSelectedItems());
			}

			var value = info.box && info.box.getValue();
			var text = info.box && info.box.getText && info.box.getText();
			if (typeof value === "string") {
				value = Jui.string.trim(value);
			}
			if (typeof text === "string") {
				text = Jui.string.trim(text);
			}
			if (!Jui.string.isEmpty(value)) {
				if (info.field.isCheckBox) {
					var operator = value == "1" ? "True" : "False";
					parts.push({fieldName:fieldName, operator:operator});
				}
				else if (control == "EntityBox") {
					var operator = Jui.util.coalesce(field["queryForm.operator"], field.isTree ? "InWithSub" : "In");
					parts.push({fieldName:fieldName, operator:operator, value:JSON.stringify([value]), text:text});
					newRecentItems.push({value:value, text:text});
				}
				else {
					var operator = control == "ComboBox" ? "Equal" : "Contain";
					parts.push({fieldName:fieldName, operator:operator, value:value, text:text}); //TODO text?
					newRecentItems.push({value:value, text:text || value});
				}
			}
			else if (!Jui.string.isEmpty(text)) {
				parts.push({fieldName:fieldName, operator:"Contain", value:text});
				if (control != "EntityBox") {
					newRecentItems.push({value:text, text:text});
				}
			}
			
			var fromValue = info.fromBox && info.fromBox.getValue();
			var toValue = info.toBox && info.toBox.getValue();
			if (!Jui.string.isEmpty(fromValue)) {
				var value = /^yy-MM-dd/.test(info.fromBox.getArgs().format) ? "20" + fromValue : fromValue;
				conditions.push({fieldName:fieldName, operator:"GreatEqual", value:value});
			}
			if (!Jui.string.isEmpty(toValue)) {
				var value = /^yy-MM-dd/.test(info.toBox.getArgs().format) ? "20" + toValue : toValue;
				if (info.toBox instanceof Jui.basic.DateBox && /d$/.test(info.toBox.getFormat())) {
					var date = new Date(Jui.cast.toDate(value).getTime() + 24 * 3600 * 1000);
					var text = Jui.cast.toString(date, "yyyy-MM-dd");
					conditions.push({fieldName:fieldName, operator:"Less", value:text});
				}
				else {
					conditions.push({fieldName:fieldName, operator:"LessEqual", value:value});
				}
			}
			
			var nodes = info.tree && info.tree.getTopmostSelectedNodes();
			if (nodes != null && nodes.length > 0 && info.treeRow.style.display != "none") {
				var operator = Jui.util.coalesce(field["queryForm.operator"], "InWithSub");
				var value = JSON.stringify(Jui.array.extractProperty(nodes, "id"));
				var text = Jui.array.extractProperty(nodes, "text").join(",");
				parts.push({fieldName:fieldName, operator:operator, value:value, text:text});
				for (var i = 0; i < nodes.length; ++i) {
					newRecentItems.push({value:nodes[i].id, text:nodes[i].text});
				}
			}
			if (parts.length > 0) {
				conditions.push(parts.length == 1 ? parts[0] : {operator:"or", items:parts});
			}
			if (updateRecent && info.recentBox != null && newRecentItems.length > 0) {
				var currentItems = info.recentBox.getItems();
				var allItems = newRecentItems.concat(currentItems);
				var values = info.recentBox.getValues();
				var items = [];
				var set = {};
				for (var i = 0; i < allItems.length && items.length < QueryForm.RECENT_ITEM_COUNT; ++i) {
					var item = allItems[i];
					if (!(item.value in set)) {
						items.push(item);
						set[item.value] = 1;
					}
				}
				info.recentBox.loadItems(items);
				info.recentBox.setValues(values);
				if (JSON.stringify(items) != JSON.stringify(currentItems)) {
					queryFormRecent[field.name] = items;
				}
			}
		}
		return {conditions:conditions, queryFormRecent:queryFormRecent};
	},
	
	//-----------------------------------------------------------------------
	// methods published to other file
	//-----------------------------------------------------------------------

	getData: function()
	{
		var data = {};
		for (var fieldName in QueryForm.controlMap) {
			var info = QueryForm.controlMap[fieldName];
			var item = {};
			var properties = ["box", "fromBox", "toBox", "recentBox"];
			for (var i = 0; i < properties.length; ++i) {
				var property = properties[i];
				if (property in info) {
					item[property] = QueryForm.getBoxJson(info[property]);
				}
			}
			if (info.tree != null) {
				item.tree = info.tree.getSelectedIds();
			}
			data[fieldName] = item;
		}
		return data;
	},

	loadData: function(data)
	{
		for (var fieldName in QueryForm.controlMap) {
			var info = QueryForm.controlMap[fieldName];
			var item = data[fieldName];
			var properties = ["box", "fromBox", "toBox", "recentBox"];
			for (var i = 0; i < properties.length; ++i) {
				var property = properties[i];
				if (property in info) {
					QueryForm.setBoxJson(info[property], item[property]);
				}
			}
			if (info.tree != null) {
				info.tree.select(item.tree);
			}
		}
	},
	
	getControl: function(fieldName)
	{
		return QueryForm.controlMap[fieldName].box;
	},
	
	getStartControl: function(fieldName)
	{
		return QueryForm.controlMap[fieldName].fromBox;
	},
	
	getEndControl: function(fieldName)
	{
		return QueryForm.controlMap[fieldName].toBox;
	},
	
	getTree: function(fieldName)
	{
		return QueryForm.controlMap[fieldName].tree;
	},

	getBoxJson: function(box)
	{
		var json = {value:box.getValue()};
		if (box.getText != null) {
			json.text = box.getText();
		}
		return json;
	},
	
	setBoxJson: function(box, json)
	{
		"text" in json ? box.setValue(json.value, json.text) : box.setValue(json.value);
	},

	doBoxChange: function(){},
	
	doBoxKeyDown: function(){}
};
