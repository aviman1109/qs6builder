--minglei

delete from TsTextResource where FId='983c7a7a-3d1e-4416-8c3e-33f78ce3059a';
delete from TsTextResource where FId='cc522f77-cdf1-4b3e-94ac-3370acb2221c';
delete from TsTextResource where FId='655918b4-8106-4b84-9666-32113561120e';
insert into TsTextResource set FId='983c7a7a-3d1e-4416-8c3e-33f78ce3059a', FCode='E.Qs.Auth.PasswordVerifyUrlMissing',					FValue='未設定密碼校驗 URL。';
insert into TsTextResource set FId='cc522f77-cdf1-4b3e-94ac-3370acb2221c', FCode='E.Qs.Auth.PasswordVerifyHttpError',					FValue='密碼校驗 URL 訪問失敗。狀態碼：${0}';
insert into TsTextResource set FId='655918b4-8106-4b84-9666-32113561120e', FCode='E.Qs.Auth.PasswordVerifyResponseInvalid',				FValue='密碼校驗 URL 返回內容格式無效。';

delete from TsTextResource where FId='b96b9959-ba2d-4b21-b6b5-d3d64cb2e676';
delete from TsTextResource where FId='c676f35a-f097-414e-82e3-ec1fa4560f16';
delete from TsTextResource where FId='97d6796a-01b6-4d65-83bb-db4247406254';
delete from TsTextResource where FId='ea81e55c-0be0-4fd5-ba98-688387b73cfa';
delete from TsTextResource where FId='2f935243-7b9d-4cdb-95ad-708d9bc48ecf';
delete from TsTextResource where FId='f885a288-539e-4613-be58-688f2f840355';
insert into TsTextResource set FId='b96b9959-ba2d-4b21-b6b5-d3d64cb2e676', FCode='E.Qs.Auth.OuterLoginNotEnabled',						FValue='未啟用通過其它系統自動登錄。';
insert into TsTextResource set FId='c676f35a-f097-414e-82e3-ec1fa4560f16', FCode='E.Qs.Auth.OuterLoginVerifyUrlMissing',				FValue='未設定自動登錄校驗 URL。';
insert into TsTextResource set FId='97d6796a-01b6-4d65-83bb-db4247406254', FCode='E.Qs.Auth.OuterLoginVerifyHttpError',					FValue='自動登錄校驗伺服器訪問失敗。狀態碼：${0}';
insert into TsTextResource set FId='ea81e55c-0be0-4fd5-ba98-688387b73cfa', FCode='E.Qs.Auth.OuterLoginVerifyResponseInvalid',			FValue='自動登錄校驗伺服器返回內容格式無效。';
insert into TsTextResource set FId='2f935243-7b9d-4cdb-95ad-708d9bc48ecf', FCode='E.Qs.Auth.OuterLoginVerifyFailed',					FValue='未通過自動登錄身份校驗。';
insert into TsTextResource set FId='f885a288-539e-4613-be58-688f2f840355', FCode='E.Qs.Auth.AdServerNotConnectable',					FValue='無法連接到 Active Directory 伺服器。';

delete from TsTextResource where FId='80852fa3-6daa-40de-ac27-e8636dda5470';
delete from TsTextResource where FId='7485fc8a-2fa6-44c5-b958-e516af3827a9';
insert into TsTextResource set FId='80852fa3-6daa-40de-ac27-e8636dda5470', FCode='T.Qs.Auth.SessionInvalid',							FValue='您尚未登錄或連接中斷，請重新登錄。';
insert into TsTextResource set FId='7485fc8a-2fa6-44c5-b958-e516af3827a9', FCode='T.Qs.Auth.OuterLoginFailed',							FValue='自動登錄失敗，請使用帳號密碼登錄。';

delete from TsDictionary where FId='09f32050-8bf9-49c6-aa87-dd491d0e5562';
delete from TsDictionaryItem where FId='cfe5d0ee-2ace-4837-968b-b463a77e34d7';
delete from TsDictionaryItem where FId='c4c48451-e8d5-421e-9b6d-d7c3d96925fe';
delete from TsDictionaryItem where FId='45a6fd86-2a37-4fe0-bd9c-a0d33d76a0eb';
delete from TsDictionaryItem where FId='1bf2ed87-d64c-4e5b-ba87-a6fb1a48cd48';
delete from TsDictionaryItem where FId='9a2f2b3e-5f94-40f7-8c61-ad0fced30125';
insert into TsDictionary set FId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FName='QS-登錄日誌-認證方式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='cfe5d0ee-2ace-4837-968b-b463a77e34d7', FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FValue='Default',			FText='系統預設',			FIndex=1;
insert into TsDictionaryItem set FId='c4c48451-e8d5-421e-9b6d-d7c3d96925fe', FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FValue='Http',				FText='HTTP',				FIndex=2;
insert into TsDictionaryItem set FId='45a6fd86-2a37-4fe0-bd9c-a0d33d76a0eb', FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FValue='ActiveDirectory',	FText='Active Directory',	FIndex=3;
insert into TsDictionaryItem set FId='1bf2ed87-d64c-4e5b-ba87-a6fb1a48cd48', FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FValue='CustomVerifier',		FText='自訂校驗器',			FIndex=4;
insert into TsDictionaryItem set FId='9a2f2b3e-5f94-40f7-8c61-ad0fced30125', FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FValue='OuterLogin',			FText='通過其它系統登錄',	FIndex=5;

java runIgnoreError('alter table TsLoginLog add FAuthType varchar(20)');
java runIgnoreError('alter table TsLoginLog add FAuthSource varchar(100)');

delete from TsField where FId='6df57f57-35e7-400f-ac87-ff011f7cbfb8';
delete from TsField where FId='38f2116d-cdc0-4231-8d42-f30c31e915f6';
insert into TsField set FId='6df57f57-35e7-400f-ac87-ff011f7cbfb8', FUnitId='00000000-0000-0000-0001-000000001008', FName='FAuthType',		FTitle='認證方式',   FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='09f32050-8bf9-49c6-aa87-dd491d0e5562', FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='38f2116d-cdc0-4231-8d42-f30c31e915f6', FUnitId='00000000-0000-0000-0001-000000001008', FName='FAuthSource',	FTitle='認證源',     FType='InputBox-Text',       FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

java setFormFields('b395cfda-f344-42d7-8256-841c2a6f4842', '基本資訊', 'cead1678-a14e-4c05-abd3-c60773e13d7f', null, 'FUserId,FTime,FAction,FIpAddress,FClusterNode,FAuthType,FAuthSource,FSessionId');
java setListFields('aecb6714-aa2e-4d83-bb46-a74abcd8bba7', 'FUserId,FIpAddress,FAction,FTime,FClusterNode,FAuthType,FAuthSource,FSessionId');

delete from TsDictionary where FId='cb80ea76-72e3-4826-b564-ea01ef48c7ca';
delete from TsDictionaryItem where FDictionaryId='cb80ea76-72e3-4826-b564-ea01ef48c7ca';
insert into TsDictionary set FId='cb80ea76-72e3-4826-b564-ea01ef48c7ca', FName='QS-參數-密碼校驗方式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='40bc18c1-8480-4f5f-8493-51d8af6b9a72', FDictionaryId='cb80ea76-72e3-4826-b564-ea01ef48c7ca', FValue='Default',			FText='系統預設',			FIndex=1;
insert into TsDictionaryItem set FId='885ff78d-7b4b-4d61-bdc6-df0f7e867cbf', FDictionaryId='cb80ea76-72e3-4826-b564-ea01ef48c7ca', FValue='Http',				FText='HTTP',				FIndex=2;
insert into TsDictionaryItem set FId='27cb78d0-3f48-480b-a932-fa9a97c07863', FDictionaryId='cb80ea76-72e3-4826-b564-ea01ef48c7ca', FValue='ActiveDirectory',	FText='Active Directory',	FIndex=3;

update TsParameterGroup set FName='登錄設置' where FId='948d19ef-e494-4b60-9cde-cfd8a61e793b';
delete from TsParameterGroup where FId='640d9f1d-cd25-466e-b4ae-ed05fac83246';
delete from TsParameterGroup where FId='4e243470-7710-4f27-bed6-dd956f5aa482';
delete from TsParameterGroup where FId='03f80ede-10d9-4197-a8cb-6a29cb94b226';

delete from TsParameterGroup where FId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5';
delete from TsParameterGroup where FId='d1a59885-4655-4d44-ba17-cdd92f287ea3';
delete from TsParameterGroup where FId='2cfe89da-4251-4d4d-90b9-38c76bce5389';
insert into TsParameterGroup set FId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FName='Session 設置',				FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b',	FIndex=1;
insert into TsParameterGroup set FId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FName='密碼校驗',					FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b',	FIndex=2;
insert into TsParameterGroup set FId='2cfe89da-4251-4d4d-90b9-38c76bce5389', FName='其它設置',					FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b',	FIndex=3;

delete from TsParameterDefinition where FId='04ac9157-ae03-432c-9b86-32e989c595b8'; --QsADServerPort1
delete from TsParameterDefinition where FId='82ba2591-75d0-4eb9-a135-c005b444aa5e'; --QsADServerPort2
delete from TsParameterDefinition where FId='af6ba3b8-45b7-4503-9b91-366fa84312e7'; --QsADServerPort3
delete from TsParameterDefinition where FId='3a70497f-daca-4f4e-8afe-0b3595dbb569'; --QsADServerPort4
delete from TsParameterDefinition where FId='f65b1574-d181-40de-bea2-c5290d13c0c3'; --QsADServerPort5 
delete from TsParameterDefinition where FId='42b4aecc-b309-4c2a-9071-cb6503401f1e'; --QsEnableADServer
delete from TsParameterDefinition where FId='dfbfd47e-d39f-4cd8-990b-f3da491b5ddc'; --QsEnableThirdPartyCertification

delete from TsParameterDefinition where FId='7cf459bf-1ea0-4b2c-90e9-95b0ea50506e';
delete from TsParameterDefinition where FId='727a2f35-bdba-4d3e-bb4e-ee85d510f479';
delete from TsParameterDefinition where FId='35a46b93-fa4e-4b74-836b-e689a9e6b3c0';
insert into TsParameterDefinition set FId='7cf459bf-1ea0-4b2c-90e9-95b0ea50506e', FName='Session 超時時間(分鐘)',					FCode='QsSessionTimeout',					FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=1;
insert into TsParameterDefinition set FId='727a2f35-bdba-4d3e-bb4e-ee85d510f479', FName='許可不足時，斷開 N 分鐘未活動的用戶',		FCode='QsCrowdedSessionTimeout',			FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='35a46b93-fa4e-4b74-836b-e689a9e6b3c0', FName='每用戶只能登錄一個 Session',				FCode='QsOneSessionPerUser',				FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;

delete from TsParameterDefinition where FId='32c2cf11-57ab-4ee0-8e14-6969ed216ea2';
delete from TsParameterDefinition where FId='31d0bab1-f311-4d5b-83cf-ba3556d9dcea';
delete from TsParameterDefinition where FId='780ffb22-e844-46fb-a844-780336565d10';
delete from TsParameterDefinition where FId='b36d445a-73b5-4702-8ea9-e1da32ffb100';
delete from TsParameterDefinition where FId='bd218991-ecf6-4c57-8313-135af1eed1a4';
delete from TsParameterDefinition where FId='cefc09b2-23d8-4a44-8bbe-df565be02bc5';
delete from TsParameterDefinition where FId='7d319d9c-1757-4b0e-b2ef-54b4d8c05ebb';
delete from TsParameterDefinition where FId='fe1f47c5-4332-4592-92ae-e676b075aaa1';
delete from TsParameterDefinition where FId='65936564-40fc-42ed-ba7e-6d37f06fadf4';
delete from TsParameterDefinition where FId='f60f5759-d94e-45f9-bec0-cb3944440505';
delete from TsParameterDefinition where FId='6d283d69-38e5-4cef-9ab1-2790bc5a41c5';
delete from TsParameterDefinition where FId='8fff677e-041e-43c7-9768-10a4e2c7a929';
delete from TsParameterDefinition where FId='fb0a688f-62bd-45b3-87bf-bcfa2374e853';
delete from TsParameterDefinition where FId='543f0987-0581-429b-a353-8e27dad28f0c';
insert into TsParameterDefinition set FId='32c2cf11-57ab-4ee0-8e14-6969ed216ea2', FName='密碼校驗方式',								FCode='QsPasswordVerifyMode',				FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=1, FDictionaryId='cb80ea76-72e3-4826-b564-ea01ef48c7ca';
insert into TsParameterDefinition set FId='31d0bab1-f311-4d5b-83cf-ba3556d9dcea', FName='密碼校驗 URL',								FCode='QsPasswordVerifyUrl',				FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='780ffb22-e844-46fb-a844-780336565d10', FName='AD 網域 1',								FCode='QsAdDomain1',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='b36d445a-73b5-4702-8ea9-e1da32ffb100', FName='AD 伺服器 1',								FCode='QsAdServer1',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;
insert into TsParameterDefinition set FId='bd218991-ecf6-4c57-8313-135af1eed1a4', FName='AD 網域 2',								FCode='QsAdDomain2',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5;
insert into TsParameterDefinition set FId='cefc09b2-23d8-4a44-8bbe-df565be02bc5', FName='AD 伺服器 2',								FCode='QsAdServer2',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=6;
insert into TsParameterDefinition set FId='7d319d9c-1757-4b0e-b2ef-54b4d8c05ebb', FName='AD 網域 3',								FCode='QsAdDomain3',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=7;
insert into TsParameterDefinition set FId='fe1f47c5-4332-4592-92ae-e676b075aaa1', FName='AD 伺服器 3',								FCode='QsAdServer3',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=8;
insert into TsParameterDefinition set FId='65936564-40fc-42ed-ba7e-6d37f06fadf4', FName='AD 網域 4',								FCode='QsAdDomain4',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=9;
insert into TsParameterDefinition set FId='f60f5759-d94e-45f9-bec0-cb3944440505', FName='AD 伺服器 4',								FCode='QsAdServer4',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=10;
insert into TsParameterDefinition set FId='6d283d69-38e5-4cef-9ab1-2790bc5a41c5', FName='AD 網域 5',								FCode='QsAdDomain5',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=11;
insert into TsParameterDefinition set FId='8fff677e-041e-43c7-9768-10a4e2c7a929', FName='AD 伺服器 5',								FCode='QsAdServer5',						FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=12;
insert into TsParameterDefinition set FId='fb0a688f-62bd-45b3-87bf-bcfa2374e853', FName='啟用自訂校驗器',							FCode='QsCustomLoginVerifierEnabled',		FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=13;
insert into TsParameterDefinition set FId='543f0987-0581-429b-a353-8e27dad28f0c', FName='校驗器類名',								FCode='QsCustomLoginVerifierClassName',		FParameterGroupId='d1a59885-4655-4d44-ba17-cdd92f287ea3', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=14;

delete from TsParameterDefinition where FId='63b585c2-e218-4e08-b41d-eba51ef2659c';
delete from TsParameterDefinition where FId='e15d5e7a-d187-45a9-a0ed-0c6db2398376';
delete from TsParameterDefinition where FId='27ffa340-e588-405a-b314-b24c7542c1d0';
delete from TsParameterDefinition where FId='0cc2678c-896b-42a0-85cb-724e605aca6a';
insert into TsParameterDefinition set FId='63b585c2-e218-4e08-b41d-eba51ef2659c', FName='啟用自訂登錄頁面',							FCode='QsCustomLoginPageEnabled',			FParameterGroupId='2cfe89da-4251-4d4d-90b9-38c76bce5389', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=1;
insert into TsParameterDefinition set FId='e15d5e7a-d187-45a9-a0ed-0c6db2398376', FName='登錄頁面 URL',								FCode='QsCustomLoginPageUrl',				FParameterGroupId='2cfe89da-4251-4d4d-90b9-38c76bce5389', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='27ffa340-e588-405a-b314-b24c7542c1d0', FName='允許通過其它系統登錄',						FCode='QsOuterLoginEnabled',				FParameterGroupId='2cfe89da-4251-4d4d-90b9-38c76bce5389', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='0cc2678c-896b-42a0-85cb-724e605aca6a', FName='登錄校驗 URL',								FCode='QsOuterLoginVerifyUrl',				FParameterGroupId='2cfe89da-4251-4d4d-90b9-38c76bce5389', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;

update TsSystemParameter
set FValue = trim(FValue) || ':' || (select trim(FValue) from TsSystemParameter where FKey = 'QsADServerPort1')
where FKey='QsADServer1' and length(trim(FValue)) > 0 and locate(':', FValue) = 0 and exists (
	select * from TsSystemParameter where FKey = 'QsADServerPort1' and length(trim(FValue)) > 0
);
update TsSystemParameter
set FValue = trim(FValue) || ':' || (select trim(FValue) from TsSystemParameter where FKey = 'QsADServerPort2')
where FKey='QsADServer2' and length(trim(FValue)) > 0 and locate(':', FValue) = 0 and exists (
	select * from TsSystemParameter where FKey = 'QsADServerPort2' and length(trim(FValue)) > 0
);
update TsSystemParameter
set FValue = trim(FValue) || ':' || (select trim(FValue) from TsSystemParameter where FKey = 'QsADServerPort3')
where FKey='QsADServer3' and length(trim(FValue)) > 0 and locate(':', FValue) = 0 and exists (
	select * from TsSystemParameter where FKey = 'QsADServerPort3' and length(trim(FValue)) > 0
);
update TsSystemParameter
set FValue = trim(FValue) || ':' || (select trim(FValue) from TsSystemParameter where FKey = 'QsADServerPort4')
where FKey='QsADServer4' and length(trim(FValue)) > 0 and locate(':', FValue) = 0 and exists (
	select * from TsSystemParameter where FKey = 'QsADServerPort4' and length(trim(FValue)) > 0
);
update TsSystemParameter
set FValue = trim(FValue) || ':' || (select trim(FValue) from TsSystemParameter where FKey = 'QsADServerPort5')
where FKey='QsADServer5' and length(trim(FValue)) > 0 and locate(':', FValue) = 0 and exists (
	select * from TsSystemParameter where FKey = 'QsADServerPort5' and length(trim(FValue)) > 0
);

update TsSystemParameter set FKey='QsCustomLoginVerifierClassName' where FKey='QsLoginHandler';

insert into TsSystemParameter (FId, FKey, FValue)
select '4100ee86-9675-45d2-9beb-e62353aa658d', 'QsCustomLoginVerifierEnabled',
    case
		when exists (select * from TsSystemParameter where FKey='QsCustomLoginVerifierClassName' and length(trim(FValue)) > 0) then 'true'
		else 'false'
	end
from TsDual
where not exists (select * from TsSystemParameter where FKey='QsCustomLoginVerifierEnabled');

insert into TsSystemParameter (FId, FKey, FValue)
select '66f374dd-3435-48d6-af52-d657940ec482', 'QsPasswordVerifyMode',
    case
		when exists (select * from TsSystemParameter where FKey='QsEnableADServer' and FValue='true') then 'ActiveDirectory'
		when exists (select * from TsSystemParameter where FKey='QsEnableThirdPartyCertification' and FValue='true') then 'HTTP'
		else 'Default'
	end
from TsDual
where not exists (select * from TsSystemParameter where FKey='QsPasswordVerifyMode');

update TsSystemParameter set FKey='QsPasswordVerifyUrl' where FKey='QsThirdPartyCertificationUrl';
update TsSystemParameter set FKey='QsAdDomain1' where FKey='QsADDomain1';
update TsSystemParameter set FKey='QsAdServer1' where FKey='QsADServer1';
update TsSystemParameter set FKey='QsAdDomain2' where FKey='QsADDomain2';
update TsSystemParameter set FKey='QsAdServer2' where FKey='QsADServer2';
update TsSystemParameter set FKey='QsAdDomain3' where FKey='QsADDomain3';
update TsSystemParameter set FKey='QsAdServer3' where FKey='QsADServer3';
update TsSystemParameter set FKey='QsAdDomain4' where FKey='QsADDomain4';
update TsSystemParameter set FKey='QsAdServer4' where FKey='QsADServer4';
update TsSystemParameter set FKey='QsAdDomain5' where FKey='QsADDomain5';
update TsSystemParameter set FKey='QsAdServer5' where FKey='QsADServer5';
update TsSystemParameter set FKey='QsCustomLoginPageEnabled' where FKey='QsEnableThirdPartyLoginPage';
update TsSystemParameter set FKey='QsCustomLoginPageUrl' where FKey='QsThirdPartyLoginPageUrl';

update TsUnit
set FHomeClassName='com.jeedsoft.quicksilver.user.ThirdPartyCertificationHome',
	FDaoClassName='com.jeedsoft.quicksilver.user.dao.impl.ThirdPartyCertificationDaoImpl',
	FServiceClassName='com.jeedsoft.quicksilver.user.service.impl.ThirdPartyCertificationServiceImpl',
	FActionClassName='com.jeedsoft.quicksilver.user.action.impl.ThirdPartyCertificationActionImpl',
	FApiClassName='com.jeedsoft.quicksilver.user.api.impl.ThirdPartyCertificationApiImpl'
where FCode='Qs.ThirdPartyCertification';

delete from TsPage where FId='028578f1-76f1-40b9-8d7b-abdf950458c9';
insert into TsPage set FId='028578f1-76f1-40b9-8d7b-abdf950458c9', FName='登錄頁面',		 FTitle='登錄',			FCode='Qs.OnlineUser.Login',	  FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FType='Other',      FIcon=null,									 FUrl='quicksilver/page/user/Login.jsp',		  FActionMethodName='Qs.OnlineUser.prepareLogin', FLoadHandler=null, FRelationId=null, FUnitId='e4da095a-1f19-41f5-af6a-f43258569516', FMasterUnitId=null,									 FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FVisible=1, FDescription=null, FHasViewFrame=null;

--------------------------------------------------------------------------------

java refreshSerial('TsParameterGroup');
