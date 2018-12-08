var QuerySchemaSort = 
{
	unitId: clientData.unitId,
	
	publicSchemaIds: {},
	
	doLoad: function()
	{
		var publicItems = clientData.publicItems || [];
		for (var i = 0; i < publicItems.length; ++i) {
			QuerySchemaSort.publicSchemaIds[publicItems[i].value] = 1;
		}

		var html = "<div style='padding:8px 8px 2px 8px'><table><tr>"
				 +   "<td style='padding-right:6px'>" + $text("Qs.QuerySchema.MyDefaultSchema") + "</td>"
				 +	 "<td></td>"
				 + "</tr></table></div>";
		var content = $elem("QsContent");
		Jui.dom.insertHtml(content, "AfterBegin", html);
		var table = content.firstChild.firstChild;
		content.style.paddingBottom = "42px";
		content.style.overflow = "hidden";
		QuerySchemaSort.defaultSchemaBox = Jui.basic.ComboBox.create({
			target	: table.rows[0].cells[1],
			items	: clientData.defaultSchemaBoxItems
		});
		if (clientData.defaultSchema != null) {
			QuerySchemaSort.defaultSchemaBox.setValue(clientData.defaultSchema.id, clientData.defaultSchema.name);
		}
		
		QuerySchemaSort.refreshSorter(clientData.visibleIds);
	},

	doSave: function()
	{
		var args = {
			unitId				: clientData.urlArgs.unitId,
			defaultId			: QuerySchemaSort.defaultSchemaBox.getValue(),
			privateVisibleIds	: [],
			publicVisibleIds	: []
		};
		var visibleIds = DoubleSorter.sorters.right.getValues();
		for (var i = 0; i < visibleIds.length; ++i) {
			var id = visibleIds[i];
			(id in QuerySchemaSort.publicSchemaIds ? args.publicVisibleIds : args.privateVisibleIds).push(id);
		}
		Utility.invoke("Qs.QuerySchema.setVisibleIndexAndDefault", args, true, function() {
			Jui.message.hint($text("Public.SaveSuccess"));
			Utility.closeDialog(true);
		});
	},
	
	moveLeft: function()
	{
		var selected = DoubleSorter.sorters.right.getSelectedValues();
		if (QuerySchemaSort.validatePrivilege(selected)) {
			var current = DoubleSorter.sorters.right.getValues();
			var values = [];
			var set = Jui.array.toSet(selected);
			for (var i = 0; i < current.length; ++i) {
				if (!(current[i] in set)) {
					values.push(current[i]);
				}
			}
			QuerySchemaSort.refreshSorter(values);
		}
	},
	
	moveRight: function()
	{
		var selected = DoubleSorter.sorters.left.getSelectedValues();
		if (QuerySchemaSort.validatePrivilege(selected)) {
			var current = DoubleSorter.sorters.right.getValues();
			var values = current.concat(selected);
			QuerySchemaSort.refreshSorter(values);
		}
	},
	
	moveUp: function()
	{
		if (QuerySchemaSort.validatePrivilege(DoubleSorter.sorters.right.getSelectedValues())) {
			DoubleSorter.sorters.right.moveUp();
		}
	},
	
	moveDown: function()
	{
		if (QuerySchemaSort.validatePrivilege(DoubleSorter.sorters.right.getSelectedValues())) {
			DoubleSorter.sorters.right.moveDown();
		}
	},
	
	moveTop: function()
	{
		if (QuerySchemaSort.validatePrivilege(DoubleSorter.sorters.right.getSelectedValues())) {
			DoubleSorter.sorters.right.moveTop();
		}
	},
	
	moveBottom: function()
	{
		if (QuerySchemaSort.validatePrivilege(DoubleSorter.sorters.right.getSelectedValues())) {
			DoubleSorter.sorters.right.moveBottom();
		}
	},

	refreshSorter: function(values)
	{
		var leftPrivate 	= QuerySchemaSort.getGroupItems(values, false, false);
		var leftPublic		= QuerySchemaSort.getGroupItems(values, false, true);
		var rightPrivate	= QuerySchemaSort.getGroupItems(values, true, false);
		var rightPublic		= QuerySchemaSort.getGroupItems(values, true, true);
		DoubleSorter.sorters.left.load(leftPrivate.concat(leftPublic));
		DoubleSorter.sorters.right.load(rightPrivate.concat(rightPublic));
	},
	
	getGroupItems: function(selectedValues, visible, isPublic)
	{
		var allItems	= (isPublic ? clientData.publicItems : clientData.privateItems) || [];
		var titleCode	= isPublic ? "Qs.QuerySchema.PublicQuerySchema" : "Qs.QuerySchema.PrivateQuerySchema";
		var set 		= Jui.array.toSet(selectedValues);
		var items 		= [];
		for (var i = 0; i < allItems.length; ++i) {
			var item = allItems[i];
			if (item.value in set == visible) {
				if (items.length == 0) {
					items.push({level:1, isTitle:true, text:$text(titleCode)});
				}
				items.push({level:2, value:item.value, text:item.text});
			}
		}
		return items;
	},
	
	validatePrivilege: function(values)
	{
		if (clientData.hasManagePrivilege) {
			return true;
		}
		for (var i = 0; i < values.length; ++i) {
			if (values[i] in QuerySchemaSort.publicSchemaIds) {
				Jui.message.alert($text("Qs.QuerySchema.CannotSortPublic"));
				return false;
			}
		}
		return true;
	}
};

DoubleSorter.leftTitle 	= $text("Qs.QuerySchema.Hidden");
DoubleSorter.rightTitle = $text("Qs.QuerySchema.Visible");
DoubleSorter.doRefresh 	= QuerySchemaSort.doLoad;
DoubleSorter.moveLeft 	= QuerySchemaSort.moveLeft;
DoubleSorter.moveRight	= QuerySchemaSort.moveRight;
DoubleSorter.moveUp		= QuerySchemaSort.moveUp;
DoubleSorter.moveDown	= QuerySchemaSort.moveDown;
DoubleSorter.moveTop	= QuerySchemaSort.moveTop;
DoubleSorter.moveBottom	= QuerySchemaSort.moveBottom;
