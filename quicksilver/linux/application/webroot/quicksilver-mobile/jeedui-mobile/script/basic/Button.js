Jui.$define("Jui.basic.Button", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.Button.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "Jui" + (args.face || "Button");
	var buffer		= [];
	buffer.push("<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + " unselectable=on>");
	if (!Jui.string.isEmpty(args.icon)) {
		buffer.push("<img class=JuiButtonIcon src='" + args.icon + "'>");
	}
	else {
		buffer.push("<div class=JuiButtonText>" + Jui.$h(args.text) + "</div>");
	}
	buffer.push("</div>");
	return buffer.join("");
};

Jui.basic.Button.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me._face		= args.face || "Button";
	me._items		= args.items;
	me._icon		= args.icon;
	me._text		= args.text;
	me._iconElem	= element.firstChild.tagName == "IMG" ? element.firstChild : null;
	me._textElem	= element.firstChild.tagName == "DIV" ? element.firstChild : null;
	me.onclick		= args.onclick;
	me.setDisabled(Jui.cast.toBool(args.disabled, false));
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.Button.prototype.setDisabled = function(disabled)
{
	var	me = this;
	Jui.basic.Control.prototype.setDisabled.call(me, disabled);
	me.element.onclick = me.isDisabled() ? null : me.$class.doClick;
};

Jui.basic.Button.prototype.getIcon = function()
{
	return this._icon;
};

Jui.basic.Button.prototype.setIcon = function(icon)
{
	var me = this;
	me._icon = icon;
	me._iconElem.src = icon;
};

Jui.basic.Button.prototype.getText = function()
{
	return this._text;
};

Jui.basic.Button.prototype.setText = function(text)
{
	var me = this;
	me._text = text;
	Jui.dom.setInnerText(me._textElem, text);
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.Button.doClick = function()
{
	var me = Jui.$owner();
	if (Jui.array.isEmpty(me._items)) {
		me.fireEvent("onclick", {id:me._id, name:me._name, text:me._text});
	}
	else {
		Jui.basic.PopupMenu.getInstance().show(me._items);
	}
};

Jui.basic.Button.doPopupItemClick = function(event)
{
	var me = this.getOwner();
	me.fireEvent("onclick", event);
};
