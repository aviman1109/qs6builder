Jui.$define("Jui.basic.Control");

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.Control.create = function(args)
{
	args = args || {};
	if (args.target == null) {
		var temp = document.createElement("div");
		temp.innerHTML = this.getHtml(args);
		var me = this.initialize(temp.firstChild, args, this);
		return me;
	}
	else {
		var target = Jui.dom.element(args.target);
		Jui.dom.insertHtml(target, "BeforeEnd", this.getHtml(args));
		var me = this.initialize(target.lastChild, args, this);
		return me;
	}
};

Jui.basic.Control.initialize = function(element, args, clazz)
{
	args 			= args || {};
	var me			= new clazz();
	me.$class		= clazz;
	me.$superClass	= clazz.superClass;
	me._args		= args;
	me._owner		= args.owner;
	me._id			= args.id;
	me._attributes 	= {};
	Jui.$bind(me, element);
	me.setHint(args.hint);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.Control.prototype.getId = function()
{
	return this._id;
};

Jui.basic.Control.prototype.getArgs = function()
{
	return this._args;
};

Jui.basic.Control.prototype.getOwner = function()
{
	return this._owner;
};

Jui.basic.Control.prototype.isDisabled = function()
{
	return /Disabled/.test(this.element.className);
};

Jui.basic.Control.prototype.setDisabled = function(disabled)
{
	var className = this._cssClass || this.element.className.replace(/ .*/, "");
	Jui.dom.tagClass(this.element, className + "Disabled", Jui.cast.toBool(disabled, true));
};

Jui.basic.Control.prototype.isVisible = function()
{
	return this.element.style.display != "none";
};

Jui.basic.Control.prototype.setVisible = function(visible)
{
	this.element.style.display = Jui.cast.toBool(visible, true) ? "" : "none";
};

Jui.basic.Control.prototype.setHint = function(hint)
{
	this.element.title = hint || "";
};

Jui.basic.Control.prototype.getAttribute = function(key)
{
	return this._attributes[key];
};

Jui.basic.Control.prototype.setAttribute = function(key, value)
{
	this._attributes[key] = value;
};

Jui.basic.Control.prototype.setAttributes = function(attributes)
{
	Jui.object.merge(this._attributes, attributes, true);
};

Jui.basic.Control.prototype.setElementStyle = function(cssText)
{
	Jui.dom.setStyle(this.element, cssText);
};

Jui.basic.Control.prototype.addEventListener = function(name, listener)
{
	var me = this;
	me._eventListeners = me._eventListeners || {};
	me._eventListeners[name] = me._eventListeners[name] || [];
	me._eventListeners[name].push(listener);
};

Jui.basic.Control.prototype.removeEventListener = function(name, listener)
{
	var listeners = (this._eventListeners && this._eventListeners[name]) || [];
	for (var i = listeners.length - 1; i >= 0; --i) {
		if (listeners[i] == listener) {
			listeners.splice(i, 1);
		}
	}
};

Jui.basic.Control.prototype.fireEvent = function(name, eventObject)
{
	var result = undefined;
	var listeners = [].concat(this[name], this._eventListeners && this._eventListeners[name]);
	for (var i = 0; i < listeners.length; ++i) {
		var listener = listeners[i];
		if (typeof(listener) == "function" || typeof(listener) == "string" && !Jui.string.isEmpty(listener)) {
			var event = eventObject || {};
			var args = [listener, this, event].concat(Jui.array.wrap(arguments).slice(2));
			var temp = Jui.util.execute.apply(Jui.util, args);
			if (i == 0 && this[name] != null) {
				result = temp;
			}
			if (temp == false) {
				break;
			}
		}
	}
	return result;
};

//-----------------------------------------------------------------------
// package methods
//-----------------------------------------------------------------------

Jui.basic.Control.prototype.$addElementClass = function(postfix)
{
	var className = this._cssClass || this.element.className.replace(/ .*/, "");
	var array = Jui.array.make(postfix);
	for (var i = 0; i < array.length; ++i) {
		array[i] = className + array[i];
	}
	Jui.dom.addClass(this.element, array);
};

Jui.basic.Control.prototype.$removeElementClass = function(postfix)
{
	var className = this._cssClass || this.element.className.replace(/ .*/, "");
	var array = Jui.array.make(postfix);
	for (var i = 0; i < array.length; ++i) {
		array[i] = className + array[i];
	}
	Jui.dom.removeClass(this.element, array);
};

Jui.basic.Control.prototype.$tagElementClass = function(postfix, isAdd)
{
	var className = this._cssClass || this.element.className.replace(/ .*/, "");
	Jui.dom.tagClass(this.element, className + postfix, isAdd);
};
