var UnitAccessFieldConfig =
{
	doLoad: function()
	{
		DoubleSorter.name = document.title;
		toolBar.getItem("Customize").onchange = UnitAccessFieldConfig.doCustomizeChange;
	},

	doCustomizeChange: function()
	{
		var disabled = !toolBar.getItem("Customize").getValue();
		DoubleSorter.sorters.left.setDisabled(disabled);
		DoubleSorter.sorters.right.setDisabled(disabled);
		DoubleSorter.buttons.moveLeft.setDisabled(disabled);
		DoubleSorter.buttons.moveRight.setDisabled(disabled);
		DoubleSorter.buttons.moveTop.setDisabled(disabled);
		DoubleSorter.buttons.moveUp.setDisabled(disabled);
		DoubleSorter.buttons.moveDown.setDisabled(disabled);
		DoubleSorter.buttons.moveBottom.setDisabled(disabled);
	}
};

DoubleSorter.doAfterLoad = function(json)
{
	toolBar.getItem("Customize").setValue(json.supports);
	UnitAccessFieldConfig.doCustomizeChange();
};

DoubleSorter.getSaveArguments = function()
{
	return {
		supports		: toolBar.getItem("Customize").getValue(),
		entityId		: clientData.entityId,
		selectedValues	: DoubleSorter.sorters.right.getValues()
	};
};
