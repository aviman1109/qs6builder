--Minglei

update TsUnit set FSupportEditType=1 where FCode='Qs.Page';

alter table TsPage add FEditId uuid;
insert into TsField set FId='b8900f10-fe29-4ff2-b224-ba1e2d2c8652', FUnitId='00000000-0000-0000-0001-000000000006', FName='FEditId',                FTitle='平臺',               FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=1, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000012', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',                                          FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                              FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',   FAlwaysBringDataToClient=0;
update TsPage set FEditId='5c6ae004-d69f-4c45-acb1-d1a049bd8aa9' where FPlatform='Mobile';
update TsPage set FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e' where FEditId is null;

insert into TsEdit set FCustomizeFields=1, FDefault=1, FId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FIndex=1, FName='電腦', FUnitId='00000000-0000-0000-0001-000000000006', FVisible=1;
insert into TsEdit set FCustomizeFields=1, FDefault=0, FId='5c6ae004-d69f-4c45-acb1-d1a049bd8aa9', FIndex=2, FName='手機', FUnitId='00000000-0000-0000-0001-000000000006', FVisible=1;
java setEditFields('4e9b96a5-4c20-42a0-8929-d83efc27af4e', 'FActionMethodName,FUrl,FMasterUnitId,FCode,FName,FUnitId,FIcon,FEditId,FDialogWidth,FDialogHeight,FToolItemInitArguments,FPlatform,FDescription,FIsSlavePage,FCreateQuerySchemaBox,FQueryFormAutoQuery,FDialogMaximized,FQueryOnLoad,FRelationId,FCreateKeywordBox,FVisibleCondition,FTitle,FLoadHandler,FQuerySchemaId,FType,FHasViewFrame');
java setEditFields('5c6ae004-d69f-4c45-acb1-d1a049bd8aa9', 'FActionMethodName,FMasterUnitId,FCode,FName,FUnitId,FDescription,FIsSlavePage,FRelationId,FVisibleCondition,FTitle,FLoadHandler,FType,FEditId');

java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '基本資訊', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', null, 'FType,FEditId,FIsSlavePage,FRelationId,FUnitId,FMasterUnitId,FVisibleCondition', '通用資訊', '66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FCode,FName,FTitle,FUrl,FActionMethodName,FLoadHandler', '清單信息', '6fdfaf24-efd9-444f-952b-a738654a4d68', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FQueryFormAutoQuery,FHasViewFrame,FQueryOnLoad,FQuerySchemaId,FCreateQuerySchemaBox,FCreateKeywordBox,FToolItemInitArguments', '電腦資訊', '0e78d39e-0a96-4520-9c64-499b583b9897', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FIcon,FDialogWidth,FDialogHeight,FDialogMaximized', '描述', 'ed6e4ca6-8917-4648-9247-5d158179fb97', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FDescription');
java setListFields('57292237-25c0-4f42-9180-c6fc12eb30e4', 'FEditId,FName,FTitle,FUnitId,FMasterUnitId,FIsSlavePage,FCode');
java setListFields('ae3c4f51-30f8-470d-a470-9ef065b70a6c', 'FEditId,FName,FTitle,FUnitId,FCode');

update TsToolItem set FType='ComboButton', FSubItemSource='EditType'
where FCode = 'Add' and FPageId in (select FId from TsPage where FCode in ('Qs.Page.List', 'Qs.Page.SelectList', 'Qs.Unit.PageList'));

delete from TsRelation where FId='323b992f-5985-44f4-8962-eec19690394e' or FOppositeId='323b992f-5985-44f4-8962-eec19690394e';

----------------------

java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本資訊', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIcon,FIsTreeStructure,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '資料庫設置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '類設置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高級設置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它資訊', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '閱覽頁面打開條件', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FViewPageConditionForList,FViewPageConditionForLink', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '過濾條件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');
update TsField set FIsNewRow=0 where FId='0bddcdbd-b8fe-432c-bbdc-1e3d803c2a2a';
