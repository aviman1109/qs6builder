var DictionaryItemList =
{
};

if (clientData.parentId == null) {
	for (var fields = clientData.titleJson.fields, i = fields.length - 1; i >= 0; --i) {
		if (fields[i].name == "FParentValue") {
			fields.splice(i, 1);
		}
	}
}
