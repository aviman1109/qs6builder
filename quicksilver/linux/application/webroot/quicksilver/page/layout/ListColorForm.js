var ListColorForm =
{
	doLoad: function()
	{
		ListColorForm.createCondition();
	},

	createCondition: function()
	{
		$elem("FormZone").style.height = "auto" ;
		var html = "<div class=ConditionTitle id=ConditionTitle>" 
			 	 + 		$text("Qs.ListColor.Condition")
			 	 + "</div>"
			 	 + "<div class=ConditionContent id=ConditionContent>" 
			 	 + "</div>";
		Jui.dom.insertHtml($elem("FormZone"), "AfterEnd", html);
		
		ListColorForm.condition = Jui.option.Condition.create({
			target						: "ConditionContent",
			onloadselect				: ListColorForm.doConditionLoadSelect,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
			isSimpleMode				: true
		});
		$elem("ConditionTitle").style.display = "block";
		$elem("ConditionContent").style.display = "block";
		ListColorForm.condition.load(clientData.condition);
	},

	doConditionLoadSelect: function(event)
	{
		var args = {dictionaryId:event.selectId};
		return Utility.syncInvoke("Qs.Dictionary.getComboBoxItemsJson", args, function(ret) {
			return ret.data;
		});
	}
};

EntityForm.validate = function()
{
	if (!EntityForm.$validate()) {
		return false;
	}
	if (!ListColorForm.condition.validate()) {
		return false;
	}
	if (ListColorForm.condition.getData().length < 1 && Jui.string.isEmpty(form.getFieldValue("FExpression"))) {
		Jui.message.alert($text("Qs.ListColor.ConditionAndExpressionNullAlert"));
		return false;
	}
	return true;
};

EntityForm.getData = function()
{
	var data = EntityForm.$getData();
	data.condition = ListColorForm.condition.getData();
	return data;
};

Jui.use("Condition");
