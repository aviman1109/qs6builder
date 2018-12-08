--minglei

java runOnError('select FTimeoutTime from TwActivity', 'alter table TwActivity add FTimeoutTime timestamp');
delete from TsField where FId='423ae528-45fb-444c-be1a-9b95f1317d4a';
insert into TsField set FId='423ae528-45fb-444c-be1a-9b95f1317d4a', FUnitId='00000000-0000-0000-0001-000000003004', FName='FTimeoutTime',	FTitle='超時時間',			FType='DateBox-DateTime',		FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
