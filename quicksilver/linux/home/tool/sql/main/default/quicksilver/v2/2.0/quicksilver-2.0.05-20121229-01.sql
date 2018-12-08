alter table TsEdit add FCustomizeFields bit default 1;
insert into TsField set FId='5b96ae7b-50dc-4542-8005-703f3c783fc9', FUnitId='00000000-0000-0000-0001-000000000012', FName='FCustomizeFields',	FTitle='自定义字段',	FType='CheckBox',         FSize=0,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='1',  FValidation=null, FRelationCapacity=null;
java setFormFields('8e5f7a18-ede0-4753-a9d5-b8c30b2d33c4', 'FName|FDefault|FVisible|FCustomizeFields');
java setListFields('ca2b4b6a-86d3-41d0-8333-10f956656809', 'FName,FDefault,FVisible,FCustomizeFields');
java setListFields('bdf38d67-a744-4423-8a62-12080f87e99a', 'FName,FDefault,FVisible,FCustomizeFields');
update TsEdit set FCustomizeFields = 1 where FCustomizeFields is null;

delete from TsDictionaryItem where FId='af7a10c4-a3cc-487e-b46f-995fe0204d46';
insert into TsDictionaryItem set FId='af7a10c4-a3cc-487e-b46f-995fe0204d46', FDictionaryId='054afa07-6b92-4545-b078-b231f8927452', FValue='EditType',				FText='实体类型',		FIndex=3;
delete from TsI18nString where FId='9fa0fea8-d008-4778-b2da-a0dbf20ce935';
insert into TsI18nString set FCode='T.Qs.Field.EditId',                                 FId='9fa0fea8-d008-4778-b2da-a0dbf20ce935', FValue='实体类型';

insert into TsI18nString set FCode='E.Jsql.JavaMethodNotRegistered',                     FId='024e79b8-1ba3-4a17-85b7-6e0747008bf8', FValue='“${0}”不是有效的 Java 方法全名，也未在 JeedSQL 中注册。';

alter table TsQuerySchema alter column FSql set data type varchar(2000);
update TsField set FSize = 2000 where FId='1f90ec68-5f01-4ffc-bfb0-22a4ec254ce1';

java setKeywordFields('00000000-0000-0000-0001-000000000006', 'FName,FCode');

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20121229-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20121229-01';
