delete from TsTextResource where FId='ceb472b4-93a8-492c-83c3-3666fa2d6412';
delete from TsTextResource where FId='0faaa2de-0827-4730-bd37-7c0632e217d8';
insert into TsTextResource set FCode='E.Qs.WebService.Failed',								FId='ceb472b4-93a8-492c-83c3-3666fa2d6412', FValue='WebService 调用失败。错误信息：${0}';
insert into TsTextResource set FCode='E.Qs.WebService.NotAvailable',						FId='0faaa2de-0827-4730-bd37-7c0632e217d8', FValue='WebService 无法访问。';

alter table TsUnit drop FWebServiceKeyType;
alter table TsUnit drop FWebServiceKeyField;
alter table TsUnit add FWebServiceUniqueField varchar(50);

delete from TsField where FId='fd9aeb28-bfa8-40e3-9998-a3fa40158280';
delete from TsField where FId='a7990c5a-ba74-4986-9e8f-a068882760e8';
insert into TsField set FId='fd9aeb28-bfa8-40e3-9998-a3fa40158280', FUnitId='00000000-0000-0000-0001-000000000001', FName='FWebServiceUniqueField',    FTitle='唯一键字段',      FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                             FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null;

java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FOpenViewPageFirst,FSupportVersion,FSourceType,FWebServiceUniqueField,FWebServiceClassName,FWebServiceProviderId');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本信息', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FIcon,FModuleId,FOpenMode,FSourceType,FMasterUnitId,FIsSlaveUnit,FIsTreeStructure,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '数据库设置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '类设置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高级设置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它信息', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '阅览设置', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FOpenViewPageFirst', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceProviderId,FWebServiceUniqueField,FWebServiceClassName', '过滤条件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

delete from TsTextResource where FId='f4af2b35-0486-40b8-bc09-bd0173f8d205';

update TsParameterGroup set FIndex = FIndex + 1 where FParentId = '1b380ee1-cbdb-44e4-980c-7a789b428cec' and FIndex >= 6;
delete from TsParameterGroup where FId='6d69b985-9411-4bc9-843e-0a5cddabb338';
insert into TsParameterGroup set FId='6d69b985-9411-4bc9-843e-0a5cddabb338', FName='附件生成 Flash 设置',	FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec', FIndex=6;

delete from TsParameterDefinition where FId='4e64d612-7c61-4184-8043-7d2be5e144af';
delete from TsParameterDefinition where FId='a26d6288-48d5-4f0d-a32a-0bba5baa7fe1';
delete from TsParameterDefinition where FId='a72620d8-842d-4880-a3e7-dbeab47a886f';
delete from TsParameterDefinition where FId='f563349d-4a03-42e5-b209-c106beb31d94';
insert into TsParameterDefinition set FId='4e64d612-7c61-4184-8043-7d2be5e144af', FName='通过远端服务转换',				FCode='QsFlashRemoteConvert',		FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=1;
insert into TsParameterDefinition set FId='a26d6288-48d5-4f0d-a32a-0bba5baa7fe1', FName='转换服务器 URL',				FCode='QsFlashServerUrl',			FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Url',			FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='a72620d8-842d-4880-a3e7-dbeab47a886f', FName='转换服务器用户名',				FCode='QsFlashServerUserName',		FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='f563349d-4a03-42e5-b209-c106beb31d94', FName='转换服务器密码',				FCode='QsFlashServerPassword',		FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Password',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;

delete from TsParameterDefinition where FId='d14a7df4-36b5-4af1-b8a1-85fc3decfee6';
delete from TsSystemParameter where FKey='d14a7df4-36b5-4af1-b8a1-85fc3decfee6';

create table TsSystemParameter2
(
	FId		uuid primary key,
	FKey	varchar(50),
	FValue	varchar(500)
);

insert into TsSystemParameter2
select FId, (select FCode from TsParameterDefinition where FId = TsSystemParameter.FKey) as FKey, FValue
from TsSystemParameter;

drop table TsSystemParameter;

create table TsSystemParameter
(
	FId		uuid primary key,
	FKey	varchar(50),
	FValue	varchar(500)
);

insert into TsSystemParameter select * from TsSystemParameter2;

drop table TsSystemParameter2;

create table TsUserParameter2
(
	FId		uuid primary key,
	FUserId	uuid,
	FKey	varchar(50),
	FValue	varchar(500),
	unique(FUserId, FKey)
);

insert into TsUserParameter2
select FId, FUserId, (select FCode from TsParameterDefinition where FId = TsUserParameter.FKey) as FKey, FValue
from TsUserParameter;

drop table TsUserParameter;

create table TsUserParameter
(
	FId		uuid primary key,
	FUserId	uuid,
	FKey	varchar(50),
	FValue	varchar(500),
	unique(FUserId, FKey)
);

insert into TsUserParameter select * from TsUserParameter2;

drop table TsUserParameter2;

alter table TsAttachment add FFlashFileTime timestamp;
delete from TsField where FId='ee1e7d51-a89a-4dc1-853a-9e4b79dab314';
insert into TsField set FId='ee1e7d51-a89a-4dc1-853a-9e4b79dab314', FUnitId='00000000-0000-0000-0001-000000000019', FName='FFlashFileTime',			FTitle='预览文件处理时间',				FType='DateBox-DateTime',	FSize=0,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
