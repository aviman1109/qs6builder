var SimpleForm =
{
	formJson: clientData.formJson,
	
	postArgs: clientData.postArgs,
	
	saveMethod: clientData.saveMethod,
	
	multiAdd: Jui.cast.toBool(clientData.multiAdd, true),
	
	doLoad: function()
	{
		window.form = Jui.option.Form.create({
			target						: "QsContent",
			titleWidth					: clientData.titleWidth || 110,
			columnCount					: clientData.columnCount || 2,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			style						: "width:100%;height:100%;overflow:auto"
		});
		form.load(SimpleForm.formJson);
	},

	validate: function()
	{
		return form.validate();
	},

	doSave: function()
	{
		if (SimpleForm.validate()) {
			var args = Jui.object.merge({data:form.getData()}, SimpleForm.postArgs);
			Utility.invoke(SimpleForm.saveMethod, args, true, function(ret) {
				var entityIds = (Utility.getDialogResult() || {}).entityIds || [];
				if (!(ret.entityId in Jui.array.toSet(entityIds))) {
					entityIds.push(ret.entityId);
					Utility.setDialogResultAttribute("entityIds", entityIds);
				}
				var args = Jui.object.merge({entityId:ret.entityId}, clientData.urlArgs);
				if (clientData.entityId != null || !SimpleForm.multiAdd) {
					Jui.message.hint($text("Public.SaveSuccess"));
				}
				else if (confirm($text("Public.SaveSuccessAndAddNext"))) {
					args = clientData.urlArgs;
				}
				Utility.navigate(window.location.href, args);
			});
		}
	}
};

window.onload = SimpleForm.doLoad;
