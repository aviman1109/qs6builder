Jui.$define("Jui.basic.InputBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.InputBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "InputBox");
	return	"<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + ">"
		+		"<input" + (args.type == "password" ? " type=password" : "") + ">"
		+ 	"</div>";
};

Jui.basic.InputBox.initialize = function(element, args, clazz)
{
	args					= args || {};
	clazz					= clazz || this;
	var me					= this.superClass.initialize(element, args, clazz);
	me._face				= args.face || "InputBox";
	me._input				= element.firstChild;
	me.onlinkclick			= args.onlinkclick || Jui.basic.InputBox._defaultLinkClickHandler;
	me._input.onclick		= me.$class.doInputClick;
	me._value				= "";

	me.setAlign(args.align);
	me.setBackgroundColor(args.backgroundColor);
	me.setEmptyAsNull(Jui.cast.toBool(args.emptyAsNull, false));
	me.setEmptyText(args.emptyText);
	me.setMaxLength(args.maxLength);
	me.setType(args.type);
	me.setScale(args.scale);
	me.setFormat(args.format);
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setValue(args.value);
	return me;
};

Jui.basic.InputBox.getPhoneClickHandler = function()
{
	return Jui.basic.InputBox._phoneClickHandler;
};

Jui.basic.InputBox.setPhoneClickHandler = function(handler)
{
	Jui.basic.InputBox._phoneClickHandler = handler;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.InputBox.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.InputBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 					= this;
	disabled 				= me.isDisabled();
	me.element.onclick		= disabled ? null : me.$class.doClick; 
	me._input.readOnly		= disabled;
	me._input.onfocus		= disabled ? null : me.$class.doInputFocus;
	me._input.onblur		= disabled ? null : me.$class.doInputBlur;
	me._input.onchange		= disabled ? null : me.$class.doInputChange;
};

Jui.basic.InputBox.prototype.isNumberType = function()
{
	return this._type in Jui.basic.InputBox._numberTypes;
};

Jui.basic.InputBox.prototype.isLinkType = function()
{
	return this._type in Jui.basic.InputBox._linkTypes;
};

Jui.basic.InputBox.prototype.focus = function()
{
	this.fireEvent("onsetfocus");
	this._input.focus();
};

Jui.basic.InputBox.prototype.getValue = function()
{
	var value = this._input.value;
	if (this.isNumberType()) {
		value = value.replace(/,/g, "");
		return Jui.string.isEmpty(value) ? null : value;
	}
	else {
		return this._emptyAsNull && value == ""  ? null : value;
	}
};

Jui.basic.InputBox.prototype.getNumberValue = function()
{
	var value = parseFloat(this.getValue());
	return isNaN(value) ? 0 : value;
};

Jui.basic.InputBox.prototype.setValue = function(value)
{
	this._setValue(value, false);
};

Jui.basic.InputBox.prototype.toText = function(value, text, showZeroValue)
{
	if (this.isNumberType()) {
		value = Jui.cast.toNumber(value);
		if (!showZeroValue && (value == null || value == 0)) {
			return "";
		}
		value = Jui.cast.toString(value, this._format);
		return this._type == "percent" ? value + "%" : value;
	}
	else if (this._type == "password") {
		return Jui.string.isEmpty(value) ? "" : "******";
	}
	else {
		return value == null ? "" : Jui.string.trim((value + "").replace(/\n+/g, " "));
	}
};

Jui.basic.InputBox.prototype.setAlign = function(align)
{
	if (!Jui.string.isEmpty(align)) {
		this._input.style.textAlign = align;
	}
};

Jui.basic.InputBox.prototype.setBackgroundColor = function(color)
{
	if (!Jui.string.isEmpty(color)) {
		this.element.style.backgroundColor = color;
	}
};

Jui.basic.InputBox.prototype.setFormat = function(format)
{
	var me = this;
	var oldFormat = me._format;
	if (!Jui.string.isEmpty(format)) {
		me._format = format;
	}
	else if (me._type == "int" || me._type == "bigint") {
		me._format = "#,##0";
	}
	else if (me.isNumberType()) {
		me._format = me._scale == 0 ? "#,##0" : "#,##0." + Jui.string.repeat("0", me._scale);
	}
	if (me._format != oldFormat && me.isNumberType() && !Jui.string.isEmpty(me._input.value)) {
		me._setValue(me._input.value);
	}
};

Jui.basic.InputBox.prototype.setEmptyAsNull = function(emptyAsNull)
{
	var me = this;
	me._emptyAsNull = Jui.cast.toBool(emptyAsNull, true); 
};

Jui.basic.InputBox.prototype.setEmptyText = function(emptyText)
{
	this._input.placeholder = emptyText || "";
};

Jui.basic.InputBox.prototype.setMaxLength = function(maxLength)
{
	var len = parseInt(maxLength);
	if (!isNaN(len)) {
		this._input.maxLength = len <= 0 ? 0x7FFFFFFF : len;
	}
};

Jui.basic.InputBox.prototype.getType = function()
{
	return this._type;
};

Jui.basic.InputBox.prototype.setType = function(type)
{
	var me = this;
	var oldType = me._type;
	me._type = type || "string";
	me.element.setAttribute("type", Jui.basic.InputBox._elementTypeMap[me._type] || "");
	if (me._type != oldType && me.isNumberType() && !Jui.string.isEmpty(me._input.value)) {
		me._setValue(me._input.value);
	}
};

Jui.basic.InputBox.prototype.setScale = function(scale)
{
	var me = this;
	var oldScale = me._scale;
	me._scale = Math.min(10, Math.max(0, typeof(scale) == "number" ? scale : 2));
	if (me._scale != oldScale && me.isNumberType() && !Jui.string.isEmpty(me._input.value)) {
		me._setValue(me._input.value);
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.InputBox.doClick = function()
{
	Jui.$owner()._input.focus();
};

Jui.basic.InputBox.doInputFocus = function()
{
	Jui.$owner(this).$addElementClass("Focused");
};

Jui.basic.InputBox.doInputBlur = function()
{
	var me = Jui.$owner(this);
	me.$removeElementClass("Focused");
	if (me.isNumberType()) {
		me._setValue(me._input.value, true);
	}
};

Jui.basic.InputBox.doInputChange = function()
{
	var me = Jui.$owner();
	me._setValue(me._input.value, true);
};

Jui.basic.InputBox.doInputKeyDown = function()
{
	var me = Jui.$owner();
	if (event.keyCode == 27) {
		if (Jui.browser.mozilla) {
			me._input.blur();
		}
		me._setValue(null, true);
		if (Jui.browser.mozilla) {
			me._input.focus();
		}
	}
	if (event.keyCode == 13 && Jui.browser.ie) {
		me._setValue(me._input.value, true);
	}
	me.fireEvent("onkeydown", {keyCode:event.keyCode});
};

Jui.basic.InputBox.doInputKeyPress = function()
{
	/*
	 * 不同浏览器此处的表现不同：
	 * - 在 IE 下表现符合预期
	 * - 在 Firefox 下会导致方向键失灵（keyCode = 0）
	 * - 在 Chrome 下会导致 Enter 键失灵
	 * 所以暂时取消该功能
	var me = Jui.$owner();
	var c = event.keyCode;
	if (me._type == "int" || me._type == "bigint") {
		return (c >= 48 && c <= 57) || c == 44 || c == 45;
	}
	else if (me.isNumberType()) {
		return (c >= 48 && c <= 57) || c == 44 || c == 45 || c == 46;
	}
	*/
};

Jui.basic.InputBox.doInputClick = function()
{
	var me = Jui.$owner();
	if (!Jui.string.isEmpty(me._input.value) && me._input.style.cursor == "pointer") {
		me.fireEvent("onlinkclick");
	}
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.InputBox._numberTypes = Jui.array.toSet(["int", "bigint", "double", "percent"]);

Jui.basic.InputBox._linkTypes = Jui.array.toSet(["email", "url", "phone"]);

Jui.basic.InputBox._elementTypeMap =
{
	"int"		: "Number",
	"bigint"	: "Number",
	"double"	: "Number",
	"percent"	: "Percent",
	"email"		: "Email",
	"url"		: "Url",
	"phone"		: "Phone"
};

/* Fortify disallow this property declared directly in prior map */
Jui.basic.InputBox._elementTypeMap["password"] = "Password";

Jui.basic.InputBox._defaultLinkClickHandler = function()
{
	if (/Empty/.test(this.element.className)) {
		return;
	}
	else if (this._type == "url") {
		window.open(Jui.util.getFullUrl(this._input.value), "_blank");
	}
	else if (this._type == "email") {
		window.open("mailto:" + this._input.value);
	}
	else if (this._type == "phone" && Jui.basic.InputBox._phoneClickHandler != null) {
		Jui.basic.InputBox._phoneClickHandler(this._input.value);
	}
};

Jui.basic.InputBox.prototype._setValue = function(value, fireEvent)
{
	var me = this;
	var oldValue = me._value;
	if (me.isNumberType()) {
		value = Jui.cast.toNumber(value);
		if (me._type == "int" && value > 0x7FFFFFFF) {
			value = 0x7FFFFFFF;
		}
		me._input.value = value == null ? "" : Jui.cast.toString(value, me._format);
	}
	else {
		me._input.value = value || "";
	}
	me._value = me._input.value;
	if (fireEvent && oldValue != me._value) {
		me.fireEvent("onchange");
	}
};
