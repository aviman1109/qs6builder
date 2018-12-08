CKEDITOR.plugins.add('excelpaster',
{
	init: function(editor)
	{
		editor.addCommand('excelpaster',
		{
			exec: function(editor)
			{
				pasterMgr.PasteExcel();
			}
		});
		editor.ui.addButton('excelpaster',
		{
			label: 'Paste Excel',
			command: 'excelpaster',
			icon: this.path + 'images/excel.gif'
		});
	}
});
