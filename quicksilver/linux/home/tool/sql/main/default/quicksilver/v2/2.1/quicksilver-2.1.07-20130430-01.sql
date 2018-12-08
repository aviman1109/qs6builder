--remove deprecated fields for privilege

alter table TsPrivilege drop FCanBeUser;
alter table TsPrivilege drop FCanBeDepartment;
alter table TsPrivilege drop FCanBeGlobal;
alter table TsPrivilege drop FUserFields;
alter table TsPrivilege drop FDepartmentFields;
alter table TsPrivilege drop FExtraOrSql;

delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FCanBeUser';
delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FCanBeDepartment';
delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FCanBeGlobal';
delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FUserFields';
delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FDepartmentFields';
delete from TsField where FUnitId='00000000-0000-0000-0001-000000001006' and FName='FExtraOrSql';

java setEditFields('5992c3d2-0b4a-478c-bbfa-2089819ad575', 'FName,FUnitId,FPrivilegeTypeId,FModuleId,FUseExisting,FSourcePrivilegeId');
java setEditFields('a4e6555d-8998-4287-a83f-8b0c9e5f87ff', 'FName,FModuleId');
java setFormFields('ff64e749-2a9f-4093-9932-e1c45a16bfc8', '基本信息', '8c213da2-3d3b-46b4-92b1-b23dca3c258a', null, 'FName,FModuleId,FUnitId,FPrivilegeTypeId,FUseExisting,FSourcePrivilegeId,FEditId');
java setListFields('2bd5d6a8-c0e0-4da3-aded-b5ec721ec08e', 'FName,FUnitId,FPrivilegeTypeId,FModuleId');

update TsPrivilege set FSourcePrivilegeId=null where FId='8bc8176c-455f-452b-835a-2a62169ddb59';

--workflow node privilege

alter table TwParticipant add FNodeId uuid;
create index IwParticipant3 on TwParticipant (FUserId, FNodeId, FEntityId);
update TwParticipant set FNodeId = (select FNodeId from TwWorkItem where FId = TwParticipant.FWorkItemId) where FNodeId is null;

alter table TwNode add FPrivilegeId uuid;

delete from TsField where FId='30b16b13-9c12-4127-b778-9932088b2438';
insert into TsField set FId='30b16b13-9c12-4127-b778-9932088b2438', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FPrivilegeId',       FTitle='参与者权限',   FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001006', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceFieldName=null, FCustomData='';

delete from TsRelation where FId='08363bb0-a82e-4d8c-a726-5491ed0cae9c';
insert into TsRelation set FId='08363bb0-a82e-4d8c-a726-5491ed0cae9c', FOppositeId='a3abc490-feef-4cb7-aad2-da52a1b525a5', FName='工作流节点-参与者权限', FOppositeName='参与者权限-工作流节点', FUnitId1='fd32e77e-07ce-442a-9687-671c017d03ef', FUnitId2='00000000-0000-0000-0001-000000001006', FType='field', FTable=null, FField1='FId',     FField2='FPrivilegeId', FDeleteAction1='unset',   FDeleteAction2='cancel',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

java setEditFields('ae542383-9d52-43d7-8940-962af2465fbb', 'FName,FCode,FMultiWorkItem,FJoinMode,FJoinCondition,FJoinConditionType,FTimeoutMode,FTimeoutDays,FTimeoutResult,FUrl,FUrlType,FPrivilegeId');
java setFormFields('dc16b2d8-e4e9-4801-926f-7b9479d7146c', '-', '38720435-2b81-4bbf-8288-591d481ab509', null, 'FName,FCode,FMultiWorkItem,FAutoFinish', '聚合', 'a78770f1-5a4e-4b1e-b081-1b03002e6c02', null, 'FJoinMode,FJoinConditionType,FJoinCondition', '超时', '5cfe8dda-fb78-4d1c-8e8f-8af8a0f72b1c', null, 'FTimeoutMode,FTimeoutDays,FTimeoutResult', '其它', '941b466d-e4f5-48f3-965c-d37e30a05daf', null, 'FPrivilegeId');

--jump audit

alter table TwLine add FSupportJump bit;
alter table TwLine add FJumpResult varchar(50);

delete from TsField where FId='e1a77170-0e14-4e61-8e4e-49d970314408';
delete from TsField where FId='17a4990d-5b22-4a26-a716-f8a6e400aa5a';
insert into TsField set FId='e1a77170-0e14-4e61-8e4e-49d970314408', FUnitId='f0ee0fe7-3e65-421a-a539-b47d4881418a', FName='FSupportJump',   FTitle='支持跳审',   FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,   FHint=null, FValidation=null, FWebServiceFieldName=null, FCustomData='';
insert into TsField set FId='17a4990d-5b22-4a26-a716-f8a6e400aa5a', FUnitId='f0ee0fe7-3e65-421a-a539-b47d4881418a', FName='FJumpResult',    FTitle='跳审结果',   FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,   FHint=null, FValidation=null, FWebServiceFieldName=null, FCustomData='';

java setFormFields('f0999e2f-7ea9-4753-adfc-fa2d43a0fb1f', '-', 'e9207961-81a4-4bb4-a908-103253c07da6', null, 'FName,FDefault,FConditionType,FCondition', '跳审(前后节点参与者相同，且后节点由前节点完成而触发时，自动完成后节点)', 'a8e84fc3-d0b9-4e28-a277-2778e980a905', null, 'FSupportJump,FJumpResult');

update TsField set FRequired=0 where FId='06b3381a-7f4f-4d13-a8e8-64c42d29d7fa';
