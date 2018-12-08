var MarqueeForm =
{
	doLoad: function()
	{
		var types = [
 		    {value:"Qs.Department", text:Utility.getUnit("Qs.Department").name},
		    {value:"Qs.User", 		text:Utility.getUnit("Qs.User").name}
		];
		var titleJson = [
		    {
		    	name		: "FType",
		    	title		: $text("Public.Type"),
		    	control		: "ComboBox",
		    	width		: 150,
		    	items		: types,
		    	required	: true,
		    	onchange	: MarqueeForm.doPublishRangeTypeRange
		    },
		    {
		    	name		: "FEntityId",
		    	title		: $text("Public.Name"),
		    	control		: "EntityBox",
		    	textField	: "FName",
		    	required	: true
		    }
		];
		var label	= form.getControl("FPublishRange");
		var html 	= "<div id=PublishRangeListContainer></div>"
					+ "<div id=PublishRangeButtonContainerOuter class=QsMiddleAlign>"
					+	"<div id=PublishRangeButtonContainerInner class=QsVertButtonPanel></div>"
					+ "</div>";
		label.setHtml(html);
		MarqueeForm.publishRangeList = Jui.option.List.create({
			editable					: true,
			border						: "all",
			target						: "PublishRangeListContainer",
			oneditrowchange				: MarqueeForm.doPublishRangeEditRowChange,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView
		});
		MarqueeForm.publishRangeAddButton = Jui.basic.Button.create({
			icon		: "quicksilver/image/16/Plus.gif",
			target		: "PublishRangeButtonContainerInner",
			onclick		: MarqueeForm.doPublishRangeAddClick
		});
		MarqueeForm.publishRangeAddButton = Jui.basic.Button.create({
			icon		: "quicksilver/image/16/Minus.gif",
			target		: "PublishRangeButtonContainerInner",
			onclick		: MarqueeForm.doPublishRangeDeleteClick
		});
		MarqueeForm.publishRangeList.loadTitle(titleJson);
		form.getControl("FUseHtmlSubject").onchange = MarqueeForm.doUseHtmlSubjectChange;
		form.getControl("FPublishType").onchange = MarqueeForm.doPublishTypeChange;
		MarqueeForm.doUseHtmlSubjectChange();
		MarqueeForm.doPublishTypeChange();
		if (form.getFieldValue("FPublishType") == "Range") {
			MarqueeForm.publishRangeList.loadData(clientData.publishRange || []);
		}
	},
	
	doPublish: function()
	{
		if (EntityForm.validate()) {
			var args = {entityId:clientData.entityId, entity:EntityForm.getData(), cancel:false};
			Utility.invoke("Qs.Marquee.publish", args, true, function(ret) {
				Jui.message.hint($text("Public.OperationSuccess"));
				EntityForm.addDialogResultEntityId(ret.entityId);
				EntityForm.reload(ret.entityId);
			});
		}
	},
	
	doCancelPublish: function()
	{
		var args = {entityId:clientData.entityId, cancel:true};
		Utility.invoke("Qs.Marquee.publish", args, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			EntityForm.reload(clientData.entityId);
		});
	},
	
	doUseHtmlSubjectChange: function()
	{
		var useHtmlSubject = form.getFieldValue("FUseHtmlSubject");
		form.setFieldVisible("FHtmlSubject", useHtmlSubject);
		if (!useHtmlSubject) {
			form.setFieldValue("FHtmlSubject");
		}
	},

	doPublishTypeChange: function()
	{
		form.setFieldVisible("FPublishRange", form.getFieldValue("FPublishType") == "Range");
	},
	
	doPublishRangeEditRowChange: function()
	{
		var entityType = MarqueeForm.publishRangeList.getEditFieldValue("FType") || "Qs.Department";
		MarqueeForm.publishRangeList.getControl("FEntityId").setEntityType(entityType);
	},
	
	doPublishRangeTypeRange: function()
	{
		var entityType = this.getValue() || "Qs.Department";
		MarqueeForm.publishRangeList.getControl("FEntityId").setEntityType(entityType);
		MarqueeForm.publishRangeList.getControl("FEntityId").setValue();
	},
	
	doPublishRangeAddClick: function()
	{
		MarqueeForm.publishRangeList.appendDataAndEdit({FType:"Qs.Department"});
	},
	
	doPublishRangeDeleteClick: function()
	{
		MarqueeForm.publishRangeList.deleteSelectedRows();
	},
	
	validate: function()
	{
		if (!EntityForm.$validate()) {
			return false;
		}
		if (form.getFieldValue("FStartTime") >= form.getFieldValue("FEndTime")) {
			Jui.message.hint($text("Public.StartTimeAfterEndTimeAlert"));
			return false;
		}
		if (form.getFieldValue("FPublishType") == "Range") {
			if (!MarqueeForm.publishRangeList.validate()) {
				return false;
			}
			if (MarqueeForm.publishRangeList.length() == 0) {
				Jui.message.hint($text("Qs.Marquee.SelectPublishRangeAlert"));
				return false;
			}
		}
		return true;
	},
	
	getData: function()
	{
		var data = EntityForm.$getData();
		if (form.getFieldValue("FPublishType") == "Range") {
			data.publishRange = MarqueeForm.publishRangeList.getData();
		}
		return data;
	}
};

EntityForm.validate = MarqueeForm.validate;
EntityForm.getData = MarqueeForm.getData;