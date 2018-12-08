Jui.$define("Jui.basic.PickList", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.PickList.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "JuiPickList";
	return	"<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + " scrollable=true>"
		+ 	"</div>";
};

Jui.basic.PickList.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me.onclick		= args.onclick;
	me._multiSelect	= Jui.cast.toBool(args.multiSelect);
	element.onclick	= Jui.basic.PickList.doClick;
	me.setItems(args.items);
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.PickList.prototype.setItems = function(json)
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
	me._groups = groups;
	
	var buffer = [];
	var icon = Jui.theme.getPath("image/PickListTick.png");
	for (var i = 0; i < groups.length; ++i) {
		var group = groups[i];
		buffer.push("<div class=JuiPickListGroup>");
		for (var j = 0; j < group.items.length; ++j) {
			var item = group.items[j];
			buffer.push("<div class=JuiPickListItem _value='" + Jui.$h(item.value) + "'>");
			buffer.push("<div><img src='" + icon + "'></div>");
			buffer.push("<div>" + Jui.$h(item.text) + "</div>");
			buffer.push("</div>");
		}
		buffer.push("</div>");
	}
	me.element.innerHTML = buffer.join("");
};

Jui.basic.PickList.prototype.getValue = function()
{
};

Jui.basic.PickList.prototype.setValue = function(value)
{
	this._setValue(value, true);
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.PickList.doClick = function()
{
	var me = Jui.$owner();
	var item = Jui.dom.getAncestorByClassName("JuiPickListItem");
	if (item != null) {
		var value = item.getAttribute("_value");
		if (me._multiSelect) {
			Jui.dom.tagAttribute(item, "selected", !item.hasAttribute("selected"));
			me.fireEvent("onclick", {value:value});
		}
		else if (!item.hasAttribute("selected")) {
			me.setValue(value, false);
			me.fireEvent("onclick", {value:value});
		}
	}
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.PickList.prototype._setValue = function(value, scrollToFirstSelectedItem)
{
	var set = Jui.array.toSet(Jui.array.make(value));
	var me = this;
	var items = Jui.dom.getElementsByClassName(me.element, "JuiPickListItem");
	var isFirstSelectedItem = true;
	for (var i = 0; i < items.length; ++i) {
		var item = items[i];
		var selected = item.getAttribute("_value") in set;
		Jui.dom.tagAttribute(item, "selected", selected);
		if (selected && scrollToFirstSelectedItem && isFirstSelectedItem) {
			isFirstSelectedItem = false;
			if (item.offsetTop + item.offsetHeight > me.element.clientHeight) {
				var half = (me.element.offsetHeight + item.offsetHeight) >> 1;
				me.element.scrollTop = item.offsetTop - me.element.clientHeight + half;
			}
		}
	}
};
