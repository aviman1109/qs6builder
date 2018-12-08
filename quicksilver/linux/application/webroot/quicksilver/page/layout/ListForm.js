var ListForm =
{
	isMobile: null,
	
	computerPane: null,
	
	mobilePane: null,
	
	sorterLoaded: false,
	
	doLoad: function()
	{
		ListForm.computerPane = FieldSelect.createControls();
		var listTitle = [
 		    {
 		    	name		: "name",
 		    	control		: "ComboBox",
 		    	title		: $text("Qs.ListField.Name"),
 		    	width		: 260,
 		    	disabled	: true,
 		    	items		: clientData.fields
 		    },
 		    {
 		    	name		: "isNewRow",
 		    	control		: "CheckBox",
 		    	title		: $text("Qs.ListField.IsNewRow"),
 		    	width		: 90,
 		    	align		: "center"
 		    },
 		    {
 		    	name		: "isAlignRight",
 		    	control		: "CheckBox",
 		    	title		: $text("Qs.ListField.AlignRight"),
 		    	width		: 90,
 		    	align		: "center"
 		    }
 		];
 		ListForm.mobilePane = FieldSelectWithList.createControls(listTitle);
 		ListForm.mobilePane.style.display = "none";
		form.getControl("FPageId").onchange = ListForm.doPageChange;
		form.getControl("FPlatform").onchange = ListForm.doPlatformChange;
		ListForm.doPageChange();
	},
	
	doPageChange: function()
	{
		var pageId = form.getFieldValue("FPageId");
		if (pageId != null) {
			var pageEditId = CommonBusiness.getFieldValue("Qs.Page", pageId, "FEditId");
			var isMobile = pageEditId == "5c6ae004-d69f-4c45-acb1-d1a049bd8aa9";
			form.setFieldValue("FPlatform", isMobile ? "Phone" : "Computer");
		}
		ListForm.refreshControlStatus();
	},
	
	doPlatformChange: function()
	{
		ListForm.refreshControlStatus();
	},
	
	refreshControlStatus: function()
	{
		form.setFieldEnabled("FPlatform", form.getFieldValue("FPageId") == null, true);
		var isMobile = form.getFieldValue("FPlatform") == "Phone";
		if (isMobile != ListForm.isMobile) {
			ListForm.isMobile = isMobile;
			ListForm.computerPane.style.display = isMobile ? "none" : "block";
			ListForm.mobilePane.style.display = isMobile ? "block" : "none";
			if (isMobile) {
				if (ListForm.sorterLoaded) {
					var values = FieldSelect.rightSorter.getValues();
					var data = [];
					for (var i = 0; i < values.length; ++i) {
						data.push({name:values[i]});
					}
					FieldSelectWithList.loadFields(clientData.fields, data);
				}
				else {
					FieldSelectWithList.loadFields(clientData.fields, clientData.selectedFields);
				}
			}
			else {
				if (ListForm.sorterLoaded) {
					var values = FieldSelectWithList.list.getFieldValues("name");
					FieldSelect.loadFields(clientData.fields, values);
				}
				else {
					var values = Jui.array.extractProperty(clientData.selectedFields, "name");
					FieldSelect.loadFields(clientData.fields, values);
				}
			}
		}
		ListForm.sorterLoaded = true;
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (ListForm.isMobile && FieldSelectWithList.list.getData().length == 0
		|| !ListForm.isMobile && FieldSelect.rightSorter.getValues().length == 0) {
		alert($text("Qs.Field.SelectAlert"));
		return false;
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	data.isMobile = EntityForm.isMobile;
	if (ListForm.isMobile) {
		var listData = FieldSelectWithList.list.getData();
		var propertyMap = {name:"FFieldName", isNewRow:"FIsNewRow", isAlignRight:"FAlignRight"};
		data.selectedFields = Jui.array.transformProperty(listData, propertyMap);
	}
	else {
		var fieldNames = FieldSelect.rightSorter.getValues();
		data.selectedFields = Jui.array.wrapAsProperty(fieldNames, "FFieldName");
	}
	return data;
};
