var ReportEdit =
{
	doLoad: function()
	{
		form.getControl("FReportCatalogId").onbeforedrop = ReportEdit.doReportCatalogBoxBeforeDrop;
	},
	
	doPreview: function()
	{
		if (EntityForm.validate()) {
			var args = {
				relationId		: clientData.relationId,
				masterUnitId	: clientData.masterUnitId,
				masterEntityId	: clientData.masterEntityId
			};
			CommonBusiness.saveEntity(clientData.unitCode, [form.getData()], args, function(json) {
				var entityId = json.entityIds[0];
				EntityForm.addDialogResultEntityId(entityId);
				var features = "status=yes,toolbar=no,menubar=no,location=no,resizable=yes,width=900,height=600";
				Utility.openWindow("Qs.Report.Show.page", {reportId:entityId}, "_blank", features);
				EntityForm.reload(entityId);
			});
		}
	},
	
	doReportCatalogBoxBeforeDrop: function()
	{
		if (!ReportEdit.reportCatalogDropdownLoaded) {
			Utility.syncInvoke("Qs.ReportCatalog.getDropdownJson", null, function(ret) {
				form.getControl("FReportCatalogId").loadItems(ret.data);
				ReportEdit.reportCatalogDropdownLoaded = true;
			});
		}
	}
};
