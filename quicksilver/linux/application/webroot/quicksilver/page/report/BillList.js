var BillList = 
{
	doPreview: function()
	{
		var billId = list.getSelectedKeys()[0];
		if (billId == null) {
			alert($text("Public.SelectAlert"));
			return;
		}
		CommonBusiness.viewBill(billId);
	}
};
