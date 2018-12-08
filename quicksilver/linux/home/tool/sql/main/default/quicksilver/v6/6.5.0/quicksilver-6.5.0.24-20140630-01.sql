--lei.lei

-----1. 刪除欄位 FURLAddress,FEncryption,FOpenModel,FDefaultOpen,FImage,FModel
alter table TsDataLink drop column FURLAddress;
alter table TsDataLink drop column FEncryption;
alter table TsDataLink drop column FOpenModel;
alter table TsDataLink drop column FDefaultOpen;
alter table TsDataLink drop column FImage;
alter table TsDataLink drop column FModel;
                               
delete from TsField where FId='d6ca1d84-f8a0-4d0c-820a-5fccb5baadf5';
delete from TsField where FId='0e72b04b-12dd-45df-a799-56a20c071c2e';
delete from TsField where FId='81747d1e-f6e9-4e84-9977-55a8e3242b1c';
delete from TsField where FId='b448b87d-610e-470e-adaf-d6ace98edf7b';
delete from TsField where FId='74d93d96-6535-4baf-9cbe-84d85e02ac4a';
delete from TsField where FId='cd3ba57d-e88b-4fef-8325-168d5e9eb6b2';


----1. 新增欄位 FUrlAddress,FEncrypt,FOpenMode,FEnabled,FIcon ,FFunctionName
alter table TsDataLink add  FUrlAddress varchar(500);
alter table TsDataLink add  FEncrypt bit;
alter table TsDataLink add  FOpenMode varchar(20);
alter table TsDataLink add  FEnabled bit;
alter table TsDataLink add  FIcon varchar(100);
alter table TsDataLink add  FFunctionName varchar(500);

delete from TsField where FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f' and FName='FUrlAddress';
insert into TsField set FId='aa8e47fa-11eb-4624-ae65-37c097399501', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FEnabled',      FTitle='啟用',    FType='CheckBox',         FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='true', FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;
insert into TsField set FId='616a379f-4072-44f3-9965-d38d0318e987', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FEncrypt',      FTitle='加密',    FType='CheckBox',         FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;                                 
insert into TsField set FId='daa77ef7-716b-4180-81c0-328bf1ce3fea', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FFunctionName', FTitle='函數',    FType='InputBox-Text',    FSize=500,  FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=3, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;
insert into TsField set FId='9073ff83-6ef8-4b60-83e0-24a7d0f70ec6', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FIcon',         FTitle='圖示',    FType='InputBox-Text',    FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=3, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;
insert into TsField set FId='4cfccdfc-e006-47e7-8f92-384673a89b73', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FOpenMode',     FTitle='模式',    FType='RadioBox',         FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=2, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='SlavePage', FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;
insert into TsField set FId='7412c24f-fdd1-48f2-804d-821fd7812714', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='FUrlAddress',   FTitle='url地址', FType='InputBox-Url',     FSize=500,  FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=3, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;


----2. 導入數據 FUrlAddress,FOpenMode,FDefaultOpen,FImage,FModel
--update TsDataLink set FUrlAddress = FURLAddress, FEncrypt = FEncryption, FOpenMode = FModel,FEnabled = FDefaultOpen,FIcon = FImage;




----4. 刪除數據字典
delete from TsDictionary where FId='61484ac1-d88f-4acc-ad9e-92855bc6de59';
delete from TsDictionaryItem where FId='74312286-a72a-4b60-a393-54bf68cd926f';
delete from TsDictionaryItem where FId='6922cce2-4571-4875-bad0-c2582b74f059';
delete from TsDictionaryItem where FId='52c9ced6-acc7-4e42-af00-f2782306a078';

delete from TsDictionary where FId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc';
delete from TsDictionaryItem where FId='73855665-0a49-4b0e-a45d-08d74102c139';
delete from TsDictionaryItem where FId='6c5e8d2f-b86f-4d59-b41f-b123476937bb';
delete from TsDictionaryItem where FId='03d80bbd-c5bb-479c-bec5-47b6ab636644';

insert into TsDictionary set FBuiltin=0, FDescription='', FId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc', FName='QS-資料鏈接-開啟模式', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc', FEnabled=1, FId='73855665-0a49-4b0e-a45d-08d74102c139', FIndex=1, FParentValue=null, FText='頁簽',   FValue='Tab';
insert into TsDictionaryItem set FDictionaryId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc', FEnabled=1, FId='6c5e8d2f-b86f-4d59-b41f-b123476937bb', FIndex=2, FParentValue=null, FText='新視窗', FValue='Window';
insert into TsDictionaryItem set FDictionaryId='8dbfa435-8b66-41c1-9a43-cce51de0d8dc', FEnabled=1, FId='03d80bbd-c5bb-479c-bec5-47b6ab636644', FIndex=3, FParentValue=null, FText='子頁簽', FValue='SlavePage';

-----5.其它

delete from TsUnit where FId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';
insert into TsUnit set FId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FCode='Qs.DataLink', FName='資料鏈接', FIcon='quicksilver/image/unit/New.gif', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='System', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=0, FMasterUnitId=null, FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=1, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable='TsDataLink', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.datalink.DataLinkHome', FDaoClassName='com.jeedsoft.quicksilver.datalink.dao.impl.DataLinkDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.datalink.service.impl.DataLinkServiceImpl', FActionClassName='com.jeedsoft.quicksilver.datalink.action.impl.DataLinkActionImpl', FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';


delete from TsRelation where FId='9979a43b-53e7-416f-b825-bb3d2c7ebd22';
delete from TsRelation where FId='53f93137-1958-4425-a867-05567633f345';
insert into TsRelation set FId='53f93137-1958-4425-a867-05567633f345', FOppositeId='831739b3-90b0-480d-ab1e-27ef01833e57', FName='資料鏈接-單元', FOppositeName='單元-資料鏈接', FUnitId1='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FUnitId2='00000000-0000-0000-0001-000000000001', FType='field', FTable=null, FField1='FId', FField2='FUnitId', FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;


delete from TsPage where FId='417a050a-5e82-4cad-8b2c-4b776d560781';
delete from TsPage where FId='63a781e5-8817-49f7-9fc7-e4cbbf1cffd6';
delete from TsPage where FId='d0c87f85-d3b9-4c56-ad0b-85d50cfcc38c';
delete from TsPage where FId='d0c87f85-d3b9-4c56-ad0b-85d50cfcc38c';

delete from TsPage where FId='752df0a5-d639-4adc-bf41-df9a036ee1d3';
delete from TsPage where FId='158ffec6-f270-4fd4-8496-0baa618ed879';
delete from TsPage where FId='1a464f81-11e4-4f29-9727-e30912a6316d';
delete from TsPage where FCode='Qs.DataLink.Form';

insert into TsPage set FId='752df0a5-d639-4adc-bf41-df9a036ee1d3', FName='資料鏈接選擇列表', FTitle='資料鏈接列表', FCode='Qs.DataLink.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.DataLink.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0, FQueryFormAutoQuery=1, FHasViewFrame=0, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='', FVisible=1, FVisibleCondition=null, FDescription='', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e';
insert into TsPage set FId='158ffec6-f270-4fd4-8496-0baa618ed879', FName='資料鏈接主列表',   FTitle='資料鏈接列表', FCode='Qs.DataLink.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.DataLink.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0, FQueryFormAutoQuery=1, FHasViewFrame=0, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='', FVisible=1, FVisibleCondition=null, FDescription='', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e';
insert into TsPage set FId='1a464f81-11e4-4f29-9727-e30912a6316d', FName='資料鏈接排序',     FTitle='排序',         FCode='Qs.DataLink.Sort',       FPlatform='Computer', FType='Sort',       FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/template/Sorter.jsp',     FActionMethodName='Qs.DataLink.prepareSort', FLoadHandler=null, FRelationId=null, FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0, FQueryFormAutoQuery=0, FHasViewFrame=0, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='', FVisible=1, FVisibleCondition=null, FDescription='', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e';
insert into TsPage set FId='52de789f-a329-4a43-8cee-9136f031b190', FName='資料鏈接表單',     FTitle='表單',         FCode='Qs.DataLink.Form',       FPlatform='Computer', FType='EntityForm', FIcon='quicksilver/image/unit/Form.png', FUrl='quicksilver/page/template/EntityForm.jsp', FActionMethodName='Qs.DataLink.prepareForm', FLoadHandler=null, FRelationId=null, FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FMasterUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FIsSlavePage=1, FIndex=1,    FDialogWidth=null, FDialogHeight=500,  FDialogMaximized=0, FQueryFormAutoQuery=0, FHasViewFrame=0, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='', FVisible=1, FVisibleCondition=null, FDescription='', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e';

--資料鏈接選擇列表
delete from TsToolItem where FId='3a4da0cf-1311-4184-b194-8d5c1d24f972';
delete from TsToolItem where FId='a4ec2884-5422-4df5-b553-2b4e48793ebd';
delete from TsToolItem where FId='fd3af17f-611c-4a49-a676-c3ba418e7b8d';

delete from TsToolItem where FId='9b13dc7f-8ccd-4e85-8b99-1befb23f3863';
delete from TsToolItem where FId='42ae1f3f-d9d6-45ae-b970-dcf2430d13fe';
delete from TsToolItem where FId='945f570e-f884-4441-8a70-26f55b2a40f4';

insert into TsToolItem set FId='9b13dc7f-8ccd-4e85-8b99-1befb23f3863', FPageId='752df0a5-d639-4adc-bf41-df9a036ee1d3', FCode='ConfirmSelection', FName='確定', FHint=null,                                                   FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Ok.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='42ae1f3f-d9d6-45ae-b970-dcf2430d13fe', FPageId='752df0a5-d639-4adc-bf41-df9a036ee1d3', FCode='Add',              FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Add.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='945f570e-f884-4441-8a70-26f55b2a40f4', FPageId='752df0a5-d639-4adc-bf41-df9a036ee1d3', FCode='Open',             FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Open.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';


--資料鏈接主列表
delete from TsToolItem where FId='26dec3a2-83fa-464f-bb4c-ee0658b45fe8';
delete from TsToolItem where FId='d9f8d50f-5738-42d9-b205-fd5a23ad494d';
delete from TsToolItem where FId='053bbadf-69e1-43da-9b40-8241eb49a0d4';
delete from TsToolItem where FId='3b690e67-36fb-4518-b0cd-ceab79cdf037';
delete from TsToolItem where FId='c5dda9fd-f58e-4b89-9aca-29f24177e237';
delete from TsToolSubItem where FId='0b15ca94-1571-4d82-a39d-bcce5a9b011c';
delete from TsToolSubItem where FId='32613b62-d071-4c65-b36b-5bc285a4dfbb';
delete from TsToolSubItem where FId='d7bc214a-a3e0-447c-b86a-1be1c3075312';
delete from TsToolSubItem where FId='a22a7998-386b-4b2f-bfdd-fcd49506aca1';

delete from TsToolItem where FId='f8d9b294-fbc8-4f37-ae3a-de7e2d80de8d';
delete from TsToolItem where FId='9a56eb09-072d-460e-ad52-e27a71f1bec0';
delete from TsToolItem where FId='5efafac5-c4d9-41a0-a31d-69bcb52d076e';
delete from TsToolItem where FId='1ae13375-3aaf-4029-b42a-9d6d6d27d876';
delete from TsToolItem where FId='c0c7321e-62c8-4ed0-b39d-22b736507aa1';
delete from TsToolSubItem where FId='22283bea-4cc8-4480-bb9d-f2e03566694b';
delete from TsToolSubItem where FId='99b6d25c-a130-4f6a-8ae4-1ab856c4db5f';
delete from TsToolSubItem where FId='59ec4509-6b44-4d7c-a515-4b1849ddf5d1';
delete from TsToolSubItem where FId='f8309a35-e740-494e-abf7-01d68310de84';
delete from TsToolSubItem where FId='fd05988d-d873-4c37-b761-9d998c013bdb';

insert into TsToolItem set FId='f8d9b294-fbc8-4f37-ae3a-de7e2d80de8d', FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FCode='Add',     FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='9a56eb09-072d-460e-ad52-e27a71f1bec0', FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='5efafac5-c4d9-41a0-a31d-69bcb52d076e', FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='1ae13375-3aaf-4029-b42a-9d6d6d27d876', FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FCode='Other',   FName=null,   FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='22283bea-4cc8-4480-bb9d-f2e03566694b', FToolItemId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FCode='Sort',        FName='排序',       FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.png',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doSort';
insert into TsToolSubItem set FId='99b6d25c-a130-4f6a-8ae4-1ab856c4db5f', FToolItemId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FCode='Splitter1',   FName='-',          FExpandMode='None', FIndex=2, FIcon=null,                              FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FEventHandler=null;
insert into TsToolSubItem set FId='59ec4509-6b44-4d7c-a515-4b1849ddf5d1', FToolItemId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FCode='Import',      FName='導入',       FExpandMode='None', FIndex=3, FIcon='quicksilver/image/16/Import.png', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doImport';
insert into TsToolSubItem set FId='f8309a35-e740-494e-abf7-01d68310de84', FToolItemId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FCode='ExcelExport', FName='匯出 Excel', FExpandMode='None', FIndex=4, FIcon='quicksilver/image/16/Excel.png',  FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doExcelExport';
insert into TsToolSubItem set FId='fd05988d-d873-4c37-b761-9d998c013bdb', FToolItemId='c0c7321e-62c8-4ed0-b39d-22b736507aa1', FCode='BillPrint',   FName='單據列印',   FExpandMode='None', FIndex=5, FIcon='quicksilver/image/unit/Bill.png', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doBillPrint';


--資料鏈接排序
delete from TsToolItem where FId='6155d315-cdb3-4b0c-80e7-87fdb76f47d6';
delete from TsToolItem where FId='48191f9f-f77c-4d2d-af62-aa396d3254c5';
delete from TsToolItem where FId='34b84928-eadb-472f-8058-99a8513da195';
delete from TsToolItem where FId='26a131e0-98b4-46f7-8876-285fcc7cf3b8';
delete from TsToolItem where FId='385bb0ca-acc6-4520-b9de-4ddc96b63241';


delete from TsToolItem where FId='9415e007-3ab4-49da-b9a6-675c807aca54';
delete from TsToolItem where FId='129e25fa-03ae-41ee-8076-ffba634ad6ea';
delete from TsToolItem where FId='522494f1-be4c-4cd6-838e-629caf68caa8';
delete from TsToolItem where FId='a8257be3-1e97-451f-9488-b242566b31bd';
delete from TsToolItem where FId='b0c66234-3593-4673-af92-cb8545cd6f64';

insert into TsToolItem set FId='9415e007-3ab4-49da-b9a6-675c807aca54', FPageId='1a464f81-11e4-4f29-9727-e30912a6316d', FCode='MoveUp',     FName='上升', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=1, FWidth=0, FIcon='quicksilver/image/16/MoveUp.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveUp';
insert into TsToolItem set FId='129e25fa-03ae-41ee-8076-ffba634ad6ea', FPageId='1a464f81-11e4-4f29-9727-e30912a6316d', FCode='MoveDown',   FName='下降', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=2, FWidth=0, FIcon='quicksilver/image/16/MoveDown.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveDown';
insert into TsToolItem set FId='522494f1-be4c-4cd6-838e-629caf68caa8', FPageId='1a464f81-11e4-4f29-9727-e30912a6316d', FCode='MoveTop',    FName='置頂', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=3, FWidth=0, FIcon='quicksilver/image/16/MoveTop.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveTop';
insert into TsToolItem set FId='a8257be3-1e97-451f-9488-b242566b31bd', FPageId='1a464f81-11e4-4f29-9727-e30912a6316d', FCode='MoveBottom', FName='置底', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=4, FWidth=0, FIcon='quicksilver/image/16/MoveBottom.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveBottom';
insert into TsToolItem set FId='b0c66234-3593-4673-af92-cb8545cd6f64', FPageId='1a464f81-11e4-4f29-9727-e30912a6316d', FCode='Save',       FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doSave';

--資料鏈接表單
delete from TsScript where FId='cd4c4ed1-590e-45de-bced-cf14e28f4754';
delete from TsToolItem where FId='23888627-2e1e-4b1b-8f08-8a741ae1e036';
delete from TsToolItem where FId='bd0de481-c946-4829-b509-29b8e1f47750';
delete from TsToolSubItem where FId='c18849bd-0f33-4688-89ac-c13e21ab6392';


delete from TsToolItem where FId='23383b01-7d9e-4505-91ec-7d694d5acbf5';
delete from TsToolItem where FId='c5b9e664-0734-4305-841f-a61285549ee4';
delete from TsToolSubItem where FId='28840273-601b-4c50-88af-9c7a500d868d';

insert into TsToolItem set FId='23383b01-7d9e-4505-91ec-7d694d5acbf5', FPageId='52de789f-a329-4a43-8cee-9136f031b190', FCode='Save',  FName='保存', FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';
insert into TsToolItem set FId='c5b9e664-0734-4305-841f-a61285549ee4', FPageId='52de789f-a329-4a43-8cee-9136f031b190', FCode='Other', FName=null,   FHint=null, FLabel=null, FType='ComboButton', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Other.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='28840273-601b-4c50-88af-9c7a500d868d', FToolItemId='c5b9e664-0734-4305-841f-a61285549ee4', FCode='BillPrint', FName='單據列印', FExpandMode='None', FIndex=1, FIcon='quicksilver/image/unit/Bill.png', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityForm.doBillPrint';


delete from TsForm where FId='04659731-6687-451a-827f-a9f46278db02';
delete from TsForm where FId='8bc5d730-50f7-4191-92b6-15527c9c0921';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='8bc5d730-50f7-4191-92b6-15527c9c0921', FIndex=1, FName='默認', FPageId=null, FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';



delete from TsList where FId='af468b40-d50f-494d-bfd7-40d700ad955d';
delete from TsList where FId='0165c301-b464-4e68-b559-61eb635e92b7';
delete from TsList where FId='5837f91a-4eba-43aa-ad70-6d984af7c40a';

delete from TsList where FId='88c082d1-e239-4f52-a291-5aecd100574b';
delete from TsList where FId='d4e85855-a9f3-4127-8e94-ae7d3269c946';
delete from TsList where FId='ea060419-167c-49f9-8c84-4044a56cadd1';

insert into TsList set FDefault=1, FId='88c082d1-e239-4f52-a291-5aecd100574b', FIndex=null, FMultiPage=1, FName='資料鏈接列表',     FPageId=null,                                   FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';
insert into TsList set FDefault=0, FId='d4e85855-a9f3-4127-8e94-ae7d3269c946', FIndex=null, FMultiPage=1, FName='資料鏈接選擇列表', FPageId='752df0a5-d639-4adc-bf41-df9a036ee1d3', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';
insert into TsList set FDefault=0, FId='ea060419-167c-49f9-8c84-4044a56cadd1', FIndex=null, FMultiPage=1, FName='資料鏈接首頁列表', FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';


delete from TsPrivilege where FId='b825d047-aa34-437f-a511-ae6c2c9207a3';

delete from TsPrivilege where FId='4e734c68-e4a2-4b0a-ae4b-c844edc1bf16';
delete from TsPrivilege where FId='ff364aba-f662-4a86-a611-21700c36572f';
delete from TsPrivilege where FId='b3529c52-31e8-4c7f-9140-23303dcf2007';
delete from TsPrivilege where FId='1bba60bc-20d3-4a97-8156-cbb2c1106372';

insert into TsPrivilege set FId='4e734c68-e4a2-4b0a-ae4b-c844edc1bf16', FName='資料鏈接修改', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000003', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='ff364aba-f662-4a86-a611-21700c36572f', FName='資料鏈接刪除', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000004', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='b3529c52-31e8-4c7f-9140-23303dcf2007', FName='資料鏈接新增', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000001', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='1bba60bc-20d3-4a97-8156-cbb2c1106372', FName='資料鏈接查看', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000002', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;


delete from TsQuerySchema where FId='1743493b-3278-410b-9021-70934068c4f4';
delete from TsQuerySchema where FId='6ca3ff4e-9ed9-45db-bf1a-25442d3878f9';
delete from TsMenu where FId='241e6934-fdf1-4434-a1f9-c9d6b497f5c1';


delete from TsQuerySchema where FId='3b0e5d12-e898-4af1-a56c-093b118d8945';
delete from TsMenu where FId='3041e04e-0bc7-4b80-80c3-e292230a45ff';
delete from TsCondition where FId='cc6f0fb6-a166-489c-9e7e-c39ba63ad037';
delete from TsConditionPart where FId='35481876-46b6-4ee8-ab24-1821db655408';

insert into TsQuerySchema set FId='3b0e5d12-e898-4af1-a56c-093b118d8945', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f', FName='全部資料鏈接',     FType='condition',  FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId=null, FConditionId=null,                                   FSqlSource='None', FSql=null, FIndex=2, FUpdateTime=null, FOriginSchemaId=null, FParentId=null;
insert into TsCondition set FId='cc6f0fb6-a166-489c-9e7e-c39ba63ad037', FUnitId='71a3a0a5-47bd-4320-80f8-399cdc98db6f';
insert into TsConditionPart set FId='35481876-46b6-4ee8-ab24-1821db655408', FConditionId='cc6f0fb6-a166-489c-9e7e-c39ba63ad037', FGroupId=null, FIndex=1, FFieldName='FDepartmentId', FOperator='CurrentDeptWithSub', FValue=null, FText=null;
insert into TsMenu set FArguments='', FEnabled=1, FExternalPageUrl=null, FFunctionName=null, FIcon='quicksilver/image/unit/SerialNumberPart.gif', FId='3041e04e-0bc7-4b80-80c3-e292230a45ff', FIndex=8, FLicensed=1, FName='資料鏈接', FOpenMode=null, FPageId='158ffec6-f270-4fd4-8496-0baa618ed879', FParentId='00000000-0000-0000-0008-990000000010', FQueryFormHidden=0, FQuerySchemaId=null, FQuerySchemaLocked=0, FReplaceByChildren=0, FSubMenuRoutine='', FSubMenuSource='MenuTable', FTabTitle=null, FTabTitleSource='PageTitle', FTreeLevel=3, FTreeSerial='002.001.008', FType='InternalPage';




java setFormFields('8bc5d730-50f7-4191-92b6-15527c9c0921', '基本資訊', '1809bec3-aa94-4765-b056-087054ce0b24', null, 'FName,FEnabled,FEncrypt,FUrlAddress,FOpenMode,FUnitId,FIcon,FNote', '函數', '6b625150-416b-4ec5-840b-e6489442c585', '1809bec3-aa94-4765-b056-087054ce0b24', 'FFunctionName', '管理', 'ff35f01f-082d-4a77-b4ca-8d2b307d0e86', null, '');
java setOrderFields('71a3a0a5-47bd-4320-80f8-399cdc98db6f', 'FIndex', '0');
java setQueryFormFields('71a3a0a5-47bd-4320-80f8-399cdc98db6f', 'FName');
java setListFields('88c082d1-e239-4f52-a291-5aecd100574b', 'FName,FEnabled,FEncrypt,FFunctionName,FIcon,FNote,FOpenMode,FUnitId,FUrlAddress');
java setListFields('d4e85855-a9f3-4127-8e94-ae7d3269c946', 'FName');
java setListFields('ea060419-167c-49f9-8c84-4044a56cadd1', 'FName');
java setImportTemplateFields('71a3a0a5-47bd-4320-80f8-399cdc98db6f', 'FName,FEnabled,FEncrypt,FUrlAddress,FOpenMode,FUnitId,FIcon,FNote,FFunctionName');

