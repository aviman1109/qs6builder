--单元增加 FOpenViewPageCondition 字段

alter table TsUnit add FOpenViewPageCondition varchar(200);
delete from TsField where FId='203d1b21-bd5b-4282-8fbd-06a431d29c75';
insert into TsField set FId='203d1b21-bd5b-4282-8fbd-06a431d29c75', FUnitId='00000000-0000-0000-0001-000000000001', FName='FOpenViewPageCondition', FTitle='阅览页面打开条件',		FType='InputBox-Text',       FSize=200, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;
java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FOpenViewPageFirst,FOpenViewPageCondition,FSupportVersion,FWebServiceUniqueField');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本信息', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '数据库设置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '类设置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高级设置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它信息', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '阅览设置', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FOpenViewPageFirst,FOpenViewPageCondition', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '过滤条件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

update TsField set FRowSpan=11 where FId='edc45608-06a2-4b43-8151-108253f6c421';

delete from TsTextResource where FId='eb6e2c54-1345-4bd0-bd74-88c0a73da4dc';
insert into TsTextResource set FCode='E.Qs.User.InvalidLoginName',							FId='eb6e2c54-1345-4bd0-bd74-88c0a73da4dc', FValue='登录名不符合要求。登录名只能包含字母、数字、下划线(_)、横线(-)、点(.)、AT(@)。';

--关联关系调整

delete from TsRelation where FId='0f3f6b1a-3372-4586-a796-5fb251cb8450';
delete from TsRelation where FId='84fb036a-efc2-4ada-acb8-8ae16c739028';
delete from TsRelation where FId='532f79c9-b5e1-461f-977c-1dee05fd0646';
delete from TsRelation where FId='5cfe7ab8-7e90-4ebe-baaf-6b6a3772d042';
delete from TsRelation where FId='4e303ccd-11db-4aee-bc7b-688486eb3959';
delete from TsRelation where FId='d2ff723c-da67-42d7-9a7b-91909192c4d5';
insert into TsRelation set FId='0f3f6b1a-3372-4586-a796-5fb251cb8450', FOppositeId='5cfe7ab8-7e90-4ebe-baaf-6b6a3772d042', FName='首页项-查询方案',       FOppositeName='查询方案-首页项',       FUnitId1='00000000-0000-0000-0001-000000000017', FUnitId2='00000000-0000-0000-0001-000000000013', FType='field', FTable=null,                          FField1='FId',                   FField2='FQuerySchemaId',        FDeleteAction1='unset',   FDeleteAction2='cascade',   FPrivilegeTypeId1=null,                                   FPrivilegeTypeId2=null;
insert into TsRelation set FId='84fb036a-efc2-4ada-acb8-8ae16c739028', FOppositeId='4e303ccd-11db-4aee-bc7b-688486eb3959', FName='首页项-图表',           FOppositeName='图表-首页项',           FUnitId1='00000000-0000-0000-0001-000000000017', FUnitId2='00000000-0000-0000-0001-000000000018', FType='field', FTable=null,                          FField1='FId',                   FField2='FChartId',              FDeleteAction1='unset',   FDeleteAction2='cascade',   FPrivilegeTypeId1=null,                                   FPrivilegeTypeId2=null;
insert into TsRelation set FId='532f79c9-b5e1-461f-977c-1dee05fd0646', FOppositeId='d2ff723c-da67-42d7-9a7b-91909192c4d5', FName='首页项-报表',           FOppositeName='报表-首页项',           FUnitId1='00000000-0000-0000-0001-000000000017', FUnitId2='00000000-0000-0000-0001-000000000027', FType='field', FTable=null,                          FField1='FId',                   FField2='FReportId',             FDeleteAction1='unset',   FDeleteAction2='cascade',   FPrivilegeTypeId1=null,                                   FPrivilegeTypeId2=null;

--Flash 转换时间

delete from TsParameterDefinition where FId='c7734f27-1e64-460e-9171-7441e8b7b85a';
insert into TsParameterDefinition set FId='c7734f27-1e64-460e-9171-7441e8b7b85a', FName='本地转换超时时间(秒)',		    FCode='QsFlashConvertTimeout',				FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5;

delete from TsSystemParameter where FKey='QsFlashConvertTimeout';
insert into TsSystemParameter set FId='77f83952-fce2-4755-a28b-c0356293c3b2', FKey='QsFlashConvertTimeout',				FValue='120';

--提示信息

delete from TsTextResource where FId='884d974a-224b-45bc-bf47-7af553b9bf2d';
delete from TsTextResource where FId='a75bb59e-caa7-4073-a2bd-b98255b1e7fb';
insert into TsTextResource set FId='884d974a-224b-45bc-bf47-7af553b9bf2d', FCode='E.Qs.Chart.QuerySchemaNotPublic',							FValue='公共图表的查询方案必须也是公共的。';
insert into TsTextResource set FId='a75bb59e-caa7-4073-a2bd-b98255b1e7fb', FCode='E.Qs.QuerySchema.CannotBePrivate',						FValue='查询方案关联了公共或其它用户的首页项或图表，不能设为个人查询方案。';
