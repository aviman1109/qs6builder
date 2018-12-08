var LanguageList =
{
	doReloadI18nResource: function(isSystem)
	{
		if (confirm($text("Public.LongWaitConfirm"))) {
			Utility.invoke("Qs.Language.reloadI18nResource", {isSystem:isSystem}, true, function(ret) {
				alert($text("Public.OperationSuccess"));
			});
		}
	},
	
	doDownloadI18nResource: function(isSystem)
	{
		if (confirm($text("Public.LongWaitConfirm"))) {
			Utility.download("Qs.Language.downloadI18nResource", {isSystem:isSystem});
		}
	}
};
