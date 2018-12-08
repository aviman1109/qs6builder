--minglei

alter table TsUnit add FIsTreeCheckPrivilege bit;
insert into TsField set FId='8ffcd6a1-bd08-4d01-8fcf-efc203075c33', FUnitId='00000000-0000-0000-0001-000000000001', FName='FIsTreeCheckPrivilege',  FTitle='顯示為樹時是否驗權',	FType='CheckBox',            FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;
java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FBigIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FIsTreeCheckPrivilege,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FViewPageConditionForList,FViewPageConditionForLink,FSupportVersion,FWebServiceUniqueField');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本資訊', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIcon,FBigIcon,FIsTreeStructure,FIsTreeCheckPrivilege,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '資料庫設置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '類設置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高級設置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它資訊', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '閱覽頁面打開條件', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FViewPageConditionForList,FViewPageConditionForLink', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '過濾條件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

java runOnEmpty(
	'select * from TsUnitAccessField where FUnitId=''00000000-0000-0000-0001-000000001001'' and FFieldName=''FId''',
	'insert into TsUnitAccessField set FUnitId=''00000000-0000-0000-0001-000000001001'', FFieldName=''FId'', FIndex=1'
);
java runOnEmpty(
	'select * from TsUnitAccessField where FUnitId=''00000000-0000-0000-0001-000000001001'' and FFieldName=''FUserId''',
	'insert into TsUnitAccessField set FUnitId=''00000000-0000-0000-0001-000000001001'', FFieldName=''FUserId'', FIndex=2'
);
java runOnEmpty(
	'select * from TsUnitAccessField where FUnitId=''00000000-0000-0000-0001-000000001002'' and FFieldName=''FDepartmentId''',
	'insert into TsUnitAccessField set FUnitId=''00000000-0000-0000-0001-000000001002'', FFieldName=''FDepartmentId'', FIndex=1'
);
java runOnEmpty(
	'select * from TsUnitAccessField where FUnitId=''00000000-0000-0000-0001-000000001002'' and FFieldName=''FManagerId''',
	'insert into TsUnitAccessField set FUnitId=''00000000-0000-0000-0001-000000001002'', FFieldName=''FManagerId'', FIndex=2'
);

update TsUnit set FSupportPrivilegeField=1 where FId='00000000-0000-0000-0001-000000001001';
update TsUnit set FSupportPrivilegeField=1 where FId='00000000-0000-0000-0001-000000001002';
