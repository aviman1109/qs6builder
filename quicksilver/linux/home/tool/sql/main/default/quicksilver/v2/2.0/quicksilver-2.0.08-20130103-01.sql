--增加页签数量上限参数

insert into TsParameterDefinition set FId='5b71a696-03e2-4617-9efb-c5e5e0082848', FName='页签数量上限',			    FCode='QsMaxTabCount',				FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='InputBox-Integer',		FRange='SystemAndUser',	FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=6;

update TsParameterDefinition set FIndex=7  where FId='8b243d3c-05b0-4830-a49e-b06c4f4a719c';
update TsParameterDefinition set FIndex=8  where FId='426d8a7b-8e86-4021-b542-922929040528';
update TsParameterDefinition set FIndex=9  where FId='42670b10-8477-45ee-865e-8489e83296fc';
update TsParameterDefinition set FIndex=10 where FId='49e8e7c4-1fdc-4594-b825-2846a69867b4';
update TsParameterDefinition set FIndex=11 where FId='a84d0c41-ad55-4886-b965-637eb17fe17a';
update TsParameterDefinition set FIndex=12 where FId='beef7a4f-bd74-48a1-a19c-45a0e6761492';

insert into TsSystemParameter set FId='6c862e15-2dbb-4da6-9bf9-928c9c550444', FKey='5b71a696-03e2-4617-9efb-c5e5e0082848', FValue='10';

java refreshSerial('TsParameterGroup');

update TsUnit set FActionClassName='com.jeedsoft.quicksilver.message.action.impl.ShortMessageActionImpl' where FId='4a31273a-b5ba-4214-a06c-ee59035869a8';

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20130103-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20130103-01';
