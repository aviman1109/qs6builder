Jui.use("Resizer", "TabStrip", "OutlookBar", "Tree", "Marquee");

var Index =
{
	marquee: null,

	toolBar: null,

	menuStrip: null,

	pageStrip: null,

	init: function()
	{
		//create Marquee
		Index.marquee = Jui.option.Marquee.create({
			target: "MarqueeRegion",
			onitemclick: Index.doMarqueeItemClick
		});
		Index.marquee.load(PageData.marquee);

		//create ToolBar
		Index.toolBar = Jui.basic.ToolBar.create({
			target: "ToolBarRegion"
		});
		Index.toolBar.load(PageData.toolBar);

		//create Resizer
		Jui.option.Resizer.create({
			elements: ["MenuRegion", "TabRegion"],
			offset: -6,
			shrinks: [6, 6]
		});

		//create page TabStrip
		Index.pageStrip = Jui.option.TabStrip.create({
			target: "TabRegion",
			tabPosition: "top",
			border: "single",
			dynamic: true
		});
		Index.pageStrip.load([PageData.helpPage]);

		//create menu TabStrip
		Index.menuStrip = Jui.option.TabStrip.create({
			target: "MenuRegion",
			tabPosition: "left"
		});
		Index.menuStrip.load(PageData.modules);

		//create OutlookBar and Tree
		for (var i = 0; i < PageData.subModules.length; ++i) {
			var olbar = Jui.option.OutlookBar.create({showBorder:false, target:Index.menuStrip.getBodyByIndex(i)});
			olbar.load(PageData.subModules[i]);
			for (var j = 0; j < PageData.subModules[i].length; ++j) {
				var treeData = PageData.subModules[i][j].tree;
				if (treeData) {
					var tree = Jui.option.Tree.create({
						style: "padding:1px 0px 0px 8px",
						target: olbar.getBodyByIndex(j),
						onleafclick: Index.doMenuItemClick
					});
					tree.load(treeData);
					tree.expandLevel(2);
				}
				else {
					olbar.getBodyByIndex(j).innerHTML = "<div class=Empty>内容撰写中...</div>";
				}
			}
		}
	},

	doMarqueeItemClick: function(event)
	{
		Jui.message.hint("您点击了跑马灯。相关数据：" + JSON.stringify(event.item));
	},

	doMenuItemClick: function(event)
	{
		if (event.json.url == null) {
			Jui.message.alert("URL is not set for this menu item.");
			return;
		}
		Index.pageStrip.add(event.json);
	},
		
	doCustomButtonClick: function(event)
	{
		Jui.message.hint("您点击了按钮 " + event.name);
	},

	doHelp: function()
	{
		Index.pageStrip.add(PageData.helpPage);
	},

	doLogout: function()
	{
		Jui.message.hint("这只是个演示页面，不能真的注销哦！");
	}
};

//本页的相关数据。在实际应用中，数据应动态载入。
var PageData =
{
	marquee: [
		{id: "1", ball: "yellow", name: "2016年公司年会时间及场地说明"},
		{id: "2", html: "关于更换<label style='font-size:16px;color:blue'>二代身份证</label>的通知"},
		{id: "3", ball: "red", html: "2016年春节放假通知，<span style='font-weight:bold;color:#f00'>请各单位做好值班安排</span>"},
		{id: "4", ball: "blue", name: "1月20日园区停电通知"}
	],

	toolBar: {
		left: [
			{control: "Button", name: "Custom1",	text: "自定义按钮1",	icon: "demo/image/misc/1.png",	onclick: "Index.doCustomButtonClick"},
			{control: "Button", name: "Custom2",	text: "自定义按钮2",	icon: "demo/image/misc/2.png",	onclick: "Index.doCustomButtonClick"}
		],
		right: [
			{control: "Button", name: "Help",	text: "帮助",	icon: "demo/image/icon/Help.png",	onclick: "Index.doHelp"},
			{control: "Button", name: "Logout",	text: "注销",	icon: "demo/image/icon/Logout.png",	onclick: "Index.doLogout"}
		]
	},

	modules: [
		{text: "控件演示", icon: "demo/image/Demo.png"},
		{text: "帮助文档", icon: "demo/image/icon/Help.png"}
	],

	subModules: [
		[
			{text: "基础控件", icon: "demo/image/control/TextBox.png", tree: [
				{text: "按钮", children: [
					{text: "普通按钮", url: "demo/basic/Button.html", icon: "demo/image/control/Button.png"},
					{text: "下拉按钮", url: "demo/basic/ComboButton.html", icon: "demo/image/control/ComboButton.png"}
				]},
				{text: "输入", children: [
					{text: "普通输入框", url: "demo/basic/InputBox.html", icon: "demo/image/control/InputBox.png"},
					{text: "下拉框", url: "demo/basic/ComboBox.html", icon: "demo/image/control/ComboBox.png"},
					{text: "日期框", url: "demo/basic/DateBox.html", icon: "demo/image/control/DateBox.png"},
					{text: "勾选框", url: "demo/basic/CheckBox.html", icon: "demo/image/control/CheckBox.png"},
					{text: "实体框", url: "demo/basic/EntityBox.html", icon: "demo/image/control/EntityBox.png"},
					{text: "多实体框", url: "demo/basic/MultiEntityBox.html", icon: "demo/image/control/EntityBox.png"},
					{text: "多选框", url: "demo/basic/MultiCheckBox.html", icon: "demo/image/control/MultiCheckBox.png"},
					{text: "多选下拉框", url: "demo/basic/MultiCheckComboBox.html", icon: "demo/image/control/MultiCheckComboBox.png"},
					{text: "图片框", url: "demo/basic/PictureBox.html", icon: "demo/image/control/PictureBox.png"},
					{text: "大文本框", url: "demo/basic/TextBox.html", icon: "demo/image/control/TextBox.png"},
					{text: "富文本框", url: "demo/basic/HtmlBox.html?impl=ckeditor", icon: "demo/image/control/HtmlBox.png"}
				]},
				{text: "其它", children: [
					{text: "工具条", url: "demo/basic/ToolBar.html", icon: "demo/image/control/ToolBar.png"},
					{text: "弹出菜单", url: "demo/basic/PopupMenu.html", icon: "demo/image/control/PopupMenu.png"},
					{text: "消息框", url: "demo/basic/MessageBox.html", icon: "demo/image/control/MessageBox.png"},
					{text: "对话框", url: "demo/basic/Dialog.html", icon: "demo/image/control/Dialog.png"},
					{text: "进度条", url: "demo/basic/ProgressBar.html", icon: "demo/image/control/ProgressBar.png"}
				]}
			]},
			{text: "可选控件", icon: "demo/image/control/List.png", tree: [
				{text: "树", url: "demo/option/Tree.html", icon: "demo/image/control/Tree.png"},
				{text: "OutlookBar", icon: "demo/image/control/OutlookBar.png", children: [
					{text: "OutlookBar", url: "demo/option/OutlookBar.html"},
					{text: "动态 OutlookBar", url: "demo/option/OutlookBar-Dynamic.html"}
				]},
				{text: "页签", icon: "demo/image/control/TabStrip.png", children: [
					{text: "页签居左", url: "demo/option/TabStrip-Left.html"},
					{text: "页签居上", url: "demo/option/TabStrip-Top.html"},
					{text: "动态页签", url: "demo/option/TabStrip-Dynamic.html"},
					{text: "多行页签", url: "demo/option/MultiRowTabStrip.html"}
				]},
				{text: "表单", icon: "demo/image/control/Form.png", children: [
					{text: "无分组", url: "demo/option/Form.html"},
					{text: "区块分组", url: "demo/option/Form.html?group=block"},
					{text: "页签分组", url: "demo/option/Form.html?group=tab"}
				]},
				{text: "列表", icon: "demo/image/control/List.png", children: [
					{text: "普通列表", url: "demo/option/List-Normal.html"},
					{text: "可编辑列表", url: "demo/option/List-Editable.html"}
				]},
				{text: "Sorter", icon: "demo/image/control/Sorter.png", children: [
					{text: "单个", url: "demo/option/Sorter-Single.html"},
					{text: "两个", url: "demo/option/Sorter-Double.html"}
				]},
				{text: "Resizer", url: "demo/option/Resizer.html", icon: "demo/image/control/Resizer.png"},
				{text: "Grid", url: "demo/option/Grid.html", icon: "demo/image/control/Grid.png"},
				{text: "跑马灯", url: "demo/option/Marquee.html", icon: "demo/image/control/Marquee.png"},
				{text: "日历", url: "demo/option/Calendar.html", icon: "demo/image/control/Calendar.png"},
				{text: "小日历", url: "demo/option/MiniCalendar.html", icon: "demo/image/control/Calendar.png"},
				{text: "布局", url: "demo/option/Layout.html", icon: "demo/image/control/Layout.png"},
				{text: "条件", url: "demo/option/Condition.html", icon: "demo/image/control/Condition.png"}
			]},
			{text: "设计图控件", icon: "demo/image/control/Workflow.png", tree: [
				{text: "流程图", icon: "demo/image/control/Workflow.png", children: [
					{text: "流程图-设计", url: "demo/graph/Workflow-Design.html"},
					{text: "流程图-状态", url: "demo/graph/Workflow-Status.html"}
				]}
			]}
		], [
			{text: "使用说明", icon: "demo/image/Usage.png"},
			{text: "API手册", icon: "demo/image/Api.png"}
		]
	],

	helpPage: {id: "Help", text: "帮助", icon: "demo/image/icon/Help.png", url: "demo/misc/Help.html"}
};

window.addEventListener("load", Index.init);
