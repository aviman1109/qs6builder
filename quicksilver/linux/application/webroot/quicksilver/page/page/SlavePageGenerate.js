var SlavePageGenerate =
{
	doLoad: function()
	{
		var isTableRelation = clientData.listData.length == 2;
		var listTitle = {keyField:"relationId", fields:[
			{name:"masterUnitName", title:$text("Qs.SlavePageGenerate.MasterUnit"), width:100, control:"InputBox", readOnly:true},
			{name:"slaveUnitName",	title:$text("Qs.SlavePageGenerate.SlaveUnit"),	width:100, control:"InputBox", readOnly:true},
			{name:"exist",			title:$text("Qs.SlavePageGenerate.Exist"),		width:100, control:"CheckBox", disabled:true, align:"center"},
			{name:"generate",		title:$text("Qs.SlavePageGenerate.Generate"),	width:100, control:"CheckBox", align:"center"},
			{name:"editable",		title:$text("Qs.SlavePageGenerate.Editable"),	width:80, control:"CheckBox", disabled:isTableRelation, align:"center"}
		]};
		SlavePageGenerate.list = Jui.option.List.create({
			target			: "ListPanel",
			editable		: true,
			multiPage		: false,
			multiSelect		: false,
			border			: "all"
		});
		SlavePageGenerate.list.loadTitle(listTitle);
		SlavePageGenerate.list.loadData(clientData.listData);
	},

	doConfirm: function()
	{
		var args = {relationIds:[], editables:[]};
		var exist = false;
		for (var i = 0, data = SlavePageGenerate.list.getData(); i < data.length; ++i) {
			if (data[i].generate) {
				exist = data[i].exist || exist; 
				args.relationIds.push(data[i].relationId);
				args.editables.push(data[i].editable);
			}
		}
		if (args.relationIds.length == 0) {
			Jui.message.alert($text("Qs.SlavePageGenerate.SelectAlert"));
			return;
		}
		if (exist && !confirm($text("Qs.SlavePageGenerate.RewriteConfirm"))) {
			return;
		}
		Utility.invoke("Qs.Page.generateSlavePage", args, true, function(json) {
			Jui.message.hint($text("Public.OperationSuccess"));
			Utility.closeDialog();
		});
	}
};
