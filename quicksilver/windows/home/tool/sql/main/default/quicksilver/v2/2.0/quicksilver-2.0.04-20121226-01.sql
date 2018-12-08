alter table TsQuerySchema alter column FSql set data type varchar(1000);
update TsField set FSize = 1000, FRowSpan=3 where FId='1f90ec68-5f01-4ffc-bfb0-22a4ec254ce1';

--------------------------------------------------------------------------------

java refreshSerial('TsDepartment');
java refreshSerial('TsFieldGroup', 'FFormId');
java refreshSerial('TsMenu');
java refreshSerial('TsParameterGroup');
java refreshSerial('TsReportCatalog');
java refreshSerial('TsChartCatalog');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20121226-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20121226-01';
