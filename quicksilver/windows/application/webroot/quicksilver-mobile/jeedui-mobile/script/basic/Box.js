Jui.$define("Jui.basic.Box", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.Box.initialize = function(element, args, clazz)
{
	args	= args || {};
	clazz	= clazz || this;
	var me	= this.superClass.initialize(element, args, clazz);
	me.setClearOnDisable(Jui.cast.toBool(args.clearOnDisable, false));
	me.setRestoreOnEnable(Jui.cast.toBool(args.restoreOnEnable, false));
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.Box.prototype.setDisabled = function(disabled)
{
	var me = this;
	var oldDisabled = me.isDisabled();
	Jui.basic.Control.prototype.setDisabled.call(me, disabled);
	var newDisabled = me.isDisabled();
	if (newDisabled != oldDisabled) {
		if (newDisabled && me._restoreOnEnable) {
			me._savedValue = me.getValue();
			me._savedText = me.getText == null ? null : me.getText();
		}
		if (newDisabled && me._clearOnDisable) {
			me.setValue();
		}
		if (!newDisabled && me._restoreOnEnable && "_savedValue" in me) {
			me.setValue(me._savedValue, me._savedText);
		}
	}
};

Jui.basic.Box.prototype.isClearOnDisable = function()
{
	return this._clearOnDisable;
};

Jui.basic.Box.prototype.setClearOnDisable = function(clearOnDisable)
{
	var me = this;
	me._clearOnDisable = Jui.cast.toBool(clearOnDisable, true);
};

Jui.basic.Box.prototype.isRestoreOnEnable = function()
{
	return this._restoreOnEnable;
};

Jui.basic.Box.prototype.setRestoreOnEnable = function(restoreOnEnable)
{
	var me = this;
	me._restoreOnEnable = Jui.cast.toBool(restoreOnEnable, true);
};

Jui.basic.Box.prototype.getForm = function()
{
	return this._form;
};

Jui.basic.Box.prototype.setForm = function(form)
{
	var me = this;
	me._form = form;
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

//-----------------------------------------------------------------------
// package methods
//-----------------------------------------------------------------------
