var RolePrivilege =
{
	allChecked: false,
	
	typeMap: Jui.array.toMap(clientData.types, "id"),

	radios: {},
	
	checks: {},
	
	labels: {},
	
	doLoad: function()
	{
		RolePrivilege.tabStrip = Jui.option.TabStrip.create({target:"QsContent"});
		RolePrivilege.tabStrip.load(clientData.modules);
		var modulePrivileges = {};
		for (var i = 0; i < clientData.privileges.length; ++i) {
			var privilege = clientData.privileges[i];
			if (!(privilege.moduleId in modulePrivileges)) {
				modulePrivileges[privilege.moduleId] = [];
			}
			modulePrivileges[privilege.moduleId].push(privilege);
		}
		for (var i = 0; i < clientData.modules.length; ++i) {
			var moduleId = clientData.modules[i].id;
			var privileges = modulePrivileges[moduleId];
			var panel = RolePrivilege.tabStrip.getBodyByIndex(i);
			panel.style.padding = "8px"; 
			panel.innerHTML = RolePrivilege.getModuleHtml(moduleId, privileges);
		}

		for (var id in RolePrivilege.checks) {
			var item 		= RolePrivilege.checks[id];
			var data 		= clientData.rolePrivileges[item.pid];
			var elem 		= $elem(id);
			elem.onclick 	= RolePrivilege.doCheckBoxClick;
			if (data != null) {
				if (item.type == "global" && data.global) {
					elem.checked = true;
				}
				else if (item.type == "field" && !Jui.string.isEmpty(data.expression)) {
					for (var i = 0, fields = data.expression.split(","); i < fields.length; ++i) {
						var parts = fields[i].split(":");
						if (parts[0] == item.fieldName) {
							var mode = item.mode;
							var mask = parts.length == 1 ? 0 : parseInt(parts[1]);
							if (mode == null || mode == "Current" && (mask & 1) || mode == "Sub" && (mask & 2)) {
								elem.checked = true;
								break;
							}
						}
					}
				}
			}
		}
		for (var id in RolePrivilege.radios) {
			var item = RolePrivilege.radios[id];
			var data = clientData.rolePrivileges[item.pid];
			if (data != null && data.operator == "And" && item.mode == "And") {
				$elem(id).checked = true;
			}
		}
		for (var id in RolePrivilege.labels) {
			var item = RolePrivilege.labels[id];
			var data = clientData.rolePrivileges[item.pid];
			$elem(id).onclick = RolePrivilege.doSqlClick;
			if (data != null && !Jui.string.isEmpty(data.sql)) {
				RolePrivilege.setSql($elem(id), data.sql);				
			}
		}
	},
	
	getModuleHtml: function(moduleId, privileges)
	{
		var units = [];
		var unitPrivileges = {};
		var privilegeTypes = {};
		var miscPrivileges = [];
		for (var i = 0; i < privileges.length; ++i) {
			var privilege = privileges[i];
			if (privilege.type in RolePrivilege.typeMap) {
				if (!(privilege.unitId in unitPrivileges)) {
					unitPrivileges[privilege.unitId] = {};
					units.push(clientData.units[privilege.unitId]);
				}
				unitPrivileges[privilege.unitId][privilege.type] = privilege;
				privilegeTypes[privilege.type] = null;
			}
			else {
				miscPrivileges.push(privilege);
			}
		}
		units.sort(function(a, b) {return a.name.localeCompare(b.name);});
		miscPrivileges.sort(function(a, b) {return a.name.localeCompare(b.name);});
		var types = [];
		for (var i = 0; i < clientData.types.length; ++i) {
			var type = clientData.types[i];
			if (type.id in privilegeTypes) {
				types.push(type);
			}
		}
		
		var buffer = [];
		if (units.length > 0) {
			buffer.push("<table class='PrivilegeTable GeneralPrivilegeTable'>");
			buffer.push("<tr>");
			buffer.push("<th>" + $text("Qs.Privilege.Unit") + "</th>");
			buffer.push("<th colspan=2>" + $text("Qs.Privilege.Range") + "</th>");
			for (var i = 0; i < types.length; ++i) {
				buffer.push("<th>" + types[i].name + "</th>");
			}
			buffer.push("</tr>");
			buffer.push("<tr class=BatchRow>");
			buffer.push("<th></th>");
			buffer.push("<td colspan=2></td>");
			for (var k = 0; k < types.length; ++k) {
				var common = {type:"top", moduleId:moduleId, ptype:types[k].id};
				buffer.push("<td>");
				
				var id = RolePrivilege.generateElementId();
				buffer.push("<div><input type=checkbox id=" + id + ">");
				buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.All") + "</label></div>");
				RolePrivilege.checks[id] = Jui.object.merge({mode:"all"}, common);

				id = RolePrivilege.generateElementId();
				buffer.push("<div><input type=checkbox id=" + id + ">");
				buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.ChargeUser") + "</label></div>");
				RolePrivilege.checks[id] = Jui.object.merge({mode:"user"}, common);

				id = RolePrivilege.generateElementId();
				buffer.push("<div><input type=checkbox id=" + id + ">");
				buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.ChargeDepartment") + "</label></div>");
				RolePrivilege.checks[id] = Jui.object.merge({mode:"dept"}, common);

				id = RolePrivilege.generateElementId();
				buffer.push("<div><input type=checkbox id=" + id + ">");
				buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.ChargeDepartmentSub") + "</label></div>");
				RolePrivilege.checks[id] = Jui.object.merge({mode:"subdept"}, common);

				buffer.push("</td>");
			}
			buffer.push("</tr>");
			for (var i = 0; i < units.length; ++i) {
				var unit = units[i];
				var fields = unit.fields || [];
				var rowSpan = 3;
				if (fields.length > 0) {
					for (var j = 0; j < fields.length; ++j) {
						rowSpan += fields[j].isTree ? 2 : 1;
					}
					if (fields.length > 1) {
						rowSpan += 1;
					}
				}
				privilegeMap = unitPrivileges[unit.id];
				
				buffer.push("<tr>");
				buffer.push("<th rowspan=" + rowSpan + ">" + unit.name + "</th>");
				buffer.push("<td colspan=2 class=GroupTitle></td>");
				for (var k = 0; k < types.length; ++k) {
					buffer.push("<td class=GroupTitle>");
					if (types[k].id in privilegeMap) {
						buffer.push(types[k].name);
					}
					buffer.push("</td>");
				}
				buffer.push("</tr>");
				
				if (fields.length > 1) {
					buffer.push("<tr>");
					buffer.push("<td colspan=2 class=GroupTitle>" + $text("Qs.Privilege.Operator.Type") + "</td>");
					for (var k = 0; k < types.length; ++k) {
						var ptype = types[k].id;
						buffer.push("<td class=GroupTitle>");
						if (ptype in privilegeMap) {
							var pid = privilegeMap[ptype].id;
							var common = {moduleId:moduleId, unitId:unit.id, pid:pid, ptype:ptype};
							var name = RolePrivilege.generateElementName();
							
							var id = RolePrivilege.generateElementId();
							buffer.push("<input type=radio checked id=" + id + " name=" + name + ">");
							buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.Operator.Or") + "</label>");
							RolePrivilege.radios[id] = Jui.object.merge({mode:"Or"}, common);

							id = RolePrivilege.generateElementId();
							buffer.push("<input type=radio id=" + id + " name=" + name + ">");
							buffer.push("<label for=" + id + ">" + $text("Qs.Privilege.Operator.And") + "</label>");
							RolePrivilege.radios[id] = Jui.object.merge({mode:"And"}, common);
						}
						buffer.push("</td>");
					}
					buffer.push("</tr>");
				}
				
				for (var j = 0; j < fields.length; ++j) {
					var field = fields[j];
					var common = {type:"field", moduleId:moduleId, unitId:unit.id, fieldName:field.name};
					buffer.push("<tr>");
					buffer.push("<td rowspan=" + (field.isTree ? 2 : 1) + " colspan=" + (field.isTree ? 1 : 2) + ">");
					buffer.push(field.title + "</td>");
					if (field.isTree) {
						buffer.push("<td>" + $text("Qs.Privilege.Current") + "</td>");
					}
					for (var k = 0; k < types.length; ++k) {
						var ptype = types[k].id;
						buffer.push("<td>");
						if (ptype in privilegeMap) {
							var mode = field.isTree ? "Current" : null;
							var pid = privilegeMap[ptype].id;
							var id = RolePrivilege.generateElementId();
							buffer.push("<input type=checkbox id=" + id + ">");
							RolePrivilege.checks[id] = Jui.object.merge({mode:mode, pid:pid, ptype:ptype}, common);
						}
						buffer.push("</td>");
					}
					buffer.push("</tr>");
					if (field.isTree) {
						buffer.push("<tr>");
						buffer.push("<td>" + $text("Qs.Privilege.Sub") + "</td>");
						for (var k = 0; k < types.length; ++k) {
							var ptype = types[k].id;
							buffer.push("<td>");
							if (ptype in privilegeMap) {
								var pid = privilegeMap[ptype].id;
								var id = RolePrivilege.generateElementId();
								buffer.push("<input type=checkbox id=" + id + ">");
								RolePrivilege.checks[id] = Jui.object.merge({mode:"Sub", pid:pid, ptype:ptype}, common);
							}
							buffer.push("</td>");
						}
						buffer.push("</tr>");
					}
				}
				
				var common = {moduleId:moduleId, unitId:unit.id};
				buffer.push("<tr>");
				buffer.push("<td colspan=2>" + $text("Qs.Privilege.All") + "</td>");
				for (var k = 0; k < types.length; ++k) {
					var ptype = types[k].id;
					buffer.push("<td>");
					if (ptype in privilegeMap) {
						var pid = privilegeMap[ptype].id;
						var id = RolePrivilege.generateElementId();
						buffer.push("<input type=checkbox id=" + id + ">");
						RolePrivilege.checks[id] = Jui.object.merge({type:"global", pid:pid, ptype:ptype}, common);
					}
					buffer.push("</td>");
				}
				buffer.push("</tr>");

				buffer.push("<tr>");
				buffer.push("<td colspan=2>SQL</td>");
				for (var k = 0; k < types.length; ++k) {
					var ptype = types[k].id;
					buffer.push("<td>");
					if (ptype in privilegeMap) {
						var pid = privilegeMap[ptype].id;
						var id = RolePrivilege.generateElementId();
						buffer.push("<label class=Sql id=" + id + ">" + $text("Qs.RolePrivilege.SqlNullText") + "</label>");
						RolePrivilege.labels[id] = Jui.object.merge({type:"sql", pid:pid, ptype:ptype}, common);
					}
					buffer.push("</td>");
				}
				buffer.push("</tr>");
			}
			buffer.push("</table>");
		}
		
		if (miscPrivileges.length > 0) {
			var className = units.length == 0 ? "MiscTitle TopMiscTitle" : "MiscTitle";
			buffer.push("<div class='" + className + "'>" + $text("Qs.Privilege.Miscellaneous") + "</div>");
			buffer.push("<table class=PrivilegeTable>");
			buffer.push("<tr>");
			buffer.push("<th>" + $text("Qs.Privilege.Privilege") + "</th>");
			buffer.push("<th>" + $text("Qs.Privilege.Authorize") + "</th>");
			buffer.push("</tr>");
			for (var i = 0; i < miscPrivileges.length; ++i) {
				var privilege = miscPrivileges[i];
				var id = RolePrivilege.generateElementId();
				buffer.push("<tr>");
				buffer.push("<td>" + privilege.name + "</td>");
				buffer.push("<td><input type=checkbox id=" + id + "></td>");
				buffer.push("</tr>");
				RolePrivilege.checks[id] = {type:"global", pid:privilege.id};
			}
		}
		
		return buffer.join("");
	},
	
	generateElementId: function()
	{
		RolePrivilege.idSerail = RolePrivilege.idSerail == null ? 1 : RolePrivilege.idSerail + 1;
		return "i-" + RolePrivilege.idSerail;
	},
	
	generateElementName: function()
	{
		RolePrivilege.nameSerial = RolePrivilege.nameSerial == null ? 1 : RolePrivilege.nameSerial + 1;
		return "n-" + RolePrivilege.nameSerial;
	},

	doSqlClick: function()
	{
		var elem = event.srcElement;
		var item = RolePrivilege.labels[elem.id];
		var args = {
			title		: $text("Qs.RolePrivilege.SqlInputTitle"),
			information	: $text("Qs.RolePrivilege.SqlInputMessage"),
			text		: item.sql,
			allowEmpty	: true,
			multiLine	: true
		};
		Utility.openDialog("Qs.Misc.Prompt.page", args, {width:600,height:400}, function(sql) {
			RolePrivilege.setSql(elem, sql);
		});
	},
	
	setSql: function(label, sql)
	{
		var isEmpty 	= Jui.string.isEmpty(sql);
		var item 		= RolePrivilege.labels[label.id];
		item.sql 		= isEmpty ? null : Jui.string.trim(sql);
		label.className	= isEmpty ? "Sql" : "Sql SqlWithContent";
		label.title		= isEmpty ? "" : sql;
		Jui.dom.setInnerText(label, isEmpty ? $text("Qs.RolePrivilege.SqlNullText") : "(SQL)");
	},
	
	doSave: function()
	{
		var map = {};
		for (var i = 0; i < clientData.privileges.length; ++i) {
			var privilege = clientData.privileges[i];
			map[privilege.id] = {FPrivilegeId:privilege.id, FGlobal:false, FOperator:"Or", fields:{}};
		}
		for (var id in RolePrivilege.checks) {
			var item = RolePrivilege.checks[id];
			var privilege = map[item.pid];
			if ($elem(id).checked) {
				if (item.type == "global") {
					privilege.FGlobal = true;
				}
				else if (item.type == "field") {
					if (item.mode == "Current") {
						privilege.fields[item.fieldName] = (privilege.fields[item.fieldName] || 0) | 1;
					}
					else if (item.mode == "Sub") {
						privilege.fields[item.fieldName] = (privilege.fields[item.fieldName] || 0) | 2;
					}
					else {
						privilege.fields[item.fieldName] = null; 
					}
				}
			}
		}
		for (var id in RolePrivilege.radios) {
			var item = RolePrivilege.radios[id];
			if (item.mode == "And" && $elem(id).checked) {
				map[item.pid].FOperator = "And";
			}
		}
		for (var id in RolePrivilege.labels) {
			var item = RolePrivilege.labels[id];
			if (item.sql != null) {
				map[item.pid].FSql = item.sql;
			}
		}
		
		var privileges = [];
		for (var privilegeId in map) {
			var privilege = map[privilegeId];
			if (privilege.FGlobal) {
				delete privilege.FOperator; 
			}
			else {
				var fields = [];
				for (var fieldName in privilege.fields) {
					var value = privilege.fields[fieldName];
					fields.push(fieldName + (value == null ? "" : ":" + value));
				}
				privilege.FExpression = fields.join(",");
			}
			delete privilege.fields; 
			if (privilege.FGlobal || !Jui.string.isEmpty(privilege.FExpression) || !Jui.string.isEmpty(privilege.FSql)) {
				privileges.push(privilege);
			}
		}
		
		var args = {roleId:clientData.roleId, privileges:privileges};
		Utility.invoke("Qs.RolePrivilege.saveConfig", args, true, function(json) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},

	doSelectAll: function()
	{
		RolePrivilege.allChecked = !RolePrivilege.allChecked;
		var boxes = document.getElementsByTagName("input");
		for (var i = 0; i < boxes.length; ++i) {
			var box = boxes[i];
			if (box.type == "checkbox") {
				box.checked = RolePrivilege.allChecked;
			}
			else if (RolePrivilege.allChecked && RolePrivilege.radios[box.id].mode == "Or") {
				box.checked = true;
			}
		}
	},
	
	doCheckBoxClick: function()
	{
		var thisItem = RolePrivilege.checks[this.id];
		if (thisItem.type == "top") {
			for (var id in RolePrivilege.checks) {
				var item = RolePrivilege.checks[id];
				if (item.moduleId == thisItem.moduleId && item.ptype == thisItem.ptype) {
					if (thisItem.mode == "all") {
						$elem(id).checked = this.checked;
					}
					else if (thisItem.mode == "user" && item.fieldName == "FUserId") {
						$elem(id).checked = this.checked;
					}
					else if (thisItem.mode == "dept" && item.fieldName == "FDepartmentId" && item.mode == "Current") {
						$elem(id).checked = this.checked;
					}
					else if (thisItem.mode == "subdept" && item.fieldName == "FDepartmentId" && item.mode == "Sub") {
						$elem(id).checked = this.checked;
					}
				}
			}
		}
	},

	doExportAll: function()
	{
		Utility.download("Qs.RolePrivilege.export");
	},

	doExportCurrent: function()
	{
		var args = {roleId:clientData.roleId};
		Utility.download("Qs.RolePrivilege.export", args);
	}
};
