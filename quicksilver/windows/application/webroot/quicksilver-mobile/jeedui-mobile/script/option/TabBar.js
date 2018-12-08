Jui.$define("Jui.option.TabBar", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.option.TabBar.getHtml = function(args, clazz)
{
	args = args || {};
	return	"<div class=JuiTabBar" + Jui.$p({style:args.style}) + " unselectable=on>"
		+	"</div>";
};

Jui.option.TabBar.initialize = function(element, args, clazz)
{
	args					= args || {};
	clazz					= clazz || this;
	var me					= this.superClass.initialize(element, args, clazz);
	me._disabledIconPostfix	= args.disabledIconPostfox || "-Disabled";
	me._hasText				= Jui.cast.toBool(args.hasText, true);
	me._currentId			= null;
	me.onswitch				= args.onswitch;
	me.load(args.items);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.option.TabBar.prototype.load = function(items)
{
	var me = this;
	if (items == null) {
		items = [];
	}
	var buffer = [];
	for (var i = 0; i < items.length; ++i) {
		var item = items[i];
		buffer.push("<div class=JuiTabBarItem>");
		buffer.push("<div class=JuiTabBarItemIcon>");
		buffer.push("<img src='" + item.icon + "' style='display:none'>");
		buffer.push("<img src='" + me._getDisabledIcon(item.icon) + "'>");
		buffer.push("</div>");
		if (me._hasText) {
			buffer.push("<div class=JuiTabBarItemText>" + Jui.$h(item.text) + "</div>");
		}
		buffer.push("</div>");
	}
	me.element.innerHTML = buffer.join("");
	for (var i = 0; i < me.element.children.length; ++i) {
		var elem = me.element.children[i];
		elem.onclick = Jui.option.TabBar.doItemClick;
		elem._json = items[i];
	}
	me._items = items;
	if (items.length > 0) {
		me._setCurrentElem(me.element.children[0]);
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.option.TabBar.doItemClick = function()
{
	var me = Jui.$owner(this);
	var clickElem = Jui.dom.getAncestorByClassName("JuiTabBarItem");
	if (clickElem._json.id != me._currentId) {
		me._setCurrentElem(clickElem);
	}
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.option.TabBar.prototype._getDisabledIcon = function(icon)
{
	return icon.replace(/(\.[^\.]+)$/, this._disabledIconPostfix + "$1");
};

Jui.option.TabBar.prototype._setCurrentElem = function(currentElem)
{
	var me = this;
	for (var i = 0; i < me.element.children.length; ++i) {
		var elem = me.element.children[i];
		var icons = elem.firstChild.children;
		var isNewCurrent = elem == currentElem;
		var isOldCurrent = icons[0].style.display == "";
		if (isNewCurrent != isOldCurrent) {
			icons[0].style.display = isNewCurrent ? "" : "none";
			icons[1].style.display = isNewCurrent ? "none" : "";
			elem.className = isNewCurrent ? "JuiTabBarItem JuiTabBarItemCurrent" : "JuiTabBarItem";
		}
	}
	me._currentId = currentElem._json.id;
	me.fireEvent("onswitch", {item:currentElem._json});
};
