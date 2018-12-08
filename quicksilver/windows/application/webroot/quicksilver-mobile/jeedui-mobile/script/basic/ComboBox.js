Jui.$define("Jui.basic.ComboBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.ComboBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "ComboBox");
	var elemClass	= cssClass + " " + cssClass.replace("ComboBox", "Combo"); 
	var icon		= Jui.theme.getPath("image/DropRight.png");
	return	"<div" + Jui.$p({"class":elemClass, id:id, style:args.style}) + ">"
		+		"<input" + (args.type == "password" ? " type=password" : "") + ">"
		+		"<div class=JuiComboBoxIcon><img src='" + icon + "'></div>"
		+ 	"</div>";
};

Jui.basic.ComboBox.initialize = function(element, args, clazz)
{
	args				= args || {};
	clazz				= clazz || this;
	var me				= this.superClass.initialize(element, args, clazz);
	me._face			= args.face || "ComboBox";
	me._cssClass		= "Jui" + (args.face || "ComboBox");
	me._input			= element.firstChild;
	me._icon			= element.lastChild;
	me._groups			= [];
	me._value			= "";
	me.onselect			= args.onselect;

	me.loadItems(args.items);
	me.setEmptyText(args.emptyText);
	me.setMaxLength(args.maxLength);
	me.setDropOnly(args.dropOnly);
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.ComboBox.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.ComboBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 				= this;
	disabled 			= me.isDisabled();
	me._input.readOnly	= disabled || me.isDropOnly();
	me._input.onfocus	= disabled ? null : me.$class.doInputFocus;
	me._input.onblur	= disabled ? null : me.$class.doInputBlur;
	me._input.onchange	= disabled ? null : me.$class.doInputChange;
	me._input.onclick	= disabled ? null : me.$class.doInputClick;
	me._icon.onclick	= disabled ? null : me.$class.doIconClick;
};

Jui.basic.ComboBox.prototype.isDropOnly = function()
{
	return this._dropOnly;
};

Jui.basic.ComboBox.prototype.setDropOnly = function(dropOnly)
{
	var me = this;
	me._dropOnly = Jui.cast.toBool(dropOnly, true);
	me._input.readOnly = me._dropOnly || me.isDisabled();
};

Jui.basic.ComboBox.prototype.focus = function()
{
	this.fireEvent("onsetfocus");
	this._input.focus();
};

Jui.basic.ComboBox.prototype.getItems = function()
{
	return Jui.util.clone(this._items);
};

Jui.basic.ComboBox.prototype.getGroups = function()
{
	return Jui.util.clone(this._groups);
};

Jui.basic.ComboBox.prototype.loadItems = function(json, clearIfCurrentValueNotExist)
{
	var me = this;
	var groups = Jui.util.clone(json) || [];
	me._items = groups;
	me._map = {};
	if (groups.length > 0 && groups[0].items == null) {
		groups = [{items:groups}];
	}
	for (var i = 0; i < groups.length; ++i) {
		var items = groups[i].items;
		for (var j = items.length - 1; j >= 0; --j) {
			var item = items[j];
			if (!("value" in item)) {
				item.value = item.text;
			}
			if (!("text" in item)) {
				item.text = item.value;
			}
			me._map[item.value] = item.text;
			if (item.disabled == true) {
				items.splice(j, 1);
			}
		}
	}
	var value = Jui.string.trim(me.getValue());
	if (value != null && !(value in me._map) && clearIfCurrentValueNotExist) {
		me._setValue();
	}
	else if (value != null && value in me._map && me.getText() != me._map[value]) {
		me._setValue(value, me._map[value]);
	}
	me._groups = groups;
};

Jui.basic.ComboBox.prototype.getValue = function()
{
	return this._value;
};

Jui.basic.ComboBox.prototype.setValue = function(value, text)
{
	value = Jui.string.trim(Jui.cast.toString(value));
	if (value in this._map) {
		this._setValue(value, this._map[value]);
	}
	else if (text != null) {
		this._setValue(value, text);
	}
	else {
		this._setValue(null, value);
	}
};

Jui.basic.ComboBox.prototype.toText = function(value, text, showZeroValue)
{
};

Jui.basic.ComboBox.prototype.setEmptyText = function(emptyText)
{
	this._input.placeholder = emptyText || "";
};

Jui.basic.ComboBox.prototype.setMaxLength = function(maxLength)
{
	var len = parseInt(maxLength);
	if (!isNaN(len)) {
		this._input.maxLength = len <= 0 ? 0x7FFFFFFF : len;
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.ComboBox.doInputFocus = function()
{
};

Jui.basic.ComboBox.doInputBlur = function()
{
};

Jui.basic.ComboBox.doInputChange = function()
{
	var me = Jui.$owner();
	me._setValue(me._input.value, true);
};

Jui.basic.ComboBox.doInputClick = function()
{
	var me = Jui.$owner();
	if (me.isDropOnly()) {
		me.fireEvent("onselect");
	}
};

Jui.basic.ComboBox.doIconClick = function()
{
	var me = Jui.$owner();
	me.fireEvent("onselect");
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.ComboBox.prototype._setValue = function(value, text)
{
	var me = this;
	me._value = value;
	me._input.value = text == null ? "" : text;
};
