Jui.$define("Jui.basic.DatePicker", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.DatePicker.getHtml = function(args, id, clazz)
{
	args			= args || {};
	var cssClass	= "JuiDatePicker";
	return	"<div" + Jui.$p({"class":cssClass, id:id, style:args.style}) + " unselectable=on>"
		+		"<div class=JuiDatePickerBody>"
		+			"<div class=JuiDatePickerHighlight>"
		+				"<div>-</div>"
		+				"<div>-</div>"
		+				"<div>:</div>"
		+ 			"</div>"
		+			"<div class=JuiDatePickerScrollerContainer>"
		+				"<div class=JuiDatePickerScroller></div>"
		+				"<div class=JuiDatePickerScroller></div>"
		+				"<div class=JuiDatePickerScroller></div>"
		+				"<div class=JuiDatePickerScroller></div>"
		+				"<div class=JuiDatePickerScroller></div>"
		+			"</div>"
		+		"</div>"
		+ 	"</div>";
};

Jui.basic.DatePicker.initialize = function(element, args, clazz)
{
	args			= args || {};
	clazz			= clazz || this;
	var me			= this.superClass.initialize(element, args, clazz);
	me.onclick		= args.onclick;
	me._scrollers	= Jui.dom.getElementsByClassName(element, "JuiDatePickerScroller");
	me._highlight	= Jui.dom.getElementsByClassName(element, "JuiDatePickerHighlight")[0];
	me._touchMap	= {};
	
	for (var i = 0; i < me._scrollers.length; ++i) {
		var scroller 			= me._scrollers[i];
		scroller._index			= i;
		scroller.ontouchstart	= Jui.basic.DatePicker.doTouchStart;
		scroller.ontouchmove	= Jui.basic.DatePicker.doTouchMove;
		scroller.ontouchend		= Jui.basic.DatePicker.doTouchEnd;
		scroller.ontouchcancel	= Jui.basic.DatePicker.doTouchCancel;
	}
	
	var now = new Date();
	me._setScrollContext(me._scrollers[0], now.getFullYear() - 50, now.getFullYear() + 50);
	me._setScrollContext(me._scrollers[1], 1, 12);
	me._setScrollContext(me._scrollers[2], 1, 31);
	me._setScrollContext(me._scrollers[3], 0, 23);
	me._setScrollContext(me._scrollers[4], 0, 59);
	
	me.setHasTime(Jui.cast.toBool(args.hasTime));
	me.setValue(args.value);
	return me;
};

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.DatePicker.prototype.setHasTime = function(hasTime)
{
	var me = this;
	me._hasTime = hasTime;
	Jui.dom.tagAttribute(me.element, "NoTime", !hasTime);
};

Jui.basic.DatePicker.prototype.getValue = function()
{
	return this._value;
};

Jui.basic.DatePicker.prototype.setValue = function(value)
{
	var me = this;
	me._value = Jui.cast.toDate(value) || new Date();
	var parts = [
	    me._value.getFullYear(),
	    me._value.getMonth() + 1,
	    me._value.getDate(),
	    me._value.getHours(),
	    me._value.getMinutes()
	];
	var extraCount = Jui.basic.DatePicker._SCROLLER_EXTRA_COUNT;
	for (var i = 0; i < parts.length; ++i) {
		var part = parts[i];
		var scroller = me._scrollers[i];
		var items = scroller.firstChild.children;
		var itemHeight = items[0].offsetHeight;
		var offset = part - parseInt(items[extraCount].innerText);
		if (offset >= 0 && offset < items.length - 2 * extraCount) {
			scroller.firstChild.style.top = -(offset + 1) * itemHeight + "px";
		}
	}
};

//-----------------------------------------------------------------------
// event handlers
//-----------------------------------------------------------------------

Jui.basic.DatePicker.doTouchStart = function()
{
	var me = Jui.$owner();
	for (var i = 0; i < event.touches.length; ++i) {
		var touch = event.touches[i];
		var scroller = Jui.dom.getAncestorByClassName("JuiDatePickerScroller", touch.target);
		if (scroller._finish != null) {
			clearInterval(scroller._finish.timer);
			delete scroller._finish;
		}
		for (var id in me._touchMap) {
			if (me._touchMap[id].scroller == scroller) {
				continue;
			}
		}
		me._touchMap[touch.identifier] = {
			scroller	: scroller,
			base		: scroller.firstChild.offsetTop - touch.pageY,
			path		: [{y:touch.pageY, time:new Date().getTime()}]
		};
	}
};

Jui.basic.DatePicker.doTouchMove = function()
{
	var me = Jui.$owner();
	for (var i = 0; i < event.changedTouches.length; ++i) {
		var touch = event.changedTouches[i];
		var info = me._touchMap[touch.identifier];
		if (info != null) {
			me._addToScrollPath(info.path, touch);
			me._setScrollerTop(info.scroller, touch.pageY + info.base);
		}
	}
};

Jui.basic.DatePicker.doTouchEnd = function()
{
	var me = Jui.$owner();
	for (var i = 0; i < event.changedTouches.length; ++i) {
		var touch = event.changedTouches[i];
		var info = me._touchMap[touch.identifier];
		if (info != null) {
			delete me._touchMap[touch.identifier];
			me._addToScrollPath(info.path, touch);
			me._finishScroll(info.scroller, info.path);
		}
	}
};

Jui.basic.DatePicker.doTouchCancel = function()
{
	var me = Jui.$owner();
	for (var i = 0; i < event.changedTouches.length; ++i) {
		var touch = event.changedTouches[i];
		var info = me._touchMap[touch.identifier];
		if (info != null) {
			var content = info.scroller.firstChild;
			var endTop = me._alignScrollEnd(content.offsetTop, content.firstChild.offsetHeight);
			me._setScrollerTop(info.scroller, endTop);
			me._setDatePart(info.scroller, endTop);
			delete me._touchMap[touch.identifier];
		}
	}
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.DatePicker._SCROLLER_EXTRA_COUNT = 4;

Jui.basic.DatePicker.prototype._setScrollContext = function(scroller, min, max)
{
	var me = this;
	var buffer = [];
	buffer.push("<div>");
	for (var i = Jui.basic.DatePicker._SCROLLER_EXTRA_COUNT - 1; i >= 0; --i) {
		buffer.push(me._getScrollerItemHtml(max - i));
	}
	for (var i = min; i <= max; ++i) {
		buffer.push(me._getScrollerItemHtml(i));
	}
	for (var i = 0; i < Jui.basic.DatePicker._SCROLLER_EXTRA_COUNT; ++i) {
		buffer.push(me._getScrollerItemHtml(min + i));
	}
	buffer.push("</div>");
	buffer.push("<div class=JuiDatePickerScrollerMask></div>");
	buffer.push("<div class=JuiDatePickerScrollerMask></div>");
	scroller.innerHTML = buffer.join("");
};

Jui.basic.DatePicker.prototype._getScrollerItemHtml = function(value)
{
	if (value < 10) {
		value = "0" + value;
	}
	return "<div>" + value + "</div>";
};

Jui.basic.DatePicker.prototype._addToScrollPath = function(path, touch)
{
	path.push({y:touch.pageY, time:new Date().getTime()});
	if (path.length > 5) {
		path.shift();
	}
};

Jui.basic.DatePicker.prototype._finishScroll = function(scroller, path)
{
	var speed = 0;
	if (path.length > 2) {
		var end = path[path.length - 1];
		var distance = 0;
		var time = 0;
		for (var i = path.length - 2; i >= 0; --i) {
			var point = path[i];
			if (point.time < end.time - 300) {
				break;
			}
			if (Math.abs(end.y - point.y) < Math.abs(distance)) {
				break;
			}
			distance = end.y - point.y;
			time = end.time - point.time;
		}
		if (time > 0) {
			speed = distance / time;
		}
	}

	var me				= this;
	var content			= scroller.firstChild;
	var ITEM_HEIGHT		= content.firstChild.offsetHeight;
	var MAX_DURATION	= 1500;
	var SLOW_RANGE		= 3 * ITEM_HEIGHT;
	var distance		= MAX_DURATION * speed / 2;
	var startTop		= content.offsetTop;
	var endTop;
	if (speed == 0) {
		endTop = me._alignScrollEnd(startTop, ITEM_HEIGHT);
		if (path.length == 2) {
			var lastPoint = path[path.length - 1];
			var rect = scroller.getBoundingClientRect();
			var isMoveUp = lastPoint.y > (rect.top + rect.bottom) / 2;
			if (endTop >= startTop && isMoveUp || endTop <= startTop && !isMoveUp) {
				endTop += isMoveUp ? -ITEM_HEIGHT : ITEM_HEIGHT;
			}
		}
	}
	else if (Math.abs(distance) < SLOW_RANGE) {
		var ratio = Math.abs(speed) / (2 * SLOW_RANGE / MAX_DURATION);
		endTop = me._alignScrollEnd(startTop + distance * ratio, ITEM_HEIGHT);
		if (speed < 0 && endTop >= startTop || speed > 0 && endTop <= startTop) {
			endTop = endTop + (speed < 0 ? -ITEM_HEIGHT : ITEM_HEIGHT);
		}
	}
	else {
		endTop = me._alignScrollEnd(startTop + distance, ITEM_HEIGHT);
	}
	me._setDatePart(scroller, endTop);
	if (endTop == startTop) {
		return;
	}
	
	var duration = MAX_DURATION * Math.min(1, Math.abs(endTop - startTop) / SLOW_RANGE);
	speed = 2 * (endTop - startTop) / duration;
	scroller._finish = {
		startSpeed	: speed,
		startTime	: new Date().getTime(),
		startTop	: scroller.firstChild.offsetTop,
		timer		: setInterval(function() {
			var elapse = Math.min(duration, new Date().getTime() - scroller._finish.startTime);
			var speed = scroller._finish.startSpeed * (duration - elapse) / duration;
			var d = elapse * (scroller._finish.startSpeed + speed) / 2;
			me._setScrollerTop(scroller, scroller._finish.startTop + d);
			if (elapse >= duration) {
				clearInterval(scroller._finish.timer);
				delete scroller._finish;
			}
		}, 20)
	};
};

Jui.basic.DatePicker.prototype._alignScrollEnd = function(y, itemHeight)
{
	y = Math.round(y);
	var offset = (itemHeight + y % itemHeight) % itemHeight;
	return offset <= itemHeight / 2 ? y - offset : y + itemHeight - offset;
};

Jui.basic.DatePicker.prototype._setScrollerTop = function(scroller, top)
{
	scroller.firstChild.style.top = this._getValidTop(scroller, top) + "px";
};

Jui.basic.DatePicker.prototype._getValidTop = function(scroller, top)
{
	var content = scroller.firstChild;
	var extraHeight = Jui.basic.DatePicker._SCROLLER_EXTRA_COUNT * content.firstChild.offsetHeight;
	var validHeight = content.offsetHeight - 2 * extraHeight;
	while (top > 0) {
		top = top - validHeight;
	}
	while (top < scroller.offsetHeight - content.offsetHeight) {
		top = top + validHeight;
	}
	return Math.round(top);
};

Jui.basic.DatePicker.prototype._setDatePart = function(scroller, top)
{
	var me = this;
	var content = scroller.firstChild;
	var itemHeight = content.firstChild.offsetHeight;
	var validTop = me._getValidTop(scroller, top);
	var itemIndex = Math.floor(scroller.offsetHeight / itemHeight / 2) - validTop / itemHeight;
	var value = parseInt(content.children[itemIndex].innerText);
	if (me._value == null) {
		me._value = new Date();
	}
	if (scroller._index == 0) {
		me._value.setFullYear(value);
	}
	else if (scroller._index == 1) {
		me._value.setMonth(value - 1);
	}
	else if (scroller._index == 2) {
		me._value.setDate(value);
	}
	else if (scroller._index == 3) {
		me._value.setHours(value);
	}
	else if (scroller._index == 4) {
		me._value.setMinutes(value);
	}
};
