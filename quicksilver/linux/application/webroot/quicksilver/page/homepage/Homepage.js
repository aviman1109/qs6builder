var Homepage =
{
	//-----------------------------------------------------------------------
	// Data
	//-----------------------------------------------------------------------
	
	items: {},
	
	asyncLoadItems: [],
	
	toolBarData: [],
	
	listFunctions: {},

	//-----------------------------------------------------------------------
	// Common
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		for (var i = 0; i < Homepage.toolBarData.length; ++i) {
			var item = Homepage.toolBarData[i];
			Homepage.items[item.id].toolBar.load(item.data);
		}
		for (var itemId in Homepage.items) {
			Homepage.items[itemId].content = document.getElementById("BlockContent-" + itemId);
		}
		for (var i = 0, elems = document.getElementsByClassName("HomepageItem"); i < elems.length; ++i) {
			var item = Homepage.items[elems[i].id];
			if (item.refresh != null) {
				Homepage.asyncLoadItems.push(item);
			}
		}
		if (Homepage.asyncLoadItems.length > 0) {
			Homepage.asyncLoadItems.shift().refresh(true);
		}
	},
	
	doToggleButtonClick: function()
	{
		var item = Homepage.getItemByEvent();
		Homepage.setContentVisible(item, item.content.style.display == "none");
	},
	
	getItemByEvent: function()
	{
		var itemId = Jui.dom.getAncestorByClassName("HomepageItem").id;
		return Homepage.items[itemId];
	},
	
	addToolBar: function(id, data, visible)
	{
		data.left.unshift({
			name	: "Toggle",
			control	: "Button",
			icon	: Homepage.getToggleIcon(visible),
			onclick	: Homepage.doToggleButtonClick
		});
		Homepage.toolBarData.push({id:id, data:data});
	},
	
	setContentVisible: function(item, visible)
	{
		item.content.style.display = visible ? "" : "none";
		item.toolBar.getItem("Toggle").setIcon(Homepage.getToggleIcon(visible));
	},
	
	getToggleIcon: function(visible)
	{
		return visible ? "quicksilver/image/16/ArrowDown.png" : "quicksilver/image/16/ArrowRight.png";
	},

	//-----------------------------------------------------------------------
	// QuerySchema
	//-----------------------------------------------------------------------
	
	createQuerySchemaList: function(itemId)
	{
		var item = Homepage.items[itemId];
		item.list = Jui.option.List.create({
			showRowNumber			: false,
			selectionMode			: 'single',
			multiPage				: false,
			ondoubleclick			: Homepage.doQuerySchemaItemDoubleClick,
			entityBoxViewHandler	: CommonBusiness.doEntityBoxView	
		});
		var titleJson = item.titleJson;
		var func = Homepage.listFunctions[item.unitCode];
		if (func != null && func.processListTitle != null) {
			titleJson = func.processListTitle(titleJson);
		}
		item.list.loadTitle(titleJson);
	},
	
	doQuerySchemaItemExpand: function()
	{
		var item = Homepage.getItemByEvent();
		Utility.openTab(item.pageCode + ".page", {schemaId:item.schemaId}, item.tabTitle, item.unitIcon);
	},
	
	doQuerySchemaItemOpen: function()
	{
		var item = Homepage.getItemByEvent();
		var entityId = item.list.getSelectedKeys()[0];
		if (entityId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		Homepage.openQuerySchemaItem(item, entityId, "Dialog");
	},
	
	doQuerySchemaItemDoubleClick: function(event)
	{
		var item = Homepage.getItemByEvent();
		Homepage.openQuerySchemaItem(item, event.id, "Tab");
	},
	
	openQuerySchemaItem: function(item, entityId, mode)
	{
		CommonBusiness.tryOpenViewPage(item.unitCode, entityId, true, function() {
			CommonBusiness.openEntity(item.unitCode, {entityId:entityId}, mode, function(ret) {
				CommonBusiness.loadListRow(item.list, item.unitCode, item.listId, ret.ids, false);
			});
		});
	},
	
	doQuerySchemaItemRefresh: function()
	{
		Homepage.getItemByEvent().refresh();
	},
	
	refreshQuerySchemaItem: function(isPageLoad)
	{
		var item = this;
		var args = {
			listId			: item.listId,
			schemaId		: item.schemaId,
			pageSize		: item.rowCount,
			showPageCount	: item.showTotalCount
		};
		Utility.invoke(item.unitCode + ".getListData", args, true, function(ret) {
			var size = ret.data.records.length;
			var countText;
			if (!ret.data.hasNextPage) {
				countText = $text("Qs.Homepage.CountText.Total", size);
			}
			else if (!item.showTotalCount) {
				countText = $text("Qs.Homepage.CountText.First", size);
			}
			else {
				countText = $text("Qs.Homepage.CountText.TotalAndFirst", ret.data.totalSize, size);
			}
			Jui.dom.setInnerText(item.toolBar.getItem("Count"), countText);
			Homepage.setContentVisible(item, size > 0);
			item.content.style.height = Math.max(2, 1 + size) * Jui.theme["List.RowHeight"] + "px";
			
			var dataJson = ret.data;
			var func = Homepage.listFunctions[item.unitCode];
			if (func != null && func.processListData != null) {
				dataJson = func.processListData(dataJson);
			}
			item.list.loadData(dataJson);

			if (isPageLoad && Homepage.asyncLoadItems.length > 0) {
				Homepage.asyncLoadItems.shift().refresh(true);
			}
		});
	},
	
	//-----------------------------------------------------------------------
	// Chart
	//-----------------------------------------------------------------------
	
	doChartItemExpand: function()
	{
		var item		= Homepage.getItemByEvent();
		var tabTitle	= $text("Qs.Menu.Chart");
		var icon		= "quicksilver/image/unit/Chart.png";
		Utility.openTab("Qs.Chart.Show.page", {chartId:item.chartId}, tabTitle, icon);
	},
	
	doChartItemRefresh: function()
	{
		Homepage.loadChart(Homepage.getItemByEvent());
	},
	
	loadChart: function(item)
	{
		var panel = $elem("BlockContent-" + item.id);
		Chart.getData(panel, null, {chartId:item.chartId}, function(ret) {
			if (!ret.isEmpty) {
				if (ret.chart != null) {
					delete ret.chart.caption;
				}
				else {
					delete ret.title;
				}
			}
			Chart.show(panel, ret, null, false);
		});
	},

	//-----------------------------------------------------------------------
	// LastOpen
	//-----------------------------------------------------------------------
	
	doLastOpenItemOpen: function()
	{
		var list = Homepage.getItemByEvent().list;
		var entityId = list.getSelectedKeys()[0];
		if (entityId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		var unitCode = list.getSelectedFieldValues("UnitCode")[0];
		CommonBusiness.openEntity(unitCode, {entityId:entityId}, "Dialog");
	},
	
	doLastOpenItemDoubleClick: function(event)
	{
		CommonBusiness.openEntity(event.data.UnitCode, {entityId:event.id}, "Tab");
	},
	
	doLastOpenItemRefresh: function()
	{
		var item = Homepage.getItemByEvent();
		Utility.invoke("Qs.QuerySchema.getHomepageLastOpenListData", null, true, function(ret) {
			item.content.style.height = Math.max(2, 1 + ret.data.length) * Jui.theme["List.RowHeight"] + "px";
			item.list.loadData(ret.data);
		});
	},
	
	//-----------------------------------------------------------------------
	// WorkItem
	//-----------------------------------------------------------------------
	
	doTodoItemOpen: function()
	{
		var item = Homepage.getItemByEvent();
		var workItemId = item.list.getSelectedKeys()[0];
		if (workItemId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		Homepage.openTodoItem(item, workItemId);
	},
	
	doTodoItemDoubleClick: function(event)
	{
		var item = Homepage.getItemByEvent();
		Homepage.openTodoItem(item, event.id);
	},
	
	doTodoListEntityBoxView: function()
	{
		var box = this;
		if (box.getName() == "FProcessId") {
			var item = Homepage.getItemByEvent();
			var workItemId = item.list.getHoveringKey();
			if (workItemId != null) {
				Homepage.openTodoItem(item, workItemId);
			}
		}
		else {
			CommonBusiness.openEntity(box.getEntityType(), {entityId:box.getValue()}, "Dialog");
		}
	},

	openTodoItem: function(item, workItemId)
	{
		var args = {workItemId:workItemId};
		Utility.invoke("Wf.WorkItem.getHandleInformation", args, true, function(ret) {
			var options = CommonBusiness.defaultDialogOptions.info;
			Utility.openDialog(ret.url, ret.args, options, function() {
				Homepage.doTodoItemRefresh(null, item);
			});
		});
	},
	
	doTodoItemRefresh: function(event, item)
	{
		(item || Homepage.getItemByEvent()).refresh();
	},
	
	doTodoItemExpand: function()
	{
		var url		= "Wf.WorkItem.List.page";
		var args	= {schemaId:"d6a812ef-c2f5-4bc3-8571-eb2e77f1906f"};
		var title	= $text("Wf.WorkItem.List");
		var icon	= "quicksilver/image/16/TodoTask.gif";
		Utility.openTab(url, args, title, icon);
	},
	
	refreshTodoItem: function(isPageLoad)
	{
		var item = this;
		Utility.invoke("Wf.WorkItem.getHomepageTodoListData", null, true, function(ret) {
			var template = $text("Qs.Homepage.CountText.TotalAndFirst");
			var countText = template.replace("${0}", ret.totalSize).replace("${1}", ret.size);
			Jui.dom.setInnerText(item.toolBar.getItem("Count"), countText);
			Homepage.setContentVisible(item, ret.data.length > 0);
			item.content.style.height = (1 + ret.data.length) * Jui.theme["List.RowHeight"] + "px";
			item.list.loadData(ret.data);
			if (isPageLoad && Homepage.asyncLoadItems.length > 0) {
				Homepage.asyncLoadItems.shift().refresh(true);
			}
		});
	},

	//-----------------------------------------------------------------------
	// ContextMenu
	//-----------------------------------------------------------------------
	
	doContextMenu: function()
	{
		if (Homepage.menu == null) {
			var items = [
				{
					text	: $text("Qs.Homepage.Refresh"),
					icon	: "quicksilver/image/16/Refresh.png",
					onclick	: Homepage.doRefresh
				}, {
					text	: $text("Qs.Homepage.UserConfig"),
					icon	: "quicksilver/image/16/Config.png",
					onclick : "Homepage.doConfig('User')"
				}
			];
			if (clientData.hasManagePrivilege) {
				items.push({
					text	: $text("Qs.Homepage.SystemConfig"),
					icon	: "quicksilver/image/16/Config.png",
					onclick	: "Homepage.doConfig('System')"
				});
			}
			Homepage.menu = Jui.basic.PopupMenu.create({items:items});
		}
		Homepage.menu.show();
		return false;
	},
	
	doRefresh: function()
	{
		window.location.reload(true);
	},
	
	doConfig: function(type)
	{
		var url = "Qs.HomepageItem." + type + "HomepageConfig.page";
		var title = $text("Qs.Homepage." + type + "Config");
		var icon = "quicksilver/image/16/Home.gif";
		Utility.openTab(url, null, title, icon);
	}
};

Jui.option.List.setHScrollable(false);
document.oncontextmenu = Homepage.doContextMenu;
