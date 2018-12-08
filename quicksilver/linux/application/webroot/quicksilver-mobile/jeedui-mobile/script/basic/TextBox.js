Jui.$define("Jui.basic.TextBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.TextBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "TextBox");
	return	"<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + ">"
		+		"<textarea" + Jui.$p({wrap:args.wrap}) + "></textarea>"
		+ 	"</div>";
};

Jui.basic.TextBox.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me._face		= args.face || "TextBox";
	me._textarea	= element.firstChild;
	me.onchange		= args.onchange;
	me.onkeydown	= args.onkeydown;
	me.onsetfocus	= args.onsetfocus;

	me.setEmptyText(args.emptyText);
	me.setMaxLength(args.maxLength);
	me.setHtml(Jui.cast.toBool(args.isHtml, false));
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.TextBox.prototype.focus = function()
{
	this.fireEvent("onsetfocus");
	this._textarea.focus();
};

Jui.basic.TextBox.prototype.setEmptyText = function(emptyText)
{
	this._textarea.placeholder = emptyText || "";
};

Jui.basic.TextBox.prototype.isHtml = function()
{
	return this._isHtml;
};

Jui.basic.TextBox.prototype.setHtml = function(isHtml)
{
	var me = this;
	me._isHtml = Jui.cast.toBool(isHtml, false);
};

Jui.basic.TextBox.prototype.getMaxLength = function()
{
	return this._textarea.maxLength;
};

Jui.basic.TextBox.prototype.setMaxLength = function(maxLength)
{
	var len = parseInt(maxLength);
	if (!isNaN(len)) {
		this._textarea.maxLength = len;
	}
};

Jui.basic.TextBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 					= this;
	disabled 				= me.isDisabled();
	me._textarea.readOnly	= disabled; 
	me._textarea.onfocus	= disabled ? null : me.$class.doFocus;
	me._textarea.onblur		= disabled ? null : me.$class.doBlur;
	me._textarea.onchange	= disabled ? null : me.$class.doChange;
	me._textarea.onkeydown	= disabled ? null : me.$class.doKeyDown;
};

Jui.basic.TextBox.prototype.getSelectedText = function()
{
	var textarea = this._textarea;
	if (textarea.selectionEnd > textarea.selectionStart + 1) {
		return textarea.value.substring(textarea.selectionStart, textarea.selectionEnd);
	}
};

Jui.basic.TextBox.prototype.getValue = function()
{
	return this._textarea.value;
};

Jui.basic.TextBox.prototype.setValue = function(value)
{
	this._textarea.value = value == null ? "" : value;
};

Jui.basic.TextBox.prototype.toText = function(value)
{
	if (value == null) {
		return "";
	}
	var s = value.replace(/\n+/g, " ");
	return this._isHtml ? s.replace(/<[^>]*>/g, "") : s;
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.TextBox.doFocus = function()
{
};

Jui.basic.TextBox.doBlur = function()
{
};

Jui.basic.TextBox.doChange = function()
{
	Jui.$owner().fireEvent("onchange");
};

Jui.basic.TextBox.doKeyDown = function()
{
	Jui.$owner().fireEvent("onkeydown");
};
