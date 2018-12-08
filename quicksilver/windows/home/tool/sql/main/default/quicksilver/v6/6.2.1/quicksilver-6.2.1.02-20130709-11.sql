alter table TsUser add column FManagerId uuid;

delete from TsField where FId='a7bf1bf5-9b52-4e35-82a0-fcebd9d6bfd3';
insert into TsField set FId='a7bf1bf5-9b52-4e35-82a0-fcebd9d6bfd3', FUnitId='00000000-0000-0000-0001-000000001002', FName='FManagerId',    FTitle='上层主管', FType='EntityBox',           FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001002', FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

delete from TsRelation where FId='2a030fc2-773f-470a-b9d5-cf7252ccac48';
delete from TsRelation where FId='59da7ecf-c0d8-4a9c-920a-2f04866ece20';
insert into TsRelation set FId='2a030fc2-773f-470a-b9d5-cf7252ccac48', FOppositeId='59da7ecf-c0d8-4a9c-920a-2f04866ece20', FName='员工-上层主管',         FOppositeName='上层主管-员工',       FUnitId1='00000000-0000-0000-0001-000000001002', FUnitId2='00000000-0000-0000-0001-000000001001', FType='field', FTable=null,                          FField1='FId',                   FField2='FManagerId',         FDeleteAction1='unset',   FDeleteAction2='cancel',  FPrivilegeTypeId1=null,                                   FPrivilegeTypeId2=null;

delete from TsFormField where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FFieldName='FManagerId';
update TsFormField set FIndex = FIndex + 1 where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FIndex >= 4;
insert into TsFormField set FFormId='320ab079-f260-4e81-b545-15c08fe1d955', FFieldName='FManagerId', FIndex=4;

update TsField set FSupportI18n = 1 where FId='48b349a5-8db9-4914-8ca0-23b6d555180f';
update TsField set FSupportI18n = 1 where FId='0592b984-5bda-49ba-890a-effade2e2c85';
update TsField set FSupportI18n = 1 where FId='ba795942-1b2b-4cf8-a360-329d0a8c4063';
