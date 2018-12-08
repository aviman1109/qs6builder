--阅览项关联关系调整

delete from TsRelation where FId='a23c0b00-78c1-4194-afc3-e119567dbff6';
delete from TsRelation where FId='faf920e0-01ea-4071-92e8-06038f2a00cb';
delete from TsRelation where FId='3b482b8c-2119-4ff8-bcc5-19a66b59e6fa';
delete from TsRelation where FId='97b85562-71e1-4290-b396-5681cd43d66a';
delete from TsRelation where FId='f498621d-28cd-4bb8-95c4-39c051d94f59';
delete from TsRelation where FId='00c511a9-d067-4ccd-965c-07e7225f27f8';
insert into TsRelation set FId='a23c0b00-78c1-4194-afc3-e119567dbff6', FOppositeId='97b85562-71e1-4290-b396-5681cd43d66a', FName='阅览项字段-阅览项', FOppositeName='阅览项-阅览项字段', FUnitId1='0bd0ac10-dded-4d37-a03a-a284856445be', FUnitId2='20b2c483-c0e2-47db-afef-ac31628da984', FType='field', FTable='', FField1='FId', FField2='FViewItemId', FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='faf920e0-01ea-4071-92e8-06038f2a00cb', FOppositeId='f498621d-28cd-4bb8-95c4-39c051d94f59', FName='阅览项按钮-阅览项', FOppositeName='阅览项-阅览项按钮', FUnitId1='1483fd8c-d559-45c4-879f-df0edbae3f7a', FUnitId2='20b2c483-c0e2-47db-afef-ac31628da984', FType='field', FTable='', FField1='FId', FField2='FViewItemId', FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='3b482b8c-2119-4ff8-bcc5-19a66b59e6fa', FOppositeId='00c511a9-d067-4ccd-965c-07e7225f27f8', FName='阅览项-单元',       FOppositeName='单元-阅览项',       FUnitId1='20b2c483-c0e2-47db-afef-ac31628da984', FUnitId2='00000000-0000-0000-0001-000000000001', FType='field', FTable='', FField1='FId', FField2='FUnitId',     FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

--扫把提示信息调整

delete from TsTextResource where FId='7ff9fd42-73bc-4f89-aeff-addc472f5891';
insert into TsTextResource set FId='7ff9fd42-73bc-4f89-aeff-addc472f5891', FCode='T.Qs.QueryForm.Hint.ClearQueryForm',					FValue='清空查询表单，并执行查询。';

--查询方案下拉框/查询方案按钮/关键字输入框/扫把按钮，改为自动生成，不在工具条内配置。

delete from TsToolItem where FPageId in (select FId from TsPage where FType='EntityList') and FCode in ('QuerySchema', 'QuerySchemaConfig', 'QuerySchemaLock', 'Keyword', 'QueryBoxClear');
delete from TsToolItemProperty where not exists (select * from TsToolItem where FId = TsToolItemProperty.FToolItemId);

delete from TsToolItem where FId='3b52eda8-3f77-4a66-8599-c2c51815c509';
delete from TsToolItem where FId='3ee7185f-1579-47a8-a0c9-9df175686318';
delete from TsToolItem where FType='Button' and FCode='QuerySchemaLock';
delete from TsToolItem where FPageId='37c35cde-2f79-4592-b765-ee7fbe47f0b5' and FAlign='left';

delete from TsTextResource where FCode='T.Qs.ToolItem.Hint.QueryBoxClear';
delete from TsTextResource where FCode='T.Qs.ToolItem.Hint.QuerySchemaConfig';
delete from TsTextResource where FCode='T.Qs.List.DefaultSchemaEmptyText';
delete from TsTextResource where FCode='T.Qs.List.SchemaEmptyText';
delete from TsTextResource where FCode='T.Qs.List.SchemaHint';
delete from TsTextResource where FCode='T.Qs.List.NavigateBackward';
delete from TsTextResource where FCode='T.Qs.List.NavigateForward';

delete from TsTextResource where FCode='T.Qs.List.QueryBoxClearHint';
delete from TsTextResource where FCode='T.Qs.List.QuerySchemaConfigHint';
delete from TsTextResource where FCode='T.Qs.List.KeywordHint';
delete from TsTextResource where FCode='T.Qs.List.QuerySchemaEmptyText1';
delete from TsTextResource where FCode='T.Qs.List.QuerySchemaEmptyText2';
delete from TsTextResource where FCode='T.Qs.List.QuerySchemaHint';
delete from TsTextResource where FCode='T.Qs.List.NavigateBackwardHint';
delete from TsTextResource where FCode='T.Qs.List.NavigateForwardHint';
insert into TsTextResource set FId='a764456b-e058-4b9b-85c7-463b525294bd', FCode='T.Qs.List.QueryBoxClearHint',					FValue='清空页面上所有查询条件，并执行查询。';
insert into TsTextResource set FId='71a5ffd1-13ea-43a5-8092-952e0791130e', FCode='T.Qs.List.QuerySchemaConfigHint',				FValue='查询方案设置';
insert into TsTextResource set FId='30f56807-0a05-4575-96e8-c70b441d6d17', FCode='T.Qs.List.KeywordHint',						FValue='请输入${0}，并按回车键查询。';
insert into TsTextResource set FId='2d4e5d0f-ede2-4fb0-97c7-35280ac0961e', FCode='T.Qs.List.QuerySchemaEmptyText1',				FValue='请选择查询方案';
insert into TsTextResource set FId='cacf5ac9-1591-4720-837a-e6a9bfdbbe78', FCode='T.Qs.List.QuerySchemaEmptyText2',				FValue='已预设为“${0}”';
insert into TsTextResource set FId='09afe609-4473-415c-93ad-82fbb5f0c6d3', FCode='T.Qs.List.QuerySchemaHint',					FValue='请选择查询方案。';
insert into TsTextResource set FId='b643b27c-62e1-4d14-a563-5c3b4a83173d', FCode='T.Qs.List.NavigateBackwardHint',				FValue='后退到上一查询条件，并执行查询。';
insert into TsTextResource set FId='f9bb11ed-4eff-41b5-9fc1-dfe5cfa083d9', FCode='T.Qs.List.NavigateForwardHint',				FValue='前进到下一查询条件，并执行查询。';

--页面单元修改

alter table TsPage add FCreateQuerySchemaBox varchar(10);
alter table TsPage add FCreateKeywordBox varchar(10);
alter table TsPage add FToolItemInitArguments varchar(500);

insert into TsField set FId='95207bf8-4049-4c66-856f-1e8e38e30b9a', FUnitId='00000000-0000-0000-0001-000000000006', FName='FCreateQuerySchemaBox',	FTitle='查询方案框',			FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',                                          FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                              FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;
insert into TsField set FId='618c0401-2602-4264-a64e-de7a79484c5d', FUnitId='00000000-0000-0000-0001-000000000006', FName='FCreateKeywordBox',		FTitle='关键字框',				FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='b4ac2d00-5014-4c08-b9b2-3788a84a7d87', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',                                          FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                              FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;
insert into TsField set FId='286f6ae0-4e93-4e58-ae48-b343bcbb6282', FUnitId='00000000-0000-0000-0001-000000000006', FName='FToolItemInitArguments',	FTitle='工具条项初始化参数',	FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',                                          FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=3, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                              FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;

update TsField set FTitle='预设查询方案', FVisible=1 where FId='4ec766f2-cbaf-4ced-b5e9-49b1684f785f';
java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '基本信息', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', null, 'FPlatform,FType,FIsSlavePage,FRelationId,FUnitId,FMasterUnitId', '通用信息', '66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FCode,FName,FTitle,FUrl,FActionMethodName,FLoadHandler', '列表信息', '6fdfaf24-efd9-444f-952b-a738654a4d68', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FQueryFormAutoQuery,FHasViewFrame,FQueryOnLoad,FQuerySchemaId,FCreateQuerySchemaBox,FCreateKeywordBox,FToolItemInitArguments', '电脑信息', '0e78d39e-0a96-4520-9c64-499b583b9897', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FIcon,FDialogWidth,FDialogHeight,FDialogMaximized', '描述', 'ed6e4ca6-8917-4648-9247-5d158179fb97', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FDescription');

insert into TsDictionary set FBuiltin=0, FDescription='', FId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22', FName='QS-页面-查询方案框', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22', FId='5efa1bb0-9bf5-48a7-8a72-a9f1d9316c35', FIndex=1, FParentValue=null, FText='默认(为非从属页面创建)', FValue='Default';
insert into TsDictionaryItem set FDictionaryId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22', FId='cbe2c74a-e4e1-450c-8155-86148f0ba15d', FIndex=2, FParentValue=null, FText='创建',                   FValue='Yes';
insert into TsDictionaryItem set FDictionaryId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22', FId='33db76bd-9f0f-4d78-9a55-26008fea8181', FIndex=3, FParentValue=null, FText='不创建',                 FValue='No';

insert into TsDictionary set FBuiltin=0, FDescription='', FId='b4ac2d00-5014-4c08-b9b2-3788a84a7d87', FName='QS-页面-关键字框', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='b4ac2d00-5014-4c08-b9b2-3788a84a7d87', FId='6c5eb1f2-d4ef-4502-bf6d-0d8435c5a0f4', FIndex=1, FParentValue=null, FText='创建',   FValue='Yes';
insert into TsDictionaryItem set FDictionaryId='b4ac2d00-5014-4c08-b9b2-3788a84a7d87', FId='a7e33f97-9d9c-4ed1-83f7-f6d64723e081', FIndex=2, FParentValue=null, FText='不创建', FValue='No';

update TsPage set FCreateKeywordBox='No' where FCode='Qs.Unit.RelationList';
update TsPage set FCreateKeywordBox='No' where FCode='Qs.Unit.PageList';
update TsPage set FCreateQuerySchemaBox='No', FCreateKeywordBox='No' where FCode='Qs.Chart.PrivateList';
update TsPage set FCreateKeywordBox='No' where FCode='Qs.SerialNumber.PartList';

java setKeywordFields('00000000-0000-0000-0001-000000000002', 'FName,FTitle');

--菜单调整

update TsField set FType='TextBox', FRowSpan=3 where FId='615f522e-6cc4-470c-aac4-fa06bc98749a';

alter table TsMenu add FQuerySchemaId uuid;
alter table TsMenu add FQuerySchemaLocked bit;

insert into TsField set FId='228c9ae5-8aa7-4b14-97ef-24fa2974055a', FUnitId='00000000-0000-0000-0001-000000000008', FName='FQuerySchemaId',     FTitle='查询方案',           FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000013', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='FPublic = 1 and FUnitId = ${form.FPageId.FUnitId}',	FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;
insert into TsField set FId='f33918a1-462a-46ce-8c5a-33705ad2aa04', FUnitId='00000000-0000-0000-0001-000000000008', FName='FQuerySchemaLocked', FTitle='锁定查询方案',       FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',														FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;

java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本信息', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FEnabled,FLicensed', '页面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FQuerySchemaId,FQuerySchemaLocked,FArguments', '函数', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子菜单', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine');

update TsMenu set FQuerySchemaId = substr(FArguments, locate('schemaId:"', FArguments) + 10, 36)
where FQuerySchemaId is null and locate('schemaId:"', FArguments) > 0;
update TsMenu set FQuerySchemaId = substr(FArguments, locate('schemaId:''', FArguments) + 10, 36)
where FQuerySchemaId is null and locate('schemaId:''', FArguments) > 0;
update TsMenu set FQuerySchemaLocked=1 where FQuerySchemaId is not null;
update TsMenu set FArguments=null where FQuerySchemaId is not null and length(FArguments) < 53;

update TsMenu set FPageId='4aa5dfb3-2cb8-4f86-8500-e10f5e6c856e' where FPageId='5a09af98-1b1b-4803-bf7b-eefefbc1a62a';

delete from TsPage where FId='5a09af98-1b1b-4803-bf7b-eefefbc1a62a';
delete from TsScript where FId='1f6ae38b-2e92-4dab-961a-d8dcb6f52740';
delete from TsToolItem where FId='42d843c9-6ab9-443c-8901-1d6410eb7074';
delete from TsToolItem where FId='20fdbe3b-fe07-49b7-817f-6babe3e678ab';

update TsPage set FName='工作项列表', FCode='Wf.WorkItem.List' where FId='ec36c420-4d34-49fa-a5a9-57129eda1246';
delete from TsScript where FId='c6da6451-ab29-49ed-bb9b-b540da8d350e';
delete from TsToolItem where FId='e1936148-9988-4e76-93ea-a59296fa435d';
insert into TsScript set FId='c6da6451-ab29-49ed-bb9b-b540da8d350e', FIndex=1, FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FUrl='quicksilver/page/wfinstance/WorkItemList.js';
insert into TsToolItem set FId='e1936148-9988-4e76-93ea-a59296fa435d', FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FCode='Open',				FName='打开',           FLabel='',   FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='WorkItemList.doOpen',           FIcon='quicksilver/image/16/Open.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

--是否允许选择过滤范围外的数据

alter table TsField add FSelectListFilterSqlExceedable bit;
insert into TsField set FId='7ee75768-3a39-404f-860a-5a90e74104d9', FUnitId='00000000-0000-0000-0001-000000000002', FName='FSelectListFilterSqlExceedable', FTitle='允许选择过滤范围外的数据', FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FHint=null, FValidation=null, FCustomData='',   FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FSelectListFilterSqlExceedable=null;
insert into TsFormField set FFormId='75138d58-0c96-43ed-962e-39b66f28a295', FFieldGroupId='7d4ddff1-5d65-41e0-b04a-89d60da24f8b', FFieldName='FSelectListFilterSqlExceedable', FIndex=5;

--临时查询方案

insert into TsTextResource set FId='2fa264df-21ba-4673-b18f-f210c41b261a', FCode='T.Qs.QuerySchema.TempSchemaName',				FValue='临时查询方案';
