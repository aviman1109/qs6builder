alter table TsWebServiceInterface drop column FUnitId;
alter table TsWebServiceInterface drop column FJavaMethod;
alter table TsWebServiceInterface add FWebServiceProviderId uuid;
alter table TsWebServiceInterface add FCode varchar(50);

delete from TsField where FId='971b0db1-55ce-4fdc-825e-79ead5a9e0cc';
delete from TsField where FId='2eb6e2af-0b34-427b-ba23-5949a9ef8829';
insert into TsField set FId='971b0db1-55ce-4fdc-825e-79ead5a9e0cc', FUnitId='40851101-8153-4844-a4d1-fddde80be150', FName='FCode',					FTitle='编码',				FType='InputBox-Text', FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=200, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null;
insert into TsField set FId='2eb6e2af-0b34-427b-ba23-5949a9ef8829', FUnitId='40851101-8153-4844-a4d1-fddde80be150', FName='FWebServiceProviderId',	FTitle='WebService 提供者', FType='EntityBox',     FSize=null, FVisible=0, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId='287f05f1-5675-4f18-9eb5-04584ddf5d04', FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=null, FHint=null;

java setOrderFields('40851101-8153-4844-a4d1-fddde80be150', 'FCode', '0');

delete from TsRelation where FId='e16b0a2c-96d7-4cbe-8ea4-3d75f9ae7a12';
delete from TsRelation where FId='ce78a07b-9eb3-4dc5-bdfa-40e3dd296ad5';
insert into TsRelation set FId='e16b0a2c-96d7-4cbe-8ea4-3d75f9ae7a12', FOppositeId='ce78a07b-9eb3-4dc5-bdfa-40e3dd296ad5', FName='WebService接口-WebService提供者', FOppositeName='WebService提供者-WebService接口', FUnitId1='40851101-8153-4844-a4d1-fddde80be150', FUnitId2='287f05f1-5675-4f18-9eb5-04584ddf5d04', FType='field', FTable='', FField1='FId', FField2='FWebServiceProviderId', FDeleteAction1='unset', FDeleteAction2='cascade', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

delete from TsPage where FId='304334cc-212d-4876-912d-d25b303700c5';
insert into TsPage set FId='304334cc-212d-4876-912d-d25b303700c5', FName='WebService 接口列表',		  FTitle='WebService',			  FCode='Qs.WebServiceProvider.WebServiceInterfaceList',	FPlatform='Computer', FType='EditableList', FIcon='quicksilver/image/unit/WebServiceInterface.png', FUrl='quicksilver/page/template/EditableList.jsp',	FActionMethodName='Qs.WebServiceInterface.prepareEditableList',	FLoadHandler=null,								FRelationId='ce78a07b-9eb3-4dc5-bdfa-40e3dd296ad5', FUnitId='40851101-8153-4844-a4d1-fddde80be150', FMasterUnitId='287f05f1-5675-4f18-9eb5-04584ddf5d04', FIsSlavePage=1, FIndex=2,    FDialogWidth=null, FDialogHeight=null, FVisible=1, FDescription='',   FHasViewFrame=0;

java setFormFields('4d81fc30-95ee-4cb5-b2d1-ca783f0ebec0', '基本信息', 'e96711cf-e862-415e-8ee0-5d57100792cb', null, 'FCode,FWebServiceUrl');
java setListFields('cfe80156-5265-4744-9be2-934e713f0eb5', 'FCode,FWebServiceUrl');
java setListFields('5fcd8a8d-d418-49a9-adca-46ee5758bab7', 'FCode,FWebServiceUrl');
java setListFields('9b1ebd3a-1b32-49b1-a1ba-b1b6c61e670e', 'FCode,FWebServiceUrl');

alter table TsUnit drop FWebServiceProviderId;
delete from TsField where FId='603d3108-a7a4-4f2b-83f4-aa46354e74f0';
delete from TsRelation where FId='a594963d-4e91-4864-8bab-6aa10902ea90';
delete from TsRelation where FId='72cbdf84-f0ea-4a00-a85b-592c38a22a11';
java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FOpenViewPageFirst,FSupportVersion,FWebServiceUniqueField');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本信息', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '数据库设置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '类设置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高级设置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它信息', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '阅览设置', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FOpenViewPageFirst', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '过滤条件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

delete from TsTextResource where FId='5daa928f-3007-4cfb-a075-fdca7a0860d3';
insert into TsTextResource set FCode='E.Qs.WebServiceInterface.NotExist',					FId='5daa928f-3007-4cfb-a075-fdca7a0860d3', FValue='不存在提供者为“${0}”，编码为“${1}”的 WebService 接口。';
