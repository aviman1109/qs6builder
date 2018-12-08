--lei.lei
insert into TsDictionary set FBuiltin=0, FDescription='', FId='11ffea95-0142-4d6d-a44d-db8e10356d80', FName='外部頁面開始模式', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='11ffea95-0142-4d6d-a44d-db8e10356d80', FId='c42d0e6a-ecb1-4752-8fad-5181705fe549', FIndex=1, FParentValue=null, FText='TAB', FValue='TAB';
insert into TsDictionaryItem set FDictionaryId='11ffea95-0142-4d6d-a44d-db8e10356d80', FId='76d952fa-b6f7-4632-93be-9ed4fc1d8d15', FIndex=2, FParentValue=null, FText='BROWSER',  FValue='BROWSER';

alter table TsMenu  add column FExternalPage bit;
alter table TsMenu  add column FPageAddress varchar(500);
alter table TsMenu  add column FOpenModel varchar(20);

insert into TsField set FId='ea6b511e-71c3-469b-9b48-ab79cdafc796', FUnitId='00000000-0000-0000-0001-000000000008', FName='FExternalPage',      FTitle='是否外部頁面',         FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='a860e3d1-1ad9-4a8e-8c23-bc45142247bd', FUnitId='00000000-0000-0000-0001-000000000008', FName='FOpenModel',         FTitle='外部開啟模式',         FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='11ffea95-0142-4d6d-a44d-db8e10356d80', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='062e286e-86e8-4292-9102-868a14177e9a', FUnitId='00000000-0000-0000-0001-000000000008', FName='FPageAddress',       FTitle='外部網址',             FType='InputBox-Url',        FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                                  FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=2, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FEnabled,FShowMenuNameInTab', '頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPage,FOpenModel,FPageAddress,FPageId,FQuerySchemaId,FQuerySchemaLocked,FArguments', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine');
java setListFields('891e97b3-bebc-4a56-b88a-8fa3fae71d6c', 'FName,FTreeSerial,FPageId,FFunctionName,FExternalPage,FPageAddress,FOpenModel');
