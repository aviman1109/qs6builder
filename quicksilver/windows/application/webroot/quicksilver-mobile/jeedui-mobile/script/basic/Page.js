Jui.$define("Jui.basic.Page", Jui.basic.Control);

//-----------------------------------------------------------------------
// static method
//-----------------------------------------------------------------------

Jui.basic.Page.getHtml = function(args, clazz)
{
	args = args || {};
	var scrollable = Jui.cast.toBool(args.scrollable, true);
	var icon = Jui.theme.getPath("image/Progress.gif");
	return	"<div class=JuiPage" + Jui.$p({style:args.style}) +	">"
		+		"<div class=JuiPageNavBar>"
		+			"<div class=JuiPageNavBarLeft></div>"
		+			"<div class=JuiPageTitle>"
		+				"<div class=JuiPageMainTitle></div>"
		+				"<div class=JuiPageSubTitle></div>"
		+			"</div>"
		+			"<div class=JuiPageNavBarRight></div>"
		+		"</div>"
		+		"<div class=JuiPageMain" + (scrollable ? " JuiScrollable=true" : "") + ">"
		+			"<div class=JuiPageBody></div>"
		+		"</div>"
		+		"<div class=JuiPageWaitingMask></div>"
		+		"<div class=JuiPageWaitingIcon><img src='" + icon + "'></div>"
		+	"</div>";
};

Jui.basic.Page.initialize = function(element, args, clazz)
{
	args					= args || {};
	clazz					= clazz || this;
	var me					= this.superClass.initialize(element, args, clazz);
	me._id					= ++Jui.basic.Page._serial + "";
	me._waitingCount 		= 0;
	me._navBarElem			= element.children[0];
	me._barLeftElem			= me._navBarElem.children[0];
	me._titleElem			= me._navBarElem.children[1];
	me._barRightElem		= me._navBarElem.children[2];
	me._mainElem			= element.children[1];
	me._waitingMaskElem		= element.children[2];
	me._waitingIconElem		= element.children[3];
	me._mainTitleElem		= me._titleElem.children[0];
	me._subTitleElem		= me._titleElem.children[1];
	me._bodyElem			= me._mainElem.children[0];
	me._titleElem.onclick	= Jui.basic.Page.doTitleClick;

	Jui.basic.Page.setTitle(me, args.title);
	if (args.buttons != null) {
		for (var i = 0; i < args.buttons.length; ++i) {
			var buttonArgs = Jui.object.merge({target:me._barRightElem, face:"PageButton"}, args.buttons[i]);
			Jui.basic.Button.create(buttonArgs);
		}
	}
	Jui.dom.tagAttribute(element, "NoNavBar", !Jui.cast.toBool(args.hasNavBar, true));
	return me;
};

Jui.basic.Page.setContainer = function(container)
{
	Jui.basic.Page._container = container;
};

Jui.basic.Page.setCurrentStack = function(stackId, defaultPageArgs)
{
	if (stackId == null) {
		stackId = "";
	}
	if (stackId == Jui.basic.Page._currentStackId) {
		return;
	}
	
	var currentStack = Jui.basic.Page._stacks[Jui.basic.Page._currentStackId];
	for (var i = 0; i < currentStack.length; ++i) {
		Jui.basic.Page.hide(currentStack[i]);
	}
	
	if (!(stackId in Jui.basic.Page._stacks)) {
		Jui.basic.Page._stacks[stackId] = [];
	}
	Jui.basic.Page._currentStackId = stackId;
	var stack = Jui.basic.Page._stacks[stackId];
	if (stack.length > 0) {
		stack[stack.length - 1].show();
	}
};

Jui.basic.Page.getCurrentPage = function()
{
	var stack = Jui.basic.Page._stacks[Jui.basic.Page._currentStackId];
	return stack.length == 0 ? null : stack[stack.length - 1];
};

Jui.basic.Page.open = function(info, callback, fixedCallback)
{
	var stack = Jui.basic.Page._stacks[Jui.basic.Page._currentStackId];
	var container = Jui.basic.Page._container || document.body;
	var createArgs = Jui.object.merge({target:container}, info);
	var me = Jui.basic.Page.create(createArgs);
	if (stack.length > 0) {
		Jui.basic.Button.create({
			target	: me._barLeftElem,
			icon	: Jui.theme.getPath("image/PageBack.png"),
			text	: info.backText,
			face	: "PageButton",
			onclick	: Jui.basic.Page.doBackClick
		});
		Jui.basic.Page._slide(stack[stack.length - 1], me, true);		
	}
	stack.push(me);
	Jui.basic.Page._map[me._id] = me;
	me._callback = callback;
	me._fixedCallback = fixedCallback;
	return me;
};

//-----------------------------------------------------------------------
// static fields
//-----------------------------------------------------------------------

Jui.basic.Page._stacks = {"":[]};

Jui.basic.Page._currentStackId = "";

Jui.basic.Page._map = {};

Jui.basic.Page._serial = 0;

//-----------------------------------------------------------------------
// methods
//-----------------------------------------------------------------------

Jui.basic.Page.getDataArguments = function(me)
{
	return me._dataArguments;
};

Jui.basic.Page.setDataArguments = function(me, dataArguments)
{
	me._dataArguments = dataArguments || {};
};

Jui.basic.Page.getBody = function(me)
{
	return me._bodyElem;
};

Jui.basic.Page.prototype.show = function()
{
	var me = this;
	me.element.style.display = "";
};

Jui.basic.Page.hide = function(me)
{
	me.element.style.display = "none";
};

Jui.basic.Page.setResult = function(me, result)
{
	me._result = result;
};

Jui.basic.Page.close = function(me, result)
{
	var stack = Jui.basic.Page._stacks[Jui.basic.Page._currentStackId];
	stack.pop();
	delete Jui.basic.Page._map[me._id];
	if (stack.length > 0) {
		Jui.basic.Page._slide(stack[stack.length - 1], me, false);		
	}
	else {
		Jui.dom.removeElement(me.element);
	}
	Jui.$unbind(me);
	
	if (arguments.length > 1) {
		me._result = result;
	}
	if (me._fixedCallback != null) {
		me._fixedCallback();
	}
	if (me._callback != null && typeof(me._result) != "undefined") {
		me._callback(Jui.util.clone(me._result));
	}
};

Jui.basic.Page.setTitle = function(me, title)
{
	me._title = title;
	me._mainTitleElem.innerHTML = Jui.$h(title);
};

Jui.basic.Page.setSubTitle = function(me, subTitle)
{
	me._subTitle = subTitle;
	var isEmpty = Jui.string.isEmpty(subTitle);
	if (isEmpty) {
		me._subTitleElem.innerHTML = "";
	}
	else {
		//var dropdownIcon = Jui.theme.getPath("image/PageSubTitleDropdown.png");
		//me._subTitleElem.innerHTML = Jui.$h(subTitle) + "<img src='" + dropdownIcon + "'>";
		me._subTitleElem.innerHTML = Jui.$h(subTitle);
	}
	Jui.dom.tagClass(me._titleElem, "JuiPageTitleWithSubTitle", !isEmpty);
};

Jui.basic.Page.getElementById = function(me, id)
{
	return me._bodyElem.querySelector("[id=" + id + "]");
};

Jui.basic.Page.querySelector = function(me, selector)
{
	return me._bodyElem.querySelector(selector);
};

Jui.basic.Page.showWaitingAnimation = function(me)
{
	if (++me._waitingCount == 1) {
		me._waitingMaskElem.style.display = "block";
		me._waitingIconElem.style.display = "block";
	}
};

Jui.basic.Page.hideWaitingAnimationById = function(id)
{
	var me = Jui.basic.Page._map[id];
	if (me != null && --me._waitingCount == 0) {
		me._waitingMaskElem.style.display = "none";
		me._waitingIconElem.style.display = "none";
	}
};

Jui.basic.Page.setScrollable = function(me, scrollable, refreshable, scrollHandler)
{
	Jui.scroll.setScrollable(me._mainElem, scrollable, refreshable, scrollHandler);
};

Jui.basic.Page.setRefreshable = function(me, refreshable)
{
	Jui.scroll.setRefreshable(me._mainElem, refreshable);
};

Jui.basic.Page.setScrollHandler = function(me, scrollHandler)
{
	Jui.scroll.setHandler(me._mainElem, scrollHandler);
};

//-----------------------------------------------------------------------
// events
//-----------------------------------------------------------------------

Jui.basic.Page.doBackClick = function()
{
	var me = Jui.basic.Page.getCurrentPage();
	Jui.basic.Page.close(me);
};

Jui.basic.Page.doTitleClick = function()
{
	var me = Jui.basic.Page.getCurrentPage();
	me.fireEvent("ontitleclick");
};

Jui.basic.Page.doScroll = function(event)
{
	var me = Jui.basic.Page.getCurrentPage();
	if (me._scrollHandlers != null) {
		if (me._scrollHandlers.hitBottom != null) {
			me._scrollHandlers.hitBottom();
		}
		else if (me._scrollHandlers.refresh) {
			me._scrollHandlers.refresh();
		}
	}
};

//-----------------------------------------------------------------------
// private
//-----------------------------------------------------------------------

Jui.basic.Page._slide = function(leftPage, rightPage, isShow)
{
	var info = Jui.basic.Page._slideInfo;
	if (info != null) {
		Jui.basic.Page._finishSlide();
	}
	leftPage.element.style.display	= "block";
	rightPage.element.style.display	= "block";
	leftPage.element.style.right	= isShow ? "0%" : "100%";
	rightPage.element.style.left	= isShow ? "100%" : "0%";
	Jui.basic.Page._slideInfo = {
		start 	: new Date().getTime(),
		left	: leftPage.element,
		right	: rightPage.element,
		isShow	: isShow,
		timer	: setInterval(function() {
			var DURATION = 200;
			var info = Jui.basic.Page._slideInfo;
			var end = new Date().getTime();
			if (end >= info.start + DURATION) {
				Jui.basic.Page._finishSlide();
			}
			else {
				var percent = Math.round(100 * (end - info.start) / DURATION);
				info.left.style.right = (info.isShow ? percent : 100 - percent) + "%";
				info.right.style.left = (info.isShow ? 100 - percent : percent) + "%";
			}
		}, 10)
	};
};

Jui.basic.Page._finishSlide = function()
{
	var info = Jui.basic.Page._slideInfo;
	delete Jui.basic.Page._slideInfo;
	clearInterval(info.timer);
	info.left.style.right = "auto";
	info.right.style.left = "auto";
	info.left.style.display = info.isShow ? "none" : "block";
	info.right.style.display = info.isShow ? "block" : "none";
	if (!info.isShow) {
		Jui.dom.removeElement(info.right);
	}
};
