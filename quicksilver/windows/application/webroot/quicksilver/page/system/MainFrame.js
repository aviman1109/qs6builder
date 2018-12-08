var MainFrame =
{
	//-----------------------------------------------------------------------
	// public properties (can be invoked in other pages)
	//-----------------------------------------------------------------------
	
	toolBar: null,
	
	menuTabStrip: null,
	
	tabStrip: null,

	customModuleIds: {},
	
	//-----------------------------------------------------------------------
	// private properties (can be invoked in other pages)
	//-----------------------------------------------------------------------
	
	_barMap: {},

	_treeMap: {},

	_currentTree: null,

	_confirmBeforeUnload: true,

	_jocketMessageHandlerMap: {},
	
	_menuNumbers: clientData.menuNumbers,

	_menuNumberUnitIds: Jui.array.toSet(clientData.menuNumberUnitIds),

	_menuNumberProperties: clientData.menuNumberProperties,
	
	_menuTexts: {},
	
	_searchMenuBox: null,
	
	//-----------------------------------------------------------------------
	// public methods (can be invoked in other pages)
	//-----------------------------------------------------------------------

	loadTree: function(barId)
	{
		var tree = MainFrame._treeMap[barId];
		if (tree != null) {
			Utility.invoke("Qs.Menu.getTree", {parentId:barId}, true, function(ret) {
				tree.load(MainFrame._processTreeJson(ret.data));
				tree.expandLevel(clientData.menuExpandLevel - 1);
			});
		}
	},
	
	addEntity: function(unitCode, args, dialogOptions)
	{
		CommonBusiness.openEntity(unitCode, args, "Dialog", null, dialogOptions);
	},
	
	broadcast: function(data)
	{
		var array = frames;
		while (array.length != 0) {
			var next = [];
			for (var i = 0; i < array.length; ++i) {
				var frame = array[i];
				try {
					var frameWindow = Jui.dom.getFrameWindow(frame);
					frameWindow.postMessage(data, "*");
					for (var j = 0, subFrames = frameWindow.frames; j < subFrames.length; ++j) {
						next.push(subFrames[j]);
					}
				}
				catch (e) {
				}
			}
			array = next;
		}
	},
	
	setJocketMessageHandler: function(messageCode, handler)
	{
		MainFrame._jocketMessageHandlerMap[messageCode] = handler;
	},

	refreshMenuNumbers: function(unitId)
	{
		var unitIds = [];
		for (var i = 0, array = Jui.array.make(unitId); i < array.length; ++i) {
			if (array[i] in MainFrame._menuNumberUnitIds) {
				unitIds.push(array[i]);
			}
		}
		if (unitIds.length > 0) {
			Utility.invoke("Qs.MenuNumber.getNumbers", {unitIds:unitIds}, false, function(ret) {
				MainFrame._menuNumberChangeHandler(ret.numbers);
			});
		}
	},
	
	refreshMarquee: function()
	{
		Utility.invoke("Qs.Marquee.getActiveItems", null, false, function(ret) {
			MainFrame._marquee.load(ret.items);
		});
	},
	
	refreshSystemMessageCount: function()
	{
		var button = MainFrame.toolBar.getItem("SystemMessage");
		if (button != null) {
			Utility.invoke("Qs.SystemMessage.getNewItemCount", null, false, function(ret) {
				MainFrame.setSystemMessageCount(ret.count);
			});
		}
	},
	
	setSystemMessageCount: function(count)
	{
		var button = MainFrame.toolBar.getItem("SystemMessage");
		if (button != null) {
			if (MainFrame._systemMessageButtonText == null) {
				MainFrame._systemMessageButtonText = button.getText();
			}
			if (count <= 0) {
				button.setText(MainFrame._systemMessageButtonText);
			}
			else {
				var html = "<span style='padding-right:2px'>" + MainFrame._systemMessageButtonText + "</span>"
						 + "<span class=JuiNumberBubble>" + count + "</span>";
				button.setHtml(html);
			}
		}
	},
	
	//-----------------------------------------------------------------------
	// event handlers (should not be invoked in other pages)
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		MainFrame.resizer = Jui.option.Resizer.create({
			elements	: ["MenuZone", "TabZone"],
			offset		: -6,
			shrinks		: [6, 6]
		});

		MainFrame.toolBar = Jui.basic.ToolBar.create({target:"ToolBarZone"});
		MainFrame.toolBar.load(clientData.toolBarJson);
		MainFrame.doResize();

		//create menu TabStrip
		var isTextVerticalArrangeable = /^zh-/.test(clientData.language);
		MainFrame.menuTabStrip = Jui.option.TabStrip.create({
			target		: "MenuZone",
			tabPosition	: "left",
			textType	: isTextVerticalArrangeable ? "text" : "image"
		});
		if (!isTextVerticalArrangeable) {
			for (var i = 0; i < clientData.menuJson.length; ++i) {
				var item = clientData.menuJson[i];
				item.text = Utility.getUrl("Qs.Menu.GetModuleTextImage.file", {moduleId:item.id});
			}
		}
		MainFrame.menuTabStrip.load(clientData.menuJson);
		
		//load OutlookBars/Trees
		for (var i = 0; i < clientData.menuJson.length; ++i) {
			var tabJson = clientData.menuJson[i];
			var tabId = tabJson.id;
			var tabBody = MainFrame.menuTabStrip.getBody(tabId);
			if (tabId in MainFrame.customModuleIds) {
				continue;
			}
			if (tabJson.children == null && tabJson.data != null && tabJson.data.page != null) {
				var frameId = tabJson.data.page.replace(/\.page$/, "");
				tabBody.innerHTML = "<iframe class=FullSize id='" + frameId + "'></iframe>";
				tabBody.firstChild.src = tabJson.data.page;
				MainFrame._barMap[tabId] = "loaded";
				continue;
			}
			var barsJson = tabJson.children || [];
			var bar = Jui.option.OutlookBar.create({showBorder:false, target:tabBody});
			MainFrame._barMap[tabId] = bar; 
			bar.load(barsJson);
			for (var j = 0; j < barsJson.length; ++j) {
				var barJson = barsJson[j];
				var barId = barJson.id;
				if (!Jui.string.isEmpty(barId)) {
					var tree = Jui.option.Tree.create({
						style		: "padding-left:8px;padding-top:2px;width:100%;height:100%;overflow:auto", 
						target		: bar.getBody(barId),
						onleafclick	: MainFrame.doTreeLeafClick
					});
					tree.load(MainFrame._processTreeJson(barJson.children || []));
					tree.expandLevel(clientData.menuExpandLevel - 1);
					MainFrame._treeMap[barId] = tree;
				}
			}
		}
		if (clientData.menuHide) {
			MainFrame.doSwitchMenuClick();
		}

		MainFrame.tabStrip = Jui.option.TabStrip.create({
			target		: "TabZone",
			dynamic		: true,
			maximizable	: true,
			maxTabCount	: clientData.maxTabCount,
			maxTabWidth	: clientData.maxTabWidth //TODO HTML5
		});
		for (var i = 0; i < clientData.autoOpenPages.length; ++i) {
			var page = clientData.autoOpenPages[i];
			var options = {lock:page.code == "Qs.Homepage"};
			Utility.openTab(page.code + '.page', null, page.title, page.icon, null, null, false, options);
		}
		if (clientData.argsFromEmail != null) {
			MainFrame._openPageFromEmail(clientData.argsFromEmail);
		}
		if (!Jui.array.isEmpty(clientData.missingPageCodes)) {
			var codes = clientData.missingPageCodes.join(", ");
			Jui.message.alert($text("Qs.MainFrame.InvalidAutoOpenPageCode").replace("${0}", codes));
		}

		MainFrame._marquee = Jui.option.Marquee.create({
			target		: "MarqueeZone",
			direction	: clientData.marqueeDirection || "left",
			onitemclick	: MainFrame.doMarqueeItemClick
		});
		MainFrame._openJocket();
		MainFrame._checkPassword();
		MainFrame.refreshMarquee();
		MainFrame.refreshSystemMessageCount();
	},

	doResize: function()
	{
		//跑马灯重写算轨道距离chrome要设一点延迟，否则会导致计算不准，最终跑马灯轨道和其他元素重叠
		setTimeout(function(){
			var left = MainFrame.toolBar.getLeftRect();
			var right = MainFrame.toolBar.getRightRect();
			var container = $elem("MarqueeZone");
			container.style.left = left.right + "px";
			container.style.width = (right.left - left.right) + "px";
		},10);
	},
	
	doBeforeUnload: function()
	{
		if (MainFrame._confirmBeforeUnload) {
			return $text("Qs.System.CloseBrowserConfirm");
		}
	},
	
	doSwitchMenuClick: function()
	{
		var isShow = $elem("MenuZone").style.display == "none";
		$elem("MenuZone").style.display = isShow ? "" : "none";
		if (!isShow) {
			MainFrame._tabZoneLeft = $elem("TabZone").offsetLeft;
		}
		$elem("TabZone").style.left = isShow ? MainFrame._tabZoneLeft + "px" : "0px";
		MainFrame.resizer.setVisible(isShow);
	},
	
	doSearchMenuClick: function()
	{
		var menuZone = $elem("MenuZone");
		var isShow = !menuZone.hasAttribute("SearchMenu");
		if (menuZone.style.display == "none") {
			MainFrame.doSwitchMenuClick();
			isShow = false;
		}
		Jui.dom.tagAttribute(menuZone, "SearchMenu", isShow);
		if (MainFrame._searchMenuBox == null) {
			MainFrame._searchMenuBox = Jui.basic.InputBox.create({
				target		: "SearchMenuPane",
				emptyText	: $text("Public.KeywordBoxEmptyText"),				
				style		: "width:100%",
				onkeydown	: MainFrame.doSearchMenuBoxKeyDown
			});
		}
	},

	doSearchMenuBoxKeyDown: function(event)
	{
		if (event.keyCode != 13) {
			return;
		}
		var keyword = Jui.string.trim(MainFrame._searchMenuBox.getValue()).toLowerCase();
		if (Jui.string.isEmpty(keyword)) {
			MainFrame._menuSearch = null;
			return;
		}
		if (MainFrame._menuSearch == null || keyword != MainFrame._menuSearch.keyword) {
			MainFrame._menuSearch = {keyword:keyword};
		}
		var setSearchResult = function(moduleId, subModuleId, menuId) {
			MainFrame.menuTabStrip.setCurrentId(moduleId);
			MainFrame._barMap[moduleId].setCurrentId(subModuleId);
			MainFrame._treeMap[subModuleId].setCurrentId(menuId);
			MainFrame._menuSearch.previousResult = subModuleId + menuId;
		};
		var firstItem = null;
		var previousResultPassed = MainFrame._menuSearch.previousResult == null;
		for (var i = 0; i < clientData.menuJson.length; ++i) {
			var module = clientData.menuJson[i];
			var subModules = module.children || [];
			for (var j = 0; j < subModules.length; ++j) {
				var subModule = subModules[j];
				var tree = MainFrame._treeMap[subModule.id];
				if (tree != null) {
					var treeItems = tree.getData(true);
					for (var k = 0; k < treeItems.length; ++k) {
						var item = treeItems[k];
						if (item.text.toLowerCase().indexOf(keyword) != -1) {
							if (previousResultPassed) {
								setSearchResult(module.id, subModule.id, item.id);
								return;
							}
							if (firstItem == null) {
								firstItem = {moduleId:module.id, subModuleId:subModule.id, menuId:item.id};
							}
						}
						if (subModule.id + item.id == MainFrame._menuSearch.previousResult) {
							previousResultPassed = true;
						}
					}
				}
			} 
		}
		if (firstItem != null) {
			setSearchResult(firstItem.moduleId, firstItem.subModuleId, firstItem.menuId);
		}
		else {
			Jui.message.hint($text("Qs.MainFrame.MenuNotFound", keyword));
		}
	},
	
	doModifyPassword: function(args)
	{	
		var options = {height:230};
		options = Jui.object.isEmpty(args) ? options : Jui.object.merge(options,args);;
		Utility.openDialog("Qs.User.PasswordModify.page", null, options, function(ret){
			if(options.hasOwnProperty('showCloseButton') && options.showCloseButton == false) {
				if (!ret.modifyPassword) {
					MainFrame.doModifyPassword(args);
				}
			}
		});
	},
	
	doLogout: function()
	{
		Jui.message.confirm($text("Qs.OnlineUser.LogoutConfirm"), function() {
			Utility.invoke("Qs.OnlineUser.logout", null, true, function() {
				MainFrame._jumpToLoginPage();
			});
		});
	},
	
	doThemeClick: function(event)
	{
		Jui.message.confirm($text("Qs.System.SwitchThemeConfirm"), function() {
			Jui.theme.setName(event.id);
			MainFrame._confirmBeforeUnload = false;
			window.location.reload();
		});
	},
	
	doFeedback: function()
	{
		window.open("mailto:" + clientData.feedbackEmail);
	},
	
	doAbout: function()
	{
		Utility.openDialog("Qs.Misc.About.page");
	},

	doOpenSystemMessageList: function()
	{
		var pageCode = "Qs.SystemMessage.List";
		var body = MainFrame.tabStrip.getBody(pageCode);
		if (body == null) {
			var page = Utility.getPage(pageCode);
			Utility.openTab("Qs.SystemMessage.List.page", null, page.title, page.icon, null, pageCode);
		}
		else {
			MainFrame.tabStrip.setCurrentId(pageCode);
			body.contentWindow.SystemMessageList.showNewItems();
		}
	},
	
	doSystemMessageItemClick: function(event)
	{
		SystemMessage.open(event.item.id, event.item.unitId, event.item.entityId);
		if (event.allRead) {
			this.close();
		}
	},
	
	doMarqueeItemClick: function(event)
	{
		CommonBusiness.openEntity("Qs.Marquee", {entityId:event.item.id}, "Tab");
	},
	
	doOpenPageFromEmail: function()
	{
		Utility.invoke("Qs.Misc.getOnlineArgsFromEmail", null, true, function(ret) {
			if (ret.args == null) {
				Jui.message.alert($text("Qs.Misc.NoOnlineArgsFromEmail"));
			}
			else {
				MainFrame._openPageFromEmail(ret.args);
			}
		});
	},
	
	doCheckWordPaster: function()
	{
		Utility.openDialog("Qs.Misc.InstallWordPaster.page");
	},

	doTreeLeafClick: function(event)
	{
		MainFrame._currentTree = this;
		MainFrame._execute(event);
	},
	
	doOpenHomepage: function(event)
	{
		for (var i = 0; i < clientData.autoOpenPages.length; ++i) {
			var page = clientData.autoOpenPages[i];
			if (page.code == "Qs.GraphHomepage" || page.code == "Qs.Homepage") {
				Utility.openTab(page.code + '.page', null, page.title, page.icon);
			}
		}
	},

	doOpenQuerySchema: function(event)
	{
		var data = event.data;
		var args = {schemaId:data.schemaId};
		Utility.openTab(data.unitCode + ".List.page", args, data.unitName, event.icon);
	},

	doMessage: function(event)
	{
		var data = event.data;
		if (data.action == "broadcast") {
			MainFrame.broadcast(data.args.data);
		}
		else if (data.action == "crossFrameCall") {
			var frame = frames[data.args.frameId];
			if (frame != null) {
				var args = {functionName:data.args.functionName, functionArgs:data.args.functionArgs};
				Utility.postMessage(Jui.dom.getFrameWindow(frame), {action:"callFunction", args:args});
			}
		}
	},

	doJocketOpen: function()
	{
	},
	
	doJocketClose: function(code, reason)
	{
		var INVALID_HTTP_SESSION = 4900;
		if (code == INVALID_HTTP_SESSION) {
			MainFrame._jumpToLoginPage("Timeout", reason);
		}
	},

	doJocketMessage: function(code, data)
	{
		var handler = MainFrame._jocketMessageHandlerMap[code];
		if (handler != null) {
			handler(data);
		}
	},
	
	//-----------------------------------------------------------------------
	// private methods (should not be invoked in other pages)
	//-----------------------------------------------------------------------
	
	_openJocket: function()
	{
   		var jocket = new Jocket({path:"/jocket/inner"});
   		jocket.on("open", MainFrame.doJocketOpen);
   		jocket.on("close", MainFrame.doJocketClose);
   		jocket.on("message", MainFrame.doJocketMessage);
   		MainFrame.setJocketMessageHandler("Qs.Marquee.Change", MainFrame._marqueeChangeHandler);
   		MainFrame.setJocketMessageHandler("Qs.Menu.NumberChange", MainFrame._menuNumberChangeHandler);
   		MainFrame.setJocketMessageHandler("Qs.Session.Invalidate", MainFrame._sessionInvalidateHandler);
   		MainFrame.setJocketMessageHandler("Qs.SystemMessage.New", MainFrame._newSystemMessageHandler);
   		MainFrame.setJocketMessageHandler("Wf.Activity.InstantActivityFinished", MainFrame._instantActivityFinishedHandler);
   		MainFrame.setJocketMessageHandler("Qs.OnlineUser.Handshake", MainFrame._onlineUserHandshakeHandler);
	},

	_sessionInvalidateHandler: function(json)
	{
		MainFrame._jumpToLoginPage(json.action);
	},

	_marqueeChangeHandler: function(json)
	{
		MainFrame.refreshMarquee();
	},
	
	_menuNumberChangeHandler: function(json)
	{
		var data = [];
		for (var menuId in json) {
			MainFrame._menuNumbers[menuId] = json[menuId];
			if (menuId in MainFrame._menuTexts) {
				var html = MainFrame._getMenuNodeHtml(menuId, json[menuId]);
				data.push({id:menuId, html:html});
			}
		}
		for (var barId in MainFrame._treeMap) {
			MainFrame._treeMap[barId].update(data, {});
		}
	},
	
	_newSystemMessageHandler: function()
	{
		Utility.invoke("Qs.SystemMessage.getTodoItems", null, false, function(ret) {
			if (!Jui.array.isEmpty(ret.items)) {
				var box = Jui.option.MessageReminder.open(ret);
				box.onitemclick = MainFrame.doSystemMessageItemClick;
			}
			MainFrame.setSystemMessageCount(ret.count);
		});
	},
	
	_instantActivityFinishedHandler: function(json)
	{
		MainFrame.broadcast({action:"InstantActivityFinished", args:{activityId:json.activityId}});
	},
	
	_onlineUserHandshakeHandler: function(json)
	{
		Utility.invoke("Qs.OnlineUser.respondHandshake", {key:json.key}, false);
	},
	
	_execute: function(event)
	{
		var data = event.json.data;
		if (Jui.object.isEmpty(data)) {
			Jui.message.alert("The link of this node is not set.");
			return;
		}
		if (data.page != null) {
			if (data.openMode == "Window") {
				Utility.openWindow(data.page, data.args);
			}
			else {
				var tabTitle = data.title || MainFrame._menuTexts[event.json.id] || event.json.text;
				var options = {openNewTab:data.openNewTab};
				Utility.openTab(data.page, data.args, tabTitle, event.json.icon, null, null, true, options);
			}
		}
		else {
			var temp = eval(data["function"]);
			if (!/\(/.test(data["function"])) {
				temp(event);
			}
		}
	},

	_jumpToLoginPage: function(jumpCode, description)
	{
		var url = ".";
		if (jumpCode != null) {
			url += "?jumpCode=" + jumpCode;
			if (description != null) {
				url += "&description=" + encodeURIComponent(description);
			}
		}
		window.onbeforeunload = null;
		for (var i = 0; i < window.frames.length; ++i) {
			try {
				Jui.dom.getFrameWindow(window.frames[i]).onbeforeunload = null;
			}
			catch (e) {
			}
		}
		window.location.href = url;
	},

	_processTreeJson: function(data)
	{
		for (var i = 0; i < data.length;) {
			var item = data[i];
			if (item.replaceByChildren && item.children != null && item.children.length > 0) {
				data = data.slice(0, i).concat(item.children, data.slice(i + 1));
			}
			else {
				MainFrame._menuTexts[item.id] = item.text;
				if (item.id in MainFrame._menuNumbers) {
					item.html = MainFrame._getMenuNodeHtml(item.id, MainFrame._menuNumbers[item.id]);
				}
				if (item.children != null && item.children.length > 0) {
					MainFrame._processTreeJson(item.children);
				}
				++i;
			}
		}
		return data;
	},
	
	_getMenuNodeHtml: function(menuId, numbers)
	{
		var nonZeroNumbers = [];
		if (numbers != null) {
			for (var i = 0; i < numbers.length; ++i) {
				if (numbers[i] > 0) {
					var properties = (MainFrame._menuNumberProperties[menuId] || [])[i] || {};
					var html = "<label class=MenuNumber style='";
					if (properties.color != null) {
						html += "color:" + properties.color + ";";
					}
					if (properties.isBold != null) {
						html += "font-weight:bold;";
					}
					nonZeroNumbers.push(html + "'>" + numbers[i] + "</label>");
				}
			}
		}
		var html = Jui.$h(MainFrame._menuTexts[menuId]);
		if (nonZeroNumbers.length > 0) {
			var joiner = "<label class=MenuNumberSplitter>/</label>";
			html += "<span class=MenuNumbers>(" + nonZeroNumbers.join(joiner) + ")</span>";
		}
		return html;
	},
	
	_openPageFromEmail: function(args)
	{
		if (args.unitCode != null && args.entityId != null) {
			CommonBusiness.tryOpenViewPage(args.unitCode, args.entityId, true, function() {
				CommonBusiness.openEntity(args.unitCode, {entityId:args.entityId}, "Tab");
			});
		}
	},
	
	_checkPassword: function()
	{
		Utility.invoke("Qs.User.checkPassword", null, true, function(ret) {
			if (ret.needModify) {
				MainFrame.doModifyPassword({showCloseButton: !ret.forceModify});
			}
		});
	}
};

MainFrame.setWebSocketMessageHandler = MainFrame.setJocketMessageHandler;
Utility.addFunctionAlias(MainFrame);
window.onload			= MainFrame.doLoad;
window.onbeforeunload	= MainFrame.doBeforeUnload;
window.onmessage 		= MainFrame.doMessage;
window.addEventListener("resize", MainFrame.doResize);
