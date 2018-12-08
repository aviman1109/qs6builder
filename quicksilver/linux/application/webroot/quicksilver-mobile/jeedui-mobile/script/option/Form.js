Jui.$define("Jui.option.Form", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.option.Form.getHtml = function(args, clazz)
{
	args = args || {};
	return	"<div class=JuiForm" + Jui.$p({style:args.style}) + ">"
		+	"</div>";
};

Jui.option.Form.initialize = function(element, args, clazz)
{
	args						= args || {};
	clazz						= clazz || this;
	var me						= this.superClass.initialize(element, args, clazz);
	me._map						= {};
	me._list					= [];
	me._record					= {};
	me._comboBoxSelectHandler	= args.comboBoxSelectHandler;
	me._dateBoxSelectHandler	= args.dateBoxSelectHandler;
	me._entityBoxSelectHandler	= args.entityBoxSelectHandler;
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.option.Form.prototype.clear = function()
{
	var me = this;
	for (var fieldName in me._map) {
		var box = me._map[fieldName].box;
		if (box.setValue != null) {
			box.setValue();
		}
	}
	me._record = {};
};

Jui.option.Form.prototype.load = function(json)
{
	this.loadTitle(json.title);
	this.loadData(json.data);
};

Jui.option.Form.prototype.loadTitle = function(json)
{
	var me				= this;
	var buffer			= [];
	var map				= {};
	var group			= null;
	var firstOfGroup	= true;
	var controlsNoTitle = Jui.array.toSet(["Label", "Button", "ComboButton"]);
	for (var i = 0; i < json.length; ++i) {
		var field = json[i];
		var thisGroup = field.group || field.group2 || field.group1;
		if (i == 0 || thisGroup != group) {
			if (i > 0) {
				buffer.push("</div>");
			}
			buffer.push("<div class=JuiFormGroup>");
			group = thisGroup;
			firstOfGroup = true;
			if (!Jui.string.isEmpty(group)) {
				buffer.push("<div class=JuiFormGroupTitle unselectable=on>" + Jui.$h(group) + "</div>");
			}
		}

		if (field.control == "HtmlBox") {
			field.control = "TextBox";
		}
		else if (field.control != "InputBox" && field.control != "CheckBox" && field.control != "ComboBox"
			&& field.control != "TextBox" && field.control != "EntityBox" && field.control != "DateBox"
			&& field.control != "Button" && field.control != "ComboButton") {
			field.control = "InputBox";
		}
		if (field.face == null) {
			field.face = "Form" + field.control;
		}
		var clazz = Jui.basic[field.control] || Jui.option[field.control];
		map[field.name] = field;
		var hasTitle = Jui.cast.toBool(field.hasTitle, !(field.control in controlsNoTitle));
		var className = hasTitle ? "JuiFormItem" : "JuiFormItem JuiFormItemWithoutTitle";
		buffer.push("<div class='" + className + "' name=" + field.name);
		if (firstOfGroup) {
			buffer.push(" firstOfGroup");
		}
		if (field.required) {
			buffer.push(" required");
		}
		if (field.disabled) {
			buffer.push(" disabled");
		}
		if (field.rowSpan > 1) {
			buffer.push(" style='height:" + (field.rowSpan * Jui.theme["Form.RowHeight"] + 1) + "px'");
		}
		buffer.push(">");
		buffer.push(	"<div class=JuiFormItemTitle unselectable=on>");
		buffer.push(		"<span>" + field.title + "</span>");
		buffer.push(	"</div>");
		buffer.push(	"<div class=JuiFormItemControl>");
		buffer.push(	    clazz.getHtml(field));
		buffer.push(	"</div>");
		buffer.push("</div>");
		firstOfGroup = false;
	}
	if (json.length > 0) {
		buffer.push("</div>");
	}
	me.element.innerHTML = buffer.join("");
	for (var i = 0, elems = me.element.getElementsByClassName("JuiFormItem"); i < elems.length; ++i) {
		var elem		= elems[i];
		var fieldName	= elem.getAttribute("name");
		var field		= map[fieldName];
		var clazz		= Jui.basic[field.control] || Jui.option[field.control];
		var box			= clazz.initialize(elem.lastChild.firstChild, field);
		if (box instanceof Jui.basic.ComboBox) {
			box.onselect = box.onselect || me._comboBoxSelectHandler;
		}
		else if (box instanceof Jui.basic.DateBox) {
			box.onselect = box.onselect || me._dateBoxSelectHandler;
		}
		else if (box instanceof Jui.basic.EntityBox) {
			box.onselect = box.onselect || me._entityBoxSelectHandler;
		}
		var info = Jui.object.merge({box:box}, field);
		me._map[fieldName] = info;
		me._list.push(info);
	}
};

Jui.option.Form.prototype.loadData = function(json)
{
	this.clear();
	this.updateData(json);
};

Jui.option.Form.prototype.updateData = function(json)
{
	Jui.object.merge(this._record, json);
	for (var fieldName in this._map) {
		var info = this._map[fieldName];
		if (fieldName in json || info.acceptPureText && (info.textField in json)) {
			info.box.setValue(json[fieldName], json[info.textField]);
		}
	}
};

Jui.option.Form.prototype.validate = function(showMessage)
{
	var me = this;
	for (var fieldName in me._map) {
		var info = me._map[fieldName];
		var box = info.box;
		if (!box.getValue) {
			continue;
		}
		var value = box.getValue();
		if (me.isFieldRequired(fieldName) && !box.isDisabled() && Jui.string.isEmpty(value)) {
			if (!info.acceptPureText || Jui.string.isEmpty(box.getText())) {
				me._showValidationMessage(showMessage, info, "Jui.BackForm.RequiredAlert");
				return false;
			}
		}
		var maxLength = info.maxLength > 0 ? info.maxLength : 0x7FFFFFFF;
		//var text = box instanceof Jui.option.Grid ? JSON.stringify(value) : value;
		var text = value;
		if (typeof(text) == "string" && text.length > maxLength) {
			me._showValidationMessage(showMessage, info, "Jui.BackForm.ValueTooLong");
			return false;
		}
		if (!Jui.string.isEmpty(value)) {
			var reg = null;
			if (!Jui.string.isEmpty(info.validation)) {
				var s = ("^" + info.validation + "$").replace(/^\^+/, "^").replace(/\$+$/, "$");
				reg = new RegExp(s); 
			}
			else if (box instanceof Jui.basic.InputBox) {
				if (box.getType() == "phone") {
					reg = /^\s*[0-9()#+-]+\s*$/;
				}
				else if (box.getType() == "email") {
					reg = /^\s*[\w\d-_\.]+@[\w\d-_\.]+\s*$/;
				}
			} 
			if (reg != null && !reg.test(value)) {
				me._showValidationMessage(showMessage, info, "Jui.BackForm.RegExpAlert");
				return false;
			}
			/*
			if (box instanceof Jui.basic.MultiCheckBox) {
				var capacity = box.getArgs().capacity;
				if (capacity > 0 && box.getValues().length > capacity) {
					var code = "Jui.BackForm.MultiCheckBox.TooManyItems";
					var message = Utility.formatText(code, info.title, capacity);
					me._showValidationMessage(showMessage, info, message);
					return false;
				}
			}
			*/
		}
	}
	return true;
};

Jui.option.Form.prototype.getData = function()
{
	var data = {};
	for (var fieldName in this._map) {
		var info = this._map[fieldName];
		var box = info.box;
		if (box.getValue) {
			var value = box.getValue();
			if (box instanceof Jui.basic.InputBox && typeof(value) == "string") {
				value = Jui.string.trim(value);
			}
			data[fieldName] = value;
			//if (box instanceof Jui.basic.EntityBox || box instanceof Jui.basic.MultiEntityBox) {
			if (box instanceof Jui.basic.EntityBox) {
				data[info.textField] = box.getText();
			}
		}
	}
	return Jui.object.merge(data, this._record);
};

Jui.option.Form.prototype.isFieldRequired = function(fieldName)
{
	return false;
};

Jui.option.Form.prototype.getFieldValue = function(fieldName)
{
	if (fieldName in this._map) {
		var box = this._map[fieldName].box;
		return box.getValue == null ? null : box.getValue();
	}
	else {
		return this._record[fieldName];
	}
};

Jui.option.Form.prototype.setFieldValue = function(fieldName, value, text)
{
	if (fieldName in this._map) {
		this.box(this._map[fieldName].box, value, text);
	}
	else {
		this._record[fieldName] = value;		
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.option.Form.prototype._setBoxValue = function(box, value, text)
{
	if (box.setValue) {
		box.setValue(value, text);
	}
};
