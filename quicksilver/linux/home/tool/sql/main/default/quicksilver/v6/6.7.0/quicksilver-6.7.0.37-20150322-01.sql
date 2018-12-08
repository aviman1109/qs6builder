﻿update TsForm set FName='默認' where FName='默认';

update TsField set FListWidth=200 where FId='0dbce4fd-c027-4d7a-84ff-8af8864d5df0';
update TsField set FListWidth=150 where FId='40dbf866-a5e4-472a-b06e-e2f7c780cea0';

alter table TsLocalApiGroup add FIsStandardResponse bit;
update TsLocalApiGroup set FIsStandardResponse = 1 where FIsStandardResponse is null;
insert into TsField set FId='1d80c086-e58c-425f-84d6-7646a810fffe', FUnitId='2c53f550-63e5-4e41-ad9a-a71dcc1741c0', FName='FIsStandardResponse',     FTitle='是否平台標準回應', FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
update TsField set FTitle='請求資料格式' where FId='180beb14-1ac8-4d12-8403-a4f779e2f6b2';
update TsField set FTitle='回應資料格式' where FId='180beb14-1ac8-4d12-8403-a4f779e2f6b2';
java setFormFields('6b21c284-9b4c-4d03-8309-4fafe91a87ab', '基本資訊', '1093047f-216c-4919-a25e-834624cfc224', null, 'FName,FCode,FEnabled,FAuthType', '請求與回應', 'b699abe6-b551-4da3-b02a-d7d282a2a0bd', '1093047f-216c-4919-a25e-834624cfc224', 'FRequestFormat,FResponseFormat,FIsStandardResponse', '描述', '7904e0a1-b271-4342-83c7-ecc1fbd434f6', '1093047f-216c-4919-a25e-834624cfc224', 'FDescription');
update TsPage set FLoadHandler='LocalApiGroupForm.doLoad' where FId='f4d7ba3a-f9a8-4184-bc17-2f187a1dc74d';
insert into TsScript set FId='dc2876c2-ee6d-4791-9899-9f0d23c005e8', FIndex=1, FPageId='f4d7ba3a-f9a8-4184-bc17-2f187a1dc74d', FUrl='quicksilver/page/integration/LocalApiGroupForm.js';

alter table TsLocalApi add FEnableRrConfig bit;
alter table TsLocalApi add FRequestFormat varchar(20);
alter table TsLocalApi add FResponseFormat varchar(20);
alter table TsLocalApi add FIsStandardResponse bit;
update TsLocalApi set FEnableRrConfig = 0 where FEnableRrConfig is null;
insert into TsField set FId='5a15799c-34f6-4d9b-8359-88ce1056155f', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FEnableRrConfig',    FTitle='啟用獨立的請求與回應設置', FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=200, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='4f010dac-2148-4764-953e-6930014e3ec9', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FRequestFormat',        FTitle='請求資料格式',             FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=1,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='b8c6d69a-1af5-4568-8fc6-901e414d1b73', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FResponseFormat',       FTitle='回應資料格式',             FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='8c761a15-1420-409a-9bf7-1611e8f496ca', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='800378f9-771e-4e29-8c28-6929c5ca96e4', FUnitId='9cfe771b-3489-4e20-8054-573dad780a00', FName='FIsStandardResponse', FTitle='是否平台標準回應',     FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
update TsForm set FGroupMode='Double' where FId='81b46101-ea7e-4ac7-b5d3-32b49fecb34b';
java setFormFields('81b46101-ea7e-4ac7-b5d3-32b49fecb34b', '基本資訊', '9963a399-3970-4a03-93f6-a1c3dc56bbac', null, 'FPath,FLocalApiGroupId,FTarget,FEnabled', '請求與回應', 'e19de462-292c-4327-936a-ab7487d2ebc8', '9963a399-3970-4a03-93f6-a1c3dc56bbac', 'FEnableRrConfig,FRequestFormat,FResponseFormat,FIsStandardResponse', '描述', '57f6d63b-2d9a-4ece-864b-bc5af8d5600f', '9963a399-3970-4a03-93f6-a1c3dc56bbac', 'FDescription');
java setListFields('b73bcc55-47ab-45d9-afac-0dc41b90bc2f', 'FLocalApiGroupId,FPath,FEnabled,FTarget,FEnableRrConfig,FDescription');
java setListFields('e1d24f3c-fb91-4143-b35d-a154ba49b70e', 'FLocalApiGroupId,FPath,FEnabled,FTarget,FEnableRrConfig,FDescription');
java setListFields('6403ca9d-cd86-4ec8-bf3a-2ae0df7b9b48', 'FLocalApiGroupId,FPath,FEnabled,FTarget,FEnableRrConfig,FDescription');
update TsPage set FLoadHandler='LocalApiForm.doLoad' where FId='005cf80b-9ef0-4eea-8b9a-b7a42c9a10da';
insert into TsScript set FId='2dd38bf3-4236-49ef-bd7d-6a3eb660a125', FIndex=1, FPageId='005cf80b-9ef0-4eea-8b9a-b7a42c9a10da', FUrl='quicksilver/page/integration/LocalApiForm.js';

alter table TsRemoteApiGroup add FIsStandardRequest bit;
update TsRemoteApiGroup set FIsStandardRequest = 1 where FIsStandardRequest is null;
insert into TsField set FId='037c6947-a51f-4760-aded-69788cb44792', FUnitId='d5172f96-bce7-482d-9e68-94b4b3d7a394', FName='FIsStandardRequest', FTitle='是否平台標準請求', FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
update TsField set FTitle='請求資料格式' where FId='a3b9eea0-e8c9-4491-9afb-db0915ddc2a5';
update TsField set FTitle='回應資料格式' where FId='d5c2fa8d-2dce-4dce-b578-8bb97a8f98ef';
java setFormFields('90c94fe9-e771-4af9-851b-2e2925eb1598', '基本資訊', '8b802391-3c55-4629-8d94-5760b31d7aab', null, 'FName,FCode,FEnabled,FBasePath', '安全驗證', '1d85b250-f0d4-413d-9a02-cf82fa221376', '8b802391-3c55-4629-8d94-5760b31d7aab', 'FAuthType,FTokenApiId', '資料格式', 'a9e58728-f978-4c8e-b7a1-508dba12d98e', '8b802391-3c55-4629-8d94-5760b31d7aab', 'FRequestFormat,FResponseFormat,FIsStandardRequest', '描述', '74e45ffe-3d5e-4394-bc93-fffca0f953f7', '8b802391-3c55-4629-8d94-5760b31d7aab', 'FDescription');

alter table TsRemoteApi add FHttpMethod varchar(20);
alter table TsRemoteApi add FEnableRrConfig bit;
alter table TsRemoteApi add FRequestFormat varchar(20);
alter table TsRemoteApi add FResponseFormat varchar(20);
alter table TsRemoteApi add FIsStandardRequest bit;
update TsRemoteApi set FHttpMethod = 'POST' where FHttpMethod is null;
update TsRemoteApi set FEnableRrConfig = 0 where FEnableRrConfig is null;
insert into TsField set FId='754010a8-2ce5-4c2d-bbf1-d6a64b7e5261', FUnitId='d9fae961-1ef3-4879-893c-fe68913ff828', FName='FEnableRrConfig',     FTitle='啟用獨立的請求與回應設置',        FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='750259f8-8fad-4220-890f-64c43616a882', FUnitId='d9fae961-1ef3-4879-893c-fe68913ff828', FName='FHttpMethod',         FTitle='HTTP 方法',                       FType='RadioBox',            FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='9478f719-7250-412b-8773-32a5d8b7046c', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue='POST', FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='82a8749d-6d19-4f20-a11b-1a8100f57b7f', FUnitId='d9fae961-1ef3-4879-893c-fe68913ff828', FName='FRequestFormat',      FTitle='請求資料格式',                    FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='93fc7a55-89a0-461c-adab-812e72e33f94', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=1,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='c80e4d5b-a74f-4cc6-94e8-ac9b138d6fb4', FUnitId='d9fae961-1ef3-4879-893c-fe68913ff828', FName='FResponseFormat',     FTitle='回應資料格式',                    FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='60c505a0-2bc5-437f-93fd-61a91bf9f631', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='54641b62-c75b-478d-aca9-08cb6b3c0080', FUnitId='d9fae961-1ef3-4879-893c-fe68913ff828', FName='FIsStandardRequest', FTitle='是否平台標準請求',         FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null,   FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setFormFields('9b430dca-8726-451f-ab3a-54f98c6c8189', '基本資訊', '28f35a41-288e-4c54-a3ba-7c74ee75d737', null, 'FName,FCode,FRemoteApiGroupId,FPath,FHttpMethod,FEnabled', '請求與回應', 'ad39afee-b46b-472d-ac63-58872343d450', '28f35a41-288e-4c54-a3ba-7c74ee75d737', 'FEnableRrConfig,FRequestFormat,FResponseFormat,FIsStandardRequest', '描述', '496b3ac7-cc6e-4fc4-8dce-e764280cd5a4', '28f35a41-288e-4c54-a3ba-7c74ee75d737', 'FDescription');
java setListFields('9a1a5a08-9857-41cc-b291-a72e4a06bd67', 'FRemoteApiGroupId,FName,FCode,FPath,FEnabled,FHttpMethod,FEnableRrConfig,FDescription');
update TsPage set FLoadHandler='RemoteApiForm.doLoad' where FId='851fb84c-f4d3-49df-a9b6-b69b99335d35';
insert into TsScript set FId='76952068-021d-4647-8ea0-2d991fd020c5', FIndex=1, FPageId='851fb84c-f4d3-49df-a9b6-b69b99335d35', FUrl='quicksilver/page/integration/RemoteApiForm.js';

insert into TsDictionary set FBuiltin=1, FDescription='', FId='9478f719-7250-412b-8773-32a5d8b7046c', FName='QS-遠端API-HTTP方法', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='9478f719-7250-412b-8773-32a5d8b7046c', FEnabled=1, FId='b542f6d4-1169-4511-ba06-ac4154b0eefa', FIndex=1, FParentValue=null, FText='GET',			FValue='GET';
insert into TsDictionaryItem set FDictionaryId='9478f719-7250-412b-8773-32a5d8b7046c', FEnabled=1, FId='f7ee03b5-e31c-4d21-a6bb-5e824ce61583', FIndex=2, FParentValue=null, FText='POST',			FValue='POST';

delete from TsDictionary where FId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382';
delete from TsDictionary where FId='8c761a15-1420-409a-9bf7-1611e8f496ca';
delete from TsDictionary where FId='fa1a2fbf-ea70-4d23-9be2-c448a00014ee';
delete from TsDictionary where FId='93fc7a55-89a0-461c-adab-812e72e33f94';
delete from TsDictionary where FId='60c505a0-2bc5-437f-93fd-61a91bf9f631';
delete from TsDictionary where FId='b42d4cfa-b4f5-44d8-8b89-d2863b8617a1';
insert into TsDictionary set FBuiltin=1, FDescription='', FId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382', FName='QS-本地API-請求資料格式', FParentId=null, FTextAsValue=0;
insert into TsDictionary set FBuiltin=1, FDescription='', FId='8c761a15-1420-409a-9bf7-1611e8f496ca', FName='QS-本地API-回應資料格式', FParentId=null, FTextAsValue=0;
insert into TsDictionary set FBuiltin=1, FDescription='', FId='fa1a2fbf-ea70-4d23-9be2-c448a00014ee', FName='QS-本地API-安全驗證方式', FParentId=null, FTextAsValue=0;
insert into TsDictionary set FBuiltin=1, FDescription='', FId='93fc7a55-89a0-461c-adab-812e72e33f94', FName='QS-遠端API-請求資料格式', FParentId=null, FTextAsValue=0;
insert into TsDictionary set FBuiltin=1, FDescription='', FId='60c505a0-2bc5-437f-93fd-61a91bf9f631', FName='QS-遠端API-回應資料格式', FParentId=null, FTextAsValue=0;
insert into TsDictionary set FBuiltin=1, FDescription='', FId='b42d4cfa-b4f5-44d8-8b89-d2863b8617a1', FName='QS-遠端API-安全驗證方式', FParentId=null, FTextAsValue=0;

delete from TsDictionaryItem where FDictionaryId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382';
delete from TsDictionaryItem where FDictionaryId='8c761a15-1420-409a-9bf7-1611e8f496ca';
delete from TsDictionaryItem where FDictionaryId='93fc7a55-89a0-461c-adab-812e72e33f94';
delete from TsDictionaryItem where FDictionaryId='60c505a0-2bc5-437f-93fd-61a91bf9f631';
insert into TsDictionaryItem set FDictionaryId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382', FEnabled=1, FId='dcd09501-ff3e-410f-bf86-cf5c517335c6', FIndex=1, FParentValue=null, FText='JSON',			FValue='JSON';
insert into TsDictionaryItem set FDictionaryId='b6cf47a5-c650-49e0-aa82-bc8e74a4a382', FEnabled=1, FId='3da5c188-64b9-467e-88eb-e7a87e0436a7', FIndex=2, FParentValue=null, FText='XML',			FValue='XML';
insert into TsDictionaryItem set FDictionaryId='8c761a15-1420-409a-9bf7-1611e8f496ca', FEnabled=1, FId='95f7fcb7-ec46-402b-8c56-30d00d6ded3f', FIndex=1, FParentValue=null, FText='JSON',			FValue='JSON';
insert into TsDictionaryItem set FDictionaryId='8c761a15-1420-409a-9bf7-1611e8f496ca', FEnabled=1, FId='1c4035ed-6303-44f6-890b-d2961f065ea7', FIndex=2, FParentValue=null, FText='XML',			FValue='XML';
insert into TsDictionaryItem set FDictionaryId='93fc7a55-89a0-461c-adab-812e72e33f94', FEnabled=1, FId='81fdd28c-ed1d-4b62-bc04-04d7e962d0ff', FIndex=1, FParentValue=null, FText='JSON',			FValue='JSON';
insert into TsDictionaryItem set FDictionaryId='93fc7a55-89a0-461c-adab-812e72e33f94', FEnabled=1, FId='4cce91ef-0cbb-4d3c-8e70-9afee0785d83', FIndex=2, FParentValue=null, FText='XML',			FValue='XML';
insert into TsDictionaryItem set FDictionaryId='60c505a0-2bc5-437f-93fd-61a91bf9f631', FEnabled=1, FId='e29cb9fb-c396-4ba4-bab7-06992ca8038f', FIndex=1, FParentValue=null, FText='JSON',			FValue='JSON';
insert into TsDictionaryItem set FDictionaryId='60c505a0-2bc5-437f-93fd-61a91bf9f631', FEnabled=1, FId='7b09c902-37d3-445b-9742-0da44834e5f8', FIndex=2, FParentValue=null, FText='XML',			FValue='XML';

delete from TsDictionary where FId='ec28cca9-936e-447a-a4bf-6d5e430dfdf7';
delete from TsDictionary where FId='c7e383fb-a894-43ef-9647-4870bd3d610e';
delete from TsDictionaryItem where FDictionaryId='ec28cca9-936e-447a-a4bf-6d5e430dfdf7';
delete from TsDictionaryItem where FDictionaryId='c7e383fb-a894-43ef-9647-4870bd3d610e';

insert into TsDictionary set FBuiltin=1, FDescription='', FId='c7e383fb-a894-43ef-9647-4870bd3d610e', FName='QS-本地API-回應生成方式', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='c7e383fb-a894-43ef-9647-4870bd3d610e', FEnabled=1, FId='3ac5d980-dc78-4361-b78b-28ec51b64742', FIndex=1, FParentValue=null, FText='生成分層的JSON資料(自動添加平臺標準的header/body結構)',   FValue='TreeJson';
insert into TsDictionaryItem set FDictionaryId='c7e383fb-a894-43ef-9647-4870bd3d610e', FEnabled=1, FId='96612a41-34f2-4e57-aae5-72b321a4e2c3', FIndex=2, FParentValue=null, FText='生成平鋪的JSON資料(不自動添加平臺標準的header/body結構)', FValue='FlatJson';
insert into TsDictionaryItem set FDictionaryId='c7e383fb-a894-43ef-9647-4870bd3d610e', FEnabled=1, FId='cde4ea2d-366f-4184-bb3a-ed306dadd6b6', FIndex=3, FParentValue=null, FText='生成分層的XML資料(自動添加平臺標準的header/body結構)',    FValue='TreeXml';
insert into TsDictionaryItem set FDictionaryId='c7e383fb-a894-43ef-9647-4870bd3d610e', FEnabled=1, FId='7a355e44-15bd-4139-8748-7344f853006f', FIndex=4, FParentValue=null, FText='生成平鋪的XML資料(不自動添加平臺標準的header/body結構)',  FValue='FlatXml';

delete from TsTextResource where FId='88da5d37-ba21-4cdd-8445-37e6610fc558';
insert into TsTextResource set FId='88da5d37-ba21-4cdd-8445-37e6610fc558', FCode='E.Basic.Xml.InvalidText',			FValue='文字不是有效的 XML 格式：${0}';
