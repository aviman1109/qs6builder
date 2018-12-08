var SlavePagePrivilege =
{
	masterUnitId: clientData.urlArgs.masterEntityId,
	
	doLoad: function()
	{
		var unitPrivilegeMap = {};
		for (var i = 0; i < clientData.unitPrivileges.length; ++i) {
			var up = clientData.unitPrivileges[i];
			if (unitPrivilegeMap[up.unitId] == null) {
				unitPrivilegeMap[up.unitId] = [];
			}
			unitPrivilegeMap[up.unitId].push(up);
		}
		var masterPrivileges = unitPrivilegeMap[SlavePagePrivilege.masterUnitId] || [];
		var comboBoxItems = Jui.array.transformProperty(masterPrivileges, {id:"value", name:"text"});
		var comboBoxArgs = {items:comboBoxItems};
		
		var configMap = {};
		for (var i = 0; i < clientData.configs.length; ++i) {
			var config = clientData.configs[i];
			configMap[config.relationId + "~" + config.slavePrivilegeId] = config.masterPrivilegeId;
		}
		
		var buffer = [];
		buffer.push("<table id=MainTable>");
		
		buffer.push("<tr>");
		buffer.push("<td>" + Utility.getUnit("Qs.Page").name + "</td>");
		buffer.push("<td>" + $fieldTitle("Qs.SlavePagePrivilege", "FSlavePrivilegeId") + "</td>");
		buffer.push("<td>" + $fieldTitle("Qs.SlavePagePrivilege", "FMasterPrivilegeId") + "</td>");
		buffer.push("</tr>");

		var isEmpty = true;
		for (var i = 0; i < clientData.pages.length; ++i) {
			var page = clientData.pages[i];
			var privileges = unitPrivilegeMap[page.unitId];
			if (privileges != null) {
				isEmpty = false;
				buffer.push("<tr>");
				buffer.push("<td rowspan=" + privileges.length + ">" + page.name + "</td>");
				for (var j = 0; j < privileges.length; ++j) {
					if (j > 0) {
						buffer.push("<tr>");
					}
					var privilege = privileges[j];
					buffer.push("<td>" + privilege.name + "</td>");
					buffer.push("<td _relationId='" + page.relationId + "'");
					buffer.push(" _slaveUnitId='" + page.unitId + "'");
					buffer.push(" _slavePrivilegeId='" + privilege.id + "'>");
					buffer.push( Jui.basic.ComboBox.getHtml(comboBoxArgs));
					buffer.push("</td>");
					buffer.push("</tr>");
				}
			}
		}
		if (isEmpty) {
			$elem("QsContent").innerHTML = $text("Qs.SlavePagePrivilege.EmptyMessage");
			return;
		}
		
		buffer.push("</table>");
		$elem("QsContent").innerHTML = buffer.join("");
		for (var i = 0, cells = SlavePagePrivilege.getBoxCells(); i < cells.length; ++i) {
			var cell = cells[i];
			var box = Jui.basic.ComboBox.initialize(cell.firstChild, comboBoxArgs);
			var key = cell.getAttribute("_relationId") + "~" + cell.getAttribute("_slavePrivilegeId");
			box.setValue(configMap[key]);
		}
	},
	
	doClearAll: function()
	{
		for (var i = 0, cells = SlavePagePrivilege.getBoxCells(); i < cells.length; ++i) {
			Jui.$owner(cells[i].firstChild).setValue();
		}
	},
	
	doSave: function()
	{
		var args = {masterUnitId:SlavePagePrivilege.masterUnitId, configs:[]};
		for (var i = 0, cells = SlavePagePrivilege.getBoxCells(); i < cells.length; ++i) {
			var cell = cells[i];
			var box = Jui.$owner(cell.firstChild);
			if (!Jui.string.isEmpty(box.getValue())) {
				args.configs.push({
					FMasterUnitId		: SlavePagePrivilege.masterUnitId,
					FSlaveUnitId		: cell.getAttribute("_slaveUnitId"),
					FRelationId			: cell.getAttribute("_relationId"),
					FSlavePrivilegeId	: cell.getAttribute("_slavePrivilegeId"),
					FMasterPrivilegeId	: box.getValue()
				});
			}
		}
		Utility.invoke("Qs.SlavePagePrivilege.saveConfigs", args, true, function(ret){
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},
	
	getBoxCells: function()
	{
		var boxCells = [];
		for (var i = 0, cells = $elem("QsContent").getElementsByTagName("td"); i < cells.length; ++i) {
			var cell = cells[i];
			if (cell.firstChild != null && /ComboBox/.test(cell.firstChild.className)) {
				boxCells.push(cell);
			}
		}
		return boxCells;
	}
};
