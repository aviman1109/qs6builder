﻿update TsField set FColSpan=1 where FId='7f2b3405-b99c-462d-b631-46fc65e18c9d';
update TsField set FListWidth=200 where FId='3d9e7548-3b6d-48d8-ba4a-13a3c2a6fb00';
update TsField set FListWidth=200 where FId='2612affd-d625-4b9a-a8d9-9043016b21d1';
update TsField set FListWidth=200 where FId='7f2b3405-b99c-462d-b631-46fc65e18c9d';
update TsField set FTitle='調用目標' where FId='dfcf0dc5-3fa4-4999-84ff-46beef815e01';

alter table TsLocalApiGroup add FHandlerClassName varchar(100);
insert into TsField set FId='ba9d467a-9701-47d2-b619-d52f144b3189', FUnitId='2c53f550-63e5-4e41-ad9a-a71dcc1741c0', FName='FHandlerClassName',     FTitle='處理類',           FType='InputBox-Text',       FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=2, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setFormFields('6b21c284-9b4c-4d03-8309-4fafe91a87ab', '基本資訊', '1093047f-216c-4919-a25e-834624cfc224', null, 'FName,FCode,FAuthType,FHandlerClassName,FEnabled', '請求與回應', 'b699abe6-b551-4da3-b02a-d7d282a2a0bd', '1093047f-216c-4919-a25e-834624cfc224', 'FRequestFormat,FResponseFormat,FIsStandardResponse', '描述', '7904e0a1-b271-4342-83c7-ecc1fbd434f6', '1093047f-216c-4919-a25e-834624cfc224', 'FDescription');
java setListFields('44938da4-5b87-4c37-92f1-6c5a8680699d', 'FName,FCode,FEnabled,FAuthType,FRequestFormat,FResponseFormat,FHandlerClassName');
java setListFields('58746c76-e9fc-4f23-8861-e2ecef54e6b7', 'FName,FCode,FEnabled,FAuthType,FRequestFormat,FResponseFormat,FHandlerClassName');
java setListFields('7ff8d491-135c-4ea2-8a1d-127309834ca5', 'FName,FCode,FEnabled,FAuthType,FRequestFormat,FResponseFormat,FHandlerClassName');

alter table TsLocalApi add FTargetType varchar(20);
alter table TsLocalApi add FHandleType varchar(20);
update TsLocalApi set FTargetType='ActionMethod' where FTargetType is null;
update TsLocalApi set FHandleType='Partial' where FHandleType is null;
insert into TsField set FId='caccce77-183b-4069-b177-0b0436853af6', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FTargetType',         FTitle='調用目標類型',             FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='84c37206-ab23-406a-9676-5c6d8d8fbc27', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType='ServerValue', FDefaultValue='ApiMethod', FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='92cd4186-d034-48ee-8b80-165fc80d24b6', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FHandleType',         FTitle='處理方式',                 FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='f11d295b-bd28-4e09-ae88-e7ed8aa55bb1', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=2, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType='ServerValue', FDefaultValue='Partial',   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setFormFields('81b46101-ea7e-4ac7-b5d3-32b49fecb34b', '基本資訊', '9963a399-3970-4a03-93f6-a1c3dc56bbac', null, 'FPath,FLocalApiGroupId,FEnabled', '調用目標', '368c6128-06ab-49e5-8628-34e88b96b3a7', '9963a399-3970-4a03-93f6-a1c3dc56bbac', 'FTargetType,FTarget', '請求與回應', 'e19de462-292c-4327-936a-ab7487d2ebc8', '9963a399-3970-4a03-93f6-a1c3dc56bbac', 'FHandleType,FEnableRrConfig,FRequestFormat,FResponseFormat,FIsStandardResponse', '描述', '57f6d63b-2d9a-4ece-864b-bc5af8d5600f', '9963a399-3970-4a03-93f6-a1c3dc56bbac', 'FDescription');

insert into TsDictionary set FBuiltin=1, FDescription='', FId='84c37206-ab23-406a-9676-5c6d8d8fbc27', FName='QS-本地API-調用目標類型', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='84c37206-ab23-406a-9676-5c6d8d8fbc27', FEnabled=1, FId='f5b90e61-4b1e-4cea-bc94-035e25229820', FIndex=1, FParentValue=null, FText='API Method',    FValue='ApiMethod';
insert into TsDictionaryItem set FDictionaryId='84c37206-ab23-406a-9676-5c6d8d8fbc27', FEnabled=1, FId='47663c6f-7999-40ae-ac2b-489e9c95c3f8', FIndex=2, FParentValue=null, FText='Action Method', FValue='ActionMethod';

insert into TsDictionary set FBuiltin=1, FDescription='', FId='f11d295b-bd28-4e09-ae88-e7ed8aa55bb1', FName='QS-本地API-處理方式', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='f11d295b-bd28-4e09-ae88-e7ed8aa55bb1', FEnabled=1, FId='0ebc1fb3-3be6-4a35-8faa-dccefc5217df', FIndex=1, FParentValue=null, FText='僅處理業務邏輯，由平臺自動解析 request 並生成 response', FValue='Partial';
insert into TsDictionaryItem set FDictionaryId='f11d295b-bd28-4e09-ae88-e7ed8aa55bb1', FEnabled=1, FId='f07790cf-4264-4695-b3f0-11aeb9618ef5', FIndex=2, FParentValue=null, FText='全權處理，在方法內自行解析 request 並生成 response',     FValue='Full';

delete from TsTextResource where FId='f08dc62d-3b07-4a3b-ac63-d49f3db6bd85';
delete from TsTextResource where FId='d3ac23b1-aa12-4f10-9359-c901a827d418';
insert into TsTextResource set FId='f08dc62d-3b07-4a3b-ac63-d49f3db6bd85', FCode='E.Qs.LocalApi.IncompleteActionMethod',				FValue='對於調用目標為 Action 方法，路徑為“${0}”的本地 API，必須將調用目標設置“單元編碼.方法名”。';
insert into TsTextResource set FId='d3ac23b1-aa12-4f10-9359-c901a827d418', FCode='E.Qs.LocalApi.IncompleteApiMethod',					FValue='對於調用目標為 API 方法，路徑為“${0}”的本地 API，必須將調用目標設置為“類全名.方法名”，或在對應的本地 API 組內指定處理類。';

