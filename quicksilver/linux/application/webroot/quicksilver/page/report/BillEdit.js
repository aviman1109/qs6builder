var BillEdit =
{
	doPreview: function()
	{
		if (EntityForm.validate()) {
			var data = form.getData();
			var args = {
				relationId		: clientData.relationId,
				masterUnitId	: clientData.masterUnitId,
				masterEntityId	: clientData.masterEntityId
			};
			CommonBusiness.saveEntity(clientData.unitCode, [data], args, function(json) {
				var entityId = json.entityIds[0];
				EntityForm.addDialogResultEntityId(entityId);
				CommonBusiness.viewBill(entityId);
				EntityForm.reload(entityId);
			});
		}
	}
};
