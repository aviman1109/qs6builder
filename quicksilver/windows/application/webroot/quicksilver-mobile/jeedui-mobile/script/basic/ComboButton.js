Jui.$define("Jui.basic.ComboButton", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.ComboButton.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "ComboButton");
	var elemClass	= cssClass + " " + cssClass.replace("ComboButton", "Combo"); 
	var icon		= Jui.theme.getPath("image/DropRight.png");
	return	"<div" + Jui.$p({"class":elemClass, id:id, style:args.style}) + " unselectable=on>"
		+		"<div>" + Jui.$h(args.text) + "</div>"
		+		"<div class=JuiComboButtonIcon><img src='" + icon + "'></div>"
		+ 	"</div>";
};

Jui.basic.ComboButton.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me._face		= args.face || "ComboButton";
	me._cssClass	= "Jui" + (args.face || "ComboButton");
	me._text		= element.firstChild;
	me._icon		= element.lastChild;
	me.onclick		= args.onclick;

	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.ComboButton.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.ComboButton.prototype.setDisabled = function(disabled)
{
	Jui.basic.Box.prototype.setDisabled.call(this, disabled);
	var me 				= this;
	disabled 			= me.isDisabled();
	me.element.onclick	= disabled ? null : me.$class.doClick;
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.ComboButton.doClick = function()
{
	var me = Jui.$owner();
	me.fireEvent("onclick");
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------
