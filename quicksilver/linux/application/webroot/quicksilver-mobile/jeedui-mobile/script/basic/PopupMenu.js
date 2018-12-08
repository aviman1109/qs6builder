Jui.$define("Jui.basic.PopupMenu", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.PopupMenu.getHtml = function(args, clazz)
{
	args = args || {};
	return	"<div class=JuiPopupMenu" + Jui.$p({style:args.style}) + ">"
		+		"<div class=JuiPopupMenuMask></div>"
		+		"<div class=JuiPopupMenuOuter>"
		+			"<div class=JuiPopupMenuInner>"
		+				"<div class=JuiPopupMenuItemsPane></div>"
		+				"<div class=JuiPopupMenuCancelPane></div>"
		+			"</div>"
		+		"</div>"
		+	"</div>";
};

Jui.basic.PopupMenu.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	var panes		= element.lastChild.lastChild.children;
	me._mask		= element.firstChild;
	me._itemsPane	= panes[0];
	me._loadItems(panes[1], [{text:"取消"}], Jui.basic.PopupMenu.doCancelClick);
	return me;
};

Jui.basic.PopupMenu.getInstance = function()
{
	if (Jui.basic.PopupMenu._instance == null) {
		var popup = Jui.basic.PopupMenu.create({target:document.body});
		Jui.basic.PopupMenu._instance = popup;
	}
	return Jui.basic.PopupMenu._instance;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.PopupMenu.prototype.show = function(items, owner)
{
	var me = this;
	me._owner = owner;
	me._loadItems(me._itemsPane, items || [], Jui.basic.PopupMenu.doItemClick);
	me.element.style.display = "";
};

//-----------------------------------------------------------------------
// events
//-----------------------------------------------------------------------

Jui.basic.PopupMenu.doItemClick = function()
{
	var me = Jui.$owner();
	var elem = this;
	me._hide();
	if (elem._json.onclick != null) {
		Jui.util.execute(elem._json.onclick, me);
	}
	else {
		var eventObject = Jui.util.clone(elem._json);
		me.fireEvent("onclick", eventObject);
	}
	me._owner = null;
};

Jui.basic.PopupMenu.doCancelClick = function()
{
	var me = Jui.$owner();
	me._hide();
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.PopupMenu.prototype._hide = function()
{
	var me = this;
	me.element.style.display = "none";
};

Jui.basic.PopupMenu.prototype._loadItems = function(pane, items, handler)
{
	var buffer = [];
	for (var i = 0; i < items.length; ++i) {
		var item = items[i];
		buffer.push("<div class=JuiPopupMenuItem>");
		buffer.push(Jui.$h(item.text));
		buffer.push("</div>");
	}
	pane.innerHTML = buffer.join("");
	for (var i = 0; i < items.length; ++i) {
		var elem = pane.children[i];
		elem._json = items[i];
		elem.onclick = handler;
	}
};
