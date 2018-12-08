var CommonBusiness =
{
	buttons: [],
	
	doComboBoxSelect: function()
	{
		var box = this;
		var args = {items:box.getItems(), value:box.getValue()};
		var options = {fullScreen:true, title:box.getArgs().title};
		Utility.openPage("Qs.Mobile.ComboBoxSelect", args, options, function(value) {
			box.setValue(value);
		});
	},

	doEntityBoxSelect: function()
	{
		var box 	= this;
		var boxArgs	= box.getArgs();
		var url 	= boxArgs.entityType + ".MobileList.page";
		var args 	= {isSelect:true, fieldTitle:boxArgs.title};
		if (boxArgs.hasSelectListFilterSql && typeof(EntityForm) == "object") {
			args.basicArguments = {entityBoxFieldId:boxArgs.id};
			if (boxArgs.selectListFilterFields != null) {
				var temp = EntityForm.form.getData();
				args.basicArguments.form = {};
				for (var i = 0; i < boxArgs.selectListFilterFields.length; ++i) {
					var fieldName = boxArgs.selectListFilterFields[i];
					args.basicArguments.form[fieldName] = temp[fieldName];
				}
			}
		}
		Utility.openPage(url, args, "取消", function(ret) {
			box.setValue(ret.id, ret.text, true);
		});
	},
	
	doEntityBoxSelect: function()
	{
		var box = this;
		var args = {isSelect:true, unitCode:box.getEntityType(), multiSelect:false};
		var options = {fullScreen:true, title:box.getArgs().title};
		Utility.openPage(args.unitCode + ".MobileList", args, options, function(ret) {
			box.setValue(ret.id, ret.name);
		});
	},
	
	doDateBoxSelect: function()
	{
		var box = this;
		var args = {value:box.getValue(), hasTime:/H/.test(box.getFormat())};
		var options = {fullScreen:true, title:box.getArgs().title, backText:"取消"};
		Utility.openPage("Qs.Mobile.DateBoxSelect", args, options, function(value) {
			box.setValue(value);
		});
	},

	saveEntity: function(unitCode, data, args, callback)
	{
		args = Jui.object.merge({data:data}, args);
		return Utility.invoke(unitCode + ".save", args, true, callback);
	},
	
	deleteEntity: function(unitCode, entityId, callback)
	{
		var args = {entityIds:Jui.array.make(entityId)};
		return Utility.invoke(unitCode + ".delete", args, true, callback);
	},

	//--------------------------------------------------
	
	doComboBoxBeforeDrop: function()
	{
		var parentBox		= this.parentDictionaryBox;
		var dictionaryId	= this.getArgs().dictionaryId;
		var initItems		= this.getArgs().items;
		var oldParentValue	= this.parentDictionaryValue;
		var newParentValue	= parentBox == null ? null : parentBox.getValue();
		if (parentBox != null && Jmui.string.isEmpty(newParentValue)) {
			this.loadItems([], true);
		}
		else if (parentBox == null && initItems == null || parentBox != null && newParentValue != oldParentValue) {
			var parentValue = parentBox == null ? null : parentBox.getValue();
			var cacheKey = "Dictionary." + dictionaryId;
			if (!Jmui.string.isEmpty(parentValue)) {
				cacheKey += "." + parentValue;	
			}
			var items = Utility.getCacheItem(cacheKey);
			if (items == null) {
				var args = {dictionaryId:dictionaryId, parentValue:parentValue};
				var ret = Utility.syncInvoke("Qs.Dictionary.getComboBoxItemsJson", args);
				if (ret == null) {
					return;
				}
				items = ret.data;
				Utility.setCacheItem(cacheKey, items);
			}
			if (parentBox != null) {
				this.parentDictionaryValue = parentValue;
			}
			this.loadItems(items);
		}
	},

	doMultiEntityBoxSelect: function()
	{
		var box 	= this;
		var boxArgs	= box.getArgs();
		var url 	= boxArgs.entityType + ".MobileList.page";
		var args 	= {isSelect:true, fieldTitle:boxArgs.title};
		if (boxArgs.hasSelectListFilterSql && typeof(EntityForm) == "object") {
			args.basicArguments = {entityBoxFieldId:boxArgs.id};
			if (boxArgs.selectListFilterFields != null) {
				var temp = EntityForm.form.getData();
				args.basicArguments.form = {};
				for (var i = 0; i < boxArgs.selectListFilterFields.length; ++i) {
					var fieldName = boxArgs.selectListFilterFields[i];
					args.basicArguments.form[fieldName] = temp[fieldName];
				}
			}
		}
		Utility.openPage(url, args, "取消", function(ret) {
			box.addPopupItem(ret.id, ret.text);
		});
	},
	
	setParentDictionary: function(form)
	{
		var controls = form.getControls();
		var dictionaryMap = {};
		for (var i = 0; i < controls.length; ++i) {
			var control = controls[i];
			if (control.getArgs().dictionaryId != null) {
				dictionaryMap[control.getArgs().dictionaryId] = control;
			}
		}
		for (var i = 0; i < controls.length; ++i) {
			var control = controls[i];
			var parentDictionaryBox = dictionaryMap[control.getArgs().parentDictionaryId];
			if (parentDictionaryBox != null) {
				control.parentDictionaryBox = parentDictionaryBox;
				parentDictionaryBox.subDictionaryBox = control;
			}
		}
	},
	
	getButtonsHtml: function(buttons)
	{
		var buffer = [];
		for (var i = 0; i < buttons.length; ++i) {
			var button = buttons[i];
			var index = CommonBusiness.buttons.length;
			buffer.push("<button _index=" + index + " onclick=CommonBusiness.doButtonClick()");
			if (button.disabled) {
				buffer.push(" disabled");
			}
			buffer.push(">");
			buffer.push(Jmui.$h(button.text));
			buffer.push("</button>");
			CommonBusiness.buttons.push(button);
		}
		return buffer.join("");
	},
	
	doButtonClick: function()
	{
		var json = CommonBusiness.buttons[parseInt(event.srcElement.getAttribute("_index"))];
		Jmui.util.execute(json.onclick, event.srcElement, json);
	},
	
	doFireServerEventButtonClick: function(buttonArgs)
	{
		var args = {entityEventCode:buttonArgs.name};
		if (typeof(EntityForm) == "object") {
			args.entityIds = [clientData.entityId];
		}
		Utility.invoke(clientData.unitCode + ".confirm", args, true, function() {
			alert($text("Public.OperationSuccess"));
			if (typeof(EntityForm) == "object") {
				Utility.setPageResult(true);
				EntityForm.reload(clientData.entityId);
			}
		});
	},
	
	doOpenFormButtonClick: function(buttonArgs)
	{
		var page = buttonArgs.handlePage;
		args = {
			enableAllFields		: true,
			addConfirmButton	: true,
			entityEventCode		: buttonArgs.name,
			pageTitle			: buttonArgs.text,
			showWorkflow		: false
		};
		if (typeof(EntityForm) == "object") {
			args.entityId = clientData.entityId;
		}
		Utility.openPage(page.code + ".page", args, clientData.unitName, function() {
			alert($text("Public.OperationSuccess"));
			if (typeof(EntityForm) == "object") {
				Utility.setPageResult(true);
				EntityForm.reload(args.entityId);
			}
		});
	},
	
	doFormBoxChange: function()
	{
		var form = Jmui.$owner(this.element.parentElement);
		CommonBusiness.processBoxChange(form, this);
	},
	
	processBoxChange: function(form, box, ignoreFieldValue, isLoad)
	{
		if (box.subDictionaryBox != null && !isLoad) {
			for (var subBox = box.subDictionaryBox; subBox != null; subBox = subBox.subDictionaryBox) {
				subBox.loadItems([], true);
			}
		}
		var linkage = box.getArgs().linkage;
		if (linkage == null) {
			return;
		}
		var boxValue = box.getValue();
		if (!ignoreFieldValue && !Jmui.string.isEmpty(boxValue) && linkage.hasServerLinkage) {
			var args = {fieldId:linkage.fieldId, form:form.getData()};
			Utility.invoke("Qs.FieldLinkage.getLinkageData", args, true, function(ret) {
				form.updateData(ret.data);
			});
		}
		var data = form.getData();
		var buffer = [];
		for (var fieldName in data) {
			var value = data[fieldName];
			var box = form.getControl(fieldName);
			if (value == null) {
				value = "null";
			}
			else if (box instanceof Jmui.basic.InputBox && box.isNumberType()) {
				value = box.getNumberValue();
			}
			else if (!(box instanceof Jmui.basic.CheckBox)) {
				value = "'" + value.replace(/\r|\n/g, "").replace(/'/g, "\\'") + "'";
			}
			buffer.push("var " + fieldName + " = " + value);
		}
		eval(buffer.join(";"));
		for (var i = 0, items = linkage.items || []; i < items.length; ++i) {
			var item = items[i];
			if (!ignoreFieldValue && !Jmui.string.isEmpty(item.valueExpression) && !Jmui.string.isEmpty(boxValue)) {
				form.setFieldValue(item.linkFieldName, eval(item.valueExpression));
			}
			if (!ignoreFieldValue && !Jmui.string.isEmpty(item.nullExpression) && Jmui.string.isEmpty(boxValue)) {
				form.setFieldValue(item.linkFieldName, eval(item.nullExpression));
			}
			if (!Jmui.string.isEmpty(item.statusExpression)) {
				form.setFieldEnabled(item.linkFieldName, eval(item.statusExpression));
			}
			if (!Jmui.string.isEmpty(item.requireExpression)) {
				form.setFieldRequired(item.linkFieldName, eval(item.requireExpression));
			}
			if (!Jmui.string.isEmpty(item.titleExpression) && form.setTitle) {
				form.setTitle(item.linkFieldName, eval(item.titleExpression));
			}
		}
	}
};
