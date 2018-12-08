--minglei

java runOnError(
	'select FSocketId from TsOnlineUser limit 1',
	'alter table TsOnlineUser add FSocketId varchar(50)'
);

delete from TsField where FId='cbf134df-afa1-4a52-b44e-5983015a56ba';
insert into TsField set FId='cbf134df-afa1-4a52-b44e-5983015a56ba', FUnitId='e4da095a-1f19-41f5-af6a-f43258569516', FName='FSocketId',		FTitle='雙向連接 ID',		FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null;
