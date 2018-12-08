Jui.$define("Jui.basic.EntityBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.EntityBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "EntityBox");
	var elemClass	= cssClass + " " + cssClass.replace("EntityBox", "Combo"); 
	var icon		= Jui.theme.getPath("image/DropRight.png");
	return	"<div" + Jui.$p({"class":elemClass, id:id, style:args.style}) + ">"
		+		"<input" + (args.type == "password" ? " type=password" : "") + ">"
		+		"<div class=JuiEntityBoxIcon><img src='" + icon + "'></div>"
		+ 	"</div>";
};

Jui.basic.EntityBox.initialize = function(element, args, clazz)
{
	args				= args || {};
	clazz				= clazz || this;
	var me				= this.superClass.initialize(element, args, clazz);
	me._face			= args.face || "EntityBox";
	me._cssClass		= "Jui" + (args.face || "EntityBox");
	me._input			= element.firstChild;
	me._icon			= element.lastChild;
	me._value			= "";
	me.onselect			= args.onselect;

	me.setEmptyText(args.emptyText);
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setEntityType(args.entityType);
	me.setAcceptPureText(args.acceptPureText);
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.EntityBox.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.EntityBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 				= this;
	disabled 			= me.isDisabled();
	me._input.readOnly	= disabled || !me.isAcceptPureText();
	me._input.onchange	= disabled ? null : me.$class.doInputChange;
	me._input.onclick	= disabled ? null : me.$class.doInputClick;
	me._icon.onclick	= disabled ? null : me.$class.doIconClick;
};

Jui.basic.EntityBox.prototype.focus = function()
{
	this.fireEvent("onsetfocus");
	this._input.focus();
};

Jui.basic.EntityBox.prototype.getValue = function()
{
	return this._value;
};

Jui.basic.EntityBox.prototype.setValue = function(value, text)
{
	if (value != null && typeof(value) == "object") {
		text = value.text;
		value = value.value;
	}
	var me = this;
	me._value = value || null;
	me._input.value = text || "";
};

Jui.basic.EntityBox.prototype.getText = function()
{
	return this._input.value;
};

Jui.basic.EntityBox.prototype.toText = function(value, text)
{
};

Jui.basic.EntityBox.prototype.setEmptyText = function(emptyText)
{
	this._input.placeholder = emptyText || "";
};

Jui.basic.EntityBox.prototype.getEntityType = function()
{
	return this._entityType;
};

Jui.basic.EntityBox.prototype.setEntityType = function(entityType)
{
	var me = this;
	me._entityType = entityType;
};

Jui.basic.EntityBox.prototype.isAcceptPureText = function()
{
	return this._acceptPureText;
};

Jui.basic.EntityBox.prototype.setAcceptPureText = function(acceptPureText)
{
	var me = this;
	me._acceptPureText = acceptPureText;
	me._input.readOnly	= me.isDisabled() || !me.isAcceptPureText();
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.EntityBox.doInputChange = function()
{
	var me = Jui.$owner();
	me._setValue(me._input.value, true);
};

Jui.basic.EntityBox.doInputClick = function()
{
	var me = Jui.$owner();
	if (!me.isAcceptPureText()) {
		me.fireEvent("onselect");
	}
};

Jui.basic.EntityBox.doIconClick = function()
{
	var me = Jui.$owner();
	me.fireEvent("onselect");
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.EntityBox.prototype._setValue = function(value, text)
{
	var me = this;
	me._value = value;
	me._input.value = text == null ? "" : text;
};
