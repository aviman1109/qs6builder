--lei.lei TsMenu-----------------------------------------------------------

----TsMenu新增欄位
--FType
alter table TsMenu add  FType varchar(20);
insert into TsField set FId='7efbee15-26f2-4499-bf83-fb6a64e8669d', FUnitId='00000000-0000-0000-0001-000000000008', FName='FType',              FTitle='類型',					FType='ComboBox-SelectOnly', FSize=20,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='InternalPage';

insert into TsDictionary set FId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FName='QS-菜單-類型', FBuiltin=0, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FId='9f4d2bc7-09e9-4f4d-a405-8bddfd77feb8', FIndex=1, FParentValue=null, FText='內部頁面', FValue='InternalPage';
insert into TsDictionaryItem set FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FId='41f6323b-7092-4196-b13f-341ad8848dd9', FIndex=2, FParentValue=null, FText='外部頁面', FValue='ExternalPage';
insert into TsDictionaryItem set FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FId='b98759ab-8784-44f1-97e4-fec4e71109c3', FIndex=3, FParentValue=null, FText='函數',     FValue='Function';

--FOpenMode
alter table TsMenu add  FOpenMode varchar(20);
insert into TsField set FId='2c59213c-cde7-4456-ae67-71fb10215e43', FUnitId='00000000-0000-0000-0001-000000000008', FName='FOpenMode',          FTitle='頁面開啟模式',			FType='ComboBox-SelectOnly', FSize=20,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='0d8049d6-d50a-4b7c-b411-b276cc234684', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='Tab';
insert into TsDictionary set FId='0d8049d6-d50a-4b7c-b411-b276cc234684', FName='QS-左菜單-頁面開啟模式', FBuiltin=0, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='0d8049d6-d50a-4b7c-b411-b276cc234684', FId='b2ec1d42-abee-418c-bf59-2de2a1208f3a', FIndex=1, FParentValue=null, FText='Tab',    FValue='Tab';
insert into TsDictionaryItem set FDictionaryId='0d8049d6-d50a-4b7c-b411-b276cc234684', FId='29deae15-a166-4015-ab1d-4d21ede71f89', FIndex=2, FParentValue=null, FText='Window', FValue='Window';

--FExternalPageUrl
alter table TsMenu add FExternalPageUrl varchar(500);
insert into TsField set FId='5801fd36-519b-46ae-b681-a1421a67ca74', FUnitId='00000000-0000-0000-0001-000000000008', FName='FExternalPageUrl',   FTitle='外部頁面網址',			FType='InputBox-Url',        FSize=500,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null;
-----資料轉移
update TsMenu set FType='Function' where FFunctionName is not null;
update TsMenu set FType='InternalPage' where FPageId is not null;
update TsMenu set FType='ExternalPage' where FPageAddress  is not null and FFunctionName is null and  FPageId is  null;
update TsMenu set FExternalPageUrl = FPageAddress where FPageAddress  is not null and FFunctionName is null and  FPageId is  null;
update TsMenu set FOpenMode = 'Tab' where FOpenModel='TAB';
update TsMenu set FOpenMode = 'Window' where FOpenModel='BROWSER';


-----刪除欄位FExternalPage,FPageAddress ,FOpenModel及對應數據字典
alter table TsMenu drop column FExternalPage;
alter table TsMenu drop column FPageAddress;
alter table TsMenu drop column FOpenModel;

delete from TsField where FId='ea6b511e-71c3-469b-9b48-ab79cdafc796';
delete from TsField where FId='062e286e-86e8-4292-9102-868a14177e9a';
delete from TsField where FId='a860e3d1-1ad9-4a8e-8c23-bc45142247bd';

--FOpenModel對應數據字典
delete from TsDictionary where  FId='11ffea95-0142-4d6d-a44d-db8e10356d80';
delete from TsDictionaryItem where FId='c42d0e6a-ecb1-4752-8fad-5181705fe549';
delete from TsDictionaryItem where FId='76d952fa-b6f7-4632-93be-9ed4fc1d8d15';

------欄位分組排位
java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FEnabled,FShowMenuNameInTab,FType', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine');
java setListFields('891e97b3-bebc-4a56-b88a-8fa3fae71d6c', 'FName,FTreeSerial,FType,FPageId,FFunctionName');
