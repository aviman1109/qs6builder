Jui.addPageScript("Qs.EntityList",
{
	initialize: function()
	{
		
	},
	
	load: function()
	{
		
	},
	
	unload: function()
	{
		
	},
	
	doLoad: function()
	{
		if ($elem("LeftZone") != null) {
			EntityList._setLeftZoneVisible(true);
		}
		if ($elem("RightZone") != null) {
			EntityList._setRightZoneVisible(true);
		}

 		EntityList.loadLeftZone();
		window.list = Jui.option.List.create({
			target					: "ListZone",
			multiPage				: EntityList.multiPage,
			multiSelect				: EntityList.multiSelect,
			showPageCount			: clientData.showPageCount,
			queryOnSort				: EntityList.multiPage,
			onquery					: EntityList.doListQuery,
			onclick					: EntityList.doListClick,
			onselect				: EntityList.doListSelect,
			ondoubleclick			: EntityList.doListDoubleClick,
			entityBoxViewHandler	: CommonBusiness.doEntityBoxView,
			pictureBoxViewHandler	: CommonBusiness.doPictureBoxView
		});
		var titleJson = Jui.object.merge({keywordFields:clientData.keywordFields}, clientData.titleJson);
		list.loadTitle(EntityList.processListTitle(titleJson));

		var schema = clientData.tempSchema || clientData.schema;
		if (schema != null) {
			EntityList.getQuerySchemaBox().setValue(schema.id, schema.name);
			EntityList.query();
		}
		else if (!Jui.string.isEmpty(clientData.keyword) && EntityList.hasKeywordBox) {
			EntityList.getKeywordBox().setValue(clientData.keyword);
			EntityList.query();
		}
		else if (EntityList.queryOnLoad || EntityList.initialQueryArguments != null) {
			EntityList.query();
		}
	},
	
	processToolBarJson: function(json)
	{
		var toolItemInitArguments = clientData.toolItemInitArguments || {};
		json.left = json.left || [];
		json.right = json.right || [];
		clientData.querySchemas = clientData.querySchemas || [];
		if (clientData.tempSchema != null) {
			var items = [{value:clientData.tempSchema.id, text:clientData.tempSchema.name}];
			clientData.querySchemas.unshift({items:items});
		}
		if (EntityList.hasQuerySchemaBox || EntityList.hasKeywordBox) {
			json.left.unshift({
				control	: "Splitter",
				type	: "hidden"
			});
			json.left.unshift({
				name	: "QueryBoxClear",
				control	: "Button",
				icon	: "quicksilver/image/16/Clear.png",
				hint	: $text("Qs.List.QueryBoxClearHint"),
				onclick	: EntityList.doQueryBoxClear
			});
		}
		if (EntityList.hasKeywordBox) {
			var keywordTitles = clientData.keywordTitles.join("/");
			var item = Jui.object.merge({
				name		: "Keyword",
				control		: "InputBox",
				hint		: $text("Qs.List.KeywordHint").replace("${0}", keywordTitles),
				emptyText	: keywordTitles,
		        onkeydown	: EntityList.doKeywordKeyDown
			}, toolItemInitArguments.Keyword);
			if (!Utility.isInDialog() && clientData.keywordBoxWidth != null) {
				item.style = "width:" + clientData.keywordBoxWidth + "px";
			}
			if (clientData.queryBoxBackgroundColor != null) {
				item.backgroundColor = clientData.queryBoxBackgroundColor;
			}
			json.left.unshift(item);
		}
		var schemaLocked = Jui.cast.toBool(clientData.urlArgs.schemaLocked, false);
		if (EntityList.hasQuerySchemaBox) {
			if (schemaLocked) {
				json.left.unshift({
					control		: "Splitter",
					type		: "hidden"
				});
			}
			else {
				json.left.unshift({
					name		: "QuerySchemaConfig",
					control		: "Button",
					icon		: "quicksilver/image/16/Config.png",
					hint		: $text("Qs.List.QueryBoxClearHint"),
					onclick		: EntityList.doQuerySchemaConfig
				});
			}
		}
		var emptyText;
		if (clientData.defaultSchema == null) {
			emptyText = $text("Qs.List.QuerySchemaEmptyText1");
		}
		else {
			emptyText = $text("Qs.List.QuerySchemaEmptyText2").replace("${0}", EntityList.defaultSchema.name);
		}
		var item = Jui.object.merge({
			name		: "QuerySchema",
			control		: "ComboBox",
			hint		: $text("Qs.List.QuerySchemaHint"),
			emptyText	: emptyText,
            selectOnly	: true,
            textAsValue	: false,
            items		: clientData.querySchemas,
			disabled	: schemaLocked,
			visible		: EntityList.hasQuerySchemaBox,
            onchange	: EntityList.doQuerySchemaChange
		}, toolItemInitArguments.QuerySchema);
		if (!Utility.isInDialog() && clientData.querySchemaBoxWidth != null) {
			item.style = "width:" + clientData.querySchemaBoxWidth + "px";
		}
		if (clientData.queryBoxBackgroundColor != null) {
			item.backgroundColor = clientData.queryBoxBackgroundColor;
		}
		json.left.unshift(item);

		if (EntityList.hasTree || EntityList.hasQueryForm || EntityList.hasQuerySchemaBox || EntityList.hasKeywordBox) {
			json.left.unshift({
				name	: 'NavigateForward',
				control	: 'Button',
				icon	: 'quicksilver/image/16/PageNext.gif',
				hint	: $text('Qs.List.NavigateForwardHint'),
				disabled: true,
				onclick	: EntityList.doNavigationButtonClick
			});
			json.left.unshift({
				name	: 'NavigateBackward',
				control	: 'Button',
				icon	: 'quicksilver/image/16/PagePrevious.gif',
				hint	: $text('Qs.List.NavigateBackwardHint'),
				disabled: true,
				onclick	: EntityList.doNavigationButtonClick
			});
		}
		
		if (EntityList.hasTree || EntityList.hasQueryForm) {
			json.left.unshift({
				name	: 'LeftZoneSwitch',
				control	: 'Button',
				icon	: 'quicksilver/image/16/FrameLeft.png',
				hint	: $text('Qs.List.SwitchLeftPane'),
				onclick	: EntityList.doLeftZoneSwitch
			});
		}
		if (clientData.hasViewFrame) {
			json.right.push({
				name	: 'RightZoneSwitch',
				control	: 'Button',
				icon	: 'quicksilver/image/16/FrameRight.png',
				hint	: $text('Qs.List.SwitchRightPane'),
				fixed	: true,
				onclick	: EntityList.doRightZoneSwitch
			});
		}
		return json;
	},

	loadLeftZone: function()
	{
		if (EntityList.hasTree && EntityList.hasQueryForm) {
			$elem("LeftZone").setAttribute("hasTitle", true);
			EntityList._setCurrentLeftTitle($elem("LeftZone").children[0]);
		}
		if (EntityList.hasTree) {
			EntityList.tree = Jui.option.Tree.create({
				target			: "TreeBodyPanel",
				style			: "width:100%;height:100%",
				onnodeclick		: EntityList.doTreeNodeClick,
				onloadsubnodes	: EntityList.doTreeLoadSubNodes
			});
			EntityList.tree.load(clientData.treeJson);
			EntityList.tree.expandLevel(2);
			Jui.basic.Button.create({
				target	: "TreeButtonPanel",
				icon	: "quicksilver/image/16/Clear.png",
				hint	: $text("Qs.List.Hint.ClearTree"),
				onclick	: EntityList.doTreeClear
			});
			if (clientData.treeField != null) {
				Jui.basic.Button.create({
					target	: "TreeButtonPanel",
					icon	: "quicksilver/image/16/Save.png",
					hint	: $text("Qs.List.Hint.SaveTreeAsQuerySchema"),
					onclick	: EntityList.doTreeSave
				});
			}
		}
		if (EntityList.hasQueryForm) {
			var panel = $elem("QueryFormBodyPanel");
			panel.innerHTML = QueryForm.getHtml(clientData.queryFormJson);
			QueryForm.initialize(panel, clientData.queryFormJson);
			
			var thunderIcon = clientData.queryFormAutoQuery ? "Thunder.png" : "ThunderDisabled.png";
			Jui.basic.Button.create({
				target	: "QueryFormButtonPanel",
				icon	: "quicksilver/image/16/Query.gif",
				hint	: $text("Qs.QueryForm.Hint.Query"),
				onclick	: EntityList.doQueryFormQuery
			});
			EntityList.queryFormThunderButton = Jui.basic.Button.create({
				target	: "QueryFormButtonPanel",
				icon	: "quicksilver/image/16/" + thunderIcon,
				hint	: $text("Qs.QueryForm.Hint.SwitchInstanceQuery"),
				onclick	: EntityList.doQueryFormModeSwitch
			});
			Jui.basic.Button.create({
				target	: "QueryFormButtonPanel",
				icon	: "quicksilver/image/16/Clear.png",
				hint	: $text("Qs.QueryForm.Hint.ClearQueryForm"),
				onclick	: EntityList.doQueryFormClear
			});
			Jui.basic.Button.create({
				target	: "QueryFormButtonPanel",
				icon	: "quicksilver/image/16/Save.png",
				hint	: $text("Qs.QueryForm.Hint.SaveAsQuerySchema"),
				onclick	: EntityList.doQueryFormSave
			});
		}
		var hide = clientData.isSlavePage || clientData.urlArgs.hideLeftZone;
		if (hide && EntityList.getToolBar().getItem("LeftZoneSwitch") != null) {
			EntityList.doLeftZoneSwitch();
		}
	},
	
	//-----------------------------------------------------------------------
	// ToolBar
	//-----------------------------------------------------------------------
	
	/**
	 * This page may be embedded in MultiEntityBoxItems.jsp. In this JSP, the
	 * toolbar is in the outer page, not in this one.
	 */
	getToolBar: function()
	{
		return clientData.urlArgs.showToolBar == false ? parent.toolBar : toolBar;
	},

	//-----------------------------------------------------------------------
	// QuerySchema and keyword
	//-----------------------------------------------------------------------
	
	getQuerySchemaBox: function()
	{
		return EntityList.getToolBar().getItem("QuerySchema");
	},
	
	getKeywordBox: function()
	{
		return EntityList.getToolBar().getItem("Keyword");
	},

	doQuerySchemaChange: function(event)
	{
		EntityList.query();
	},

	doQuerySchemaConfig: function()
	{
		var parentSchemaId = clientData.schema == null ? null :  clientData.schema.id;
		var querySchemaBox =  EntityList.getQuerySchemaBox();
		CommonBusiness.configQuerySchema(clientData.unitId, querySchemaBox, clientData.tempSchema, parentSchemaId);
	},

	doKeywordKeyDown: function(event)
	{
		if (event.keyCode == 13) {
			EntityList.query();
		}
	},
	
	doQueryBoxClear: function()
	{
		var schemaBox = EntityList.getQuerySchemaBox();
		if (schemaBox != null && !schemaBox.isDisabled()) {
			schemaBox.setValue();
		}
		var keywordBox = EntityList.getKeywordBox();
		if (keywordBox != null) {
			keywordBox.setValue();
		}
		if (EntityList.hasTree) {
			EntityList.tree.setCurrentId();
		}
		if (EntityList.hasQueryForm) {
			QueryForm.clear();
		}
		EntityList.query();
	},

	doNavigationButtonClick: function()
	{
		var step = this.getName() == "NavigateForward" ? 1 : -1;
		var index = EntityList.queryIndex + step;
		if (index >= 0 && index < EntityList.historyQueries.length) {
			EntityList.restoreQuery(index);
		}
	},

	//-----------------------------------------------------------------------
	// tree
	//-----------------------------------------------------------------------
	
	doTreeNodeClick: function(event)
	{
		EntityList.query();
	},
	
	doTreeClear: function()
	{
		EntityList.tree.setCurrentId();
		EntityList.query();
	},
	
	doTreeSave: function()
	{
		var node = EntityList.tree.getCurrentNode();
		if (node == null) {
			Jui.message.hint($text("Qs.List.CannotSaveTreeAsQuerySchema"));
			return;
		}
		var condition = [{
			fieldName	: clientData.treeField,
			operator	: "InWithSub",
			value		: JSON.stringify([node.id]),
			text		: node.text
		}];
		EntityList._saveAsQuerySchema(condition, node.text);
	},
	
	doTreeLoadSubNodes: function(event, callback)
	{
		var url = clientData.relationUnitCode + ".getTreeData";
		Utility.invoke(url, {parentId:event.id}, true, function(ret) {
			callback(ret.data);
		});
	},
	
	reloadTree: function()
	{
		if (EntityList.hasTree) {
			var url = clientData.relationUnitCode + ".getTreeData";
			Utility.invoke(url, null, true, function(ret) {
				EntityList.tree.load(ret.data);
				EntityList.tree.expandLevel(2);
			});
		}
	},

	//-----------------------------------------------------------------------
	// QueryForm
	//-----------------------------------------------------------------------

	doQueryFormBoxKeyDown: function(event)
	{
		if (event.keyCode == 13) {
			EntityList.query();
		}
	},

	doQueryFormBoxChange: function()
	{
		if (!/Disabled/.test(EntityList.queryFormThunderButton.getIcon())) {
			EntityList.query();
		}
	},

	doQueryFormQuery: function()
	{
		EntityList.query();
	},

	doQueryFormClear: function()
	{
		QueryForm.clear();
		EntityList.query();
	},
	
	doQueryFormModeSwitch: function()
	{
		var button = EntityList.queryFormThunderButton;
		var autoQuery = /Disabled/.test(button.getIcon());
		button.setIcon(autoQuery ? "quicksilver/image/16/Thunder.png" : "quicksilver/image/16/ThunderDisabled.png");
		if (autoQuery) {
			EntityList.query();
		}
	},

	doQueryFormSave: function()
	{
		var conditions = QueryForm.getConditions().conditions;
		if (conditions.length == 0) {
			Jui.message.alert($text("Qs.QueryForm.InputConditionAlert"));
			return;
		}
		var treeNodeCount = 0;
		for (var i = 0; i < conditions.length; ++i) {
			if (conditions[i].items != null) {
				treeNodeCount += conditions[i].items.length;
			}
		}
		if (treeNodeCount > 100) {
			Jui.message.alert($text("Qs.QueryForm.SaveTooManyTreeNodeAlert"));
			return;
		}
		else if (treeNodeCount > 20) {
			Jui.message.confirm($text("Qs.QueryForm.SaveManyTreeNodeConfirm"), function() {
				EntityList._saveAsQuerySchema(conditions);
			});
		}
		else {
			EntityList._saveAsQuerySchema(conditions);
		}
	},
	
	doLeftPanelSwitch: function()
	{
		EntityList._setCurrentLeftTitle(event.srcElement);
	},

	doLeftZoneSwitch: function()
	{
		EntityList._setLeftZoneVisible($elem("LeftZone").style.display == "none");
	},

	doRightZoneSwitch: function()
	{
		EntityList._setRightZoneVisible($elem("RightZone").style.display == "none");
	},
	
	//-----------------------------------------------------------------------
	// query
	//-----------------------------------------------------------------------

	query: function()
	{
		var args = EntityList.getArguments();
		EntityList.currentQueryArguments = args;
		EntityList.recordQuery();
		EntityList.getListData(args, true);
	},

	getListData: function(args, clearSortFlag)
	{
		args.showPageCount = list.isShowPageCount();
		Utility.invoke(clientData.unitCode + ".getListData", args, true, function(ret) {
			var keyParts = EntityList._splitKeyword(args.keyword);
			var selectedKeys = list.getSelectedKeys();
			list.loadData(EntityList.processListData(ret.data), keyParts);
			if (args.isRefresh) {
				list.selectByKey(selectedKeys);
			}
			if (EntityList.isInitialQuery && EntityList.isEnterSelect && list.length() == 1) {
				var pairs = list.getPairs();
				Utility.setDialogResult(EntityList.multiSelect ? pairs : pairs[0]);
				Utility.closeDialog();
				return;
			}
			if (clearSortFlag) {
				list.clearSortFlag();
			}
			EntityList.isInitialQuery = false;
			EntityList._updateViewFrame(true);
		});
	},
	
	processListTitle: function(json)
	{
		return json;
	},
	
	processListData: function(data)
	{
		return data;
	},
	
	getArguments: function()
	{
		var args = Jui.object.merge({}, EntityList.basicQueryArguments);
		if (EntityList.isInitialQuery) {
			Jui.object.merge(args, EntityList.initialQueryArguments);
		}

		args.listId = clientData.listId;
		if (EntityList.relationId != null) {
			args.relationId = EntityList.relationId;
		}
		if (clientData.masterUnitId != null) {
			args.masterUnitId = clientData.masterUnitId;
		}
		if (clientData.masterEntityId != null) {
			args.masterEntityId = clientData.masterEntityId;
		}
		if (clientData.hasConstantFilterSql) {
			Jui.object.merge(args, clientData.urlArgs.tempSchemaInfo);
		} 
		if (!EntityList.multiPage) {
			args.pageSize = 1000;
		}
		else if (EntityList.isSelect) {
			args.pageSize = 20;
		}

		var schemaBox = EntityList.getQuerySchemaBox();
		if (schemaBox != null) {
			if (schemaBox.getValue() == null && EntityList.defaultSchema != null) {
				schemaBox.setValue(EntityList.defaultSchema.id, EntityList.defaultSchema.name);
			}
			if (schemaBox.getValue() != null) {
				args.schemaId = schemaBox.getValue();
			}
		}
		var keywordBox = EntityList.getKeywordBox();
		if (keywordBox != null && keywordBox.getValue() != null) {
			args.keyword = keywordBox.getValue();
		}
		if ((EntityList.hasTree || EntityList.hasQueryForm) && $elem("LeftZone").style.display != "none") {
			if (EntityList.hasTree && $elem("TreePanel").style.display != "none") {
				var id = EntityList.tree.getCurrentId();
				if (id != null) {
					args.masterEntityId	= id;
					args.includeSelf = true;
					args.includeIndirectSub = Jui.cast.toBool(clientData.urlArgs.includeIndirectSub, true);
				}
			} 
			if (EntityList.hasQueryForm && $elem("QueryFormPanel").style.display != "none") {
				var queryFormArgs = QueryForm.getConditions(true);
				args.queryFormRecent = queryFormArgs.queryFormRecent;
				if (queryFormArgs.conditions != null && queryFormArgs.conditions.length > 0) {
					if (args.conditions == null) {
						args.conditions = queryFormArgs.conditions;
					}
					else {
						args.conditions = args.conditions.concat(queryFormArgs.conditions);
					}
				}
			}
		}
		
		return args;
	},

	recordQuery: function()
	{
		var item = {args:EntityList.currentQueryArguments};
		var schemaBox = EntityList.getQuerySchemaBox();
		if (schemaBox != null) {
			item.schemaId = schemaBox.getValue();
			item.schemaName = schemaBox.getText();
		}
		var keywordBox = EntityList.getKeywordBox();
		if (keywordBox != null) {
			item.keyword = keywordBox.getValue();
		}
		if (EntityList.hasTree) {
			item.treeNodeId = EntityList.tree.getCurrentId();
		}
		if (EntityList.hasQueryForm) {
			item.queryFormData = QueryForm.getData();
		}
		var CAPACITY = 50;
		var list = EntityList.historyQueries;
		if (EntityList.queryIndex != list.length - 1) {
			list.splice(EntityList.queryIndex, list.length - EntityList.queryIndex - 1);
		}
		if (list.length >= CAPACITY) {
			list.splice(0, CAPACITY - list.length + 1);
		}
		EntityList.historyQueries.push(item);
		EntityList.queryIndex = EntityList.historyQueries.length - 1;
		EntityList._refreshNavigationButtonStatus();
		return item;
	},
	
	restoreQuery: function(index)
	{
		var item = EntityList.historyQueries[index];
		EntityList.currentQueryArguments = item.args;
		var schemaBox = EntityList.getQuerySchemaBox();
		if (schemaBox != null) {
			schemaBox.setValue(item.schemaId, item.schemaName);
		}
		var keywordBox = EntityList.getKeywordBox();
		if (keywordBox != null) {
			keywordBox.setValue(item.keyword);
		}
		if (EntityList.hasTree) {
			EntityList.tree.setCurrentId(item.treeNodeId);
		}
		if (EntityList.hasQueryForm) {
			QueryForm.loadData(item.queryFormData);
		}
		EntityList.queryIndex = index;
		EntityList._refreshNavigationButtonStatus();
		EntityList.getListData(item.args, true);
		return item;
	},
	
	//-----------------------------------------------------------------------
	// list
	//-----------------------------------------------------------------------
	
	doListClick: function(event)
	{
		var rightZone = $elem("RightZone");
		if (rightZone != null && rightZone.style.display != "none") {
			EntityList.setViewEntityId(event.id);
		}
	},
	
	doListSelect: function(event)
	{
		EntityList._updateViewFrame();
	},
	
	doListDoubleClick: function(event)
	{
		if (EntityList.isSelect) {
			var pair = {id:event.id, name:event.name};
			Utility.closeDialog(EntityList.multiSelect ? [pair] : pair);
		}
		else {
			CommonBusiness.tryOpenViewPage(clientData.unitCode, event.id, true, function() {
				EntityList.doOpen(null, "Tab", null, null, event.id);
			});		
		}
	},

	doListQuery: function(event)
	{
		if (EntityList.currentQueryArguments == null) {
			return;
		}
		var args = Jui.object.merge({}, event.arguments, EntityList.currentQueryArguments);
		EntityList.getListData(args, false);
	},

	//-----------------------------------------------------------------------
	// button
	//-----------------------------------------------------------------------
	
	doAdd: function(event)
	{
		if (clientData.isTableRelation && !EntityList.hasTree) {
			CommonBusiness.selectEntity(clientData.unitCode, null, function(ret) {
				var entityIds = Jui.array.extractProperty(ret, "id");
				var unitCode = clientData.unitCode;
				var relationId = EntityList.relationId;
				var masterEntityId = clientData.masterEntityId;
				CommonBusiness.setRelation(unitCode, relationId, masterEntityId, entityIds, function(ret) {
					CommonBusiness.appendListRow(list, unitCode, clientData.listId, entityIds);
					if (EntityList.onSaveSuccess != null) {
						EntityList.onSaveSuccess(true);
					}
				});
			});
			return;
		}
		var args = {
			relationId 		: EntityList.relationId,
			masterEntityId 	: clientData.masterEntityId,
			masterUnitId	: clientData.masterUnitId
		};
		if (EntityList.hasTree && EntityList.tree.getCurrentNode() != null) {
			args.masterEntityId = EntityList.tree.getCurrentNode().id;
		}
		if (this instanceof Jui.basic.ComboButton) {
			args.editId = event.id;
		}
		Jui.object.merge(args, EntityList.addArguments);
		if (EntityList.isSelect) {
			args.closeAfterSave = true;
		}
		CommonBusiness.openEntity(clientData.unitCode, args, EntityList.addPageMode, function(ret) {
			if (EntityList.isSelect) {
				var entityId = ret.entityIds[0];
				var name = CommonBusiness.getEntityName(clientData.unitCode, entityId);
				Utility.closeDialog({id:entityId, name:name});
				return;
			}
			if (EntityList.hasTree && clientData.unitCode == clientData.relationUnitCode) {
				CommonBusiness.loadTreeNode(EntityList.tree, clientData.unitCode, ret.entityIds);
			}
			if (ret.refreshList) {
				list.refresh(true);
			}
			else if (ret.entityIds.length > 0) {
				CommonBusiness.appendListRow(list, clientData.unitCode, clientData.listId, ret.entityIds);
			}
			if (EntityList.onSaveSuccess != null) {
				EntityList.onSaveSuccess(true);
			}
		});
	},
	
	doCopy: function()
	{
		EntityList.doOpen(null, "Dialog", true);
	},
	
	doConvert: function(destUnitCode)
	{
		var args = {isConvert:true, srcUnitId:clientData.unitId, srcEntityId:list.getSelectedKeys()[0]};
		if (args.srcEntityId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		CommonBusiness.openEntity(destUnitCode, args, "Dialog");
	},
	
	doOpen: function(event, mode, isCopy, customArgs, entityId)
	{
		entityId = entityId || list.getSelectedKeys()[0];
		if (entityId == null) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var defaultArgs = {entityId:entityId, masterEntityId:clientData.masterEntityId};
		if (isCopy) {
			defaultArgs.isCopy = true;
		}
		var args = Jui.object.merge(defaultArgs, customArgs);
		CommonBusiness.openEntity(clientData.unitCode, args, mode || "Dialog", function(ret) {
			if (EntityList.hasTree && clientData.unitCode == clientData.relationUnitCode) {
				CommonBusiness.loadTreeNode(EntityList.tree, clientData.unitCode, entityId);
			}
			if (ret.refreshList) {
				list.refresh();
			}
			else if (ret.entityIds.length == 0) {
				list.deleteRowsByKey(entityId);
			}
			else {
				CommonBusiness.loadListRow(list, clientData.unitCode, clientData.listId, ret.entityIds, isCopy);
				EntityList._updateViewFrame(true);
			}
			if (EntityList.onSaveSuccess != null) {
				EntityList.onSaveSuccess(false);
			}
		});
	},
	
	doDelete: function(event)
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Jui.message.confirm($text("Public.ListDeleteConfirm"), function() {
			if (clientData.isTableRelation) {
				var unitCode = clientData.unitCode;
				var relationId = EntityList.relationId;
				var masterEntityId = clientData.masterEntityId;
				CommonBusiness.unsetRelation(unitCode, relationId, masterEntityId, entityIds, function(ret) {
					Jui.message.hint($text("Public.DeleteSuccess"));
					list.deleteSelectedRows();
					if (EntityList.onDeleteSuccess != null) {
						EntityList.onDeleteSuccess();
					}
				});
				return;
			}
			CommonBusiness.deleteEntity(clientData.unitCode, entityIds, function(ret) {
				Jui.message.hint($text("Public.DeleteSuccess"));
				Utility.refreshMenuNumbers(clientData.unitId);
				list.deleteSelectedRows();
				EntityList._updateViewFrame();
				if (EntityList.hasTree) {
					EntityList.tree.remove(entityIds);
				}
				if (EntityList.onDeleteSuccess != null) {
					EntityList.onDeleteSuccess();
				}
			});
		});
	},
	
	doSort: function()
	{
		var args = {
			relationId		: EntityList.relationId,
			masterEntityId	: EntityList.hasTree ? EntityList.tree.getCurrentId() : clientData.masterEntityId
		};
		if (EntityList.hasTree && clientData.relationUnitId != clientData.unitId && args.masterEntityId == null) {
			Jui.message.alert($text("Public.Sort.SelectTreeNodeAlert").replace("${0}", clientData.relationUnitName));
			return;
		}
		var options = CommonBusiness.defaultDialogOptions.sort;
		Utility.openDialog(clientData.unitCode + ".Sort.page", args, options, function() {
			list.refresh(true);
		});
	},
	
	doRefresh: function()
	{
		list.refresh();
	},
	
	doSelectListConfirm: function()
	{
		if (EntityList.multiSelect) {
			var pairs = list.getSelectedPairs();
			if (pairs.length == 0) {
				Jui.message.alert($text("Public.SelectAlert"));
				return;
			}
			Utility.closeDialog(pairs);
		}
		else {
			var pair = list.getSelectedPairs()[0];
			if (pair == null) {
				Jui.message.alert($text("Public.SelectAlert"));
				return;
			}
			Utility.closeDialog(pair);
		}
	},
	
	doSelectListCancel: function()
	{
		Utility.closeDialog();
	},
	
	doImport: function()
	{
		var args = {unitId:clientData.unitId};
		Utility.openDialog("Qs.Import.ImportDialog.page", args, {width:600,height:240}, function() {
			if (EntityList.hasTree && clientData.unitCode == clientData.relationUnitCode) {
				Utility.invoke(clientData.unitCode + ".getTreeData", null, true, function(ret) {
					EntityList.tree.load(ret.data);
				});
			}
			list.refresh(true);
		});
	},
	
	doExcelExport: function()
	{
		if (list.length() == 0) {
			Jui.message.alert($text("Public.NoExportableData"));
			return;
		}
		var args = Jui.object.merge({format:"xls"}, EntityList.currentQueryArguments);
		Utility.download(clientData.unitCode + ".exportList", args);
	},
	
	doSqlExport: function()
	{
		if (list.length() == 0) {
			Jui.message.alert($text("Public.NoExportableData"));
			return;
		}
		var args = Jui.object.merge({format:"sql"}, EntityList.currentQueryArguments);
		Utility.download(clientData.unitCode + ".exportList", args);
	},
	
	doBillPrint: function(event)
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
		}
		else if (entityIds.length == 1) {
			CommonBusiness.viewBill(event.name, clientData.unitId, entityIds[0]);
		}
		else {
			Utility.invoke("Qs.Bill.setBatchEntityIds", {entityIds:entityIds}, true, function(ret) {
				CommonBusiness.viewBill(event.name, clientData.unitId, null, ret.batchId);
			});
		}
	},
	
	doBatchModify: function()
	{
		var page = this.getArgs().handlePage;
		var url = page.code + ".page";
		args = {
			enableAllFields		: true,
			addConfirmButton	: true,
			entityEventCode		: this.getArgs().name,
			showWorkflow		: false,
			batchModifyIds		: list.getSelectedKeys()
		};
		if (args.batchModifyIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog(url, args, CommonBusiness.defaultDialogOptions.form, function() {
			Jui.message.hint($text("Public.OperationSuccess"));
			CommonBusiness.updateListRow(list, clientData.unitCode, clientData.listId, args.batchModifyIds);
		});
	},

	executeOperation: function(code)
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		CommonBusiness.executeOperation(code, entityIds, null, function(ret) {
			if (ret.refreshPage) {
				CommonBusiness.loadListRow(list, clientData.unitCode, clientData.listId, entityIds);
			}
		});
	},
	
	//-----------------------------------------------------------------------
	// business operation
	//-----------------------------------------------------------------------
	
	doAssign: function()
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.openDialog("Qs.Entity.Assign.page", null, null, function(data) {
			var args = {entityIds:entityIds, data:data};
			Utility.invoke(clientData.unitCode + ".assign", args, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
				CommonBusiness.loadListRow(list, clientData.unitCode, clientData.listId, entityIds);
			});
		});
	},
	
	doExecute: function()
	{
		EntityList.invokeBusinessMethod("execute", "Public.ListExecuteConfirm");
	},
	
	doSubmit: function()
	{
		EntityList.invokeBusinessMethod("submit", "Public.ListSubmitConfirm");
	},
	
	doFinish: function()
	{
		EntityList.invokeBusinessMethod("finish", "Public.ListFinishConfirm");
	},
	
	doDiscard: function()
	{
		EntityList.invokeBusinessMethod("discard", "Public.ListDiscardConfirm");
	},
	
	doRevise: function()
	{
		EntityList.invokeBusinessMethod("revise", "Public.ListReviseConfirm");
	},
	
	invokeBusinessMethod: function(methodName, messageCode)
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		var message = Utility.formatText($text(messageCode), entityIds.length, clientData.unitName);
		Jui.message.confirm(message, function() {
			Utility.invoke(clientData.unitCode + "." + methodName, {entityIds:entityIds}, true, function() {
				Jui.message.hint($text("Public.OperationSuccess"));
				CommonBusiness.loadListRow(list, clientData.unitCode, clientData.listId, entityIds);
			});
		});
	},
	
	setViewEntityId: function(entityId, updateIfMatch)
	{
		if (entityId == EntityList.viewEntityId && !updateIfMatch) {
			return;
		}
		else if (entityId == null) {
			$elem("ViewFrame").src = "about:blank";
		}
		else {
			var args = {entityId:entityId, isListView:true};
			var keyword = (EntityList.currentQueryArguments || {}).keyword;
			if (!Jui.string.isEmpty(keyword)) {
				args.keywords = EntityList._splitKeyword(keyword);
			}
			//TODO $elem("ViewFrame").src = "";
			if (EntityList.onRowView != null) {
				EntityList.onRowView(entityId);
			}
		}
		EntityList.viewEntityId = entityId;
	},
	
	//-----------------------------------------------------------------------
	// private
	//-----------------------------------------------------------------------

	_setLeftZoneVisible: function(visible)
	{
		if (EntityList.leftResizer == null) {
			$elem("LeftZone").style.width = "226px";
		}
		$elem("LeftZone").style.display = visible ? "block" : "none";
		$elem("ListZone").style.left = visible ? $elem("LeftZone").style.width : "0px";
		Jui.dom.tagClass($elem("ListZone"), "QsLeftBorder", visible);
		if (EntityList.leftResizer == null) {
			EntityList.leftResizer = Jui.option.Resizer.create({
				elements	: ["LeftZone", "ListZone"],
				transparent	: false,
				offset		: -6
			});
		}
		EntityList.leftResizer.setVisible(visible);
	},

	_setRightZoneVisible: function(visible)
	{
		if (EntityList.rightResizer == null) {
			var leftZone = $elem("LeftZone");
			var availableWidth = $elem("QsContent").offsetWidth - (leftZone == null ? 0 : leftZone.offsetWidth);
			$elem("RightZone").style.width = Math.round(0.44 * availableWidth) + "px";
		}
		$elem("RightZone").style.display = visible ? "block" : "none";
		$elem("ListZone").style.right = visible ? $elem("RightZone").style.width : "0px";
		Jui.dom.tagClass($elem("ListZone"), "QsRightBorder", visible);
		if (EntityList.rightResizer == null) {
			EntityList.rightResizer = Jui.option.Resizer.create({
				elements	: ["ListZone", "RightZone"],
				transparent	: false,
				fixed		: "right"
			});
		}
		EntityList.rightResizer.setVisible(visible);
		if (visible) {
			EntityList._updateViewFrame();
		}
	},

	_setCurrentLeftTitle: function(elem)
	{
		if (!/Current/.test(elem.className)) {
			var siblings							= elem.parentElement.children;
			var index								= elem == siblings[0] ? 0 : 1;
			$elem("TreePanel").style.display		= index == 0 ? "block" : "none";
			$elem("QueryFormPanel").style.display	= index == 0 ? "none" : "block";
			siblings[index].setAttribute("current", true);
			siblings[1 - index].removeAttribute("current");
			Jui.dom.removeClass(siblings[index], "QsBottomBorder");
			Jui.dom.addClass(siblings[1 - index], "QsBottomBorder");
		}
	},
	
	_saveAsQuerySchema: function(condition, defaultName)
	{
		var args = {
			title		: $text("Qs.QueryForm.Save"),
			information : $text("Qs.QueryForm.QuerySchemaName"),
			text		: defaultName,
			allowEmpty	: false
		};
		Utility.openDialog("Qs.Misc.Prompt.page", args, {width:400,height:150}, function(name) {
			var args = {
				basic		: {FUnitId:clientData.unitId, FName:name, FTemp:false},
				condition	: condition
			};
			Utility.invoke("Qs.QuerySchema.save", args, true, function() {
				Jui.message.hint($text("Public.SaveSuccess"));
				var schemaBox = EntityList.getQuerySchemaBox();
				if (schemaBox != null) {
					var data = CommonBusiness.getQuerySchemaDropdownJson(clientData.unitId);
					if (data != null) {
						schemaBox.loadItems(data);
					}
				}
			});
		});
	},

	_refreshNavigationButtonStatus: function()
	{
		var backwardButton = EntityList.getToolBar().getItem("NavigateBackward");
		var forwardButton = EntityList.getToolBar().getItem("NavigateForward");
		if (backwardButton != null) {
			backwardButton.setDisabled(EntityList.queryIndex <= 0);
		}
		if (forwardButton != null) {
			forwardButton.setDisabled(EntityList.queryIndex >= EntityList.historyQueries.length - 1);
		}
	},

	_updateViewFrame: function(updateIfMatch)
	{
		var rightZone = $elem("RightZone");
		if (window.list != null && rightZone != null && rightZone.style.display != "none") {
			var selectedKeys = list.getSelectedKeys();
			EntityList.setViewEntityId(selectedKeys[0], updateIfMatch);
		}
	},
	
	_splitKeyword: function(keyword)
	{
		if (keyword != null && clientData.isFullTextSearch) {
			keyword = keyword.replace(/\b(NOT|AND|OR)\b/g, "");
		}
		return Jui.string.isEmpty(keyword) ? [] : Jui.string.trim(keyword.replace(/\s+/g, " ")).split(" ");
	}
});

Utility.addFunctionAlias(EntityList);
var processToolBarJson	= EntityList.processToolBarJson;
QueryForm.doBoxKeyDown	= EntityList.doQueryFormBoxKeyDown;
QueryForm.doBoxChange 	= EntityList.doQueryFormBoxChange;
window.onload 			= EntityList.doLoad;
