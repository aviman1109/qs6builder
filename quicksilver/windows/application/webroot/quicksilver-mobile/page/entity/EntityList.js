Utility.defineScript("Qs.EntityList",
{
	list: null,
	
	pageCount: 0,
	
	schemaPopupItems: null,
	
	schemaId: null,
	
	keywordBox: null,
	
	hasNextPage: false,
	
	isLoading: false,
	
	onload: function()
	{
		this.ontitleclick	= Qs.EntityList.doTitleClick;
		this.onrefresh		= Qs.EntityList.refresh;
		var body			= Jui.basic.Page.getBody(this);
		body.innerHTML		= "<div>"
							+ 	"<div class=QsEntityListSearchZone>"
							+     "<input>"
							+	  "<img src='quicksilver-mobile/image/32/SearchBox.png'>"
							+	"</div>"
							+ 	"<div class=QsEntityListDataZone></div>"
							+ 	"<div class=QsEntityListInfoZone></div>"
							+ "</div>";
		this.list = Jui.option.List.create({
			target	: body.firstChild.children[1],
			onclick	: Qs.EntityList.doItemClick
		});
		this.infoZone = body.firstChild.children[2];
		this.keywordBox = body.firstChild.firstChild.firstChild;
		this.keywordBox.onchange = Qs.EntityList.doKeywordChange;
		Jui.dom.setInnerText(this.infoZone, $text("Qs.MobileList.BottomInfo.Current", 0));
		Jui.basic.Page.setScrollable(this, true, true, Qs.EntityList.doScroll);
	},
	
	ondata: function(data)
	{
		var page = this;
		page.data = data;
		page.keywordBox.placeholder = data.keywordTitles.join("/");
		page.list.loadTitle(data.titleJson);
		if (data.schema != null) {
			page.schemaId = data.schema.id;
		}
		if (!page.args.isQuerySchemaLocked && (data.schema != null || !Jui.array.isEmpty(data.schemas))) {
			var schemaName = data.schema == null ? $text("Qs.MobileList.QuerySchema.All") : data.schema.name;
			Jui.basic.Page.setSubTitle(page, schemaName);
			var items = [];
			if (!Jui.array.isEmpty(data.schemas)) {
				for (var i = 0; i < data.schemas.length; ++i) {
					var schema = data.schemas[i];
					if (schema.items != null) {
						items = items.concat(schema.items);
					}
					else {
						items.push(schema);
					}
				}
			}
			var schemaIds = Jui.array.toSet(Jui.array.extractProperty(items, "id"));
			if (data.schema != null && !(data.schema.id in schemaIds)) {
				items.push(data.schema);
			}
			items.push({id:null, text:$text("Qs.MobileList.QuerySchema.Clear")});
			page.schemaPopupItems = items;
		}
		page.refresh();
	},
	
	doItemClick: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (page.args.isSelect) {
			Jui.basic.Page.close(page, {id:event.id, name:event.name});
		}
		else {
			Utility.openPage(page.data.unitCode + ".MobileForm", {entityId:event.id}, null, function(ret) {
				if (ret != null) {
					page.refresh();
				}
			});
		}
	},
	
	doAdd: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		Utility.openPage(page.data.unitCode + ".MobileForm", {}, null, function(ret) {
			if (ret != null) {
				page.refresh();
			}
		});
	},

	doTitleClick: function(event)
	{
		var popupMenu = Jui.basic.PopupMenu.getInstance();
		popupMenu.onclick = Qs.EntityList.doSchemaChange;
		popupMenu.show(this.schemaPopupItems, this);
	},
	
	doSchemaChange: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		var schemaName = event.value == null ? $text("Qs.MobileList.QuerySchema.All") : event.text;
		Jui.basic.Page.setSubTitle(page, schemaName);
		page.schemaId = event.value;
		page.refresh();
	},
	
	doKeywordChange: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		page.refresh();
	},
	
	doScroll: function(event)
	{
		var page = Jui.basic.Page.getCurrentPage();
		if (event.bottom && !page.isLoading && page.hasNextPage) {
			page.loadNextPage();
		}
		if (event.refresh && !page.isLoading) {
			page.refresh();
		}
	},
	
	refresh: function()
	{
		this.loadNextPage(true);
	},
	
	loadNextPage: function(isRefresh)
	{
		var page = this;
		var data = this.data;
		if (isRefresh) {
			this.pageCount = 0;
		}
		var args = Jui.object.merge({pageIndex:page.pageCount + 1}, this.getArguments());
		Jui.dom.setInnerText(page.infoZone, $text("Qs.MobileList.BottomInfo.Loading"));
		page.isLoading = true;
		Utility.invoke(data.unitCode + ".getMobileListData", args, true, function(ret) {
			if (isRefresh) {
				page.list.loadData(ret.records);
			}
			else {
				page.list.appendData(ret.records);
			}
			var listLength = page.list.length();
			if (ret.hasNextPage) {
				Jui.dom.setInnerText(page.infoZone, $text("Qs.MobileList.BottomInfo.Current", listLength));
			}
			else {
				Jui.dom.setInnerText(page.infoZone, $text("Qs.MobileList.BottomInfo.NoMore", listLength));
			}
			page.pageCount = ret.pageIndex;
			page.hasNextPage = ret.hasNextPage;
			page.isLoading = false;
		});
	},
	
	getArguments: function()
	{
		var data = this.data;
		var args = {
			listId			: data.listId,
			relationId		: data.relationId,
			masterEntityId	: data.masterEntityId,
			schemaId		: this.schemaId,
			keyword			: this.keywordBox.value
		};
		return args;
	}
});
