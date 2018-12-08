var VersionList =
{
	doOpen: function()
	{
		var versionId = list.getSelectedKeys()[0];
		if (versionId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		VersionList.open(versionId);
	},
	
	open: function(versionId)
	{
		Utility.openDialog("Qs.Version.EntityForm.page", {versionId:versionId}, null, function() {
			if (/Qs\.Entity\.Info\.page/.test(parent.location.href)) {
				parent.location.reload();
			}
		});
	}
};

EntityList.doListDoubleClick = function(event)
{
	VersionList.open(event.id);
};
