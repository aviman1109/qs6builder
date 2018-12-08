var MyAvatar =
{
	fileSelectOptions: {typePattern:"^image/", accept: "image/*", maxSize: 10 * 1024 * 1024},

	doLoad: function()
	{
		Utility.setFileDropZone("QsContent", MyAvatar.fileSelectOptions, function(files) {
			MyAvatar.openEditPage(files[0]);
		});
		MyAvatar.setAvatar(clientData.pictureId);
	},
	
	doSelect: function()
	{
		Utility.selectFile(MyAvatar.fileSelectOptions, function(files) {
			MyAvatar.openEditPage(files[0]);
		});
	},
	
	setAvatar: function(pictureId)
	{
		var map = {"BigImage":640, "MediumImage":128, "SmallImage":80};
		for (var id in map) {
			var args = {pictureId:pictureId, size:map[id]};
			$elem(id).src = Utility.getUrl("Qs.Picture.viewAvatar.file", args);
		}
	},
	
	openEditPage: function(file)
	{
		var args = {fileSelectOptions:MyAvatar.fileSelectOptions};
		var options = {data:{file:file}};
		Utility.openDialog("Qs.Picture.AvatarEdit.page", args, options, function(ret) {
			Utility.invoke("Qs.Picture.setMyAvatar", {pictureId:ret.pictureId}, true, function() {
				MyAvatar.setAvatar(ret.pictureId);
			});
		});
	}
};
