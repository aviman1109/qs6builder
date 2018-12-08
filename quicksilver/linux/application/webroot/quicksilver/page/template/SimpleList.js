var SimpleList =
{
	multiPage: Jui.cast.toBool(clientData.multiPage, false),

	multiSelect: Jui.cast.toBool(clientData.multiSelect, true),

	pageSize: Jui.cast.toBool(clientData.multiPage, false) ? clientData.pageSize || 20 : 0,

	titleJson: clientData.titleJson || [],
	
	loadMethod: clientData.loadMethod,

	deleteMethod: clientData.deleteMethod,
	
	//-----------------------------------------------------------------------
	// initialization
	//-----------------------------------------------------------------------

	doLoad: function()
	{
		window.list = Jui.option.List.create({
			target					: "QsContent",
			multiPage				: SimpleList.multiPage,
			multiSelect				: SimpleList.multiSelect,
			onquery					: SimpleList.doListQuery,
			entityBoxViewHandler	: CommonBusiness.doEntityBoxView
		});
		list.loadTitle(SimpleList.titleJson);
		if (SimpleList.loadMethod != null) {
			SimpleList.query();
		}
	},

	//-----------------------------------------------------------------------
	// query
	//-----------------------------------------------------------------------

	query: function(event)
	{
		var args = SimpleList.getArguments();
		SimpleList.currentQueryArguments = args;
		SimpleList.getListData(args);
	},

	getListData: function(args)
	{
		args.showPageCount = list.isShowPageCount();
		Utility.invoke(SimpleList.loadMethod, args, true, function(ret) {
			list.loadData(ret.data);
		});
	},

	getArguments: function()
	{
		var args = {};
		if (SimpleList.multiPage) {
			args.pageSize = SimpleList.pageSize;
		}
		return args;
	},

	//-----------------------------------------------------------------------
	// list
	//-----------------------------------------------------------------------

	doListQuery: function(event)
	{
		if (SimpleList.currentQueryArguments == null) {
			return;
		}
		var args = Jui.object.merge({}, event.arguments, SimpleList.currentQueryArguments);
		SimpleList.getListData(args, false);
	},

	doDelete: function()
	{
		var entityIds = list.getSelectedKeys();
		if (entityIds.length == 0) {
			Jui.message.hint($text("Public.SelectAlert"));
			return;
		}
		Jui.message.confirm($text("Public.ListDeleteConfirm"), function() {
			var args = Jui.object.merge({entityIds:entityIds});
			Utility.invoke(SimpleList.deleteMethod, args, true, function(ret) {
				SimpleList.query();
			});
		});
	},

	doRefresh: function()
	{
		SimpleList.query();
	}
};

Utility.addFunctionAlias(SimpleList);
window.onload = SimpleList.doLoad;
