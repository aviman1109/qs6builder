--minglei--------------------------------------------------

alter table TsOnlineUser drop column FClusterNode;
delete from TsField where FId='1e32d108-c396-444f-936b-56c68ab0a74f';
java setQueryFormFields('e4da095a-1f19-41f5-af6a-f43258569516', 'FUserId,FIpAddress,FLoginTime,FLastAccessTime,FLanguageId,FSessionId');
java setFormFields('1956e939-e2ab-43de-be4c-46f0bdf34df5', '基本資訊', '44d5ad3c-4030-484a-ba48-200be9a800f6', null, 'FUserId,FIpAddress,FLoginTime,FLastAccessTime,FSessionId,FLanguageId');
java setListFields('21699a22-25f6-4641-9f10-88bc08bb43a8', 'FUserId,FIpAddress,FLoginTime,FLastAccessTime,FLanguageId,FSessionId');

update TsTimer set FAllowConcurrentRun=0 where FId='b018229d-c47d-4f3d-b604-f216c61aff53';

delete from TsTextResource where FId='24b874c7-e3ad-48dc-90c6-25305ca0b710';
delete from TsTextResource where FId='d5e7e8f3-b142-4fd1-8905-325501a0cf3e';
insert into TsTextResource set FId='24b874c7-e3ad-48dc-90c6-25305ca0b710', FCode='E.Qs.WebSocket.NoHttpSession',						FValue='無法獲得 HttpSessoin，不能建立 WebSocket 連接。';
insert into TsTextResource set FId='d5e7e8f3-b142-4fd1-8905-325501a0cf3e', FCode='E.Qs.WebSocket.NotLoggedIn',							FValue='不能建立 WebSocket 連接：您尚未登錄或已被系統斷開。';

--LongUrlArguments

create table TsLongUrlArguments
(
	FId uuid primary key,
	FArguments varchar(1000000),
	FTime timestamp
);

delete from TsScript where FId='f2de8cf4-90ec-419d-8b27-06f66b9d3b1a';

--Menu Number

alter table TsMenu add FCountType varchar(10);
alter table TsMenu add FCountUnitId uuid;
alter table TsMenu add FCountUserField varchar(50);
alter table TsMenu add FCountStatusField varchar(50);
alter table TsMenu add FCountStatus1 varchar(50);
alter table TsMenu add FCountStatus2 varchar(50);
alter table TsMenu add FCountStatus3 varchar(50);
alter table TsMenu add FCountStatus4 varchar(50);
alter table TsMenu add FCountJavaClass varchar(100);

insert into TsField set FId='b301c8c3-1dcd-4533-ba23-75421da668ed', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountJavaClass',    FTitle='統計 Java 類',			FType='InputBox-Text',       FSize=100, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='d152b78e-755b-4a4f-b453-d17235169854', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountStatus1',      FTitle='狀態1',					FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=1,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='f4f3909f-a9e4-46f8-a872-74eefd80e6e1', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountStatus2',      FTitle='狀態2',					FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='229690c8-0dab-4360-81ad-f6051758a229', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountStatus3',      FTitle='狀態3',					FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='a75fc7f3-9da6-4674-91e2-5d153f7779e9', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountStatus4',      FTitle='狀態4',					FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='284eb06b-41ce-46b6-8e19-541287936426', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountStatusField',  FTitle='狀態欄位',				FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='e0e1d55e-fb9f-406c-af31-f29364290217', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountType',         FTitle='統計方式',				FType='ComboBox-SelectOnly', FSize=10,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='952063d7-5438-4acf-945c-71684e47bdfb', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountUnitId',       FTitle='統計單元',				FType='EntityBox',           FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000001', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='3bcf443a-6cf6-440a-86f8-5758c70a11dc', FUnitId='00000000-0000-0000-0001-000000000008', FName='FCountUserField',    FTitle='用戶欄位',				FType='ComboBox-SelectOnly', FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,           FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

insert into TsRelation set FId='0d87c155-b797-4556-a978-ccc6d5b33b7a', FOppositeId='95e5f8cd-0f9f-4129-b1ae-b352a0f68a70', FName='功能表-統計單元',       FOppositeName='統計單元-功能表',       FUnitId1='00000000-0000-0000-0001-000000000008', FUnitId2='00000000-0000-0000-0001-000000000001', FType='field', FTable=null, FField1='FId',       FField2='FCountUnitId', FDeleteAction1='unset',  FDeleteAction2='cancel',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FType,FEnabled', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FShowMenuNameInTab,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine', '數值推送', 'bed706e5-6954-4834-8d08-3f95483d2348', null, 'FCountType', '按欄位統計', 'd05ec7f7-f7e6-444b-946b-25f10f57427a', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountUnitId,FCountUserField,FCountStatusField,FCountStatus1,FCountStatus2,FCountStatus3,FCountStatus4', '特殊統計', 'b952ada0-aad2-4343-9db5-2a89e9035357', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountJavaClass');

insert into TsDictionary set FBuiltin=0, FDescription='', FId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FName='QS-功能表-統計方式', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='e21a364a-ae92-4b11-9251-f7fcfe3dec8c', FIndex=1, FParentValue=null, FText='不統計',     FValue='None';
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='4d8ed9c1-bf79-4362-a1df-ed6fd5b4cb78', FIndex=2, FParentValue=null, FText='按欄位統計', FValue='Field';
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=0, FId='c911eb20-94a5-47c9-862f-de9206185f34', FIndex=3, FParentValue=null, FText='特殊統計',   FValue='Java';

create table TsEntityCountByUserAndStatus
(
	FUnitId			uuid,
	FUserField		varchar(50),
	FUserId			uuid,
	FStatusField	varchar(50),
	FStatus			varchar(50),
	FCount			int,
	FBatch			int
);

create index IsEntityCountByUserAndStatus1 on TsEntityCountByUserAndStatus (FUserId);

insert into TsTimer set FId='10d8ae6e-ada9-4021-ae40-de40e1590817', FName='功能表數位推送', FType='JavaClass', FRoutine='com.jeedsoft.quicksilver.handler.timer.MenuNumberPushRoutine',	    FIntervalLength=5, FIntervalType='minute',  FSystemStartupAction='None',	    FEnabled=1, FBaseTime=timestamp('2014-01-01 00:00:20'), FAllowConcurrentRun=0;

update TsPage set FDialogHeight=558, FLoadHandler='MenuForm.doLoad' where FCode='Qs.Menu.Form';
update TsScript set FUrl='quicksilver/page/menu/MenuForm.js' where FUrl='quicksilver/page/menu/MenuEdit.js';

--rename

update TsDictionary set FName='QS-功能表-頁面開啟模式' where FId='0d8049d6-d50a-4b7c-b411-b276cc234684';
update TsDictionary set FName='QS-功能表-子功能表來源' where FId='7d839ad9-4d8a-493e-8607-541b298287b4';
update TsDictionary set FName='QS-功能表-類型' where FId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e';
update TsDictionaryItem set FText='資料表' where FId='225d88a0-c58a-4aba-a6cd-396b6e39d2bc';

update TsToolSubItem set FName='添加到功能表' where FId='15ee2017-ba37-4b0b-9158-034028a10645';
update TsToolSubItem set FName='添加到功能表' where FId='700efe08-9095-4034-931e-ad7f937dc724';
update TsToolSubItem set FName='添加到功能表' where FId='2bdb1f80-b3a8-4fdb-924b-2da5c0b13505';
update TsToolSubItem set FName='添加到功能表' where FId='4b8a6fa3-13a1-4e18-b208-617788f34454';

update TsUnit set FName='功能表' where FCode='Qs.Menu';
update TsPage set FName='功能表主清單', FTitle='功能表清單' where FCode='Qs.Menu.List';
update TsPage set FName='功能表表單' where FCode='Qs.Menu.Form';
update TsForm set FName='功能表表單' where FId='1b47ee93-6036-4ee7-b569-83c463500497';
update TsList set FName='功能表清單' where FId='891e97b3-bebc-4a56-b88a-8fa3fae71d6c';
update TsMenu set FName='功能表設置' where FId='c6a04d0e-ad88-4319-bb59-b0c53fedaf22';

update TsField set FTitle='父功能表' where FId='2988c06b-d964-4f94-989d-065acd05deeb';
update TsField set FTitle='用子功能表替換本功能表' where FId='252085c9-82e0-4ab2-ab07-d3dae379dd08';
update TsParameterDefinition set FName='功能表寬度' where FCode='QsMenuWidth';

--

update TsUnit set FIcon='quicksilver/image/unit/Menu.png' where FIcon='quicksilver/image/unit/Menu.gif';
update TsPage set FIcon='quicksilver/image/unit/Menu.png' where FIcon='quicksilver/image/unit/Menu.gif';
update TsMenu set FIcon='quicksilver/image/unit/Menu.png' where FIcon='quicksilver/image/unit/Menu.gif';
update TsToolItem set FIcon='quicksilver/image/unit/Menu.png' where FIcon='quicksilver/image/unit/Menu.gif';
update TsToolSubItem set FIcon='quicksilver/image/unit/Menu.png' where FIcon='quicksilver/image/unit/Menu.gif';

--

delete from TsPage where FId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476';
insert into TsPage set FId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476', FName='資料庫索引管理',			FTitle='索引管理',			FCode='Qs.Misc.DatabaseIndexManage',      FType='Other', FIcon=null,												FUrl='quicksilver/page/misc/DatabaseIndexManage.jsp',			FActionMethodName='Qs.Misc.prepareDatabaseIndexManage',				FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsToolItem where FPageId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476';
insert into TsToolItem set FId='51fab27c-4ac5-49d8-9f94-63b05bd79029', FPageId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476', FCode='DataSource',		FName='',			FLabel='資料來源',	FType='ComboBox-SelectOnly', FAlign='left',  FIndex=1, FWidth=120, FDefaultEventHandler='',									FIcon='',									FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType=null,         FHandlePageId=null;
insert into TsToolItem set FId='f5579111-9c1b-4f9b-8d05-4f4100c446b2', FPageId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476', FCode='Refresh',			FName='刷新',		FLabel='',			FType='Button',              FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='DatabaseIndexManage.doRefresh',	FIcon='quicksilver/image/16/Refresh.gif',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsMenu where FId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb';
delete from TsMenu where FId='69123f8e-33fe-47f4-9861-49a6d6dae398';
insert into TsMenu set FId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb', FParentId='00000000-0000-0000-0008-990000000020',	FIndex=5,	FName='資料庫',			FPageId=null,                                   FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/16/Database.png';
insert into TsMenu set FId='69123f8e-33fe-47f4-9861-49a6d6dae398', FParentId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb',	FIndex=1,	FName='索引管理',		FPageId='f08bd6f2-8c84-44fe-b53b-ea9e2a457476',	FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/16/DatabaseAndIndex.png';

update TsMenu set FParentId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb', FIndex='2' where FId='ed4986eb-eff5-458c-b890-eabbb3a40818';
update TsMenu set FParentId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb', FIndex='3' where FId='86e31886-b161-4b0b-a98f-6ea1dcd99fe6';
