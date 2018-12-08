Jui.scroll =
{
	setScrollable: function(elem, scrollable, refreshable, handler)
	{
		Jui.dom.tagAttribute(elem, "JuiScrollable", scrollable);
		Jui.dom.tagAttribute(elem, "JuiRefreshable", scrollable && refreshable);
		elem._scrollHandler = handler;
	},
	 
	doTouchStart: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				if (elem._scroll == null) {
					elem._scroll = {
						touchCount		: 0,
						scrollable		: false,
						startScrollTop	: 0,
						startPageY		: 0,
						points			: [],
						scrollTimer		: null,
						barTimer		: null,
						barUpdateTime	: 0
					};
					var refresherHtml	= "<div class=JuiScrollRefresher>"
										+	"<div><div><div></div></div></div>"
										+	"<div>" + Jui.i18n.getText("Jui.Page.Refresh") + "</div>"
										+ "</div>";
					Jui.dom.insertHtml(elem, "BeforeEnd", refresherHtml);
					Jui.dom.insertHtml(elem, "BeforeEnd", "<div class=JuiScrollBar></div>");
				}
				else {
					Jui.scroll._clearScrollTimer(elem);
				}
				var info = elem._scroll;
				if (event.touches.length != 1 && info.scrollable) {
					info.scrollable = false;
					Jui.scroll._finish(elem);
				}
				else if (event.touches.length == 1 && info.touchCount == 0) {
					var touch			= event.touches[0];
					var inner			= elem.firstChild;
					info.scrollable		= true;
					info.startScrollTop = inner.scrollTop;
					info.startPageY		= touch.pageY;
					info.points			= [];
					inner.style.top		= "0px";
					Jui.scroll._addToPath(info.points, touch);
				}
				else {
					info.scrollable = false;
				}
				info.touchCount = event.touches.length;
			}
			elem = elem.parentNode;
		}
	},

	doTouchMove: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				var info = elem._scroll;
				if (info && info.scrollable) {
					var touch			= event.touches[0];
					var inner			= elem.firstChild;
					var sh				= inner.scrollHeight;
					var ch				= inner.clientHeight;
					var maxScrollTop	= sh - ch;
					var scrollTop		= info.startScrollTop + info.startPageY - touch.pageY; 
					inner.scrollTop		= Math.max(0, Math.min(maxScrollTop, scrollTop));
					if (scrollTop < 0) {
						inner.style.top = -scrollTop * 0.5 + "px";
					}
					else if (scrollTop + inner.offsetHeight > inner.scrollHeight) {
						var top = -(scrollTop - maxScrollTop) * 0.5;
						Jui.scroll._fireHitBottomEvent(elem, top);
						inner.style.top = top + "px";
					}
					else {
						inner.style.top = "0px";
					}
					Jui.scroll._addToPath(info.points, touch);
					Jui.scroll._updateScrollBar(elem);
					Jui.scroll._updateRefresher(elem);
				}
				break;
			}
			elem = elem.parentNode;
		}
	    event.preventDefault();
	},
	
	doTouchEnd: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				var info = elem._scroll;
				info.touchCount = event.touches.length;
				if (info.scrollable) {
					info.scrollable = false;
					Jui.scroll._addToPath(info.points, event.changedTouches[0]);
					Jui.scroll._finish(elem);
					Jui.scroll._fireRefreshEvent(elem);
				}
			}
			elem = elem.parentNode;
		}
	},
	
	_addToPath: function(points, touch)
	{
		points.push({y:touch.pageY, time:new Date().getTime()});
		if (points.length > 5) {
			points.shift();
		}
	},
	
	$getSpeed: function(points)
	{
		var speed = 0;
		if (points.length > 2) {
			var end = points[points.length - 1];
			var distance = 0;
			var time = 0;
			for (var i = points.length - 2; i >= 0; --i) {
				var point = points[i];
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
		return speed;
	},
	
	_finish: function(elem)
	{
		var inner = elem.firstChild;
		if (inner.offsetTop != 0) {
			Jui.scroll._bounceBack(elem);
			return;
		}
		
		var speed = Jui.scroll.$getSpeed(elem._scroll.points);
		if (Math.abs(speed) < 0.1) {
			return;
		}
		
		var startScrollTop = inner.scrollTop;
		var startTime = new Date().getTime();
		elem._scroll.scrollTimer = setInterval(function() {
			var DURATION		= 2000;
			var BOUNCE_DURATION	= 200;
			var BOUNCE_DISTANCE	= inner.clientHeight * 0.3;
			var BOUNCE_RATIO	= 10;
			var elapse			= Math.min(DURATION, new Date().getTime() - startTime);
			var v				= speed * (DURATION - elapse) / DURATION;
			var d				= elapse * (speed + v) / 2;
			var scrollTop		= startScrollTop - d;
			var sh				= inner.scrollHeight;
			var ch				= inner.clientHeight;
			if (scrollTop >= 0 && scrollTop <= sh - ch) {
				inner.scrollTop = scrollTop;
				inner.style.top = "0px";
				if (elapse >= DURATION) {
					Jui.scroll._clearScrollTimer(elem);
				}
			}
			else {
				var actualScrollTop = scrollTop < 0 ? 0 : sh - ch;
				var scrollDistance = startScrollTop - actualScrollTop;
				var expectedDistance = speed * DURATION / 2;
				var bounceSpeed = speed * Math.sqrt(1 - Math.abs(scrollDistance / expectedDistance));
				var bounceTime = Math.min(BOUNCE_DURATION, DURATION * bounceSpeed / speed / BOUNCE_RATIO);
				var bounceElapse = elapse - DURATION * (1 - bounceSpeed / speed);
				var expectedBounceDistance = bounceTime * bounceSpeed / 2;
				if (Math.abs(expectedBounceDistance) > BOUNCE_DISTANCE) {
					bounceTime *= BOUNCE_DISTANCE / Math.abs(expectedBounceDistance);
				}
				if (bounceElapse > bounceTime) {
					bounceElapse = bounceTime;
				}
				var currentSpeed = bounceSpeed * (1 - bounceElapse / bounceTime); 
				var top = (bounceSpeed + currentSpeed) * bounceElapse / 2;
				Jui.scroll._fireHitBottomEvent(elem, top);
				inner.scrollTop = actualScrollTop;
				inner.style.top = top + "px";
				if (bounceElapse >= bounceTime) {
					Jui.scroll._clearScrollTimer(elem);
					Jui.scroll._bounceBack(elem);
				}
			}
			Jui.scroll._updateScrollBar(elem);
			Jui.scroll._updateRefresher(elem);
		}, 10);
	},
	
	_bounceBack: function(elem)
	{
		var inner = elem.firstChild;
		var startOffsetTop = inner.offsetTop;
		if (startOffsetTop == 0) {
			return;
		}
		var startTime = new Date().getTime();
		var MAX_DURATION = 360;
		var MAX_OFFSET_TOP = inner.clientHeight / 2;
		var duration = MAX_DURATION * Math.min(1, Math.abs(startOffsetTop / MAX_OFFSET_TOP));
		var speed = 2 * startOffsetTop / duration;
		elem._scroll.scrollTimer = setInterval(function() {
			var elapse = Math.min(duration, new Date().getTime() - startTime);
			inner.style.top = startOffsetTop * (1 - elapse / duration) + "px";
			Jui.scroll._updateScrollBar(elem);
			Jui.scroll._updateRefresher(elem);
			if (elapse >= duration) {
				Jui.scroll._clearScrollTimer(elem);
			}
		}, 10);
	},
	
	_updateScrollBar: function(elem)
	{
		var info			= elem._scroll;
		var inner			= elem.firstChild;
		var bar				= elem.lastChild;
		var style			= Jui.dom.getComputedStyle(bar);
		var margin			= parseInt(style.right);
		var ch				= inner.clientHeight;
		var sh				= Math.max(ch, inner.scrollHeight);
		var MIN_HEIGHT		= Math.min(20, ch / 2);
		var SHRINK_HEIGHT	= bar.offsetWidth;
		var SHRINK_RANGE	= Math.max(10, ch / 6);
		var h				= Math.max(MIN_HEIGHT, (ch - 2 * margin) * ch / sh);
		if (inner.offsetTop < 0) {
			var r				= Math.min(1, -inner.offsetTop / SHRINK_RANGE); 
			bar.style.top		= "auto";
			bar.style.bottom	= margin + "px";
			bar.style.height	= (r * SHRINK_HEIGHT + (1 - r) * h) + "px";
		}
		else if (inner.offsetTop > 0) {
			var r				= Math.min(1, inner.offsetTop / SHRINK_RANGE); 
			bar.style.top		= margin + "px";
			bar.style.bottom	= "auto";
			bar.style.height	= (r * SHRINK_HEIGHT + (1 - r) * h) + "px";
		}
		else {
			var st				= inner.scrollTop;
			bar.style.top		= margin + (sh == ch ? 0 : (ch - 2 * margin - h) * st / (sh - ch)) + "px";
			bar.style.bottom	= "auto";
			bar.style.height	= h + "px";
		}
		bar.style.display	= "block";
		bar.style.opacity	= 1;
		info.barUpdateTime	= new Date().getTime();
		if (info.barTimer == null) {
			info.barTimer = setInterval(function() {
				var KEEP		= 200;
				var FADE_OUT	= 300;
				var elapse		= new Date().getTime() - info.barUpdateTime;
				if (info.touchCount > 0) {
					bar.style.opacity = 1;
				}
				else if (elapse > KEEP) {
					var opacity = 1 - (elapse - KEEP) / FADE_OUT;
					if (opacity > 0) {
						bar.style.opacity = opacity;
					}
					else {
						bar.style.display = "none";
						clearInterval(info.barTimer);
						info.barTimer = null;
					}
				}
			}, 10);
		}
	},
	
	_clearScrollTimer: function(elem)
	{
		if (elem._scroll.scrollTimer != null) {
			clearInterval(elem._scroll.scrollTimer);
			elem._scroll.scrollTimer = null;
		}
	},
	
	_updateRefresher: function(elem)
	{
		if (!elem.hasAttribute("JuiRefreshable")) {
			return;
		}
		var refresher = elem.lastChild.previousSibling;
		var outerCircle = refresher.firstChild.firstChild;
		var innerCircle = outerCircle.firstChild;
		var textElem = refresher.lastChild;
		var ratio = elem.firstChild.offsetTop / (refresher.offsetTop + textElem.offsetTop + textElem.offsetHeight);
		var d = Math.max(0, Math.min(1, ratio)) * outerCircle.offsetHeight;
		innerCircle.style.width = d + "px";
		innerCircle.style.height = d + "px";
		innerCircle.style.borderRadius = d / 2 + "px";
		outerCircle.style.paddingTop = (outerCircle.offsetHeight - d) / 2 + "px"; 
		Jui.dom.tagAttribute(refresher, "active", ratio >= 1);
	},
	
	_fireRefreshEvent: function(elem)
	{
		if (elem.hasAttribute("JuiRefreshable") && elem._scrollHandler != null) {
			var refresher = elem.lastChild.previousSibling;
			if (refresher.hasAttribute("active")) {
				elem._scrollHandler({refresh:true});
			}
		}
	},
	
	_fireHitBottomEvent: function(elem, innerTop)
	{
		if (elem._scrollHandler != null) {
			var inner	= elem.firstChild;
			var oldTop	= parseInt(inner.style.top) || 0;
			if (oldTop >= 0 && innerTop < 0) {
				elem._scrollHandler({bottom:true});
			}
		}
	}
};

//------------------------------------------------------------------------
// initialization
//------------------------------------------------------------------------

Jui.event.attach(document, "touchstart", Jui.scroll.doTouchStart, true);
Jui.event.attach(document, "touchmove", Jui.scroll.doTouchMove, true);
Jui.event.attach(document, "touchend", Jui.scroll.doTouchEnd, true);
Jui.event.attach(document, "touchcancel", Jui.scroll.doTouchEnd, true);
