Jui.$define("Jui.option.List", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.option.List.getHtml = function(args, clazz)
{
	args = args || {};
	return	"<div class=JuiList" + Jui.$p({style:args.style}) + " unselectable=on>"
		+	"</div>";
};

Jui.option.List.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me.onclick		= args.onclick;
	me._getRowHtml	= Jui.option.List._defaultRowHtmlGenerator;
	me._group		= null;
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.option.List.prototype.setIcon = function(icon)
{
	this._icon = icon;
};

Jui.option.List.prototype.length = function()
{
	return this.element.getElementsByClassName("JuiListItem").length;
};

Jui.option.List.prototype.load = function(json)
{
	this.loadTitle(json.title);
	this.loadData(json.data);
};

Jui.option.List.prototype.loadTitle = function(json)
{
	var me			= this;
	json			= Jui.array.isArray(json) ? {fields:json} : json;
	me._keyField	= json.keyField;
	me._nameField	= json.nameField;
	me._icon		= json.icon;
	me._titleRows	= [];
	var row			= null;
	var part		= null;
	var align		= null;
	for (var i = 0; i < json.fields.length; ++i) {
		var field = json.fields[i];
		var isNewRow = i == 0 || field.isNewRow || align == "right" && field.align != align;
		if (isNewRow) {
			row = {parts:[]};
			me._titleRows.push(row);
		}
		if (isNewRow || (field.align || "left") != (align || "left")) {
			part = [];
			row.parts.push(part);
		}
		if ((field.height || 0) > (row.height || 0)) {
			row.height = field.height;
		}
		part.push(field);
		align = field.align;
	}
};

Jui.option.List.prototype.loadData = function(json)
{
	var me = this;
	me.element.innerHTML = "";
	me.appendData(json);
};

Jui.option.List.prototype.appendData = function(json)
{
	if (json == null) {
		json = [];
	}
	var me = this;
	var buffer = [];
	var group = null;
	var firstOfGroup = this.length() == 0;
	for (var i = 0; i < json.length; ++i) {
		var record = json[i];
		if (!Jui.string.isEmpty(record.group) && record.group != group) {
			group = record.group;
			buffer.push("<div class=JuiListGroup>");
			buffer.push(Jui.$h(group));
			buffer.push("</div>");
			firstOfGroup = true;			
		}
		buffer.push("<div class=JuiListItem onclick=Jui.option.List.doRowClick()");
		if (firstOfGroup) {
			buffer.push(" FirstOfGroup");
			firstOfGroup = false;
		}
		buffer.push(">");
		buffer.push(me._getRowHtml(record));
		buffer.push("</div>");
	}
	Jui.dom.insertHtml(me.element, "BeforeEnd", buffer.join(""));
	var count = 0;
	for (var elem = me.element.lastChild; elem != null; elem = elem.previousSibling) {
		if (count >= json.length) {
			break;
		}
		if (/JuiListItem/.test(elem.className)) {
			++count;
			elem._json = Jui.util.clone(json[json.length - count]);
			elem.onclick = Jui.option.List.doRowClick;
		}
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.option.List.doRowClick = function()
{
	var row = Jui.dom.getAncestorByClassName("JuiListItem");
	var me = Jui.$owner();
	var json = row._json;
	var eventObject = {
		id		: json[me._keyField],
		name	: json[me._nameField],
		data	: Jui.util.clone(json)
	};
	for (var i = 0, elems = me.element.getElementsByClassName("JuiListItem"); i < elems.length; ++i) {
		if (elems[i] == row) {
			eventObject.index = i;
		}
	}
	me.fireEvent("onclick", eventObject);
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.option.List._defaultRowHtmlGenerator = function(record)
{
	var me = this;
	var buffer = [];
	buffer.push("<div class=JuiListItemIcon><img src='" + (record.icon || me._icon) + "'></div>");
	buffer.push("<div class=JuiListItemData>");
	var ignoreFieldNames = {};
	for (var i = 0; i < me._titleRows.length; ++i) {
		var row = me._titleRows[i];
		buffer.push("<div class=JuiListItemDataRow>");
		for (var j = 0; j < row.parts.length; ++j) {
			var fields = row.parts[j];
			buffer.push("<div>");
			for (var k = 0; k < fields.length; ++k) {
				var field = fields[k];
				if (field.name in ignoreFieldNames) {
					continue;
				}
				var className = i == 0 && j == 0 && k == 0 ? "JuiListItemTitle" : "JuiListItemText";
				var text = Jui.option.List._getFieldText(field, fields[k + 1], record, ignoreFieldNames);
				if (!Jui.string.isEmpty(text)) {
					buffer.push("<div class=" + className + ">");
					buffer.push(text);
					buffer.push("</div>");
				}
			}
			buffer.push("</div>");
		}
		buffer.push("</div>");
	}
	buffer.push("</div>");
	return buffer.join("");
};

Jui.option.List._getFieldText = function(field, nextField, record, ignoreFieldNames)
{
	var value = record[field.name];
	if (nextField != null && field.followingField == nextField.name) {
		if (Jui.string.isEmpty(field.formatTemplate) && Jui.string.isEmpty(nextField.formatTemplate)) {
			ignoreFieldNames[nextField.name] = 1;
			return (value || "?") + " - " + (record[nextField.name] || "?");
		}
	}
	if (!Jui.string.isEmpty(value) && !Jui.string.isEmpty(field.formatTemplate)) {
		return field.formatTemplate.replace("${0}", value);
	}
	return value || "";
};
