EditableList.validate = function()
{
	var names = list.getFieldValues("FName");
	var values = list.getFieldValues("FValue");
	var map = {};
	for (var i = 0; i < names.length; ++i) {
		if (Jui.string.isEmpty(names[i])) {
			list.setEditIndex(i);
			alert($text("Qs.Field.Property.EmptyNameAlert"));
			list.setFieldFocus("FName");
			return false;
		}
		if (names[i] in map) {
			list.setEditIndex(i);
			alert($text("Qs.Field.Property.DuplicateAlert").replace("${0}", names[i]));
			list.setFieldFocus("FName");
			return false;
		}
		map[names[i]] = 0;
		try {
			JSON.parse(values[i]);
		}
		catch (e) {
			list.setEditIndex(i);
			alert($text("Qs.Field.Property.InvalidValueAlert").replace("${0}", values[i]));
			list.setFieldFocus("FValue");
			return false;
		}
	}
	return true;
};
