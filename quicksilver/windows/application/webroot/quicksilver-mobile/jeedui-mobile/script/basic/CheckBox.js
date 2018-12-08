Jui.$define("Jui.basic.CheckBox", Jui.basic.Box);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.CheckBox.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "CheckBox");
	return	"<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + ">"
		+		"<div class=JuiCheckBoxSwitch><div></div></div>"
		+ 	"</div>";
};

Jui.basic.CheckBox.initialize = function(element, args, clazz)
{
	args		= args || {};
	clazz		= clazz || this;
	var me		= this.superClass.initialize(element, args, clazz);
	me._face	= args.face || "CheckBox";

	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.CheckBox.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.CheckBox.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 					= this;
	disabled 				= me.isDisabled();
	var switcher			= me.element.firstChild;
	if (Jui.browser.isTouchDevice()) {
		switcher.ontouchstart	= disabled ? null : me.$class.doTouchStart;
		switcher.ontouchend		= disabled ? null : me.$class.doTouchEnd;
	}
	else {
		switcher.onclick		= disabled ? null : me.$class.doClick;
	}
};

Jui.basic.CheckBox.prototype.focus = function()
{
};

Jui.basic.CheckBox.prototype.getValue = function()
{
	return this.element.hasAttribute("checked");
};

Jui.basic.CheckBox.prototype.setValue = function(value)
{
	Jui.dom.tagAttribute(this.element, "checked", Jui.cast.toBool(value, false));
};

Jui.basic.CheckBox.prototype.toText = function(value)
{
	//TODO
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.CheckBox.doClick = function()
{
	var switcher = Jui.dom.getAncestorByClassName("JuiCheckBoxSwitch");
	if (switcher == null) {
		return;
	}
	var me = Jui.$owner();
	var rect = switcher.getBoundingClientRect();
	var x = event.clientX - rect.left;
	var checked = me.getValue();
	if (checked && x < rect.width / 2) {
		me.element.removeAttribute("checked");
	} 
	else if (!checked && x > rect.width / 2) {
		me.element.setAttribute("checked", true);
	}
};

Jui.basic.CheckBox.doTouchStart = function()
{
	var touch = event.touches[0];
	var switcher = Jui.dom.getAncestorByClassName("JuiCheckBoxSwitch", touch.target);
	if (switcher == null) {
		return;
	}
	var me = Jui.$owner(touch.target);
	var rect = switcher.getBoundingClientRect();
	var x = touch.clientX - rect.left;
	var checked = me.getValue();
	if (checked && x < rect.width / 2) {
		me.element.removeAttribute("checked");
	} 
	else if (!checked && x > rect.width / 2) {
		me.element.setAttribute("checked", true);
	}
};

Jui.basic.CheckBox.doTouchEnd = function()
{
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------
