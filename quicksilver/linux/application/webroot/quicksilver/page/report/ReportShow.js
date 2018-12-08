var ReportShow =
{
	reportId		: clientData.reportId,
	isHtml			: clientData.isHtml,
	hasTree			: clientData.treeJson != null,
	hasForm			: clientData.formJson != null,
	treeEntityId	: clientData.treeEntityId || null,
	isAutoQuery		: clientData.isAutoQuery || (clientData.treeJson == null && clientData.formJson == null),

	doLoad: function()
	{
		if (window != parent && parent.ReportCenter != null) {
			parent.toolBar.setItemDisabled("Print", !ReportShow.isHtml);
		}
			
		ReportShow.frame = $elem("ReportFrame");
		if (clientData.treeJson != null) {
			var treeTitle = clientData.treeParameterName;
			if (ReportShow.treeEntityId != null) {
				treeTitle += " - " + clientData.treeEntityName;
			}
			Jui.dom.setInnerText($elem("TreeTitle"), treeTitle);
			ReportShow.tree = Jui.option.Tree.create({
				target			: "TreePanel",
				onnodeclick		: ReportShow.doTreeNodeClick,
				onloadsubnodes	: ReportShow.doTreeLoadSubNodes
			});
			ReportShow.tree.load(clientData.treeJson);
			ReportShow.tree.expandLevel(1);
			Jui.dom.addClass($elem("RightZone"), "QsLeftBorder");
			Jui.option.Resizer.create({elements:["LeftZone", "RightZone"], transparent:false});
		}
		if (clientData.formJson != null) {
			$elem("FormPanel").style.display = "block";
			ReportShow.form = Jui.option.Form.create({
				target						: "FormPanel",
				titleWidth					: 100,
				controlWidth				: 200,
				boxChangeHandler			: ReportShow.doFormBoxChange,
				entityBoxSelectHandler		: CommonBusiness.doEntityBoxSelect,
				entityBoxViewHandler		: CommonBusiness.doEntityBoxView,
				entityBoxBeforeDropHandler	: CommonBusiness.doEntityBoxBeforeDrop,
				multiEntityBoxSelectHandler	: CommonBusiness.doMultiEntityBoxSelect,
				style						: "padding-bottom:0px"
			});
			ReportShow.form.setColumnCount(clientData.formJson.title.length == 1 ? 1 : 2);
			ReportShow.form.load(clientData.formJson);
			CommonBusiness.setParentDictionary(ReportShow.form);
			$elem("RightZone").style.paddingBottom = $elem("FormPanel").offsetHeight + "px";
		}

		if (ReportShow.reportId != null && ReportShow.isAutoQuery) {
			if (!ReportShow.tryLoadReport(false)) {
				ReportShow.frame.src = "about:blank";
			}
		}
		else {
			ReportShow.frame.src = "about:blank";
		}
	},
	
	doExecute: function()
	{
		ReportShow.tryLoadReport(true);
	},
	
	tryLoadReport: function(alertOnParameterInvalid)
	{
		if (!ReportShow.validate(alertOnParameterInvalid)) {
			return false;
		}
		var parameters = Jui.object.merge({language:clientData.language}, clientData.defaultParameters);
		if (ReportShow.hasTree) {
			parameters[clientData.treeParameterCode] = ReportShow.treeEntityId;
		}
		if (ReportShow.hasForm) {
			Jui.object.merge(parameters, ReportShow.form.getData(), true);
		}
		for (var property in parameters) {
			if (/.*\$$/.test(property)) {
				delete parameters[property];
			}
		}
		if (ReportShow.isHtml) {
			var args = {reportId:ReportShow.reportId, parameters:parameters};
			ReportShow.frame.src = Utility.getUrl("Qs.Report.Html.page", args);
		}
		else {
			ReportShow.frame.src = ReportSolution.getReportUrl(clientData.templateFile, parameters);
		}
		return true;
	},
	
	validate: function(showMessage)
	{
		if (ReportShow.hasTree && ReportShow.treeEntityId == null && clientData.treeParameterRequired) {
			if (showMessage) {
				var message = $text("Public.SelectAlertTemplate");
				Jui.message.alert(message.replace("${0}", clientData.treeParameterName));
			}
			return false;
		}
		if (ReportShow.hasForm && !ReportShow.form.validate(showMessage)) {
			return false;
		}
		return true;
	},

	doTreeLoadSubNodes: function(event, callback)
	{
		var hasFruit	= clientData.fruitUnitId != null;
		var url			= clientData.treeUnitCode + (hasFruit ? ".getTreeDataWithFruits" : ".getTreeData");
		var args		= {parentId:event.id};
		if (hasFruit) {
			args.fruitUnitId	= clientData.fruitUnitId;
			args.relationField	= clientData.fruitRelationField;
		}
		Utility.invoke(url, args, true, function(ret){callback(ret.data);});
	},
	
	doTreeNodeClick: function(event)
	{
		if (clientData.fruitUnitId == null || event.iconType == "item") {
			ReportShow.treeEntityId = event.json.id;
			Jui.dom.setInnerText($elem("TreeTitle"), clientData.treeParameterName + " - " + event.json.text);
			if (ReportShow.isAutoQuery) {
				ReportShow.tryLoadReport(false);
			}
		}
	},
	
	doFormBoxChange: function()
	{
		CommonBusiness.processBoxChange(this);
		if (ReportShow.isAutoQuery) {
			ReportShow.tryLoadReport(false);
		}
	},
	
	doPrint: function()
	{
		ReportShow.print();
	},
	
	print: function()
	{
		var wnd = $elem("ReportFrame").contentWindow;
		wnd.focus();
		wnd.print(); 
	}
};

function processToolBarJson()
{
	var items = clientData.toolBarJson.right || [];
	for (var i = items.length - 1; i >= 0; --i) {
		var name = items[i].name;
		if (ReportShow.isAutoQuery && name == "Execute" || !ReportShow.isHtml && name == "Print") {
			items.splice(i, 1);
		}
	}
	return clientData.toolBarJson;
}

Utility.addFunctionAlias(ReportShow);
window.onload = ReportShow.doLoad;
