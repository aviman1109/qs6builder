--minglei

--i18n

delete from TsTextResource where FCode='T.Public.DeleteConfirmTemplate';
insert into TsTextResource set FId='253f6842-577e-4e05-9aed-fcbea743f375', FCode='T.Public.DeleteConfirmTemplate',						FValue='您是否確定要刪除該${0}？';

update TsPage set FRelationId='7ff10213-4c22-4358-aa52-7092e268337b' where FCode='Qs.Department.List';

delete from TsRelation where not exists (select * from TsUnit where FId = TsRelation.FUnitId1);
delete from TsRelation where not exists (select * from TsUnit where FId = TsRelation.FUnitId2);

delete from TsCollection where not exists (select * from TsUnit where FId = TsCollection.FUnitId);
delete from TsCollection where FEntityName is null or trim(FEntityName) = '';
