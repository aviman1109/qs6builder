Utility.defineScript("Qs.Parameter.MobileUser",
{
	list: null,
	
	onload: function()
	{
		var page = Jui.basic.Page.getCurrentPage();
		var body = Jui.basic.Page.getBody(page);
		var form = Jui.option.Form.create({
			target					: body,
			comboBoxSelectHandler	: CommonBusiness.doComboBoxSelect
		});
		var titleJson = [
		     		    {
		    		    	control:"CheckBox",
		    		    	title:"自動登錄",
		    		    	group2: "狀態設置",
		    		    	name: "AutoLogin"
		    		    },
		    		    {
		    		    	control:"CheckBox",
		    		    	title:"登錄後保持線上",
		    		    	group2: "狀態設置",
		    		    	name: "KeepOnline"
		    		    },
		    		    {
		    		    	control:"CheckBox",
		    		    	title:"啟用推送",
		    		    	group2: "推送設置",
		    		    	name: "P1"
		    		    },
		    		    {
		    		    	control:"CheckBox",
		    		    	title:"允許夜間推送",
		    		    	group2: "推送設置",
		    		    	name: "P2"
		    		    },
		    		    {
		    		    	control:"ComboBox",
		    		    	title:"介面風格",
		    		    	group2: "介面風格",
		    		    	name: "P3",
		    		    	items: [
		    		    	    {value:"Simple", text:"簡約風格"},
		    		    	    {text:"立體風格"},
		    		    	    {text:"酷黑風格"}
		    		    	]
		    		    },
		    		    {
		    		    	control:"InputkBox",
		    		    	title:"首次預取筆數",
		    		    	group2: "列表設置",
		    		    	name: "DefaultFetchSize"
		    		    },
		    		    {
		    		    	control:"InputkBox",
		    		    	title:"每次翻頁裝載筆數",
		    		    	group2: "列表設置",
		    		    	name: "Param1"
		    		    },
		    		    {
		    		    	control:"InputkBox",
		    		    	title:"最大總裝載筆數",
		    		    	group2: "列表設置",
		    		    	name: "Param2"
		    		    },
		    		    {
		    		    	control:"InputBox",
		    		    	title:"功能表設置",
		    		    	group2: "菜單設置",
		    		    	name: "MenuConfig"
		    		    }

		];
		form.loadTitle(titleJson);
		form.loadData({
			AutoLogin:true,
			KeepOnline:true,
			P1:true,
			DefaultFetchSize:20,
			Param1:20,
			Param2:320,
			P3:"Simple"
		});
	}
});
