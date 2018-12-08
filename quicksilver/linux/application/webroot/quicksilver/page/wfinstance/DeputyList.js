var DeputyList =
{
	doOnGuard: function()
	{
		DeputyList.setOnGuard(true);
	},

	doOffGuard: function()
	{
		DeputyList.setOnGuard(false);
	},

	setOnGuard: function(onGuard)
	{
		Utility.invoke("Qs.User.setOnGuard", {isOnGuard:onGuard}, true, function(ret) {
			Jui.message.hint($text("Public.OperationSuccess"));
			toolBar.getItem("OnGuard").setDisabled(onGuard);
			toolBar.getItem("OffGuard").setDisabled(!onGuard);
		});
	},

	doAdd: function()
	{
		CommonBusiness.selectEntity("Qs.User", null, function(ret) {
			var args = {deputyIds:Jui.array.extractProperty(ret, "id")};
			Utility.invoke("Qs.Deputy.add", args, true, function() {
				list.refresh();
			});
		});
	}
};
