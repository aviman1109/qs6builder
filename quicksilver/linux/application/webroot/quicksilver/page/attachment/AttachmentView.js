var AttachmentView =
{
	doDownload: function()
	{
		Utility.download("Qs.Attachment.DownloadFile", {attachmentIds:[clientData.entityId]});
	}
};
