alter table TsUnit add FUseSystemI18nTable bit;
delete from TsField where FId='7ff67346-2494-4fab-90c0-b1f340480c36';
insert into TsField set FId='7ff67346-2494-4fab-90c0-b1f340480c36', FUnitId='00000000-0000-0000-0001-000000000001', FName='FUseSystemI18nTable',    FTitle='使用系统多语言表',		FType='CheckBox',            FSize=0,   FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;

alter table TsField add FSupportI18n bit;
delete from TsField where FId='02a03dec-1a4a-4cdc-8466-f4910b2b18ac';
insert into TsField set FId='02a03dec-1a4a-4cdc-8466-f4910b2b18ac', FUnitId='00000000-0000-0000-0001-000000000002', FName='FSupportI18n',		  FTitle='支持多国语言',     FType='CheckBox',            FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295', '(83da7ed2-8248-4c2e-b788-7976e5b8b070,基本信息,FTitle|FName|FType|FUnitId|FVisible|FRequired|FReadOnly|FQueryable|FDefaultValue|FValidation,(04234553-4f26-47c1-967d-389b0bdbce6f,类型信息,FSize|FScale|FRelationTable|FRelationCapacity|FDictionaryId|FSupportI18n)(7d4ddff1-5d65-41e0-b04a-89d60da24f8b,实体信息,FEntityUnitId|FSupportLocalText|FLocalTextField|FSelectListFilterSql)(2d1d1604-9001-461c-b19e-02d044a5d842,来源信息,FSourceType|FJoinField|FSourceField|FSource)(0c76fb5e-5e71-425e-97b0-38af40b7f88e,表单信息,FRowSpan|FColSpan|FLabelColor|FIsNewRow)(7544efe3-6515-42b9-a3bb-2840a68cdb5d,列表信息,FListWidth|FListAlign))');

create table TsToolSubItem
(
	FId uuid primary key,
	FToolItemId uuid,
	FCode varchar(50),
	FName varchar(50),
	FExpandMode varchar(20),
	FIndex int,
	FIcon varchar(100),
	FVisibleCondition varchar(200),
	FEnableCondition varchar(200),
	FHandleType varchar(20),
	FHandlePageId uuid,
	FEventHandler varchar(1000),
	unique (FCode, FToolItemId)
);

insert into TsToolSubItem
(FId, FToolItemId, FCode, FName, FExpandMode, FIndex, FIcon, FVisibleCondition, FEnableCondition, FHandleType, FHandlePageId, FEventHandler)
select FId, FToolItemId, FCode, FName, FExpandMode, FIndex, FIcon, FVisibleCondition, FEnableCondition, FHandleType, FHandlePageId, FEventHandler
from TsToolItemSubItem;

drop table TsToolItemSubItem;

--Qs.ToolSubItem------------------------------------------------------------

insert into TsUnit set FId='b8081c53-782c-43c9-b406-561b29c040c5', FCode='Qs.ToolSubItem', FName='工具条子项', FIcon='quicksilver/image/unit/ToolSubItem.gif', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='System', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=1, FMasterUnitId='00000000-0000-0000-0001-000000000010', FCreateDefaultWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=1, FSupportPrivilegeField=0, FSupportEqualQuery=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FQueryFormAutoQuery=0, FOpenViewPageFirst=0, FDataSource='default', FTable='TsToolSubItem', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField='FToolItemId', FHomeClassName='com.jeedsoft.quicksilver.page.ToolSubItemHome', FDaoClassName='com.jeedsoft.quicksilver.page.dao.impl.ToolSubItemDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.page.service.impl.ToolSubItemServiceImpl', FActionClassName='com.jeedsoft.quicksilver.page.action.impl.ToolSubItemActionImpl', FUnitFilterSql='', FBusinessFilterSql='', FDescription='', FSupportVersion=0, FUseSystemI18nTable=1;

insert into TsField set FId='7affd4e8-6fbe-484e-9534-9e349b773c02', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FCode',             FTitle='编码',					FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='f5853da8-36d5-426a-b18c-52edd57378ff', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FEnableCondition',  FTitle='可用条件',				FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='edc45608-06a2-4b43-8151-108253f6c421', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FEventHandler',     FTitle='函数/语句(JavaScript)',	FType='TextBox',             FSize=1000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=7, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='faa3806f-be70-4b87-a5a2-5c00c6868280', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FExpandMode',       FTitle='展开模式',				FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='1725c091-b54c-4d66-b5e2-683fdf8cb017', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='None', FValidation=null, FSupportI18n=0;
insert into TsField set FId='dd378c8b-93e5-46b3-be6f-153a9b055c6f', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FHandlePageId',     FTitle='处理页面',				FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000006', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='75d2f333-0044-4b53-976b-6f76548ae171', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FHandleType',       FTitle='处理方式',				FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='JavaScript', FValidation=null, FSupportI18n=0;
insert into TsField set FId='58ba0ce6-50e7-4e15-b657-2998a579200f', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FIcon',             FTitle='图标',					FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='c8cce750-c8a4-41d0-98f3-a148c7de5b7d', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FId',               FTitle='ID',						FType='InputBox-Key',        FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=null;
insert into TsField set FId='8b796d8a-2c1f-4914-bdcb-99d4c555dd53', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FName',             FTitle='名称',					FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=1;
insert into TsField set FId='3c7a54dd-0f45-45ed-83ed-d50c4d8fb460', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FToolItemId',       FTitle='工具条项',				FType='EntityBox',           FSize=null, FVisible=0, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000010', FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=null;
insert into TsField set FId='0aee95bd-25f4-4c56-a975-0afe9c8e91bb', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FVisibleCondition', FTitle='可见条件',				FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
insert into TsField set FId='5dfc68df-4f8c-455d-afe4-48266a508566', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FIndex',            FTitle='顺序',					FType='InputBox-Integer',    FSize=0,    FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;

java setOrderFields('b8081c53-782c-43c9-b406-561b29c040c5', 'FIndex', '0');

insert into TsRelation set FId='9ed2a025-8a6e-4ecd-afa6-42d0b33c690f', FOppositeId='4a2391c5-014b-41c9-aeeb-921d9e0c6316', FName='工具条子项-处理页面', FOppositeName='处理页面-工具条子项', FUnitId1='b8081c53-782c-43c9-b406-561b29c040c5', FUnitId2='00000000-0000-0000-0001-000000000006', FType='field', FTable=null, FField1='FId', FField2='FHandlePageId', FDeleteAction1='unset', FDeleteAction2='cancel',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='5cf93334-f59a-4d35-b02c-2edcdd0e9785', FOppositeId='d197bc24-bfd2-4788-9d01-cac5a41f0425', FName='工具条子项-工具条项', FOppositeName='工具条项-工具条子项', FUnitId1='b8081c53-782c-43c9-b406-561b29c040c5', FUnitId2='00000000-0000-0000-0001-000000000010', FType='field', FTable='',   FField1='FId', FField2='FToolItemId',   FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

insert into TsPage set FId='6b40d650-3790-452f-9cf4-230e835d3390', FName='工具条子项主列表',   FTitle='工具条子项列表', FCode='Qs.ToolSubItem.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/ToolSubItem.gif', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.ToolSubItem.prepareList', FLoadHandler=null,						FRelationId=null, FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1, FDescription=null;
insert into TsPage set FId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FName='工具条子项选择列表', FTitle='工具条子项列表', FCode='Qs.ToolSubItem.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/ToolSubItem.gif', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.ToolSubItem.prepareList', FLoadHandler=null,						FRelationId=null, FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1, FDescription=null;
insert into TsPage set FId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FName='工具条子项排序',     FTitle='排序',                   FCode='Qs.ToolSubItem.Sort',       FPlatform='Computer', FType='Sort',       FIcon='quicksilver/image/unit/ToolSubItem.gif', FUrl='quicksilver/page/template/Sorter.jsp',     FActionMethodName='Qs.ToolSubItem.prepareSort', FLoadHandler=null,                     FRelationId='d197bc24-bfd2-4788-9d01-cac5a41f0425', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId='00000000-0000-0000-0001-000000000010', FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FVisible=1, FDescription='',   FHasViewFrame=0;
insert into TsPage set FId='0008b354-d62b-4396-872a-3101ef1c0c75', FName='工具条子项表单',     FTitle='表单',           FCode='Qs.ToolSubItem.Edit',       FPlatform='Computer', FType='EntityEdit', FIcon='quicksilver/image/unit/Edit.gif',        FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.ToolSubItem.prepareEdit', FLoadHandler='ToolSubItemForm.doLoad',	FRelationId=null, FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FIsSlavePage=1, FIndex=1,    FDialogWidth=604,  FDialogHeight=453,  FHasViewFrame=null, FVisible=1, FDescription=null;

--工具条子项主列表
insert into TsToolItem set FId='5e751c5b-ff8a-4412-b2c6-efffac1ce05a', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint=null, FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema',  FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='aeef2b13-f37d-4c61-8e1f-f7ff1434a5b4', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='QuerySchemaConfig', FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='7be4fcfb-1f37-476e-9b99-e5965c412d1a', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='QuerySchemaLock',   FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='79bcf28d-973e-4d42-9e44-7319cba3ecf9', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='Add',               FName='新增',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FIcon='quicksilver/image/16/Add.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='810d046f-3841-4730-b77a-ac1469f6dd66', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='Open',              FName='打开',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='b91fe543-3961-49b4-b13d-ba8263d12726', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='Delete',            FName='删除',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/Delete.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='36471a74-0a2d-4909-9eba-5e9ecd92511c', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='Refresh',           FName='刷新',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=4, FWidth=0,   FIcon='quicksilver/image/16/Refresh.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItemProperty set FId='3b578395-4230-4ba6-8676-2554fe3e5198', FToolItemId='5e751c5b-ff8a-4412-b2c6-efffac1ce05a', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

--工具条子项选择列表
insert into TsToolItem set FId='9344dae1-9509-4203-8c09-c3ea38ed662d', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint=null, FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='8a762245-bb81-41f8-b4fc-0dc4118101a8', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='QuerySchemaConfig', FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='29f5bf81-97a7-4a0b-bb94-684fde32130a', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='QuerySchemaLock',   FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='a7273e3b-6cf5-4b7b-8f02-f3435d3d93ea', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='ConfirmSelection',  FName='确定',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FIcon='quicksilver/image/16/Ok.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='b77aa2d2-8d04-4cdb-aff9-17055392474a', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='Add',               FName='新增',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Add.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='9746301e-80b6-4e20-8ff8-e4c399bd9629', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='Open',              FName='打开',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItemProperty set FId='dfb54769-4d4a-41e0-ac2b-3e661a1238c1', FToolItemId='9344dae1-9509-4203-8c09-c3ea38ed662d', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

--工具条子项排序
insert into TsToolItem set FId='0c1a474b-c324-4cca-8597-bf8bbadbda1e', FPageId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FCode='MoveUp',     FName='上升', FLabel='', FType='Button', FAlign='left',  FIndex=1, FWidth=0, FDefaultEventHandler='Sorter.doMoveUp',     FIcon='quicksilver/image/16/MoveUp.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='61d1005e-1da4-4987-93fb-6c499a5e46cd', FPageId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FCode='MoveDown',   FName='下降', FLabel='', FType='Button', FAlign='left',  FIndex=2, FWidth=0, FDefaultEventHandler='Sorter.doMoveDown',   FIcon='quicksilver/image/16/MoveDown.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='bc777730-9666-445d-80fd-0498864ff847', FPageId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FCode='MoveTop',    FName='置顶', FLabel='', FType='Button', FAlign='left',  FIndex=3, FWidth=0, FDefaultEventHandler='Sorter.doMoveTop',    FIcon='quicksilver/image/16/MoveTop.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='f2e15f68-0652-40c5-85f1-7f73033fbdd2', FPageId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FCode='MoveBottom', FName='置底', FLabel='', FType='Button', FAlign='left',  FIndex=4, FWidth=0, FDefaultEventHandler='Sorter.doMoveBottom', FIcon='quicksilver/image/16/MoveBottom.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='98cf29b1-e5d5-48eb-aae9-3c79fdade517', FPageId='de5649a4-65e8-43a4-9dbf-6c88f83f08c9', FCode='Save',       FName='保存', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='Sorter.doSave',       FIcon='quicksilver/image/16/Save.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

--工具条子项表单
insert into TsScript set FId='51382278-cb62-4a66-8773-745483e846c9', FIndex=1, FPageId='0008b354-d62b-4396-872a-3101ef1c0c75', FUrl='quicksilver/page/page/ToolSubItemForm.js';
insert into TsToolItem set FId='f00958e2-0a28-427b-a5c3-d5a4bab884cb', FPageId='0008b354-d62b-4396-872a-3101ef1c0c75', FCode='Save',  FName='保存', FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityEdit.doSave';

insert into TsForm set FDefault=1, FGroupMode='Double', FId='2792504b-9609-4fe4-b90d-a7e55d2bace9', FIndex=1, FName='默认', FPageId=null, FUnitId='b8081c53-782c-43c9-b406-561b29c040c5';
java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '(680d1c15-16fc-4f41-8b10-c5ffe6604103,基本信息,FName|FCode|FExpandMode|FIcon|FVisibleCondition|FEnableCondition|FHandleType|FHandlePageId|FEventHandler)');

insert into TsList set FDefault=1, FId='3b9caf3a-3bf5-4b31-a8cf-0afa60db6ef6', FIndex=null, FMultiPage=1, FName='工具条子项列表（默认）', FPageId=null,                                   FUnitId='b8081c53-782c-43c9-b406-561b29c040c5';
insert into TsList set FDefault=0, FId='22601530-97fe-4ba0-8c51-ef3aa8a2c6a3', FIndex=null, FMultiPage=1, FName='工具条子项选择列表',     FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5';
insert into TsList set FDefault=0, FId='08713ca9-da44-4f9b-912d-912086bb2651', FIndex=null, FMultiPage=1, FName='工具条子项首页列表',     FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5';
java setListFields('3b9caf3a-3bf5-4b31-a8cf-0afa60db6ef6', 'FName,FCode,FEventHandler');
java setListFields('22601530-97fe-4ba0-8c51-ef3aa8a2c6a3', 'FName,FCode,FEventHandler');
java setListFields('08713ca9-da44-4f9b-912d-912086bb2651', 'FName,FCode,FEventHandler');

insert into TsSlaveUnitPrivilege set FId='2703c961-a65e-42e9-b22d-647298bdbd41', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FCreatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadPrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadUserFieldName='', FUpdatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FUpdateUserFieldName='', FDeletePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FDeleteUserFieldName='';

--Qs.ToolItem.ToolSubItemList

delete from TsPage where FId='11f17322-2795-49ea-9d7b-bf45d57bbdfa';
insert into TsPage set FId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FName='工具条项子项列表',    FTitle='子项',         FCode='Qs.ToolItem.ToolSubItemList',     FPlatform='Computer', FType='EntityList',   FIcon='quicksilver/image/unit/ToolSubItem.gif', FUrl='quicksilver/page/template/EntityList.jsp',   FActionMethodName='Qs.ToolSubItem.prepareList',		FLoadHandler='',                  FRelationId='d197bc24-bfd2-4788-9d01-cac5a41f0425', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId='00000000-0000-0000-0001-000000000010', FIsSlavePage=1, FIndex=3,    FDialogWidth=null, FDialogHeight=null, FVisible=1, FDescription=null, FHasViewFrame=null;

delete from TsToolItem where FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa';
delete from TsToolSubItem where FId='2c37b41b-4b5f-4f26-8d49-7677fd8b0178';
insert into TsToolItem set FId='1d72eefe-76ce-4d35-b69c-3e8b37814042', FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FCode='Add',     FName='新增', FHint=null, FLabel='', FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='48f1dcf2-2124-4e0d-9a3b-3ece4707d480', FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FCode='Open',    FName='打开', FHint=null, FLabel='', FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='46d63b95-71da-4ead-bcdc-b0b7ccada95f', FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FCode='Delete',  FName='删除', FHint=null, FLabel='', FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='5148f18d-644a-4aeb-ad74-8e646c1212fa', FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FCode='Refresh', FName='刷新', FHint=null, FLabel='', FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='1d83d610-316f-47cd-abda-7d074d70a7c3', FPageId='11f17322-2795-49ea-9d7b-bf45d57bbdfa', FCode='Other',   FName=null,   FHint=null, FLabel='', FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='2c37b41b-4b5f-4f26-8d49-7677fd8b0178', FToolItemId='1d83d610-316f-47cd-abda-7d074d70a7c3', FCode='Sort', FName='排序', FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.gif', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FEventHandler='EntityList.doSort';

delete from TsPage where FId='5a1fbff7-e186-4230-83a0-4b64474ad2a6';
delete from TsScript where FId='f5d0ba63-2276-4eb2-bfc3-517053b1f080';
delete from TsToolItem where FId='5d8c4bb7-e5ac-4935-b445-8403107f4ae2';

delete from TsPage where FId='c1ebdc31-1c05-4f6c-8cfe-ca9db9321a9b';
delete from TsToolItem where FPageId='c1ebdc31-1c05-4f6c-8cfe-ca9db9321a9b';

-- Qs.TextResource

create table TsTextResource
(
	FId uuid primary key,
	FCode varchar(100) unique,
	FValue varchar(1000)
);

insert into TsTextResource select * from TsI18nString;

drop table TsI18nString;

delete from TsUnit where FId='00000000-0000-0000-0001-000000000005';
insert into TsUnit set FId='00000000-0000-0000-0001-000000000005', FCode='Qs.TextResource', FName='文本资源', FIcon='quicksilver/image/unit/TextResource.gif', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='Dialog', FIsTreeStructure=0, FMaxTreeLevel=0, FIsSlaveUnit=0, FMasterUnitId=null, FCreateDefaultWorkflow=null, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportBusinessLog=0, FSupportNote=null, FSupportSort=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FDataSource='default', FTable='TsTextResource', FKeyField='FId', FKeyType='Uuid', FNameField='FCode', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.i18n.TextResourceHome', FDaoClassName='com.jeedsoft.quicksilver.i18n.dao.impl.TextResourceDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.i18n.service.impl.TextResourceServiceImpl', FActionClassName='com.jeedsoft.quicksilver.i18n.action.impl.TextResourceActionImpl', FUnitFilterSql=null, FBusinessFilterSql=null, FDescription=null;

delete from TsPage where FId='ff34468b-679f-4812-bee8-042cc79b5340';
delete from TsPage where FId='152b2b64-387b-4dba-84da-6a14cb09efdd';
insert into TsPage set FId='ff34468b-679f-4812-bee8-042cc79b5340', FName='文本资源主列表', FTitle='文本资源列表', FCode='Qs.TextResource.List', FType='EntityList', FIcon='quicksilver/image/unit/TextResource.gif', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.TextResource.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000005', FMasterUnitId=null,                                   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;
insert into TsPage set FId='152b2b64-387b-4dba-84da-6a14cb09efdd', FName='文本资源表单',   FTitle='文本资源表单', FCode='Qs.TextResource.Edit', FType='EntityEdit', FIcon='quicksilver/image/16/Form.png',           FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.TextResource.prepareEdit', FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000005', FMasterUnitId='00000000-0000-0000-0001-000000000005', FIsSlavePage=1, FPlatform='Computer', FIndex=1,    FDialogWidth=500,  FDialogHeight=180,  FDescription=null, FVisible=1;

delete from TsForm where FId='eef37812-8ce7-4bc7-91bb-3fa82ce01efd';
insert into TsForm set FDefault=1, FGroupMode='None', FId='eef37812-8ce7-4bc7-91bb-3fa82ce01efd', FIndex=1, FName='文本资源表单', FPageId=null, FUnitId='00000000-0000-0000-0001-000000000005';

delete from TsList where FId='95f62263-3cf3-406a-b6ea-9e26dba91575';
insert into TsList set FDefault=1, FId='95f62263-3cf3-406a-b6ea-9e26dba91575', FIndex=1, FMultiPage=1, FName='文本资源列表', FPageId=null, FUnitId='00000000-0000-0000-0001-000000000005';

delete from TsPrivilege where FId='2952475c-0c74-4b82-bef0-3b4bc1ca8325';
insert into TsPrivilege set FId='2952475c-0c74-4b82-bef0-3b4bc1ca8325', FName='文本资源管理', FUnitId='00000000-0000-0000-0001-000000000005', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000006', FUseExisting=0, FSourcePrivilegeId=null, FCanBeUser=0, FCanBeDepartment=0, FCanBeGlobal=1, FUserFields=null, FDepartmentFields=null, FExtraOrSql=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;

delete from TsQuerySchema where FId='e51ee597-daf1-42b3-b4eb-ce9ee2a7eee9';
insert into TsQuerySchema set FId='e51ee597-daf1-42b3-b4eb-ce9ee2a7eee9', FUnitId='00000000-0000-0000-0001-000000000005', FName='全部文本资源', FType='condition', FPublic=1, FTemp=0, FGlobalAutoQuery=0, FShare=null, FUserId=null, FConditionId=null, FSqlSource='None', FSql=null, FIndex=3, FUpdateTime=null, FOriginSchemaId=null;

update TsMenu set FName='文本资源', FIcon='quicksilver/image/unit/TextResource.gif' where FId='4471b273-88a5-40af-b195-8602e4fca8a9';

-- misc

java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '(0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc,基本信息,FPlatform|FType|FIsSlavePage|FRelationId|FUnitId|FMasterUnitId,(66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b,通用信息,FCode|FName|FTitle|FUrl|FActionMethodName|FLoadHandler)(0e78d39e-0a96-4520-9c64-499b583b9897,电脑信息,FIcon|FDialogWidth|FDialogHeight|FHasViewFrame)(ed6e4ca6-8917-4648-9247-5d158179fb97,描述,FDescription))');

-- drop TsScript.FDescription; script page inline edit

alter table TsScript drop FDescription;
delete from TsField where FId='1f3c6ab1-6e07-4bee-b764-07ab2f2013d7';
delete from TsList where FId='b591b540-e05c-42df-a1d8-dfa045104d2d';
delete from TsListField where FListId='b591b540-e05c-42df-a1d8-dfa045104d2d';
java setFormFields('1fe5cd07-a592-4c01-aa09-f0af53b87b40', 'FUrl');
java setListFields('b93727bb-47eb-4b70-b775-8b2db0929279', 'FUrl');

java setOrderFields('00000000-0000-0000-0001-000000000014', 'FIndex', '0');

delete from TsToolSubItem where FToolItemId in (select FId from TsToolItem where FPageId in (select FId from TsPage where FCode='Qs.Page.ScriptList'));
delete from TsToolItem where FPageId in (select FId from TsPage where FCode='Qs.Page.ScriptList');
insert into TsToolItem set FId='7e4f0d0e-7fc0-40a1-adb8-1da25d638452', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='MoveUp',		FName='上升', FLabel='',	FType='Button',      FAlign='left',  FIndex=1, FWidth=0, FDefaultEventHandler='EditableList.doMoveUp',     FIcon='quicksilver/image/16/MoveUp.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='6d94def2-acc7-402a-ba18-c77fb53279d7', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='MoveDown',	FName='下降', FLabel='',	FType='Button',      FAlign='left',  FIndex=2, FWidth=0, FDefaultEventHandler='EditableList.doMoveDown',   FIcon='quicksilver/image/16/MoveDown.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='f5dabe23-130b-4caa-b506-c80ad9615503', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='MoveTop',		FName='置顶', FLabel='',	FType='Button',      FAlign='left',  FIndex=3, FWidth=0, FDefaultEventHandler='EditableList.doMoveTop',    FIcon='quicksilver/image/16/MoveTop.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='cde798ad-a49a-4554-ae4e-557c64bb7166', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='MoveBottom',	FName='置底', FLabel='',	FType='Button',      FAlign='left',  FIndex=4, FWidth=0, FDefaultEventHandler='EditableList.doMoveBottom', FIcon='quicksilver/image/16/MoveBottom.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='ead03266-e5b0-47b3-b729-75f870585ab6', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='Add',			FName='新增', FLabel=null,	FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doAdd';
insert into TsToolItem set FId='3559e90f-a3ea-4791-9e93-e3a1d72a53b7', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='Delete',		FName='删除', FLabel=null,	FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Delete.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doDelete';
insert into TsToolItem set FId='1eae5879-bd7e-42c7-9da1-6c9d61c74b56', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='Save',		FName='保存', FLabel=null,	FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Save.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doSave';
insert into TsToolItem set FId='132d3441-953d-4235-9d11-699f2fb7447d', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='Refresh',		FName='刷新', FLabel=null,	FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doRefresh';
insert into TsToolItem set FId='64ee1abf-24de-4ab8-ae6b-828195254a67', FPageId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FCode='Other',		FName=null,   FLabel=null,	FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='0aead9eb-64f1-45c5-ba20-01eecbc2c82f', FToolItemId='64ee1abf-24de-4ab8-ae6b-828195254a67', FCode='ExcelExport', FName='导出 Excel', FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Excel.gif', FVisibleCondition='', FEnableCondition='', FHandleType='JavaScript', FHandlePageId=null, FEventHandler='EditableList.doExcelExport';

delete from TsPage where FCode='Qs.Page.ScriptList';
insert into TsPage set FId='b5c3577e-4c5a-4fe2-b1fb-c4234f126096', FName='页面脚本列表',     FTitle='客户端脚本',   FCode='Qs.Page.ScriptList',        FType='EditableList',	FIcon='quicksilver/image/unit/Script.gif',				FUrl='quicksilver/page/template/EditableList.jsp',  FActionMethodName='Qs.Script.prepareEditableList',    FLoadHandler=null,              FRelationId='5feca887-d680-45b8-9c82-c663811b069e', FUnitId='00000000-0000-0000-0001-000000000014', FMasterUnitId='00000000-0000-0000-0001-000000000006', FIsSlavePage=1, FPlatform='Computer', FIndex=3,    FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1;

delete from TsTextResource where FId='4d223f2b-7d28-402a-b9af-43616ba24325';
insert into TsTextResource set FCode='T.Public.Processing',                                FId='4d223f2b-7d28-402a-b9af-43616ba24325', FValue='处理中，请等待……';

-----------------------------------

delete from TsTextResource where FId='7811b059-370b-49c2-a205-532ae82b18e0';
delete from TsTextResource where FId='644e8a98-ac48-4445-be59-fb91a47f514d';
delete from TsTextResource where FId='e1a3286d-3b88-40bc-8711-10d6299f63b2';
delete from TsTextResource where FId='80483b03-d616-4542-8a25-f00a68b3c34c';
delete from TsTextResource where FId='26e9d08f-4bc4-4043-b95a-2537ed3faa55';
delete from TsTextResource where FId='d8f90897-bf03-4eb5-a62f-79193d2e586d';
delete from TsTextResource where FId='e6cb3b10-987f-419b-a461-313170dabc12';
insert into TsTextResource set FCode='T.Qs.Index.LoginName',                              FId='7811b059-370b-49c2-a205-532ae82b18e0', FValue='登录名称/Account';
insert into TsTextResource set FCode='T.Qs.Index.OpenNewWindow',                          FId='644e8a98-ac48-4445-be59-fb91a47f514d', FValue='打开新窗口/Open New Window';
insert into TsTextResource set FCode='T.Qs.Index.Password',                               FId='e1a3286d-3b88-40bc-8711-10d6299f63b2', FValue='密　　码/Password';
insert into TsTextResource set FCode='T.Qs.Index.Language',                               FId='80483b03-d616-4542-8a25-f00a68b3c34c', FValue='语　　言/Language';
insert into TsTextResource set FCode='T.Qs.Index.RemberLoginName',                        FId='26e9d08f-4bc4-4043-b95a-2537ed3faa55', FValue='记住登录名/Rember My Account';
insert into TsTextResource set FCode='T.Qs.Index.Theme',                                  FId='d8f90897-bf03-4eb5-a62f-79193d2e586d', FValue='界面风格/Theme';
insert into TsTextResource set FCode='T.Qs.Index.SelectLanguageAlert',                    FId='e6cb3b10-987f-419b-a461-313170dabc12', FValue='请选择语言！';

delete from TsTextResource where FId='3ba26fc7-c69b-47ef-aa2c-8ff89ad3a8c5';
delete from TsTextResource where FId='60254ce3-d419-4307-a809-5f949137a871';
insert into TsTextResource set FCode='T.Qs.Language.SetDefaultConfirm',                   FId='3ba26fc7-c69b-47ef-aa2c-8ff89ad3a8c5', FValue='更改默认语言可能需要等待较久，您是否确定更改？';
insert into TsTextResource set FCode='T.Qs.Language.DefaultModified',                     FId='60254ce3-d419-4307-a809-5f949137a871', FValue='默认语言修改成功。';

delete from TsTextResource where FId='a5812181-8b7a-4fbd-ad82-fb476a418cfb';
delete from TsTextResource where FId='435f5839-4b46-48a1-ac19-bc10ecddf68c';
insert into TsTextResource set FCode='E.Qs.Language.CannotDeleteDefault',                 FId='a5812181-8b7a-4fbd-ad82-fb476a418cfb', FValue='不能删除默认语言。';
insert into TsTextResource set FCode='E.Qs.Language.CodeExist',							  FId='435f5839-4b46-48a1-ac19-bc10ecddf68c', FValue='代码为“${0}”的语言已经存在。';

delete from TsTextResource where FId='1bf6289f-da18-42a7-b752-62c9173714ff';
insert into TsTextResource set FCode='E.Qs.Field.I18nSizeTooLong',						  FId='1bf6289f-da18-42a7-b752-62c9173714ff', FValue='多语言字段的长度不能超过2000。';

--Qs.Language-------------------------------------------------------------------

create table TsLanguage
(
	FId uuid primary key,
	FName varchar(50),
	FEnglishName varchar(50),
	FCode varchar(10) unique,
	FDefault bit,
	FIndex int
);

insert into TsUnit set FId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FCode='Qs.Language', FName='语言', FIcon='quicksilver/image/unit/Language.png', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='Dialog', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=0, FMasterUnitId=null, FCreateDefaultWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=1, FSupportPrivilegeField=0, FSupportEqualQuery=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FQueryFormAutoQuery=0, FOpenViewPageFirst=0, FDataSource='default', FTable='TsLanguage', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.i18n.LanguageHome', FDaoClassName='com.jeedsoft.quicksilver.i18n.dao.impl.LanguageDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.i18n.service.impl.LanguageServiceImpl', FActionClassName='com.jeedsoft.quicksilver.i18n.action.impl.LanguageActionImpl', FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='c521ba5e-a236-482d-bdb5-3b0d975db9fb', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FCode',        FTitle='代码',         FType='InputBox-Text',    FSize=10,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='6a80c9bd-f90e-4afd-a96c-cd50eeba7375', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FDefault',     FTitle='是否默认语言', FType='CheckBox',         FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='8173d65e-a2b1-4669-a771-36c7ee52bed1', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FEnglishName', FTitle='英文名称',     FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='32a245c6-4423-4126-8faf-b9af5a759e14', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FId',          FTitle='ID',           FType='InputBox-Key',     FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='2b9f1b47-d41a-415f-bd24-6446b038e5d8', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FIndex',       FTitle='顺序',         FType='InputBox-Integer', FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='f18d7dce-2059-4acd-bd3d-ba27e7699d8c', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FName',        FTitle='名称',         FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setOrderFields('e59603b0-5475-407e-8f1d-b3e2c4fe0c27', 'FIndex', '0');
java setQueryFormFields('e59603b0-5475-407e-8f1d-b3e2c4fe0c27', 'FName,FCode,FDefault');
java setKeywordFields('e59603b0-5475-407e-8f1d-b3e2c4fe0c27', 'FCode,FName');

insert into TsPage set FId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FName='语言主列表',   FTitle='语言列表', FCode='Qs.Language.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/Language.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.Language.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1, FDescription=null;
insert into TsPage set FId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FName='语言选择列表', FTitle='语言列表', FCode='Qs.Language.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/Language.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.Language.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1, FDescription=null;
insert into TsPage set FId='45345f7f-990d-4d34-99bd-85a707a560c4', FName='语言排序',     FTitle='排序',     FCode='Qs.Language.Sort',       FPlatform='Computer', FType='Sort',       FIcon='quicksilver/image/unit/Language.png', FUrl='quicksilver/page/template/Sorter.jsp',     FActionMethodName='Qs.Language.prepareSort', FLoadHandler=null, FRelationId=null, FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FVisible=1, FDescription=null;
insert into TsPage set FId='9739657e-8443-4658-901d-0165201065f2', FName='语言表单',     FTitle='表单',     FCode='Qs.Language.Edit',       FPlatform='Computer', FType='EntityEdit', FIcon='quicksilver/image/unit/Edit.gif',     FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.Language.prepareEdit', FLoadHandler=null, FRelationId=null, FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FMasterUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FIsSlavePage=1, FIndex=1,    FDialogWidth=604,  FDialogHeight=300,  FHasViewFrame=0,    FVisible=1, FDescription='';

--语言主列表
insert into TsToolItem set FId='d5282af8-e02b-4df0-92b7-5e2def450bd4', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint=null, FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema',  FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='cf7f9f69-b3ca-4ca4-961d-881a181c3a42', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='QuerySchemaConfig', FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='2ae43bf5-0429-417c-8515-ef49928fc717', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='QuerySchemaLock',   FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='aafebbb3-ed07-4ee7-af80-93792abd5238', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Add',               FName='新增',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FIcon='quicksilver/image/16/Add.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='92b8581b-17e7-4c38-86ce-89675130995f', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Open',              FName='打开',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='26272ca6-b99e-4a62-b1e4-c81c1f69e9e2', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Delete',            FName='删除',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/Delete.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='0e33e88f-54cf-454b-96d8-21d8763e348f', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Refresh',           FName='刷新',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=4, FWidth=0,   FIcon='quicksilver/image/16/Refresh.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='36ab1438-b4b5-404c-9ebd-e93f4c48cb2c', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Other',             FName=null,                         FHint=null, FLabel=null, FType='ComboButton',        FAlign='right', FIndex=5, FWidth=0,   FIcon='quicksilver/image/16/Other.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='c6fa5c21-0c80-4711-9829-83dd2d769a99', FToolItemId='36ab1438-b4b5-404c-9ebd-e93f4c48cb2c', FCode='Sort',        FName='排序',       FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.gif',   FVisibleCondition='', FEnableCondition='', FHandleType='JavaScript', FHandlePageId=null, FEventHandler='EntityList.doSort';
insert into TsToolSubItem set FId='18d8d021-734b-48f3-b47c-575bb203f939', FToolItemId='36ab1438-b4b5-404c-9ebd-e93f4c48cb2c', FCode='Splitter1',   FName='-',          FExpandMode='None', FIndex=2, FIcon='',                                FVisibleCondition='', FEnableCondition='', FHandleType='None',       FHandlePageId=null, FEventHandler='';
insert into TsToolSubItem set FId='be057712-13ce-450e-942a-a5bb664b17a3', FToolItemId='36ab1438-b4b5-404c-9ebd-e93f4c48cb2c', FCode='Import',      FName='导入',       FExpandMode='None', FIndex=3, FIcon='quicksilver/image/16/Import.gif', FVisibleCondition='', FEnableCondition='', FHandleType='JavaScript', FHandlePageId=null, FEventHandler='EntityList.doImport';
insert into TsToolSubItem set FId='649e014c-c06a-47e6-8c65-2ecbadae36e3', FToolItemId='36ab1438-b4b5-404c-9ebd-e93f4c48cb2c', FCode='ExcelExport', FName='导出 Excel', FExpandMode='None', FIndex=4, FIcon='quicksilver/image/16/Excel.gif',  FVisibleCondition='', FEnableCondition='', FHandleType='JavaScript', FHandlePageId=null, FEventHandler='EntityList.doExcelExport';
insert into TsToolItemProperty set FId='49bd010f-a336-4582-8daf-37b7ca28ea84', FToolItemId='d5282af8-e02b-4df0-92b7-5e2def450bd4', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

--语言选择列表
insert into TsToolItem set FId='b60fe90d-e7aa-4337-a0ff-6b990e29a586', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint=null, FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='e90c12a9-d3d3-4940-ad84-4c8957b94c92', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='QuerySchemaConfig', FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='8a72938e-e975-4c51-bacf-1e9103562444', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='QuerySchemaLock',   FName=null,                         FHint=null, FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='a582bc42-7c59-4e93-bd94-b4338553a081', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='ConfirmSelection',  FName='确定',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FIcon='quicksilver/image/16/Ok.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='6bf6d8ae-46a4-47b3-88e2-ca85bc57a05e', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='Add',               FName='新增',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Add.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='19066c36-efa9-4376-9b07-32790feca8bd', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='Open',              FName='打开',                       FHint=null, FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItemProperty set FId='80b834b8-1e3e-4a89-a043-c8c0c43d2cae', FToolItemId='b60fe90d-e7aa-4337-a0ff-6b990e29a586', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

--语言排序
insert into TsToolItem set FId='312386e4-d18b-4f17-a37f-b0f3d3b8a397', FPageId='45345f7f-990d-4d34-99bd-85a707a560c4', FCode='MoveUp',     FName='上升', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=1, FWidth=0, FIcon='quicksilver/image/16/MoveUp.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='Sorter.doMoveUp';
insert into TsToolItem set FId='d80ed645-0eba-4afe-a28a-d0ff4e38e689', FPageId='45345f7f-990d-4d34-99bd-85a707a560c4', FCode='MoveDown',   FName='下降', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=2, FWidth=0, FIcon='quicksilver/image/16/MoveDown.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='Sorter.doMoveDown';
insert into TsToolItem set FId='7ae5248e-c398-48fe-9338-8eea79a7d755', FPageId='45345f7f-990d-4d34-99bd-85a707a560c4', FCode='MoveTop',    FName='置顶', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=3, FWidth=0, FIcon='quicksilver/image/16/MoveTop.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='Sorter.doMoveTop';
insert into TsToolItem set FId='e11ea705-3d23-4c31-9300-9609a9806c35', FPageId='45345f7f-990d-4d34-99bd-85a707a560c4', FCode='MoveBottom', FName='置底', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=4, FWidth=0, FIcon='quicksilver/image/16/MoveBottom.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='Sorter.doMoveBottom';
insert into TsToolItem set FId='2e053f08-c20d-4544-8c5c-3d6045a72c21', FPageId='45345f7f-990d-4d34-99bd-85a707a560c4', FCode='Save',       FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='Sorter.doSave';

--语言表单
insert into TsScript set FId='4cdd39f4-8b7d-4c2b-ba87-357c06bd478c', FIndex=1, FPageId='9739657e-8443-4658-901d-0165201065f2', FUrl='quicksilver/page/i18n/LanguageForm2.js';
insert into TsScript set FId='a2454967-0cda-4b06-abce-ba10f59ef2a6', FIndex=2, FPageId='9739657e-8443-4658-901d-0165201065f2', FUrl='quicksilver/page/i18n/LanguageForm.js';
insert into TsToolItem set FId='066c35a0-c714-4047-be8a-127af47c0912', FPageId='9739657e-8443-4658-901d-0165201065f2', FCode='Save',       FName='保存',         FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0,    FIcon='quicksilver/image/16/Save.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null,                      FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityEdit.doSave';
insert into TsToolItem set FId='6f397590-d4d5-42ef-a2a8-b4a3ff284e54', FPageId='9739657e-8443-4658-901d-0165201065f2', FCode='SetDefault', FName='设为默认语言', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=null, FIcon='quicksilver/image/16/Default.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine='',   FVisibleCondition=null, FEnableCondition='${entity.FDefault} == 0', FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='LanguageForm.doSetDefault';

insert into TsForm set FDefault=1, FGroupMode='Double', FId='bbe7d774-1926-4635-b518-9cda868b7e95', FIndex=1, FName='默认', FPageId=null, FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27';
java setFormFields('bbe7d774-1926-4635-b518-9cda868b7e95', '(429ab835-ad91-4cc3-a7f8-f42fd97c2209,基本信息,FName|FEnglishName|FCode|FDefault)');

insert into TsList set FDefault=1, FId='6bfb1452-684a-4e53-b1a6-c315fc1a58d4', FIndex=null, FMultiPage=1, FName='语言列表（默认）', FPageId=null,                                   FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27';
insert into TsList set FDefault=0, FId='75975356-cc23-43ce-9476-63b460d90654', FIndex=null, FMultiPage=1, FName='语言选择列表',     FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27';
insert into TsList set FDefault=0, FId='d3077dea-128b-4253-bdd1-958d0dd451bc', FIndex=null, FMultiPage=1, FName='语言首页列表',     FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27';
java setListFields('6bfb1452-684a-4e53-b1a6-c315fc1a58d4', 'FName,FEnglishName,FCode,FDefault');
java setListFields('75975356-cc23-43ce-9476-63b460d90654', 'FName,FEnglishName,FCode,FDefault');
java setListFields('d3077dea-128b-4253-bdd1-958d0dd451bc', 'FName,FEnglishName,FCode,FDefault');

insert into TsPrivilege set FId='d70ef71e-a8da-43ae-b7a9-2234f3bae3bf', FName='语言管理', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000006', FUseExisting=0, FSourcePrivilegeId=null, FCanBeUser=0, FCanBeDepartment=0, FCanBeGlobal=1, FUserFields=null, FDepartmentFields=null, FExtraOrSql=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='57760201-36de-438f-8a1e-8f34fd2103ce', FName='语言查看', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000002', FUseExisting=0, FSourcePrivilegeId=null, FCanBeUser=0, FCanBeDepartment=0, FCanBeGlobal=1, FUserFields=null, FDepartmentFields=null, FExtraOrSql=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;

insert into TsQuerySchema set FId='28c96ac2-898a-4245-80ee-1216378bfac2', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='全部语言',   FType='condition',  FPublic=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId=null, FConditionId=null, FSqlSource='None', FSql=null, FIndex=1, FUpdateTime=null, FOriginSchemaId=null;

delete from TsMenu where FId='813ac0b2-a881-409f-ad05-f16bff890b11';
update TsMenu set FIndex = FIndex + 1 where FParentId = '00000000-0000-0000-0008-990000000020' and FIndex >= 2;
insert into TsMenu set FId='813ac0b2-a881-409f-ad05-f16bff890b11', FParentId='00000000-0000-0000-0008-990000000020', FIndex=2, FName='语言设置', FIcon='quicksilver/image/unit/Language.png', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FArguments=null, FLicensed=1, FEnabled=1, FReplaceByChildren=0, FFunctionName=null, FSubMenuSource='MenuTable', FSubMenuRoutine=null;
java refreshSerial('TsMenu');

--Language

insert into TsLanguage set FId='a0550f8d-b315-492f-ac20-e72de1ce4242', FName='英文',     FIndex=3, FCode='en-us', FDefault=0, FEnglishName='English(US)';
insert into TsLanguage set FId='deb3c5f9-40a7-4d64-b4f0-43522ea33e0d', FName='繁体中文', FIndex=2, FCode='zh-tw', FDefault=0, FEnglishName='Chinese(Traditional)';
insert into TsLanguage set FId='8fe394bc-8ac0-4060-bd1d-e0cedd2fff6a', FName='简体中文', FIndex=1, FCode='zh-cn', FDefault=1, FEnglishName='Chinese(Simplified)';

--TsUnit.FUseSystemI18nTable

update TsUnit set FUseSystemI18nTable=0 where FUseSystemI18nTable is null;
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Chart';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ChartParameter';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ChartCatalog';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Dictionary';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.DictionaryItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Duplication';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Edit';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.EntityEvent';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Field';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.FieldGroup';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Form';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.HomepageItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.TextResource';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Language';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.List';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Menu';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.MobileHomepageItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Notice';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Page';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ParameterDefinition';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ParameterGroup';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Privilege';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.PrivilegeType';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.QuerySchema';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Relation';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Report';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ReportCatalog';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ReportParameter';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ReportSolution';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Role';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Timer';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ToolItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ToolSubItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.Unit';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ViewItem';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.ViewItemButton';
update TsUnit set FUseSystemI18nTable=1 where FCode='Wf.Version';
update TsUnit set FUseSystemI18nTable=1 where FCode='Wf.Workflow';

--TsField.FSupportI18n

update TsField set FSupportI18n = 0 where FSupportI18n is null;
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Chart')                and FName='FGroupTitle1';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Chart')                and FName='FGroupTitle2';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Chart')                and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Chart')                and FName='FValueTitle';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ChartParameter')       and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ChartCatalog')         and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Dictionary')           and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.DictionaryItem')       and FName='FText';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Duplication')          and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Edit')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.EntityEvent')          and FName='FMessage';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.EntityEvent')          and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Field')                and FName='FTitle';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.FieldGroup')           and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Form')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.HomepageItem')         and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.TextResource')         and FName='FValue';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Language')             and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.List')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Menu')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.MobileHomepageItem')   and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Notice')               and FName='FEmailContent';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Notice')               and FName='FShortMessageContent';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Notice')               and FName='FSubject';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Page')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Page')                 and FName='FTitle';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ParameterDefinition')  and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ParameterGroup')       and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Privilege')            and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.PrivilegeType')        and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.QuerySchema')          and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Relation')             and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Relation')             and FName='FOppositeName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Report')               and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ReportCatalog')        and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ReportParameter')      and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ReportSolution')       and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Role')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Timer')                and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ToolItem')             and FName='FHint';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ToolItem')             and FName='FLabel';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ToolItem')             and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ToolSubItem')          and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.Unit')                 and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ViewItem')             and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ViewItem')             and FName='FTitleText';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Qs.ViewItemButton')       and FName='FName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Wf.Version')              and FName='FProcessName';
update TsField set FSupportI18n=1 where FUnitId in (select FId from TsUnit where FCode='Wf.Workflow')             and FName='FName';

create table TsI18nText
(
	FLanguage varchar(10),
	FTableName varchar(50),
	FFieldName varchar(50),
	FEntityId uuid,
	FText varchar(2000),
	primary key (FLanguage, FTableName, FFieldName, FEntityId)
);

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20130110-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20130110-01';
