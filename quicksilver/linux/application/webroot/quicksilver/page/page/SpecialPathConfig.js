var SpecialPathConfig =
{
	tabStrip: null,
	
	lists: {},
	
	doLoad: function()
	{
		var dataMap = {};
		for (var i = 0; i < clientData.items.length; ++i) {
			var item = clientData.items[i];
			if (dataMap[item.FKey] == null) {
				dataMap[item.FKey] = [];
			}
			dataMap[item.FKey].push(item);
		}
		
		var tabs = [
			{id:"JspDirectlyAccessible",	text:$text("Qs.SpecialPath.JspAccessControl")},
			{id:"BypassSession",			text:$text("Qs.SpecialPath.SessionControl")},
			//{id:"AllowOrigin",			text:$text("Qs.SpecialPath.CrossOriginResourceSharing")},
			{id:"VirtualDirectory",			text:$text("Qs.SpecialPath.VirtualDirectory")}
		];
		SpecialPathConfig.tabStrip = Jui.option.TabStrip.create({
			target		: "TabContainer",
			onswitch	: SpecialPathConfig.doTabSwitch
		});
		SpecialPathConfig.tabStrip.load(tabs);
		
		var listInfo = [
		    {key:"JspDirectlyAccessible",	valueField:{control:"CheckBox", title:$text("Qs.SpecialPath.JspDirectlyAccessible"), align:"center"}},
		    {key:"BypassSession",			valueField:{control:"CheckBox", title:$text("Qs.SpecialPath.BypassSession"), align:"center"}},
		    //{key:"AllowOrigin",			valueField:{control:"InputBox", title:$text("Qs.SpecialPath.AllowOrigin")}},
		    {key:"VirtualDirectory",		valueField:{control:"InputBox", title:$text("Qs.SpecialPath.VirtualDirectory")}}
		];
		for (var i = 0; i < listInfo.length; ++i) {
			var info = listInfo[i];
			var tabBody = SpecialPathConfig.tabStrip.getBody(info.key);
			var list = Jui.option.List.create({target:tabBody, editable:true});
			list.loadTitle([
			    {
			    	name		: "FMatchMode",
			    	control		: "ComboBox",
			    	width		: 150,
			    	title		: $fieldTitle("Qs.SpecialPath", "FMatchMode"),
			    	required	: true,
			    	items		: clientData.matchModes
			    },            
			    {
			    	name		: "FPath",
			    	control		: "InputBox",
			    	width		: 400,
			    	title		: $fieldTitle("Qs.SpecialPath", "FPath"),
			    	required	: true
			    },
			    Jui.object.merge({name:"FValue", width:200}, info.valueField)
			]);
			list.loadData(dataMap[info.key] || []);
			SpecialPathConfig.lists[info.key] = list;
		}
		
		Jui.basic.Button.create({
			target	: "ButtonContainer",		
			icon	: "quicksilver/image/16/Plus.gif",
			onclick	: SpecialPathConfig.doListAdd
		});
		Jui.basic.Button.create({
			target	: "ButtonContainer",		
			icon	: "quicksilver/image/16/Minus.gif",
			onclick	: SpecialPathConfig.doListDelete,
			style	: "margin-bottom:12px"
		});
		CommonBusiness.createUpDownButtons("ButtonContainer", SpecialPathConfig);
	},

	doSave: function()
	{
		var items = [];
		for (var i = 0, tabs = SpecialPathConfig.tabStrip.getItems(); i < tabs.length; ++i) {
			var key = tabs[i].id;
			var list = SpecialPathConfig.lists[key];
			if (!list.validate(false)) {
				SpecialPathConfig.tabStrip.setCurrentId(key);
				list.validate(true);
				return;
			}
			var data = list.getData();
			for (var j = 0; j < data.length; ++j) {
				items.push(Jui.object.merge({FKey:key}, data[j]));
			}
		}
		Utility.invoke("Qs.SpecialPath.saveConfig", {items:items}, true, function() {
			Jui.message.hint($text("Public.SaveSuccess"));
		});
	},
	
	doTabSwitch: function(event)
	{
		SpecialPathConfig.lists[event.item.id].adjust();
	},
	
	doListAdd: function()
	{
		SpecialPathConfig.getCurrentList().appendDataAndEdit({FMatchMode:"PlainText"});
	},
	
	doListDelete: function()
	{
		var list = SpecialPathConfig.getCurrentList();
		if (list.getSelectedKeys().length == 0) {
			Jui.message.alert($text("Public.SelectAlert"));
		}
		else {
			list.deleteSelectedRows();
		}
	},

	doMoveTop: function()
	{
		SpecialPathConfig.getCurrentList().moveTop();
	},

	doMoveUp: function()
	{
		SpecialPathConfig.getCurrentList().moveUp();
	},
	
	doMoveDown: function()
	{
		SpecialPathConfig.getCurrentList().moveDown();
	},
	
	doMoveBottom: function()
	{
		SpecialPathConfig.getCurrentList().moveBottom();
	},
	
	getCurrentList: function()
	{
		return SpecialPathConfig.lists[SpecialPathConfig.tabStrip.getCurrentId()];
	}
};
