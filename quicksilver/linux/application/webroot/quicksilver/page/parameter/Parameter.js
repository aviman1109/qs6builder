var Parameter =
{
	doLoad: function()
	{
		Parameter.form = Jui.option.Form.create({
			target						: "QsContent",
			columnCount					: 2,
			titleWidth					: 200,
			entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
			entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
			entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
			style						: "padding:2px"
		});
		Parameter.form.load(clientData.editJson);
		if (Parameter.form.hasControl("QsAttachmentDirectory")) {
			Parameter.form.getControl("QsAttachmentServerUserName").setClearOnDisable(true);
			Parameter.form.getControl("QsAttachmentServerUserName").setRestoreOnEnable(true);
			Parameter.form.getControl("QsAttachmentServerPassword").setClearOnDisable(true);
			Parameter.form.getControl("QsAttachmentServerPassword").setRestoreOnEnable(true);
		}
		Parameter.setChangeHandler("QsAttachmentDirectory", Parameter.doAttachmentDirectoryChange);
		Parameter.setChangeHandler("QsFpcRemoteConvert", Parameter.doFpcRemoteConvertChange);
		Parameter.setChangeHandler("QsSolrEnabled", Parameter.doSolrEnabledChange);
		Parameter.setChangeHandler("QsPasswordVerifyMode", Parameter.doPasswordVerifyModeChange);
		Parameter.setChangeHandler("QsCustomLoginVerifierEnabled", Parameter.doCustomLoginVerifierEnabledChange);
		Parameter.setChangeHandler("QsCustomLoginPageEnabled", Parameter.doCustomLoginPageEnabledChange);
		Parameter.setChangeHandler("QsOuterLoginEnabled", Parameter.doOuterLoginEnabledChange);
	},

	doSave: function()
	{
		if (Parameter.validate()) {
			var args = {isUser:clientData.isUser, data:Parameter.form.getData()};
			Utility.invoke("Qs.Parameter.save", args, true, function(ret) {
				Jui.message.hint($text("Public.SaveSuccess"));
			});
		}
	},
	
	doSqlExport: function()
	{
		Utility.download("Qs.Parameter.exportSql");
	},

	doAttachmentDirectoryChange: function()
	{
		var isRemote = /^\\\\/.test(Parameter.form.getFieldValue("QsAttachmentDirectory"));
		Parameter.form.setFieldEnabled("QsAttachmentServerUserName", isRemote, true);
		Parameter.form.setFieldEnabled("QsAttachmentServerPassword", isRemote, true);
	},
	
	doFpcRemoteConvertChange: function()
	{
		var isRemote = Parameter.form.getControl("QsFpcRemoteConvert").getValue();
		Parameter.form.setFieldEnabled("QsFpcServerUrl", isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcServerUserName", isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcServerPassword", isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcMaxConcurrent", !isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcConversionTimeout", !isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcQueueLength", !isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcQueueTimeout", !isRemote, true);
		Parameter.form.setFieldEnabled("QsFpcKillTimeoutProcess", !isRemote, false);
	},

	doSolrEnabledChange: function()
	{
		var enabled = Parameter.form.getControl("QsSolrEnabled").getValue();
		Parameter.form.setFieldEnabled("QsSolrServerUrl", enabled, true);
		Parameter.form.setFieldEnabled("QsSolrMaxResultCount", enabled, true);
		Parameter.form.setFieldEnabled("QsSolrBuildPageSize", enabled, true);
		Parameter.form.setFieldEnabled("QsSolrBuildCommitSize", enabled, true);
	},
	
	doPasswordVerifyModeChange: function()
	{
		var type = Parameter.form.getFieldValue("QsPasswordVerifyMode");
		Parameter.form.setFieldEnabled("QsPasswordVerifyUrl", type == "Http", true);
		Parameter.form.setFieldEnabled("QsAdDomain1", type == "ActiveDirectory", true);
		Parameter.form.setFieldEnabled("QsAdServer1", type == "ActiveDirectory", true);
		for (var i = 2; i <= 5; ++i) {
			Parameter.form.setFieldEnabled("QsAdDomain" + i, type == "ActiveDirectory", false);
			Parameter.form.setFieldEnabled("QsAdServer" + i, type == "ActiveDirectory", false);
		}
	},

	doCustomLoginVerifierEnabledChange: function()
	{
		var enabled = Parameter.form.getFieldValue("QsCustomLoginVerifierEnabled");
		Parameter.form.setFieldEnabled("QsCustomLoginVerifierClassName", enabled, true);
	},

	doCustomLoginPageEnabledChange: function()
	{
		var enabled = Parameter.form.getFieldValue("QsCustomLoginPageEnabled");
		Parameter.form.setFieldEnabled("QsCustomLoginPageUrl", enabled, true);
	},

	doOuterLoginEnabledChange: function()
	{
		var enabled = Parameter.form.getFieldValue("QsOuterLoginEnabled");
		Parameter.form.setFieldEnabled("QsOuterLoginVerifyUrl", enabled, true);
	},
	
	setChangeHandler: function(field, handler)
	{
		if (Parameter.form.hasControl(field)) {
			Parameter.form.getControl(field).onchange = handler;
			handler();
		}
	},
	
	validate: function()
	{
		if (!Parameter.form.validate()) {
			return false;
		}
		var listPageSize = parseInt(Parameter.form.getFieldValue("QsListPageSize"));
		if (isNaN(listPageSize) || listPageSize < 5 || listPageSize > 200) {
			Jui.message.alert($text("Qs.Parameter.InvalidListPageSize"), function() {
				Parameter.form.setFieldFocus("QsListPageSize");
			});
			return false;
		}
		if (Parameter.form.getControl("QsSessionTimeout") != null) {
			var sessionTimeout = parseInt(Parameter.form.getFieldValue("QsSessionTimeout"));
			if (isNaN(sessionTimeout) || sessionTimeout < 1 || sessionTimeout > 600) {
				Jui.message.alert($text("Qs.Parameter.InvalidSessionTimeout"), function() {
					Parameter.form.setFieldFocus("QsSessionTimeout");
				});
				return false;
			}
		}
		if (Parameter.form.getControl("QsPasswordUpdateRate") != null && Parameter.form.getControl("QsPasswordUpdateIntervalDay") != null) {
			var passwordUpdateRate = parseInt(Parameter.form.getFieldValue("QsPasswordUpdateRate"));
			var passwordUpdateIntervalDay= parseInt(Parameter.form.getFieldValue("QsPasswordUpdateIntervalDay"));
			if ( passwordUpdateRate < passwordUpdateIntervalDay ) {
				Jui.message.alert($text("Qs.Parameter.InvalidPasswordRate"), function() {
					Parameter.form.setFieldFocus("QsPasswordUpdateRate");
				});
				return false;
			}
		}
		return true;
	}
};

window.addEventListener("load", function(){Parameter.doLoad()});
