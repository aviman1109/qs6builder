var EntityView =
{
	//-----------------------------------------------------------------------
	// data
	//-----------------------------------------------------------------------
	
	popupButtonAdded: false,
	
	eventHandlers: [],
	
	responseEditPane: null,

	attachments: {},
	
	//-----------------------------------------------------------------------
	// page
	//-----------------------------------------------------------------------
	
	doLoad: function()
	{
		if (clientData.urlArgs.keywords != null) {
			EntityView.highlightKeywordsTryCount = 0;
			EntityView.keywords = clientData.urlArgs.keywords;
			setTimeout(EntityView.highlightKeywords, 100);
		}
		for (var i = 0, divs = document.getElementsByTagName("div"); i < divs.length; ++i) {
			var div = divs[i];
			if (div.className == "HtmlContent") {
				for (var j = 0, links = div.getElementsByTagName("a"); j < links.length; ++j) {
					links[j].target = "_blank";
				}
			}
		}
	},
	
	highlightKeywords: function()
	{
		try {
			for (var i = 0; i < EntityView.keywords.length; ++i) {
				var range = document.body.createTextRange();
				while (range.findText(EntityView.keywords[i])) {
					range.pasteHTML("<div class=EntityViewTextHighlight>" + range.text + "</div>");
				}
			}
		}
		catch (e) {
			if (++EntityView.highlightKeywordsTryCount < 20) {
				setTimeout(EntityView.highlightKeywords, 200);
			}
		}
	},
	
	getButton: function(code)
	{
		return document.getElementById("EntityView.Button." + code);
	},
	
	setButtonEnabled: function(code, enabled)
	{
		var disabled = !Jui.cast.toBool(enabled, true);
		Jui.dom.tagAttribute(EntityView.getButton(code), "disabled", disabled);
	},
	
	setButtonVisible: function(code, visible)
	{
		visible = Jui.cast.toBool(visible, true);
		EntityView.getButton(code).style.display = visible ? "" : "none";
	},
	
	generateBlockStartTag: function(block)
	{
		var className = "Block";
		if (block.breakLine == "Solid") {
			className += " BlockWithSolidLine";
		}
		else if (block.breakLine == "Dotted") {
			className += " BlockWithDottedLine";
		}
		var style = {};
		if (block.marginTop > 0) {
			style["margin-top"] = block.marginTop + "px";
		}
		document.write("<div _mark=Block");
		document.write(" class='" + className + "'");
		document.write(" id='" + block.itemId + "'");
		document.write(" style='" + Jui.$s(style) + "'");
		document.write(">");
		if (block.isAnchor && clientData.urlArgs.isListView) {
			Jui.event.attach(window, "load", function() {
				var rect = $elem("" + block.itemId).getBoundingClientRect();
				document.documentElement.scrollTop = rect.top + 1;
			});
		}
		EntityView.block = block;
	},
	
	generateBlockEndTag: function(block)
	{
		document.write("</div>");
	},
	
	getStyle: function(json)
	{
		var style = {};
		if (!Jui.string.isEmpty(json.fontSize)) {
			var fontSize = json.fontSize + "";
			style["font-size"] = /px$/.test(fontSize) ? fontSize : fontSize + "px";
		}
		if (!Jui.string.isEmpty(json.color)) {
			style["color"] = json.color;
		}
		return Jui.$s(style);
	},
	
	generateBlockHeader: function(title, buttons, type, collapsed)
	{
		document.write("<table class=BlockHeader><tr>");
		if (title != null) {
			var icon = "quicksilver/image/other/EntityViewBlock" + (collapsed ? "Collapsed.gif" : "Expanded.gif"); 
			document.write("<td>");
			document.write(  "<table><tr>");
			document.write(    "<td class=BlockFlag><img src='" + icon + "'");
			document.write(    " onclick=EntityView.doContentSwitch()></td>");
			document.write(    "<td class=BlockTitle style='" + EntityView.getStyle(title) + "'>" + Jui.$h(title.text) + "</td>");
			document.write(  "</tr></table>");
			document.write("</td>");
		}
		var buttonCodes = Jui.array.toSet(buttons, "code");
		if (!EntityView.popupButtonAdded && window.parent != window) {
			if (buttonCodes["Popup"] == null) {
				buttons.push({text:$text("Qs.EntityView.Popup"), handler:EntityView.doPopup});
			}
			if (buttonCodes["Edit"] == null && window != window.top) {
				buttons.push({text:$text("Qs.EntityView.Edit"), handler:EntityView.doEdit});
			}
			EntityView.popupButtonAdded = true;
		}
		if (type == "Attachment" && EntityView.block.hasContent) {
			buttons.push({text:$text("Qs.Attachment.DownloadAll"), handler:EntityView.downloadAllAttachments});
		}
		if (buttons.length > 0) {
			document.write("<td align=right>");
			for (var i = 0; i < buttons.length; ++i) {
				var button = buttons[i];
				if (!button.hidden) {
					EntityView.eventHandlers.push(button.handler);
					var index = EntityView.eventHandlers.length - 1;
					var id = "EntityView.Button." + button.code;
					document.write("<div class='QsSmallButton QsSmallButtonRight' unselectable=on onselectstart='return false'");
					document.write(" id='" + id + "' onclick=EntityView.doButtonClick(" + index + ")");
					if (button.disabled) {
						document.write(" disabled");
					}
					document.write(">" + button.text + "</div>");
				}
			}
			document.write("</td>");
		}
		document.write("</tr></table>");
	},

	generateEmptyMessage: function(type)
	{
		document.write("<div class=BlockContentMessage>");
		if (type == "HtmlField") {
			document.write($text("Qs.EntityView.NoHtmlContent"));
		}
		if (type == "Attachment") {
			document.write($text("Qs.EntityView.NoAttachment"));
		}
		else if (type == "List") {
			document.write($text("Qs.EntityView.NoListData"));
		}
		document.write("</div>");
	},
	
	generateSimpleFieldGroup: function(info, fields)
	{
		document.write("<div class=SimpleFieldGroup");
		if (info.contentFontSize > 0) {
			document.write(" style='font-size:" + info.contentFontSize + "px'");
		}
		document.write(">");
		for (var i = 0; i < fields.length; ++i) {
			var field = fields[i];
			if (!Jui.string.isEmpty(field.text)) {
				document.write("<div class=SimpleFieldGroupItem>");
				document.write(  "<label class=SimpleFieldGroupItemTitle>");
				document.write(    EntityView.toHtml(field.title) + (/\:$/.test(field.title) ? "" : ":"));
				document.write(  "</label>");
				document.write(  "<label class=SimpleFieldGroupItemValue style='" + EntityView.getStyle(field) + "'>");
				document.write(    EntityView.toHtml(field.text));
				document.write(  "</label>");
				document.write("</div>");
			}
		}
		document.write("</div>");
	},
	
	generateTableFieldGroup: function(info, fields)
	{
		var endRow = function(index, count) {
			for (var i = index; i < count; ++i) {
				document.write("<td colspan=3></td>");
			}
			document.write("</tr>");
		};
		
		var colCount = clientData.urlArgs.isListView ? 2 : Math.max(1, info.columnCount);
		var ratio = 0.35;
		var titlePercent = ratio * 100 / colCount;
		var valuePercent = (1 - ratio) * 100 / colCount;
		var colIndex = 0;

		document.write("<table class=TableFieldGroupTable");
		if (info.contentFontSize > 0) {
			document.write(" style='font-size:" + info.contentFontSize + "px'");
		}
		document.write(">");
		for (var i = 0; i < colCount; ++i) {
			if (i > 0) {
				document.write("<col class=TableFieldGroupSplitter>");
			}
			document.write("<col width='" + titlePercent + "%'>");
			document.write("<col width='" + valuePercent + "%'>");
		}
		
		for (var i = 0; i < fields.length; ++i) {
			var field = fields[i];
			var colSpan = field.colSpan <= 0 ? colCount : Math.min(colCount, field.colSpan);
			if (colIndex + colSpan > colCount) {
				endRow(colIndex, colCount);
				colIndex = 0;
			}
			if (colIndex == 0) {
				document.write("<tr>");
			}
			else if (colIndex > 0) {
				document.write("<td></td>");
			}
			document.write("<td>");
			document.write(  EntityView.toHtml(field.title));
			document.write("</td>");
			document.write("<td colspan=" + (1 + 3 * (colSpan - 1)) + ">");
			document.write(  "<input class='QsInputBox FieldBox" + (field.entityId == null ? "" : " QsLink") + "'");
			document.write(  " style='" + EntityView.getStyle(field) + "' readOnly");
			document.write(  " value='" + EntityView.toHtml(field.text) + "'");
			document.write(  " onmouseover=EntityView.doFieldBoxMouseOver()");
			if (field.entityId != null) {
				document.write(" onmousemove=EntityView.doFieldBoxMouseMove()");
				document.write(" onclick=EntityView.doFieldBoxClick()");
				document.write(" _entityId='" + field.entityId + "' _unitId='" + field.unitId + "'");
			}
			document.write(  ">");
			document.write("</td>");
			colIndex += colSpan;
		}
		endRow(colIndex, colCount);
		document.write("</table>");
	},
	
	generateAttachmentList: function(json)
	{
		var buffer = [];
		buffer.push("<table class=ListTable>");
		buffer.push("<tr>");
		buffer.push("<th></th>");
		buffer.push("<th>" + $text("Qs.Attachment.Name") + "</th>");
		//buffer.push("<th>" + $text("Qs.Attachment.User") + "</th>");
		buffer.push("<th>" + $text("Qs.Attachment.UploadTime") + "</th>");
		buffer.push("<th>" + $text("Qs.Attachment.Size") + "</th>");
		buffer.push("</tr>");
		json.sort(function(a, b) {return a.name.localeCompare(b.name);});
		for (var i = 0; i < json.length; ++i) {
			var row = json[i];
			EntityView.attachments[row.id] = row;
			buffer.push("<tr>");
			buffer.push("<td align=center>");
			buffer.push(  "<label class=QsLink onclick=EntityView.previewAttachment('" + row.id + "')>" + $text("Qs.Attachment.View") + "</label>&nbsp;");
			buffer.push(  "<label class=QsLink onclick=EntityView.downloadAttachment('" + row.id + "')>" + $text("Public.Download") + "</label>");
			buffer.push("</td>");
			buffer.push("<td>" + row.name + "</td>");
			//buffer.push("<td>" + row.uploader + "</td>");
			buffer.push("<td align=center>" + row.time + "</td>");
			buffer.push("<td align=right>" + row.size + "</td>");
			buffer.push("</tr>");
		}
		buffer.push("</table>");
		document.write(buffer.join(""));
	},
	
	generateList: function(json)
	{
		document.write(EntityView.getListHtml(json));
	},
	
	getListHtml: function(json)
	{
		var buffer = [];
		buffer.push("<table class=ListTable>");
		buffer.push("<tr class=ListTableTitleRow>");
		for (var i = 0; i < json.title.length; ++i) {
			var field = json.title[i];
			buffer.push("<th>" + field.title + "</th>");
		}
		buffer.push("</tr>");
		for (var i = 0; i < json.data.length; ++i) {
			var row = json.data[i];
			buffer.push("<tr class=" + (i % 2 == 0 ? "ListTableOddRow" : "ListTableEvenRow") + ">");
			for (var j = 0; j < json.title.length; ++j) {
				var field = json.title[j];
				buffer.push("<td align=" + (field.align || "left") + ">");
				if (field.name == json.nameField) {
					buffer.push("<span class=QsLink onclick=EntityView.doListRowNameClick()");
					buffer.push(" data-unit='" + json.unitCode + "'");
					buffer.push(" data-id='" + row[json.keyField] + "'>");
					buffer.push(Jui.string.escapeHtml(row[field.name]));
					buffer.push("</span>");
				}
				else {
					buffer.push(Jui.string.escapeHtml(row[field.name]));
				}
				buffer.push("</td>");
			}
			buffer.push("</tr>");
		}
		buffer.push("</table>");
		return buffer.join("");
	},
	
	doContentSwitch: function()
	{
		var image = event.srcElement;
		var show = /Collapsed/.test(image.src);
		image.src = "quicksilver/image/other/EntityViewBlock" + (show ? "Expanded.gif" : "Collapsed.gif");
		var block = Jui.dom.getAncestor("Block");
		var content = $elem("" + block.id + "-BlockContent");
		if (content != null) {
			content.style.display = show ? "" : "none";
		}
	},
	
	doButtonClick: function(index)
	{
		var button = event.srcElement;
		if (!button.hasAttribute("disabled")) {
			var handler = EntityView.eventHandlers[index];
			Jui.util.execute(handler, event.srcElement);
		}
	},
	
	doEdit: function()
	{
		var args = {entityId:clientData.entityId};
		CommonBusiness.openEntity(clientData.unitCode, args, "Tab");
	},
	
	doPopup: function()
	{
		Utility.openWindow(window.location.href);
	},
	
	doFieldBoxMouseOver: function()
	{
		//TODO HTML5
		//setTitleIfContentTooLong(event.srcElement);
	},

	doFieldBoxMouseMove: function()
	{
		var elem = event.srcElement;
		if (elem.tagName == "INPUT") {
			elem.style.cursor = Jui.dom.$isMouseOverText(elem, event) ? "pointer" : "default";
		}
	},

	doFieldBoxClick: function()
	{
		var elem = event.srcElement;
		if (elem.tagName == "INPUT" && elem.style.cursor == "pointer") {
			var unitId = elem.getAttribute("_unitId");
			var entityId = elem.getAttribute("_entityId");
			var unitCode = Utility.getUnit(unitId).code;
			CommonBusiness.tryOpenViewPage(unitCode, entityId, false, function() {
				CommonBusiness.openEntity(unitCode, {entityId:entityId}, "Dialog");
			});
		}
	},
	
	doListRowNameClick: function()
	{
		var unitCode = event.target.getAttribute("data-unit");
		var args = {entityId:event.target.getAttribute("data-id")};
		var block = Jui.dom.getAncestorByClassName("BlockContent");
		CommonBusiness.openEntity(unitCode, args, null, function() {
			EntityView.refreshList(block);
		});
	},
	
	refreshList: function(block)
	{
		var viewItemId = block.id.replace(/-BlockContent/, "");
		var args = {viewItemId:viewItemId, entityId:clientData.entityId};
		Utility.invoke("Qs.ViewItem.getViewPageListJson", args, true, function(ret) {
			block.innerHTML = EntityView.getListHtml(ret);
		});
	},
	
	previewAttachment: function(attachmentId)
	{
		var url = clientData.attachmentUnitCode + ".View.page";
		var args = {entityId:attachmentId};
		if (Utility.isInTab()) {
			Utility.openTab(url, args, "", "quicksilver/image/unit/Attachment.png");
		}
		else {
			Utility.openDialog(url, args);
		}
	},
	
	downloadAttachment: function(attachmentId)
	{
		var args = {attachmentIds:[attachmentId]};
		Utility.download(clientData.attachmentUnitCode + ".DownloadFile", args);
	},
	
	downloadAllAttachments: function()
	{
		var args = {unitId:clientData.unitId, entityId:clientData.entityId};
		Utility.download(clientData.attachmentUnitCode + ".DownloadFile", args);
	},
	
	showEntityChart: function(chartId)
	{
		CommonBusiness.showEntityChart(chartId, clientData.entityId);
	},
	
	toHtml: function(s)
	{
		return s == null ? "" : ("" + s)
			.replace(/&/g, "&amp;").replace(/\>/g, "&gt;").replace(/\</g, "&lt;")
			.replace(/\'/g, "&#39;").replace(/\"/g, "&quot;");
	}
};

if (!Jui.string.isEmpty(clientData.entityName)) {
	Utility.setTabTitle(clientData.entityName);
}
