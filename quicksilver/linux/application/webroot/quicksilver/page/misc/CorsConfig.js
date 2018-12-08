var CorsConfig =
{
	doLoad: function()
	{
		var title = [
			{
				name			: "mode",
				control			: "MultiCheckBox",
				multiSelect		: false,
				oneItemPerLine	: true,
				required		: true,
				rowSpan			: 0,
				title			: $text("Qs.CorsConfig.Mode"),
				items			: clientData.modeItems,
				onchange		: CorsConfig.doModeChange
			},
			{
				name			: "whiteList",
				control			: "TextBox",
				rowSpan			: 10,
				title			: $text("Qs.CorsConfig.WhiteList")
			}
		];
		var data = {
			mode: clientData.mode || "AllowAll",
			whiteList: (clientData.whiteList || []).join("\n")
		};
		CorsConfig.form = Jui.option.Form.create({
			target		: "QsContent",
			columnCount	: 1,
			titleWidth	: 180
		});
		CorsConfig.form.loadTitle(title);
		CorsConfig.form.loadData(data);
		CorsConfig.doModeChange();
	},
	
	doModeChange: function()
	{
		var mode = CorsConfig.form.getFieldValue("mode");
		CorsConfig.form.setFieldEnabled("whiteList", mode == "AllowWhiteList");
	},
	
	doSave: function()
	{
		if (!CorsConfig.form.validate()) {
			return;
		}
		var args = CorsConfig.form.getData();
		var whiteList = [];
		var set = {};
		for (var i = 0, array = args.whiteList.split("\n"); i < array.length; ++i) {
			var item = array[i].replace(/\s/g, "");
			if (set[item] == null) {
				whiteList.push(item);
				set[item] = 1;
			}
		}
		args.whiteList = whiteList;
		Utility.invoke("Qs.Misc.saveCorsConfig", args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
			window.location.reload();
		});
	}
};

Jui.use("Form");
window.addEventListener("load", function() {CorsConfig.doLoad()});
