--minglei

update TsRolePrivilege set FExpression = replace(FExpression, 'FParentId:', 'FId:')
where locate('FParentId:', FExpression) > 0 and locate('FId:', FExpression) = 0 and FPrivilegeId in (
    select FId from TsPrivilege where FUnitId='00000000-0000-0000-0001-000000001001'
);

delete from TsUnitAccessField where FUnitId='00000000-0000-0000-0001-000000001001' and FFieldName='FParentId' and not exists (
	select * from TsRolePrivilege where locate('FParentId:', FExpression) > 0 and FPrivilegeId in (
		select FId from TsPrivilege where FUnitId='00000000-0000-0000-0001-000000001001'
	)
);
