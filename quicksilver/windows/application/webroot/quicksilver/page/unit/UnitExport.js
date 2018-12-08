var UnitExport =
{
	doLoad: function()
	{
		toolBar.getItem("Content").setValue("sql");
		var buffer = [];
		buffer.push("<table id=MainTable>");
		buffer.push("<col width='4%'><col width='18%'><col width='10%'>");
		buffer.push("<col width='4%'><col width='18%'><col width='10%'>");
		buffer.push("<col width='4%'><col width='18%'><col width='10%'>");
		buffer.push("<tr>");
		buffer.push("<td><input type=checkbox hidefocus onclick=UnitExport.doTitleCheckBoxClick()></td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Code") + "</td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Name") + "</td>");
		buffer.push("<td><input type=checkbox hidefocus onclick=UnitExport.doTitleCheckBoxClick()></td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Code") + "</td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Name") + "</td>");
		buffer.push("<td><input type=checkbox hidefocus onclick=UnitExport.doTitleCheckBoxClick()></td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Code") + "</td>");
		buffer.push("<td>" + $text("Qs.UnitExport.Name") + "</td>");
		buffer.push("</tr>");
		for (var i = 0; i < clientData.unitsJson.length; ++i) {
			if (i % 3 == 0) {
				buffer.push("<tr>");
			}
			var item = clientData.unitsJson[i];
			buffer.push("<td><input type=checkbox hidefocus id='" + item.id + "'></td>");
			buffer.push("<td><span>" + item.code + "</span></td>");
			buffer.push("<td><span>" + item.name + "</span></td>");
			if (i % 3 == 2) {
				buffer.push("</tr>");
			}
		}
		if (clientData.unitsJson.length % 3 != 0) {
			for (var i = 3 - clientData.unitsJson.length % 3; i > 0; --i) { 
				buffer.push("<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>");
			}
			buffer.push("</tr>");
		}
		buffer.push("</table>");
		$elem("QsContent").innerHTML = buffer.join("");
	},

	doTitleCheckBoxClick: function()
	{
		var index = event.srcElement.parentElement.cellIndex;
		for (var i = 1, rows = $elem("MainTable").rows; i < rows.length; ++i) {
			var cell = rows[i].cells[index];
			if (cell.firstChild != null && cell.firstChild.tagName == "INPUT") {
				cell.firstChild.checked = event.srcElement.checked;
			}
		}
	},
	
	doExport: function()
	{
		var args = {content:toolBar.getItem("Content").getValue(), unitIds:[]};
		var boxes = $elem("MainTable").getElementsByTagName("input");
		for (var i = 0; i < boxes.length; ++i) {
			if (boxes[i].checked && !Jui.string.isEmpty(boxes[i].id)) {
				args.unitIds.push(boxes[i].id);
			}
		}
		if (Jui.string.isEmpty(args.content)) {
			Jui.message.alert($text("Qs.UnitExport.SelectContentAlert"));
			return;
		}
		if (args.unitIds.length == 0) {
			Jui.message.alert($text("Qs.UnitExport.SelectUnitAlert"));
			return;
		}
		Utility.download("Qs.Unit.export", args);
	}
};
