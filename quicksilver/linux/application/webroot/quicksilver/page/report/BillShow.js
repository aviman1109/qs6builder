var BillShow = 
{
	frameLoaded: false,

	doLoad: function(data)
	{
		BillShow.frame = $elem("ReportFrame");
		if (clientData.entityId != null || clientData.batchId != null) {
			var args = {
				isBill		: true,
				language	: clientData.language,
				entityId	: clientData.entityId,
				batchId		: clientData.batchId
			};
			BillShow.frame.src = BillShow.getUrl(args);
			BillShow.frameLoaded = true;
		}
		else {
			$elem("FormPanel").style.display = "block";
			Jui.dom.setInnerText($elem("UnitNameCell"), clientData.unitName);
			BillShow.entityBox = Jui.basic.EntityBox.create({
				target			: "EntityBoxCell",
				entityType		: clientData.unitCode,
				onchange		: BillShow.doEntityChange,
				onselect		: CommonBusiness.doEntityBoxSelect,
				onview			: CommonBusiness.doEntityBoxView,
				onbeforedrop	: CommonBusiness.doEntityBoxBeforeDrop
			});
			$elem("QsContent").style.paddingBottom = $elem("FormPanel").offsetHeight + "px";
		}
	},
	
	doEntityChange: function()
	{
		var args = {
			isBill		: true,
			language	: clientData.language,
			entityId	: BillShow.entityBox.getValue()
		};
		if (args.entityId != null) {
			BillShow.frame.src = BillShow.getUrl(args);
			BillShow.frameLoaded = true;
		}
	},
	
	doPrint: function()
	{
		var wnd = $elem("ReportFrame").contentWindow;
		wnd.focus();
		wnd.print(); 
	},
	
	getUrl: function(args)
	{
		if (clientData.isHtml) {
			args.billId = clientData.billId;
			return Utility.getUrl("Qs.Bill.Html.page", args);
		}
		else {
			return ReportSolution.getReportUrl(clientData.templateFile, args);
		}
	}
};
