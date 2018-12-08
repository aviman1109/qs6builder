var EntityInfo = 
{
	contentMap: {}, 
	
	currentPageCode: null, 
	
	firstPageCode: clientData.pages[0].id,

	unloadedPages: {},

	doLoad: function()
	{
		$elem("HintClose").onclick = EntityInfo.hideHint;
		EntityInfo.tree = Jui.option.Tree.create({
			target		: "LeftZone",
			onleafclick	: EntityInfo.doTreeLeafClick,
			style		: "height:100%;width:100%;padding-left:6px;overflow:auto"
		});
		Jui.option.Resizer.create({elements:["LeftZone", "ContentZone"]});
		Jui.dom.setInnerText($elem("TypeAndName"), clientData.typeAndName);
		if (clientData.urlArgs.entityId == null || clientData.urlArgs.isCopy) {
			for (var i = 1; i < clientData.pages.length; ++i) {
				clientData.pages[i].disabled = true;
			}
		}
		var pageCode = EntityInfo.firstPageCode;
		if (clientData.urlArgs.slavePageCode != null) {
			for (var i = 0; i < clientData.pages.length; ++i) {
				if (clientData.pages[i].id == clientData.urlArgs.slavePageCode) {
					pageCode = clientData.pages[i].id;
				}
			}
		}
		var datalinkPages = clientData.datalinkPages;
		if (clientData.urlArgs.entityId == null || clientData.urlArgs.isCopy) {
			for (var i = 0; i < datalinkPages.length; ++i) {
				datalinkPages[i].disabled = true;
			}
		}
		var pages = clientData.pages.concat(datalinkPages);
		EntityInfo.tree.load(pages);
		EntityInfo.tree.setCurrentId(pageCode);
		EntityInfo.doTreeLeafClick();
	},

	doTreeLeafClick: function()
	{
		var node = EntityInfo.tree.getCurrentNode();
		if (node.hasOwnProperty("type")) {
			EntityInfo.doDataLinkLeafClick(node);
		} 
		else {
			EntityInfo._activatePage(node);
		}
	},
	
	doDataLinkLeafClick : function(node)
	{
		var srcEntityId = clientData.entityId;
		var args = {entityId : node.id, srcEntityId : srcEntityId};
		Utility.invoke("Qs.DataLink.filterUrlAddress", args, true, function(ret) {
			var urlAddress = ret.FUrlAddress;
			var mode = ret.FOpenMode;
			node = Jui.object.merge(node, {data : urlAddress}, true); 
			if (mode == 'Tab') {
				Utility.openTab(node.data,null, node.text, node.icon);	
			} 
			else if (mode == 'Window') {
				window.open(Jui.util.getFullUrl(node.data), "_blank");
			} 
			else if (mode == 'SlavePage') {
				EntityInfo._activatePage(node);
			}
		});	
	},
	
	reloadFirstPage: function()
	{
		var frame = EntityInfo.contentMap[EntityInfo.firstPageCode];
		setTimeout(function(){frame.src = frame.src;}, 0);
	},

	showSubPage: function(pageCode)
	{
		var map = Jui.array.toMap(clientData.pages, "id");
		var page = map[pageCode];
		if (page == null) {
			throw "subpage '" + pageCode + "' not exist.";
		}
		EntityInfo.tree.setCurrentId(page.id);
		EntityInfo._activatePage(page);
	},

	unloadSubPage: function(pageCode)
	{
		if (pageCode in EntityInfo.contentMap) {
			EntityInfo.unloadedPages[pageCode] = 1;
		}
	},
	
	unloadAllSubPagesExceptTheFirstOne: function()
	{
		for (var i = 1, pages = clientData.pages; i < pages.length; ++i) {
			EntityInfo.unloadedPages[pages[i].id] = 1;
		}
	},
	
	isSubPageWindow: function(wnd)
	{
		for (var id in EntityInfo.contentMap) {
			try {
				var frame = EntityInfo.contentMap[id];
				if (frame.contentWindow == wnd) {
					return true;
				}
			}
			catch (e) {
			}
		}
		return false;
	},

	//-----------------------------------------------------------------------
	// private
	//-----------------------------------------------------------------------

	_activatePage: function(node)
	{
		var pageCode = node.id;
		if (pageCode == EntityInfo.currentPageCode) {
			return;
		}
		var frame = EntityInfo.contentMap[pageCode];
		if (frame == null || pageCode in EntityInfo.unloadedPages) {
			var defaultArgs = {masterUnitId:clientData.unitId, masterEntityId:clientData.entityId};
			var args = pageCode == EntityInfo.firstPageCode ? clientData.urlArgs : defaultArgs;
			args.addToLastOpen = false;
			if (frame == null) {
				var html = "<iframe style='width:100%;height:100%' frameborder='no' tabIndex='-1'></iframe>";
				var cell = $elem("ContentZone");
				Jui.dom.insertHtml(cell, "BeforeEnd", html);
				frame = cell.lastChild;
				EntityInfo.contentMap[pageCode] = frame;
			}
			if (node.hasOwnProperty("type")) {
				frame.src = node.data;
			}
			else {
				frame.src = Utility.getUrl(node.data, args);
			}
			delete EntityInfo.unloadedPages[pageCode];
		}
		Jui.dom.setInnerText($elem("SlavePageNameCell"), node.text);
		$elem("SlavePageNameCell").style.backgroundImage = "url(" + node.icon + ")";
		if (EntityInfo.currentPageCode != null) {
			EntityInfo.contentMap[EntityInfo.currentPageCode].style.visibility = "hidden";
		}
		EntityInfo.contentMap[pageCode].style.visibility = "visible";
		EntityInfo.currentPageCode = pageCode;
	},
	
	showHint: function(content)
	{
		$elem("SlavePageNameCell").style.display = "none";
		$elem("HintCell").style.display = "block";
		$elem("HintContent").innerHTML = content;
		return $elem("HintContent");
	},
	
	hideHint: function()
	{
		$elem("SlavePageNameCell").style.display = "block";
		$elem("HintCell").style.display = "none";
	}
};

if (!Jui.string.isEmpty(clientData.entityName)) {
	Utility.setTabTitle(clientData.entityName);
}

Utility.addFunctionAlias(EntityInfo);
