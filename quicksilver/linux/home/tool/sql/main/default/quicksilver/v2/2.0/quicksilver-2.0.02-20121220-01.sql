--调整单元字段宽度

update TsField set FListWidth=150 where FUnitId='00000000-0000-0000-0001-000000000002' and FName='FName';

--是否显示阅览窗格转移至页面设置

alter table TsPage add FHasViewFrame bit;
update TsPage set FHasViewFrame = case when exists (select * from TsUnit where FId = TsPage.FUnitId and FCode || '.List' = TsPage.FCode and FListHasViewFrame = 1) then 1 else 0 end;
alter table TsUnit drop FListHasViewFrame;

delete from TsField where FId='e51ec17c-7de6-4216-9e10-d7f887246ffa';
delete from TsField where FId='f9baf06c-55a7-427f-86fe-e6d444c59f5a';
insert into TsField set FId='e51ec17c-7de6-4216-9e10-d7f887246ffa', FUnitId='00000000-0000-0000-0001-000000000006', FName='FHasViewFrame',     FTitle='显示阅览窗格', FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                              FValidation=null, FEntityCapacity=null;

java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FCreateDefaultWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FOpenViewPageFirst');
java setFormFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', '(59d36e10-fa9b-4ca7-8650-f4bc2333c5f0,基本信息,FName|FCode|FIcon|FModuleId|FOpenMode|FIsSlaveUnit|FMasterUnitId|FIsTreeStructure|FCreateDefaultWorkflow|FSupportUser|FSupportDepartment|FSupportEditType|FSupportAttachment|FSupportDataPrivilege|FSupportBusinessLog|FSupportNote|FSupportSort|FRecordCreateInfo|FRecordUpdateInfo|FEditId,(70cd09f2-5607-4d3d-a4e4-15a010b5c2d0,数据库设置,FDataSource|FTable|FKeyField|FKeyType|FNameField|FMasterField)(f3c8ed03-71a9-44ea-866a-ce74f02fb94e,类设置,FHomeClassName|FDaoClassName|FServiceClassName|FActionClassName)(f3f089fa-9689-41aa-abe8-2430f90869c9,高级设置))(8716f3a5-7c55-4a1d-b4d4-adde4702a211,其它信息,(a9fb9172-544a-4871-a6be-6ac416d6a75b,阅览设置,FOpenViewPageFirst)(d1882fc0-77a8-442f-9cde-2857b6c08760,过滤条件,FUnitFilterSql|FBusinessFilterSql)(88b5af9a-d39d-493d-b1f9-db23b282327e,描述,FDescription))');
java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '(0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc,基本信息,FPlatform|FType|FIsSlavePage|FRelationId|FUnitId|FMasterUnitId,(66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b,通用信息,FCode|FName|FTitle|FUrl|FActionMethodName|FLoadHandler)(0e78d39e-0a96-4520-9c64-499b583b9897,电脑信息,FIcon|FDialogHeight|FDialogWidth|FHasViewFrame)(ed6e4ca6-8917-4648-9247-5d158179fb97,描述,FDescription))');

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');
java refreshSerial('TsMenu');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20121220-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20121220-01';
