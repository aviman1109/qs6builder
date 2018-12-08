--Minglei.Lee

alter table TsOnlineUser add FHandshakeFailCount int;
insert into TsField set FId='7f80b995-ae6b-43f9-a691-e55f015e434e', FUnitId='e4da095a-1f19-41f5-af6a-f43258569516', FName='FHandshakeFailCount',	FTitle='最近握手失敗次數',  FType='InputBox-Integer', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null;
java setListFields('21699a22-25f6-4641-9f10-88bc08bb43a8', 'FUserId,FIpAddress,FLoginTime,FLastAccessTime,FHandshakeFailCount,FLanguageId,FSessionId');

update TsParameterGroup set FIndex=9 where FId='8656df49-af32-4a45-8d55-a516a3776ade';
update TsParameterGroup set FIndex=11 where FId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9';
insert into TsParameterGroup set FId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FName='Session 設置',			FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec',	FIndex=10;
java refreshSerial('TsParameterGroup');

update TsParameterDefinition set FName='流程默認轉代理時數' where FCode='QsDeputeHours';

update TsParameterDefinition set FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FIndex=1 where FCode='QsSessionTimeout';
update TsParameterDefinition set FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FIndex=3 where FCode='QsLoginHandler';
update TsParameterDefinition set FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FIndex=4 where FCode='QsOneSessionPerUser';
insert into TsParameterDefinition set FId='727a2f35-bdba-4d3e-bb4e-ee85d510f479', FName='許可不足時，斷開 N 分鐘未活動的用戶',	FCode='QsCrowdedSessionTimeout',			FParameterGroupId='5c8f8dbb-c700-4f9e-b1d0-365ee9ebaeb5', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=2;

update TsParameterDefinition set FIndex=1 where FId='e5a48900-3569-4dc2-ae60-11ad3dc55880';
update TsParameterDefinition set FIndex=1 where FId='9ba8456d-0168-4741-9b59-5fe2748d7fca';
update TsParameterDefinition set FIndex=1 where FId='a4829ecc-d70b-464f-bbd1-4a4660ddb009';
update TsParameterDefinition set FIndex=1 where FId='83e90600-923f-4770-b132-8a56a6e00ad1';
update TsParameterDefinition set FIndex=1 where FId='ce526b30-8662-4bb4-bb69-f49ecb6a0f59';
update TsParameterDefinition set FIndex=1 where FId='c77cb028-1bd0-4656-9798-819a41b57131';
update TsParameterDefinition set FIndex=1 where FId='1576bf34-dabd-4979-80b6-8aaa1e54701f';

insert into TsSystemParameter set FId='a66082c7-a8f2-4aad-8bcf-2f6a10e3b74a', FKey='QsCrowdedSessionTimeout',			FValue='5';

delete from TsParameterDefinition where FCode='QsLogoUrl';
delete from TsParameterDefinition where FCode='QsLogoHeight';

delete from TsSystemParameter where FKey='QsLogoUrl';
delete from TsSystemParameter where FKey='QsLogoHeight';

update TsTimer set FIntervalLength=1 where FRoutine='com.jeedsoft.quicksilver.handler.timer.SessionCheckRoutine' and FIntervalType='minute' and FIntervalLength > 1;

insert into TsTextResource set FId='65aadd86-1512-44d3-838b-5105a3f671ed', FCode='E.Qs.Auth.ReadOnlyMustAdministrator',					FValue='唯讀環境僅允許系統管理員登錄。';
