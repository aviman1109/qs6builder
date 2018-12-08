var data = 
{
	"unitId":"105",
	"units":
	[
		{
			unitId:"101",
			fields:[
				{name:"FName",				text:"姓名",			type:"InputBox-Text"},
				{name:"FGender",			text:"性别",			type:"ComboBox-DropOnly",	selectId:"10002", isSaveValue:true},
				{name:"FCity",				text:"城市",			type:"ComboBox-Inputable",	selectId:"10003", isSaveValue:false},
				{name:"FBirthDate",			text:"出生日期",		type:"DateBox-Date"},
				{name:"FDepartmentId",		text:"所属部门",		type:"EntityBox",		entityType:"Qs.Department"},
				{name:"FDuty",				text:"职务",			type:"InputBox-Text"}
			],
			relations:[
				{id:"1012",	unitId:"102",	text:"所属部门"},
				{id:"1013",	unitId:"103",	text:"客户（负责人）"},
				{id:"1014",	unitId:"104",	text:"联系人（负责人）"},
				{id:"1015",	unitId:"105",	text:"商机（负责人）"}
			]
		},
		{
			unitId:"102",
			fields:[
				{name:"FName",				text:"名称",			type:"InputBox-Text"},
				{name:"FUserId",			text:"负责人",			type:"EntityBox",		entityType:"Qs.User"}
			],
			relations:[
				{id:"1021",	unitId:"101",	text:"负责人"},
				{id:"1023",	unitId:"103",	text:"客户（负责部门）"},
				{id:"1024",	unitId:"104",	text:"联系人（负责部门）"},
				{id:"1025",	unitId:"105",	text:"商机（负责部门）"}
			]
		},
		{
			unitId:"103",
			fields:[
				{name:"FName",				text:"名称",			type:"InputBox-Text"},
				{name:"FUserId",			text:"负责人",			type:"EntityBox",		entityType:"Qs.User"},
				{name:"FDepartmentId",		text:"负责部门",		type:"EntityBox",		entityType:"Qs.Department"},
				{name:"FIndustry",			text:"行业",			type:"InputBox-Text"},
				{name:"FCountry",			text:"国家",			type:"InputBox-Text"},
				{name:"FProvince",			text:"省份",			type:"InputBox-Text"},
				{name:"FCity",				text:"城市",			type:"InputBox-Text"}
			],
			relations:[
				{id:"1031",	unitId:"101",	text:"负责人"},
				{id:"1032",	unitId:"102",	text:"负责部门"},
				{id:"1034",	unitId:"104",	text:"联系人（客户）"},
				{id:"1035",	unitId:"105",	text:"商机（客户）"},
				{id:"1036",	unitId:"106",	text:"往来记录"}
			]
		},
		{
			unitId:"104",
			fields:[
				{name:"FName",				text:"姓名",			type:"InputBox-Text"},
				{name:"FUserId",			text:"负责人",		type:"EntityBox",		entityType:"Qs.User"},
				{name:"FDepartmentId",		text:"负责部门",		type:"EntityBox",		entityType:"Qs.Department"},
				{name:"FCustomerId",		text:"客户",			type:"EntityBox",		entityType:"Ecp.Customer"},
				{name:"FGender",			text:"性别",			type:"ComboBox-DropOnly",	selectId:"10002", isSaveValue:true},
				{name:"FCity",				text:"城市",			type:"ComboBox-Inputable",	selectId:"10003", isSaveValue:false},
				{name:"FBirthDate",			text:"出生日期",		type:"DateBox-Date"},
				{name:"FDuty",				text:"职务",			type:"InputBox-Text"}
			],
			relations:[
				{id:"1041",	unitId:"101",	text:"负责人"},
				{id:"1042",	unitId:"102",	text:"负责部门"},
				{id:"1043",	unitId:"104",	text:"客户"},
				{id:"1045",	unitId:"105",	text:"商机（主要联系人）"}
			]
		},
		{
			unitId:"105",
			fields:[
				{name:"FName",				text:"名称",			type:"InputBox-Text"},
				{name:"FUserId",			text:"负责人",			type:"EntityBox",		entityType:"Qs.User"},
				{name:"FDepartmentId",		text:"负责部门",		type:"EntityBox",		entityType:"Qs.Department"},
				{name:"FCustomerId",		text:"客户",			type:"EntityBox",		entityType:"Ecp.Customer"},
				{name:"FContactId",			text:"主要联系人",		type:"EntityBox",		entityType:"Ecp.Contact"},
				{name:"FForecastAmount",	text:"预计金额",		type:"InputBox-Double"},
				{name:"FForecastClose",		text:"预计关闭日期",	type:"DateBox-Date"},
				{name:"FStatus",			text:"状态",			type:"ComboBox-DropOnly",	selectId:"10001", isSaveValue:true}
			],
			relations:[
				{id:"1051",	unitId:"101",	text:"负责人"},
				{id:"1052",	unitId:"102",	text:"负责部门"},
				{id:"1053",	unitId:"103",	text:"客户"},
				{id:"1054",	unitId:"104",	text:"主要联系人"}
			]
		}
	],
	"conditions":
	[
		{fieldName:"FUserId", operator:"CurrentUser"},
		{operator:"or", items:[
			{fieldName:"FForecastAmount", operator:"GreatEqual", value:"100000"},
			{fieldName:"FStatus", operator:"Equal", value:"1", text:"执行中"}
		]},
		{relationId:"1053", items:[
			{fieldName:"FIndustry", operator:"Equal", value:"金融业"},
			{operator:"or", items:[
				{fieldName:"FCity", operator:"Equal", value:"纽约"},
				{fieldName:"FCity", operator:"Equal", value:"伦敦"}
			]}
		]}
	]
};
