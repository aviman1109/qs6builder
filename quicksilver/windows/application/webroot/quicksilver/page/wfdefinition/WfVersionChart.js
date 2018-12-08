var WfVersionChart =
{
	unitId			: clientData.unitId,
	basic			: clientData.basic || {},
	relevantData	: clientData.relevantData || [],
	events			: clientData.events || [],
	notice			: clientData.notice || {},
	nodes			: clientData.nodes || [],
	lines			: clientData.lines || [],
	
	nodeMap			: {},
	lineMap			: {},
	
	//-----------------------------------------------------------------------
	// event handlers
	//-----------------------------------------------------------------------

	doLoad: function()
	{
		WfVersionChart.chart = Jui.graph.Workflow.create({
			target				: "QsContent",
			isDesignMode		: true,
			ondoubleclick		: WfVersionChart.doDoubleClick,
			onnodeadd			: WfVersionChart.doNodeAdd,
			onnodedelete		: WfVersionChart.doNodeDelete,
			onnodemove			: WfVersionChart.doNodeMove,
			onnodedoubleclick	: WfVersionChart.doNodeDoubleClick,
			onlineadd			: WfVersionChart.doLineAdd,
			onlinedelete		: WfVersionChart.doLineDelete,
			onlinemove			: WfVersionChart.doLineMove,
			onlinedoubleclick	: WfVersionChart.doLineDoubleClick
		});
		for (var i = 0; i < WfVersionChart.nodes.length; ++i) {
			var node = WfVersionChart.nodes[i];
			WfVersionChart.nodeMap[node.code] = node;
		}
		for (var i = 0; i < WfVersionChart.lines.length; ++i) {
			var line = WfVersionChart.lines[i];
			WfVersionChart.lineMap[line.code] = line;
		}
		WfVersionChart.chart.load({nodes:WfVersionChart.nodes, lines:WfVersionChart.lines});
	},

	doSave: function()
	{
		WfVersionChart.save({setActive:false, isCopy:false});
	},

	doSaveAndSetActive: function()
	{
		if (WfVersionChart.validate(false, $text("Wf.Version.FixErrorFirst"))) {
			WfVersionChart.save({setActive:true, isCopy:false});
		}
	},

	doCopy: function()
	{
		WfVersionChart.save({setActive:false, isCopy:true});
	},
	
	doValidate: function()
	{
		WfVersionChart.validate(true, $text("Wf.Versoin.HasError"));
	},

	doDoubleClick: function()
	{
		var args = {
			unitId			: WfVersionChart.unitId,
			basic			: WfVersionChart.basic,
			relevantData	: WfVersionChart.relevantData,
			events			: WfVersionChart.events,
			notice			: WfVersionChart.notice,
			manualNodes		: WfVersionChart.getManualNodeComboBoxItems()
		};
		Utility.openDialog("Wf.Version.Config.page", args, null, function(ret) {
			WfVersionChart.basic		= ret.basic;
			WfVersionChart.relevantData	= ret.relevantData;
			WfVersionChart.events		= ret.events;
			WfVersionChart.notice		= ret.notice;
		});
	},

	doNodeAdd: function(event)
	{
		var node = {
			type	: event.node.type,
			text	: event.node.text,
			code	: event.node.code,
			x		: event.node.x,
			y		: event.node.y,
			basic	: {
				FName	: event.node.text,
				FCode	: event.node.code
			}
		};
		if (node.type == "End") {
			node.basic.FJoinMode 	= "Single";
			node.events				= [];
		}
		else if (node.type == "Manual") {
			node.basic.FJoinMode			= "Single";
			node.basic.FUrlType				= "EntityInfo";
			node.basic.FAutoCompleteMode	= "None";
			node.basic.FDeputeMode			= "DefaultHours";
			node.participant				= {source:"Initiator"};
			node.page						= {FUrlType:"EntityInfo"};
			node.events						= [];
			node.buttons					= [];
		}
		else if (node.type == "Auto") {
			node.basic.FJoinMode			= "Single";
			node.basic.FAutoCompleteMode	= "None";
			node.basic.FDeputeMode			= "DefaultHours";
			node.basic.FAutoFinish			= true;
			node.events						= [];
		}
		WfVersionChart.nodeMap[node.code] = node;
		WfVersionChart.nodes.push(node);
	},

	doNodeDoubleClick: function(event)
	{
		var node = WfVersionChart.nodeMap[event.node.code];
		var args = Jui.object.merge({
			unitId			: WfVersionChart.unitId,
			manualNodes		: WfVersionChart.getManualNodeComboBoxItems(),
			allNodeCodes	: Jui.array.toSet(WfVersionChart.nodes, "code")
		}, node);
		Utility.openDialog("Wf.Node.Config.page", args, null, function(ret) {
			WfVersionChart.deleteNode(event.node.code);
			delete WfVersionChart.nodeMap[event.node.code];
			Jui.object.merge(node, {text:ret.basic.FName, code:ret.basic.FCode}, ret, true);
			WfVersionChart.nodes.push(node);
			WfVersionChart.nodeMap[node.code] = node;
			WfVersionChart.chart.updateNode(event.node.code, node);
		});
	},

	doLineAdd: function(event)
	{
		var temp = event.line;
		var line = {
			code		: temp.code,
			from		: temp.from,
			to			: temp.to,
			isDefault	: true,
			routes		: [],
			basic		: {FDefault:true}
		};
		WfVersionChart.lineMap[line.code] = line;
		WfVersionChart.lines.push(line);
	},

	doLineDoubleClick: function(event)
	{
		var line = WfVersionChart.lineMap[event.line.code];
		var args = {basic:line.basic};
		Utility.openDialog("Wf.Line.Config.page", args, null, function(ret) {
			WfVersionChart.deleteLine(event.line.code);
			delete WfVersionChart.lineMap[event.line.code];
			Jui.object.merge(line, {text:ret.basic.FName, isDefault:ret.basic.FDefault}, true);
			Jui.object.merge(line, ret, true);
			WfVersionChart.lines.push(line);
			WfVersionChart.lineMap[line.code] = line;
			WfVersionChart.chart.updateLine(line.code, line);
		});
	},

	doNodeDelete: function(event)
	{
		WfVersionChart.deleteNode(event.node.code);
	},

	doLineDelete: function(event)
	{
		WfVersionChart.deleteLine(event.line.code);
	},

	doNodeMove: function(event)
	{
		var temp = event.node;
		var node = WfVersionChart.nodeMap[temp.code];
		Jui.object.merge(node, {x:temp.x, y:temp.y}, true);
	},

	doLineMove: function(event)
	{
		var temp = event.line;
		var line = WfVersionChart.lineMap[temp.code];
		Jui.object.merge(line, {from:temp.from, to:temp.to, routes:temp.routes}, true);
	},

	//-----------------------------------------------------------------------
	// methods
	//-----------------------------------------------------------------------

	deleteNode: function(code)
	{
		delete WfVersionChart.nodeMap[code];
		for (var i = 0, nodes = WfVersionChart.nodes; i < nodes.length; ++i) {
			if (nodes[i].code == code) {
				nodes.splice(i, 1);
				break;
			}
		}
	},

	deleteLine: function(code)
	{
		delete WfVersionChart.lineMap[code];
		for (var i = 0, lines = WfVersionChart.lines; i < lines.length; ++i) {
			if (lines[i].code == code) {
				lines.splice(i, 1);
				break;
			}
		}
	},

	save: function(args)
	{
		Jui.object.merge(args, {
			workflowId		: clientData.workflowId,
			versionId		: args.isCopy ? null : clientData.versionId,
			basic			: Jui.util.clone(WfVersionChart.basic),
			events			: WfVersionChart.events,
			relevantData	: WfVersionChart.relevantData,
			notice			: WfVersionChart.notice,
			nodes			: [],
			lines			: []
		});
		for (var i = 0; i < WfVersionChart.nodes.length; ++i) {
			var node = WfVersionChart.nodes[i];
			args.nodes.push(Jui.object.merge({
				FX			: node.x,
				FY			: node.y,
				FType		: node.type,
				buttons		: node.buttons,
				participant	: node.participant,
				events		: node.events
			}, node.basic, node.page));
		}
		for (var i = 0; i < WfVersionChart.lines.length; ++i) {
			var line = WfVersionChart.lines[i];
			args.lines.push(Jui.object.merge({
				FCode	: line.code,
				FFrom	: line.from,
				FTo		: line.to,
				routes	: line.routes
			}, line.basic));
		}
		Utility.invoke("Wf.Version.save", args, true, function(ret) {
			Jui.message.hint($text(args.setActive ? "Public.OperationSuccess" : "Public.SaveSuccess"));
			EntityForm.addDialogResultEntityId(ret.versionId);
			var wnd = EntityForm.getInfoWindow();
			var pageArgs = Jui.object.merge({entityId:ret.versionId}, wnd.clientData.urlArgs);
			delete pageArgs.isCopy;
			Utility.navigate(wnd.location.href, pageArgs, wnd);
		});
	},

	getManualNodeComboBoxItems: function()
	{
		var items = [];
		for (var i = 0; i < WfVersionChart.nodes.length; ++i) {
			var temp = WfVersionChart.nodes[i];
			items.push({value:temp.code, text:temp.text});
		}
		return items;
	},

	getUnreachableNodes: function(initialNodes, map)
	{
		var nodes = [];
		if (initialNodes.length > 0) {
			var passedCodes = {};
			var list = [];
			for (var i = 0; i < initialNodes.length; ++i) {
				passedCodes[initialNodes[i].code] = 0;
				list.push(initialNodes[i].code);
			}
			for (var i = 0, n = list.length; n > 0; i = i + n, n = list.length - i) {
				for (var j = 0; j < n; ++j) {
					var nextCodes = map[list[i + j]] || {};
					for (var next in nextCodes) {
						if (!(next in passedCodes)) {
							passedCodes[next] = 0;
							list.push(next);
						}
					}
				}
			}
			for (var i = 0; i < WfVersionChart.nodes.length; ++i) {
				var node = WfVersionChart.nodes[i];
				if (!(node.code in passedCodes)) {
					nodes.push(node);
				}
			}
		}
		return nodes;
	},
	
	validate: function(showSuccessMessage, errorMessage)
	{
		var startNodes = [];
		var endNodes = [];
		for (var i = 0; i < WfVersionChart.nodes.length; ++i) {
			var node = WfVersionChart.nodes[i];
			if (node.type == "Start") {
				startNodes.push(node);
			}
			if (node.type == "End") {
				endNodes.push(node);
			}
		}
		var fromMap = {};
		var toMap = {};
		for (var i = 0; i < WfVersionChart.lines.length; ++i) {
			var line = WfVersionChart.lines[i];
			toMap[line.from]			= toMap[line.from] || {};
			fromMap[line.to]			= fromMap[line.to] || {};
			toMap[line.from][line.to]	= 0;
			fromMap[line.to][line.from]	= 0;
		}
		
		var errors = [];
		if (startNodes.length == 0) {
			errors.push($text("Wf.Error.NoStartActivity"));
		}
		if (startNodes.length > 1) {
			errors.push($text("Wf.Error.ManyStartActivity"));
		}
		if (endNodes.length == 0) {
			errors.push($text("Wf.Error.NoEndActivity"));
		}
		var nodesCannotStart = WfVersionChart.getUnreachableNodes(startNodes, toMap);
		for (var i = 0; i < nodesCannotStart.length; ++i) {
			errors.push(Utility.formatText("Wf.Error.NoPathFromStartToActivity", nodesCannotStart[i].text));
		}
		var nodesCannotEnd = WfVersionChart.getUnreachableNodes(endNodes, fromMap);
		for (var i = 0; i < nodesCannotEnd.length; ++i) {
			errors.push(Utility.formatText("Wf.Error.NoPathFromActivityToEnd", nodesCannotEnd[i].text));
		}
		
		if (errors.length == 0) {
			if (showSuccessMessage) {
				Jui.message.alert($text("Wf.Version.NoError"));
			}
			return true;
		}
		var args = {errors:errors, message:errorMessage};
		Utility.openDialog("Wf.Version.ChartError.page", args);
		return false;
	}
};

window.onload = null;