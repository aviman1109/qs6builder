--minglei

--wording

update TsToolItem set FName='暫停' where FId='c0d03e48-f841-40e2-946a-1f9d807ada72';
update TsDictionaryItem set FText=replace(FText, '掛起', '暫停') where FDictionaryId='d8da3463-788c-4061-a22d-e1d20c179633' and locate('掛起', FText) > 0;
update TsDictionaryItem set FText=replace(FText, '掛起', '暫停') where FDictionaryId='2bc13cc1-390a-47a9-a7df-946f8ae73679' and locate('掛起', FText) > 0;
update TsDictionaryItem set FText=replace(FText, '掛起', '暫停') where FDictionaryId='b4631d3c-aa16-45dd-9733-e5ac74097f86' and locate('掛起', FText) > 0;
update TsDictionaryItem set FText=replace(FText, '掛起', '暫停') where FDictionaryId='47e7b8ee-3dad-41f3-8dbb-0086eb1df80e' and locate('掛起', FText) > 0;
update TsTextResource set FValue='只有已暫停的流程才能恢復。' where FId='24bb3ed4-67ff-426d-a94c-191367199082';
update TsTextResource set FValue='只有運行中的流程才能暫停。' where FId='b53636f3-7e07-4188-86df-e55c37507e12';

--TwProcessLog

create table TwProcessLog
(
	FId				uuid primary key,
	FProcessId		uuid,
	FOperation		varchar(20),
	FUserId			uuid,
	FTime			timestamp
);

insert into TsDictionary set FId='5a67ba6c-4282-4c1a-a52d-0cb54c50fc7e', FName='QS-流程日誌-操作', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='676cc471-66a7-40b0-906a-06bf059c718d', FDictionaryId='5a67ba6c-4282-4c1a-a52d-0cb54c50fc7e', FValue='Suspend',				FText='暫停',		FIndex=1;
insert into TsDictionaryItem set FId='146a0f35-243b-48e9-b6aa-38033bc08d6e', FDictionaryId='5a67ba6c-4282-4c1a-a52d-0cb54c50fc7e', FValue='Resume',					FText='恢復',		FIndex=2;
insert into TsDictionaryItem set FId='e144ec65-0e9c-4149-ace1-f80ca986aa1a', FDictionaryId='5a67ba6c-4282-4c1a-a52d-0cb54c50fc7e', FValue='Terminate',				FText='終止',		FIndex=3;

--timer

update TsField set FListWidth=200 where FId='45acada7-b800-42f2-8692-20d16079e1f1';
update TsField set FListWidth=120 where FId='1622d934-2a5e-4242-bfe8-fdda9dd9243f';
update TsField set FListWidth=130 where FId='984ba45f-b2e7-49ae-819a-a220b60fadc5';
update TsField set FListWidth=130 where FId='daf5ec86-d38c-4d80-af34-2bafb56cfdfa';
update TsField set FListWidth=80 where FId='c19823e5-488c-4eb3-9f95-24a20b8ada2d';
update TsField set FListWidth=80 where FId='2958ddcd-6de4-4982-bd41-903384b9ab65';
update TsField set FListWidth=80 where FId='74983e81-01cb-443c-a231-b96caaeb846e';
update TsField set FListWidth=80 where FId='abe084fd-3998-4f00-85d5-705b627f5bd6';

alter table TsTimer add FAllowOverlapRun bit;
update TsTimer set FAllowOverlapRun=1 where FAllowOverlapRun is null;
insert into TsField set FId='998a8f11-de2e-4e4b-93f7-aca3f7f32768', FUnitId='00000000-0000-0000-0001-000000000022', FName='FAllowOverlapRun',		FTitle='允許重疊執行',		FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
java setFormFields('fad82588-f46b-4b0c-9b9d-a22e98a00354', '基本資訊', '04d7c872-3fb2-4614-9485-5894185700a1', null, 'FName,FType,FEnabled,FRoutine,FArguments', '時間資訊', 'df2264d3-cdf7-46e5-b9a8-1493e5a3337f', '04d7c872-3fb2-4614-9485-5894185700a1', 'FBaseTime,FIntervalType,FIntervalLength,FLastTime,FNextTime', '控制選項', '4316b02b-73f5-42d5-b5a5-36c334d5536c', '04d7c872-3fb2-4614-9485-5894185700a1', 'FSystemStartupAction,FAllowConcurrentRun,FAllowOverlapRun,FMonthEnd');
java setListFields('25df4c54-d3c8-4054-894b-722d1b5b21a5', 'FName,FType,FIntervalLength,FIntervalType,FEnabled,FAllowConcurrentRun,FAllowOverlapRun,FBaseTime,FLastTime,FRoutine');

--cluster node

alter table TsClusterNode add FHttpPort varchar(10);
alter table TsClusterNode add FHttpsPort varchar(10);
alter table TsClusterNode add FContextPath varchar(50);
insert into TsField set FId='727421ff-49a5-4eab-800e-15113650e20d', FUnitId='f580bcca-add9-4d56-8b2e-b43bc3ce13b0', FName='FHttpPort',		 FTitle='HTTP 埠',				FType='InputBox-Text',    FSize=10,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='1a703ace-9a75-4644-b489-39ef1f3ab6d1', FUnitId='f580bcca-add9-4d56-8b2e-b43bc3ce13b0', FName='FHttpsPort',      FTitle='HTTPS 埠',				FType='InputBox-Text',    FSize=10,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='d9b629ad-c9cd-4a38-9371-247e4c7da3ff', FUnitId='f580bcca-add9-4d56-8b2e-b43bc3ce13b0', FName='FContextPath',    FTitle='應用路徑',				FType='InputBox-Text',    FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setFormFields('228b80a4-20da-46f9-b200-2caacf95972e', '基本資訊', '9859d274-94cd-42c1-a507-88f1c36b688f', null, 'FName,FComputerName,FDomain,FOsName,FOsVersion,FUpdateTime', 'IP、埠與應用路徑', '854e2841-a860-446e-a17f-efacbfa26fb3', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FIpAddress,FHttpPort,FHttpsPort,FContextPath', 'CPU', '8d753eca-3a86-485c-ac3a-b57278e2e9bc', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FCpuModel,FCpuUsed', '記憶體', 'd54d8d71-bdea-47b4-8133-1625a9deb53c', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FMemoryTotal,FMemoryUsed,FMemoryFree,FJvmMemoryTotal,FJvmMemoryUsed,FJvmMemoryFree', 'Java', '0cd607eb-cca9-42f9-98a4-d1c82de91497', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FJvmName,FJavaVersion,FJavaHome,FLibraryPath,FWorkDir');
