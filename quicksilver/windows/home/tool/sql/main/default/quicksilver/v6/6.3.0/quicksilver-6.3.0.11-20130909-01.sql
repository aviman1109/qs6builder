--單元

alter table TsUnit add FViewPageConditionForList varchar(200);
alter table TsUnit add FViewPageConditionForLink varchar(200);

update TsUnit set FViewPageConditionForList = FOpenViewPageCondition where FOpenViewPageFirst = 1 and FViewPageConditionForList is null and trim(FOpenViewPageCondition) <> '';
update TsUnit set FViewPageConditionForList = 'true' where FOpenViewPageFirst = 1 and FViewPageConditionForList is null;

delete from TsField where FId='f12272eb-c45a-4e80-9ff1-81d40eea1558';
delete from TsField where FId='203d1b21-bd5b-4282-8fbd-06a431d29c75';
delete from TsField where FId='a752ff7b-b871-411c-869c-443acb0e2d57';
delete from TsField where FId='4ca67a5b-1e55-4c09-a94e-f62ecd5d7445';
insert into TsField set FId='a752ff7b-b871-411c-869c-443acb0e2d57', FUnitId='00000000-0000-0000-0001-000000000001', FName='FViewPageConditionForList', FTitle='通過列表',		FType='InputBox-Text',       FSize=200, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;
insert into TsField set FId='4ca67a5b-1e55-4c09-a94e-f62ecd5d7445', FUnitId='00000000-0000-0000-0001-000000000001', FName='FViewPageConditionForLink', FTitle='通過連結',		FType='InputBox-Text',       FSize=200, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;

java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FViewPageConditionForList,FViewPageConditionForLink,FSupportVersion,FWebServiceUniqueField');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本資訊', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '資料庫設置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '類設置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高級設置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它資訊', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '閱覽頁面打開條件', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FViewPageConditionForList,FViewPageConditionForLink', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '過濾條件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

--工作臺設置

update TsToolItem set FDefaultEventHandler='WorkbenchConfig.doSave' where FId='3f3a7c11-5cdd-4d38-afd8-2e297f4c00b5';
update TsToolItem set FDefaultEventHandler='WorkbenchConfig.doSave' where FId='a6b24b03-ea7e-4b94-9384-037807a75483';
update TsToolSubItem set FEventHandler='WorkbenchConfig.doExportCurrent' where FId='585023d3-4ebb-4a99-a0f8-2d3faf42167a';
update TsToolSubItem set FEventHandler='WorkbenchConfig.doExportAll' where FId='383b6409-870c-417c-9f69-6c659a974ca6';

--閱覽介面

alter table TsViewItem alter FType set data type varchar(100);
update TsField set FSize=100 where FId='12b2a705-932a-477a-80ef-1f65d5f42d27';

delete from TsTextResource where FId='ee512566-95cf-41bb-82dc-d5036487aab2';
delete from TsTextResource where FId='d6d3f00b-1c34-4f5b-8d34-324c59be64cf';
delete from TsTextResource where FId='d68cdad4-484e-4cce-8d52-70b35cb2ce14';
delete from TsTextResource where FId='9ac051d5-3f63-49e9-b124-a0939c727838';
insert into TsTextResource set FId='ee512566-95cf-41bb-82dc-d5036487aab2', FCode='T.Public.PageFirst',									FValue='首頁';
insert into TsTextResource set FId='d6d3f00b-1c34-4f5b-8d34-324c59be64cf', FCode='T.Public.PageLast',									FValue='尾頁';
insert into TsTextResource set FId='d68cdad4-484e-4cce-8d52-70b35cb2ce14', FCode='T.Public.PageNext',									FValue='下頁';
insert into TsTextResource set FId='9ac051d5-3f63-49e9-b124-a0939c727838', FCode='T.Public.PagePrevious',								FValue='上頁';

--歷史版本

alter table TsVersion add FChange varchar(1000);
insert into TsField set FId='da41a174-1750-484d-86ed-6142057f858d', FUnitId='9638ca92-70a6-45eb-945c-4bf98d0187d3', FName='FChange',   FTitle='變更',     FType='TextBox',			FSize=1000,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,	FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=6, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
java setFormFields('39942e8e-29fd-4e6d-817a-5c7e6db96846', '基本資訊', 'b2f9a797-7257-470b-b4b0-957a0822cb52', null, 'FUnitId,FNumber,FUserId,FSaveTime,FName,FChange');
java setListFields('d8df5eff-b8c7-45f7-99db-26405b860498', 'FNumber,FUserId,FSaveTime,FChange');
