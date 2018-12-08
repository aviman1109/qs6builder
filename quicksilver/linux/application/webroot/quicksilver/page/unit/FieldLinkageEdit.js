var FieldLinkageEdit = {};

FieldLinkageEdit.doLoad = function()
{
	form.getControl("FLinkFieldName").loadItems(clientData.linkFieldItems);
};
