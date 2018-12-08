var HomepageConfig =
{
	currentFormatItem: null,

	isUser: /UserHomepageConfig/.test(window.location.href),
		
	doLoad: function()
	{
		HomepageConfig.tabStrip = Jui.option.TabStrip.create({
			target			: "TabZone"
		});
		HomepageConfig.layout = Jui.option.Layout.create({
			target			: "LayoutZone",
			onmoduleclose	: HomepageConfig.doLayoutModuleClose
		});
		HomepageConfig.formatBox = Jui.basic.InputBox.create({
			target			: "FormatBoxCell",
			style			: "width:150px",
			onchange		: HomepageConfig.doFormatChange,
			onkeydown		: HomepageConfig.doFormatBoxKeyDown
		});
		HomepageConfig.tabStrip.load([
			{id:"format", text:$text("Qs.Homepage.Config.Format"), 			body:"FormatTabBody"},
			{id:"module", text:$text("Qs.Homepage.Config.HomepageItem"),	body:"ModuleTabBody"}
		]);

		var systemModules = [];
		var userModules = [];
		var visibleModules = [];
		for (var i = 0; i < clientData.items.length; ++i) {
			var module = clientData.items[i];
			(module.isPublic ? systemModules : userModules).push(module);
			if (module.visible) {
				visibleModules.push(module);
			}
		}
		
		$elem("FormatsPanel").innerHTML = HomepageConfig.getFormatsHtml();
		HomepageConfig.selectFormatItem(clientData.format);
		HomepageConfig.layout.setFormat(clientData.format, visibleModules);
		if (HomepageConfig.isUser) {
			$elem("SystemModuleCell").innerHTML = HomepageConfig.getModulesHtml(systemModules, false);
			$elem("UserModuleCell").innerHTML = HomepageConfig.getModulesHtml(userModules, true);
		}
		else {
			$elem("UserModulePanel").style.display = "none";
			$elem("SystemModulePanel").style.width = "100%";
			$elem("SystemModuleCell").innerHTML = HomepageConfig.getModulesHtml(systemModules, true);
		}
	},
	
	doSave: function()
	{
		var args = {format:HomepageConfig.layout.getFormat(), items:[]};
		for (var i = 0, modules = HomepageConfig.layout.getModules(); i < modules.length; ++i) {
			var module = modules[i];
			args.items.push({FHomepageItemId:module.id, FRegion:module.region, FIndex:module.index});
		}
		var url = HomepageConfig.isUser ? "Qs.HomepageItem.saveUserConfig" : "Qs.HomepageItem.saveSystemConfig";
		Utility.invoke(url, args, true, function(ret) {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},
	
	doModuleAdd: function(event)
	{
		var args = {editId:event.id, multiAdd:false};
		if (!HomepageConfig.isUser) {
			args.creationEditData = {FPublic:1};
		}
		CommonBusiness.openEntity("Qs.HomepageItem", args, "Dialog", function(ret) {
			var args = {entityId:ret.entityIds[0]};
			Utility.invoke("Qs.HomepageItem.getItemJson", args, true, function(ret) {
				var target = HomepageConfig.isUser ? $elem("UserModuleCell") : $elem("SystemModuleCell");
				var html = HomepageConfig.getModuleHtml(ret, true);
				Jui.dom.insertHtml(target, "BeforeEnd", html);
			});
		});
	},

	doModuleEdit: function()
	{
		var module = Jui.dom.getAncestorByClassName("Module");
		var args = {entityId:module.id};
		CommonBusiness.openEntity("Qs.HomepageItem", args, "Dialog", function(ret) {
			Utility.invoke("Qs.HomepageItem.getItemJson", args, true, function(ret) {
				Jui.dom.setInnerText(module.children[1], ret.text);
				HomepageConfig.layout.updateModule(ret);
			});
		});
	},
	
	doModuleDelete: function()
	{
		var module = Jui.dom.getAncestorByClassName("Module");
		var message = Utility.formatText("Public.DeleteConfirmTemplate", module.children[1].innerText);
		Jui.message.confirm(message, function() {
			CommonBusiness.deleteEntity("Qs.HomepageItem", module.id, function(ret) {
				HomepageConfig.layout.deleteModule(module.id);
				Jui.dom.removeElement(module);
			});
		});
	},

	getModulesHtml: function(modules, editable)
	{
		var buffer = [];
		for (var i = 0; i < modules.length; ++i) {
			buffer.push(HomepageConfig.getModuleHtml(modules[i], editable));
		}
		return buffer.join("");
	},
	
	getModuleHtml: function(module, editable)
	{
		return	"<div id='" + module.id + "' _height=" + module.height
			+	" class='QsShortShadow Module " + (module.visible ? " SelectedModule" : "") + "'>"
			+		"<div class=ModuleCheckBoxCell>"
			+			"<input type='checkbox' hidefocus" + (module.visible ? " checked" : "")
			+ 			" onclick=HomepageConfig.doModuleCheckBoxClick()>"
			+		"</div>"
			+		"<div class=ModuleNameCell>"
			+			"<label title='" + Jui.$h(module.text) + "'>" + Jui.$h(module.text) + "</label>"
			+		"</div>"
			+		"<div class=ModuleOperationCell>"
			+			"<label " + (editable ? "class=QsLink onclick=HomepageConfig.doModuleEdit()" : "class=Gray") + ">"
			+ 				$text("Qs.Homepage.Config.Edit")
			+			"</label>"
			+			"<label " + (editable ? "class=QsLink onclick=HomepageConfig.doModuleDelete()" : "class=Gray") + ">"
			+ 				$text("Qs.ToolItem.Delete")
			+			"</label>"
			+		"</div>"
			+	"</div>";
	},
	
	doModuleCheckBoxClick: function()
	{
		var module = Jui.dom.getAncestorByClassName("Module");
		HomepageConfig.selectModule(module, event.srcElement.checked);
		if (event.srcElement.checked) {
			HomepageConfig.layout.addModule({
				id		: module.id,
				text	: module.children[1].innerText,
				height	: parseInt(module.getAttribute("_height"))
			});
		}
		else {
			HomepageConfig.layout.deleteModule(module.id);
		}
	},
	
	selectModule: function(module, visible)
	{
		module.className = visible ? "Module SelectedModule" : "Module";
	},
	
	getFormatsHtml: function()
	{
		var items = [
			{name:"1:2",	format:"1:2"},
			{name:"1:2", 	format:"1,1:2"},
			{name:"1:3", 	format:"1:3"},
			{name:"1:3", 	format:"1,1:3"},
			{name:"1:4", 	format:"1:4"},
			{name:"1:4", 	format:"1,1:4"},
			{name:"2:1", 	format:"2:1"},
			{name:"2:1", 	format:"1,2:1"},
			{name:"3:1", 	format:"3:1"},
			{name:"3:1", 	format:"1,3:1"},
			{name:"4:1", 	format:"4:1"},
			{name:"4:1", 	format:"1,4:1"},
			{name:"1:2:1", 	format:"1:2:1"},
			{name:"1:2:1", 	format:"1,1:2:1"},
			{name:"1:3:1", 	format:"1:3:1"},
			{name:"1:3:1", 	format:"1,1:3:1"},
			{name:"1:1:2", 	format:"1:1:2"},
			{name:"1:1:2", 	format:"1,1:1:2"},
			{name:"1:1:3", 	format:"1:1:3"},
			{name:"1:1:3", 	format:"1,1:1:3"},
			{name:"2:1:1", 	format:"2:1:1"},
			{name:"2:1:1", 	format:"1,2:1:1"},
			{name:"3:1:1",	format:"3:1:1"},
			{name:$text("Qs.Homepage.Config.OtherFormat"), format:"1:2,2:1", id:"other"}
		];
		var buffer = [];
		for (var i = 0; i < items.length; ++i) {
			var item = items[i];
			var id = item.id || item.format;
			buffer.push("<div id='" + id + "' _mark=Format class='Format QsShortShadow'");
			buffer.push(" onclick=HomepageConfig.doFormatClick()>");
			buffer.push("<div class=Legend>");
			for (var j = 0, rows = item.format.split(","); j < rows.length; ++j) {
				var n = rows.length;
				var height = n == 1 ? 45 : j == n - 1 ? 28 : 17;
				buffer.push("<div class=LegendRow style='height:" + height + "px'>");
				var sum = 0;
				for (var k = 0, cells = rows[j].split(":"); k < cells.length; ++k) {
					sum += parseInt(cells[k]);
				}
				for (var k = 0, cells = rows[j].split(":"); k < cells.length; ++k) {
					buffer.push("<div style='width:" + (100 * parseInt(cells[k]) / sum) + "%'><div></div></div>");
				}
				buffer.push("</div>");
			}
			buffer.push("</div>");
			buffer.push("<div class=LabelRow>" + item.name + "</div>");
			buffer.push("</div>");
		}
		return buffer.join("");
	},

	doFormatBoxChange: function()
	{
		var format = HomepageConfig.formatBox.getValue();
		if (!HomepageConfig.layout.setFormat(format)) {
			Jui.message.alert(Utility.format("Qs.Homepage.InvalidFormat", format));
		}
	},

	doFormatBoxKeyDown: function(event)
	{
		if (event.keyCode == 13) {
			HomepageConfig.doFormatBoxChange();
		}
	},

	doFormatClick: function()
	{
		var format = Jui.dom.getAncestorByClassName("Format").id;
		HomepageConfig.selectFormatItem(format);
		if (format != "other") {
			HomepageConfig.layout.setFormat(format);
		}
	},
	
	doFormatChange: function()
	{
		HomepageConfig.layout.setFormat(HomepageConfig.formatBox.getValue());
	},
	
	selectFormatItem: function(format)
	{
		var item = $elem(format);
		if (item == null) {
			item = $elem("other");
		}
		if (HomepageConfig.currentFormatItem != null) {
			HomepageConfig.currentFormatItem.className = "Format";
		}
		if (item != null) {
			item.className = "Format SelectedFormat";
			HomepageConfig.formatBox.setDisabled(item.id != "other");
			if (format != "other") {
				HomepageConfig.formatBox.setValue(format);
			}
		}
		HomepageConfig.currentFormatItem = item;
	},
	
	getFormat: function()
	{
		return HomepageConfig.formatBox.getValue();
	},

	doLayoutModuleClose: function(event)
	{
		var module = $elem(event.moduleId);
		HomepageConfig.selectModule(module, false);
		module.getElementsByTagName("input")[0].checked = false;
	},
	
	doResume: function()
	{
		if (confirm($text("Qs.Homepage.DeleteUserConfigConfirm"))) {
			Utility.invoke("Qs.HomepageItem.deleteUserConfig", {}, true, function() {
				window.location.reload(true);
			});
		}
	}
};

if (HomepageConfig.isUser) {
	for (var i = 0, right = clientData.toolBarJson.right; right != null && i < right.length; ++i) {
		if (right[i].name == "Add") {
			right[i].items.splice(3, 1);
		}
	}
}
