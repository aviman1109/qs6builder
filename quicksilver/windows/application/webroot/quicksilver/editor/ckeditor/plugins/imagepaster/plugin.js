CKEDITOR.plugins.add('imagepaster',
{
	init: function(editor)
	{
		editor.addCommand('imagepaster',
		{
			exec: function(editor)
			{
				pasterMgr.PasteManual();
			}
		});
		editor.ui.addButton('imagepaster',
		{
			label: 'Paste local image or word content',
			command: 'imagepaster',
			icon: this.path + 'images/paster.png'
		});
	}
});
