var AttachmentSlaveList =
{
	doLoad: function()
	{
		list.ondoubleclick	= null;
		var url				= "Qs.Attachment.UploadEntityAttachment.data";
		var args 			= {unitId:clientData.urlArgs.masterUnitId, entityId:clientData.urlArgs.masterEntityId};
		var options			= {multiple:true, maxSize:clientData.maxSize, hasDescription:true};
		Utility.setFileDropZoneForBatchUpload("QsContent", url, args, options, function() {
			EntityList.doRefresh();
		});
	},

	doUpload: function()
	{
		var url		= "Qs.Attachment.UploadEntityAttachment.data";
		var args 	= {unitId:clientData.urlArgs.masterUnitId, entityId:clientData.urlArgs.masterEntityId};
		var options	= {multiple:true, maxSize:clientData.maxSize, hasDescription:true};
		Utility.selectFileForBatchUpload(url, args, options, function() {
			EntityList.doRefresh();
		});
	},

	doDownload: function()
	{
		var args = {attachmentIds:list.getSelectedKeys()};
		if (args.attachmentIds.length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
			return;
		}
		Utility.download("Qs.Attachment.DownloadFile", args);
	},

	doDownloadAll: function()
	{
		if (list.length() == 0) {
			Jui.message.alert($text("Qs.Attachment.NothingToDownload"));
			return;
		}
		var args = {unitId:clientData.urlArgs.masterUnitId, entityId:clientData.urlArgs.masterEntityId};
		Utility.download("Qs.Attachment.DownloadFile", args);
	},

	doNameClick: function()
	{
		var url = "Qs.Attachment.View.page";
		var index = list.getEventIndex();
		var args = {entityId:list.getFieldValueByIndex("FId", index)};
		if (Utility.isInTab()) {
			Utility.openTab(url, args, "", "quicksilver/image/unit/Attachment.png");
		}
		else {
			Utility.openDialog(url, args);
		}
	}
};

clientData.defaultToolBarJson = clientData.toolBarJson;

clientData.toolBarJson = {right:[
	{control:"Button", text:$text("Public.Upload"),			icon:"quicksilver/image/16/Upload.gif",		onclick:"AttachmentSlaveList.doUpload"},
	{control:"Button", text:$text("Public.Download"),		icon:"quicksilver/image/16/Download.gif",	onclick:"AttachmentSlaveList.doDownload"},
	{control:"Button", text:$text("Qs.ToolItem.Delete"),	icon:"quicksilver/image/16/Delete.png",		onclick:"EntityList.doDelete"},
	{control:"Button", text:$text("Qs.ToolItem.Refresh"),	icon:"quicksilver/image/16/Refresh.png",	onclick:"EntityList.doRefresh"},
	{control:"ComboButton", icon:"quicksilver/image/16/Other.png", dropOnly: true, items: [
	     {icon:"quicksilver/image/16/Download.gif", onclick:"AttachmentSlaveList.doDownloadAll", text:$text("Qs.Attachment.DownloadAll")}
    ]}
]};
