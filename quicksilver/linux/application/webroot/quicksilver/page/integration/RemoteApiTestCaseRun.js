var RemoteApiTestCaseRun =
{
	doRun: function()
	{
		if (form.validate()) {
			var data = form.getData();
			var args = {
				apiCode		: clientData.apiCode,
				url			: data.url,
				requestData	: data.requestData
			};
			Utility.invoke("Qs.RemoteApiTestCase.run", args, true, function(ret) {
				form.setFieldValue("responseData", ret.responseData);
			});
		}
	}
};

SimpleForm.formJson =
{
	title: [
	    {
			group2	: $text("Qs.RemoteApiTestCase.UpStream"),
			name	: "url",
			title	: "URL",
			control	: "InputBox",
			colSpan	: 0
	    },
	    {
			group2	: $text("Qs.RemoteApiTestCase.UpStream"),
			name	: "requestData",
			title	: $text("Qs.RemoteApiTestCase.RequestData"),
			control	: "TextBox",
			rowSpan	: 6,
			colSpan	: 0
	    },
	    {
			group2	: $text("Qs.RemoteApiTestCase.DownStream"),
			name	: "responseData",
			title	: $text("Qs.RemoteApiTestCase.ResponseData"),
			control	: "TextBox",
			disabled: true,
			rowSpan	: 6,
			colSpan	: 0
	    }
    ],
	data:clientData.formData
};
