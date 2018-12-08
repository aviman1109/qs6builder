var DictionaryEdit =
{
	doSqlExport: function()
	{
		Utility.download("Qs.Dictionary.export", {dictionaryId:clientData.entityId});
	}
};
