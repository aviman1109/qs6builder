Jui.$define("Jui.basic.DateBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.DateBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "DateBox");
	var elemClass	= cssClass + " " + cssClass.replace("DateBox", "Combo"); 
	var icon		= Jui.theme.getPath("image/DropRight.png");
	return	"<div" + Jui.$p({"class":elemClass, id:id, style:args.style}) + ">"
		+		"<input readonly>"
		+		"<div class=JuiDateBoxIcon><img src='" + icon + "'></div>"
		+ 	"</div>";
};

Jui.basic.DateBox.initialize = function(element, args, clazz)
{
	args				= args || {};
	clazz				= clazz || this;
	var me				= this.superClass.initialize(element, args, clazz);
	me._face			= args.face || "DateBox";
	me._cssClass		= "Jui" + (args.face || "DateBox");
	me._input			= element.firstChild;
	me._icon			= element.lastChild;
	me._value			= "";
	me.onselect			= args.onselect;

	me.setEmptyText(args.emptyText);
	me.setFormat(args.format);
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.DateBox.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.DateBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 				= this;
	disabled 			= me.isDisabled();
	me._input.onclick	= disabled ? null : me.$class.doInputClick;
	me._icon.onclick	= disabled ? null : me.$class.doIconClick;
};

Jui.basic.DateBox.prototype.focus = function()
{
	this.fireEvent("onsetfocus");
	this._input.focus();
};

Jui.basic.DateBox.prototype.getValue = function()
{
	return this._value;
};

Jui.basic.DateBox.prototype.setValue = function(value)
{
	if (typeof(value) == "number") {
		value = new Date(value);
	}
	this._setValue(value);
};

Jui.basic.DateBox.prototype.toText = function(value, text)
{
};

Jui.basic.DateBox.prototype.setEmptyText = function(emptyText)
{
	this._input.placeholder = emptyText || "";
};

Jui.basic.DateBox.prototype.getFormat = function(format)
{
	return this._format;
};

Jui.basic.DateBox.prototype.setFormat = function(format)
{
	var me 				= this;
	var oldFormat		= me._format;
	me._format			= format || "yyyy-MM-dd HH:mm";
	me._input.maxLength	= me._format.length;
	if (me._format != oldFormat && !Jui.string.isEmpty(me._input.value)) {
		me._setValue(me._input.value);
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.DateBox.doInputClick = function()
{
	var me = Jui.$owner();
	me.fireEvent("onselect");
};

Jui.basic.DateBox.doIconClick = function()
{
	var me = Jui.$owner();
	me.fireEvent("onselect");
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.DateBox.prototype._setValue = function(value, fireEvent)
{
	var me = this;
	var old = me._value;
	me._value = value == null ? null : (Jui.cast.toDate(value) || me._value);
	me._input.value = me._value == null ? "" : Jui.cast.toString(me._value, me._format);
	if (fireEvent && Jui.cast.toString(old, me._format) != Jui.cast.toString(me._value, me._format)) {
		me.fireEvent("onchange");
	}
};
