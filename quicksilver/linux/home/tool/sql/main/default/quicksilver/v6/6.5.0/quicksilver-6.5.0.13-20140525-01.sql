--minglei

insert into TsDictionary set FId='7041c8e0-55dc-4649-9fd6-b05001bfbaa2', FName='QS-功能表-頁簽標題來源', FBuiltin=1, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='7041c8e0-55dc-4649-9fd6-b05001bfbaa2', FId='5db46d31-fbab-4436-a4d7-9e1f3149280f', FIndex=1, FParentValue=null, FText='內部頁面標題',	FValue='PageTitle';
insert into TsDictionaryItem set FDictionaryId='7041c8e0-55dc-4649-9fd6-b05001bfbaa2', FId='74e98c2e-3bbe-47a6-bffb-22b648dd5145', FIndex=2, FParentValue=null, FText='功能表名稱',		FValue='MenuName';
insert into TsDictionaryItem set FDictionaryId='7041c8e0-55dc-4649-9fd6-b05001bfbaa2', FId='49203735-9525-4b85-bc81-da256f72c610', FIndex=3, FParentValue=null, FText='自訂',			FValue='Custom';

alter table TsMenu add FTabTitleSource varchar(10);
alter table TsMenu add FTabTitle varchar(50);
alter table TsMenu add FQueryFormHidden bit;

update TsMenu set FTabTitleSource='MenuName' where FTabTitleSource is null and FShowMenuNameInTab=1;
update TsMenu set FTabTitleSource='PageTitle' where FTabTitleSource is null;

insert into TsField set FId='93b4b602-9377-4864-a12f-62474316b078', FUnitId='00000000-0000-0000-0001-000000000008', FName='FTabTitleSource',	FTitle='標題來源',				FType='ComboBox-SelectOnly', FSize=10,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='7041c8e0-55dc-4649-9fd6-b05001bfbaa2', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='PageTitle';
insert into TsField set FId='ebbc6401-a5cd-4e48-9c69-ab902602d370', FUnitId='00000000-0000-0000-0001-000000000008', FName='FTabTitle',			FTitle='標題',					FType='InputBox-Text',       FSize=50,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FValidation=null, FRelationCapacity=null, FSupportI18n=1;
insert into TsField set FId='1293acb1-eda3-42ed-8cf5-f0f3a2a861c0', FUnitId='00000000-0000-0000-0001-000000000008', FName='FQueryFormHidden',	FTitle='隱藏查詢表單',			FType='CheckBox',            FSize=0,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FValidation=null;

delete from TsField where FUnitId='00000000-0000-0000-0001-000000000008' and FName='FShowMenuNameInTab';
update TsField set FTitle='隱藏查詢方案框' where FUnitId='00000000-0000-0000-0001-000000000008' and FName='FQuerySchemaLocked';

java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FType,FEnabled', '頁簽', '959840c4-fce5-406d-b761-f7ca735a77cd', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FTabTitleSource,FTabTitle', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FQueryFormHidden,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine', '數值推送', 'bed706e5-6954-4834-8d08-3f95483d2348', null, 'FCountType', '按欄位統計', 'd05ec7f7-f7e6-444b-946b-25f10f57427a', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountUnitId,FCountUserField,FCountStatusField,FCountStatus1,FCountStatus2,FCountStatus3,FCountStatus4', '特殊統計', 'b952ada0-aad2-4343-9db5-2a89e9035357', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountJavaClass');
