--minglei

--TsDiskFile.FFlashFileStatus

alter table TsDiskFile add FFlashFileStatus varchar(10);
update TsDiskFile set FFlashFileStatus='Success' where FFlashFileStatus is null and FFlashFileHasError=0;
update TsDiskFile set FFlashFileStatus='Error' where FFlashFileStatus is null and FFlashFileHasError=1;
alter table TsDiskFile drop FFlashFileHasError;

delete from TsField where FId='8a918f3e-7e0c-44ec-b867-f99e37b20690';
delete from TsField where FId='1a549cb5-e45e-49ce-97b5-dba5547898d0';
insert into TsField set FId='1a549cb5-e45e-49ce-97b5-dba5547898d0', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FFlashFileStatus',       FTitle='預覽檔狀態',	FType='InputBox-Text',    FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

delete from TsTextResource where FId='b410af51-f31f-485f-93bd-359389e656d0';
insert into TsTextResource set FId='b410af51-f31f-485f-93bd-359389e656d0', FCode='T.Qs.DiskFile.Preview.WaitForGeneration',				FValue='線上閱覽正在處理中，請稍候...';
