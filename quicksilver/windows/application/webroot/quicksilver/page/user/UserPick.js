var UserPick =
{
	types: {},
	
	doLoad: function()
	{
		UserPick.createControls();
		var radios = document.getElementsByName("Type");
		for (var i = 0; i < radios.length; ++i) {
			radios[i].hideFocus = true;
			radios[i].onclick = UserPick.doTypeChange;
			if (radios[i].value == clientData.type) {
				radios[i].checked = true;
			}
		}
		$elem("Initiator").disabled = !clientData.isWorkflow;
		$elem("Participant").disabled = !clientData.isWorkflow;
		$elem("Executor").disabled = !clientData.isWorkflow;
		$elem("RelevantData").disabled = !clientData.isWorkflow;
		if (clientData.type == "User") {
			UserPick.userBox.setValue(clientData.value, clientData.text);
		}
		else if (clientData.type == "Role") {
			UserPick.roleBox.setValue(clientData.value, clientData.text);
		}
		else if (clientData.type == "Department") {
			var pair = clientData.value.split("*");
			UserPick.departmentBox.setValue(pair[0], clientData.text);
			$elem("DepartmentSub").checked = pair.length == 2;
		}
		else if (clientData.type == "UserField") {
			if (UserPick.userFieldBox.containsValue(clientData.value)) {
				UserPick.userFieldBox.setValue(clientData.value);
			}
		}
		else if (clientData.type == "DepartmentField") {
			var pair = clientData.value.split("*");
			if (UserPick.departmentFieldBox.containsValue(pair[0])) {
				UserPick.departmentFieldBox.setValue(pair[0]);
				$elem("DepartmentFieldSub").checked = pair.length == 2;
			}
		}
		else if (clientData.type == "Initiator") {
			$elem("Initiator").checked = true;
		}
		else if (clientData.type == "Participant") {
			$elem("Participant").checked = true;
		}
		else if (clientData.type == "Executor") {
			if (UserPick.executorBox.containsValue(clientData.value)) {
				UserPick.executorBox.setValue(clientData.value);
			}
		}
		else if (clientData.type == "RelevantData") {
			UserPick.relevantDataBox.setValue(clientData.value);
		}
		else if (clientData.type == "JavaClass") {
			UserPick.javaClassBox.setValue(clientData.value);
		}
		else if (clientData.type == "Sql") {
			UserPick.sqlBox.setValue(clientData.value);
		}
		else {
			$elem("User").checked = true;
		}
		UserPick.doTypeChange();
	},
	
	doConfirm: function()
	{
		var ret = null;
		var UP = UserPick;
		if ($elem("User").checked) {
			ret = {type:"User", value:UP.userBox.getValue(), text:UP.userBox.getText()};
		}
		else if ($elem("Role").checked) {
			ret = {type:"Role", value:UP.roleBox.getValue(), text:UP.roleBox.getText()};
		}
		else if ($elem("Department").checked) {
			ret = {type:"Department", value:UP.departmentBox.getValue(), text:UP.departmentBox.getText()};
			if (!Jui.string.isEmpty(ret.value) && $elem("DepartmentSub").checked) {
				ret.value += "*";
				ret.text += "(" + $text("Qs.User.Pick.IncludeSubDepartment") + ")";
			}
		}
		else if ($elem("UserField").checked) {
			ret = {type:"UserField", value:UP.userFieldBox.getValue(), text:UP.userFieldBox.getText()};
		}
		else if ($elem("DepartmentField").checked) {
			ret = {type:"DepartmentField", value:UP.departmentFieldBox.getValue(), text:UP.departmentFieldBox.getText()};
			if (!Jui.string.isEmpty(ret.value) && $elem("DepartmentFieldSub").checked) {
				ret.value += "*";
				ret.text += "(" + $text("Qs.User.Pick.IncludeSubDepartment") + ")";
			}
		}
		else if ($elem("Initiator").checked) {
			ret = {type:"Initiator"};
		}
		else if ($elem("Participant").checked) {
			ret = {type:"Participant"};
		}
		else if ($elem("Executor").checked) {
			ret = {type:"Executor", value:UP.executorBox.getValue(), text:UP.executorBox.getText()};
		}
		else if ($elem("RelevantData").checked) {
			ret = {type:"RelevantData", value:UP.relevantDataBox.getValue(), text:UP.relevantDataBox.getValue()};
		}
		else if ($elem("JavaClass").checked) {
			ret = {type:"JavaClass", value:UP.javaClassBox.getValue(), text:UP.javaClassBox.getValue()};
		}
		else if ($elem("Sql").checked) {
			ret = {type:"Sql", value:UP.sqlBox.getValue(), text:UP.sqlBox.getValue()};
		}
		if (ret.type != "Initiator" && ret.type != "Participant"
			&& (Jui.string.isEmpty(ret.value) || Jui.string.isEmpty(ret.text))) {
			Jui.message.alert($text("Public.InputAlert").replace("${0}", UP.types[ret.type]));
			return;
		}
		Utility.closeDialog(ret);
	},
	
	doTypeChange: function()
	{
		UserPick.userBox.setDisabled(!$elem("User").checked);
		UserPick.roleBox.setDisabled(!$elem("Role").checked);
		UserPick.departmentBox.setDisabled(!$elem("Department").checked);
		UserPick.userFieldBox.setDisabled(!$elem("UserField").checked);
		UserPick.departmentFieldBox.setDisabled(!$elem("DepartmentField").checked);
		UserPick.executorBox.setDisabled(!$elem("Executor").checked);
		UserPick.relevantDataBox.setDisabled(!$elem("RelevantData").checked);
		UserPick.javaClassBox.setDisabled(!$elem("JavaClass").checked);
		UserPick.sqlBox.setDisabled(!$elem("Sql").checked);
		$elem("DepartmentSub").disabled = !$elem("Department").checked;
		$elem("DepartmentFieldSub").disabled = !$elem("DepartmentField").checked;
	},
	
	createControls: function()
	{
		var commonBoxArgs = {
			clearOnDisable	: true,
			restoreOnEnable	: true,
			style			: "width:100%"
		};
		var entityBoxArgs = {
			onselect		: CommonBusiness.doEntityBoxSelect,
			onview			: CommonBusiness.doEntityBoxView,
			onbeforedrop	: CommonBusiness.doEntityBoxBeforeDrop,
			onpopupclick	: CommonBusiness.doEntityBoxPopupClick
		};
		UserPick.userBox = Jui.basic.EntityBox.create(Jui.object.merge({
			target			: "UserBoxCell",
			entityType		: "Qs.User"
		}, entityBoxArgs, commonBoxArgs));
		UserPick.roleBox = Jui.basic.EntityBox.create(Jui.object.merge({
			target			: "RoleBoxCell",
			entityType		: "Qs.Role"
		}, entityBoxArgs, commonBoxArgs));
		UserPick.departmentBox = Jui.basic.EntityBox.create(Jui.object.merge({
			target			: "DepartmentBoxCell",
			entityType		: "Qs.Department"
		}, entityBoxArgs, commonBoxArgs));
		UserPick.userFieldBox = Jui.basic.ComboBox.create(Jui.object.merge({
			target			: "UserFieldBoxCell",
			items			: clientData.userFields
		}, commonBoxArgs));
		UserPick.departmentFieldBox = Jui.basic.ComboBox.create(Jui.object.merge({
			target			: "DepartmentFieldBoxCell",
			items			: clientData.departmentFields
		}, commonBoxArgs));
		UserPick.executorBox = Jui.basic.ComboBox.create(Jui.object.merge({
			target			: "ExecutorBoxCell",
			items			: clientData.urlArgs.activities
		}, commonBoxArgs));
		UserPick.relevantDataBox = Jui.basic.InputBox.create(Jui.object.merge({
			target			: "RelevantDataBoxCell"
		}, commonBoxArgs));
		UserPick.javaClassBox = Jui.basic.InputBox.create(Jui.object.merge({
			target			: "JavaClassBoxCell"
		}, commonBoxArgs));
		UserPick.sqlBox = Jui.basic.TextBox.create(Jui.object.merge({
			target			: "SqlBoxCell",
			style			: "width:100%;height:72px"
		}, commonBoxArgs));
	},
	
	initialize: function()
	{
		for (var i = 0; i < clientData.types.length; ++i) {
			var type = clientData.types[i];
			UserPick.types[type.value] = type.text;
		}
	}
};

UserPick.initialize();
