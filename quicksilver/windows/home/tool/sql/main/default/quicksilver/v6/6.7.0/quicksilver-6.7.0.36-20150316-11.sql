delete from TsRelation where FId='2cf31ee8-188f-4b02-9b4c-86930cd72ad8';
delete from TsRelation where FId='41db09bd-9785-4b34-9f1b-09b557d702bb';
insert into TsRelation set FId='2cf31ee8-188f-4b02-9b4c-86930cd72ad8', FOppositeId='41db09bd-9785-4b34-9f1b-09b557d702bb', FName='遠端API測試用例-遠端API', FOppositeName='遠端API-遠端API測試用例', FUnitId1='82fa57a0-dd5a-4044-a6c4-e53c1603fe06', FUnitId2='d9fae961-1ef3-4879-893c-fe68913ff828', FType='field', FTable='', FField1='FId', FField2='FRemoteApiId', FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
java complementRelations();

update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.LocalApi';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.LocalApiGroup';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.RemoteApi';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.RemoteApiGroup';
update TsUnit set FUseSystemI18nTable=1 where FCode='Qs.RemoteApiTestCase';
