var AvatarEdit =
{
	fileSelectOptions: clientData.urlArgs.fileSelectOptions,
	
	file: null,
	
	selection: null,
	
	doLoad: function()
	{
		$elem("OriginImage").onload = AvatarEdit.doOriginImageLoad;
		Utility.setFileDropZone("Origin", AvatarEdit.fileSelectOptions, function(files) {
			AvatarEdit.setFile(files[0]);
		});
		var dialog = Utility.getCurrentDialog();
		AvatarEdit.setFile(dialog.getData().file)
	},
	
	setFile: function(file)
	{
		AvatarEdit.file = file;
		AvatarEdit.selection = null;
		var src = URL.createObjectURL(file);
		$elem("OriginImage").src = src;
		$elem("MediumImage").src = src;
		$elem("SmallImage").src = src;
	},
	
	doOriginImageLoad: function()
	{
		var image = $elem("OriginImage");
		AvatarEdit.originWidth = image.width;
		AvatarEdit.originHeight = image.height;
		image.className = "OriginImage";
		var maxSize = Math.min(image.offsetWidth, image.offsetHeight);
		var size = Math.max(Math.floor(maxSize * 0.75), Math.min(128, maxSize));
		var x1 = (image.offsetWidth - size) >> 1;
		var y1 = (image.offsetHeight - size) >> 1;
		$("#OriginImage").imgAreaSelect({
			aspectRatio		: "1:1",
			handles			: true,
			onSelectChange	: AvatarEdit.doSelectChange,
			x1				: x1,
			y1				: y1,
			x2				: x1 + size,
			y2				: y1 + size
		});
		AvatarEdit.previewAll({x1:x1, y1:y1, x2:x1 + size, y2:y1 + size, width:size, height:size});
	},
	
	doSelectChange: function(image, selection)
	{
		AvatarEdit.previewAll(selection);
	},
	
	previewAll: function(selection)
	{
		if (selection.width <= 0 || selection.height <= 0) {
			return;
		}
		AvatarEdit.previewOne($elem("MediumImage"), selection);
		AvatarEdit.previewOne($elem("SmallImage"), selection);
		AvatarEdit.selection = selection;
	},
	
	previewOne: function(image, selection)
	{
		var originImage = $elem("OriginImage");
		var scale = image.parentElement.offsetWidth / selection.width;
		image.style.width = Math.round(scale * originImage.offsetWidth) + "px";
		image.style.height = Math.round(scale * originImage.offsetHeight) + "px";
		image.style.marginLeft = -Math.round(scale * selection.x1) + "px";
		image.style.marginTop = -Math.round(scale * selection.y1) + "px";
	},
	
	doConfirm: function()
	{
		if (AvatarEdit.file == null || AvatarEdit.selection == null) {
			Jui.message.alert($text("Qs.PictureUpload.SelectPictureAlert"));
			return;
		}
		var originImage = $elem("OriginImage");
		var selection = AvatarEdit.selection;
		var originW = AvatarEdit.originWidth;
		var originH = AvatarEdit.originHeight;
		var zoomW = originImage.width;
		var zoomH = originImage.height;
		var zoomRatio = originW > originH ? zoomW / originW : zoomH / originH;
		var args = {
			x: Math.floor(selection.x1 / zoomRatio),
			y: Math.floor(selection.y1 / zoomRatio),
			size: Math.floor(selection.width / zoomRatio)
		};
		var ajax = new Utility.Ajax("Qs.Picture.UploadAvatar.data", args);
		ajax.showAnimation = true;
		ajax.onsuccess = function(ret) {
			Utility.closeDialog(ret);
		};
		ajax.submitFile(AvatarEdit.file);
	},
	
	doReselect: function()
	{
		Utility.selectFile(AvatarEdit.fileSelectOptions, function(files) {
			AvatarEdit.setFile(files[0]);
		});
	}
};
