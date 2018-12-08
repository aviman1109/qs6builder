alter table TwNode add FSupportClone bit;
alter table TwNode add FSupportTransfer bit;

delete from TsField where FId='e4311cd3-f639-4f3b-ac0c-ba67cbdaecd3';
delete from TsField where FId='7894afa2-9c14-48ec-8930-8a74db57310f';
insert into TsField set FId='e4311cd3-f639-4f3b-ac0c-ba67cbdaecd3', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FSupportClone',      FTitle='支持加签',		FType='CheckBox',			 FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='7894afa2-9c14-48ec-8930-8a74db57310f', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FSupportTransfer',   FTitle='支持转办',		FType='CheckBox',			 FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setEditFields('ae542383-9d52-43d7-8940-962af2465fbb', 'FName,FCode,FMultiWorkItem,FJoinMode,FJoinCondition,FJoinConditionType,FTimeoutMode,FTimeoutDays,FTimeoutResult,FUrl,FUrlType,FPrivilegeId,FExpectedResult,FSupportClone,FSupportTransfer');
java setFormFields('f2a2f17c-4860-4ce2-8edb-3c0822bc2d04', 'FUrlType,FUrl,FSupportClone,FSupportTransfer');

update TwNode set FSupportClone=1 where FSupportClone is null and FType='Manual';
update TwNode set FSupportTransfer=1 where FSupportTransfer is null and FType='Manual';
