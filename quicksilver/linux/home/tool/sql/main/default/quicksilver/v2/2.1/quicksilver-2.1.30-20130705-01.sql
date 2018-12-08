--部门的单元权限字段

update TsUnit set FSupportPrivilegeField=1 where FCode='Qs.Department';
delete from TsUnitAccessField where FUnitId='00000000-0000-0000-0001-000000001001' and FFieldName='FParentId';
delete from TsUnitAccessField where FUnitId='00000000-0000-0000-0001-000000001001' and FFieldName='FUserId';
insert into TsUnitAccessField set FUnitId='00000000-0000-0000-0001-000000001001', FFieldName='FParentId', FIndex=1;
insert into TsUnitAccessField set FUnitId='00000000-0000-0000-0001-000000001001', FFieldName='FUserId',   FIndex=2;
