--调整字段宽度

delete from TsField where FId='7dacf560-a696-48f2-93d5-a3c61e0a4620';
insert into TsField set FId='7dacf560-a696-48f2-93d5-a3c61e0a4620', FUnitId='0bd0ac10-dded-4d37-a03a-a284856445be', FName='FFieldName',  FTitle='字段',             FType='ComboBox-SelectOnly', FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20121231-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20121231-01';
