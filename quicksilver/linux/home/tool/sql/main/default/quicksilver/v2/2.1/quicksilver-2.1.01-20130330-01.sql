delete from TsTextResource where FId='a489700b-9488-4a89-a9d7-35eb52ed1a2d';
delete from TsTextResource where FId='526fc8fb-84c3-485f-a458-f17236b7ac16';
delete from TsTextResource where FId='8ef5e1f9-2633-4dca-a3b6-2336edcf0ad8';
delete from TsTextResource where FId='f82d9a14-c20c-4485-bba9-8df679afdca0';
delete from TsTextResource where FId='c9851caa-5ec8-4bd1-9e41-efa56fcb0bba';
delete from TsTextResource where FId='53083f51-f506-46eb-b362-f6530fc31150';
insert into TsTextResource set FCode='T.Esc.List.HidePageCount',							FId='a489700b-9488-4a89-a9d7-35eb52ed1a2d', FValue='隐藏总页数';
insert into TsTextResource set FCode='T.Esc.List.ShowPageCount',							FId='526fc8fb-84c3-485f-a458-f17236b7ac16', FValue='显示总页数';
insert into TsTextResource set FCode='T.Esc.List.TimeCost',									FId='8ef5e1f9-2633-4dca-a3b6-2336edcf0ad8', FValue='用时 ${0} 秒';
insert into TsTextResource set FCode='T.Qs.RolePrivilege.SqlNullText',						FId='f82d9a14-c20c-4485-bba9-8df679afdca0', FValue='点击编辑';
insert into TsTextResource set FCode='T.Qs.RolePrivilege.SqlInputTitle',					FId='c9851caa-5ec8-4bd1-9e41-efa56fcb0bba', FValue='过滤条件';
insert into TsTextResource set FCode='T.Qs.RolePrivilege.SqlInputMessage',					FId='53083f51-f506-46eb-b362-f6530fc31150', FValue='请输入 SQL 过滤条件（where 部分，不包含 where 关键字）';

delete from TsUnit where FId='00000000-0000-0000-0001-000000001007';
insert into TsUnit set FId='00000000-0000-0000-0001-000000001007', FCode='Qs.RolePrivilege', FName='权限分配', FIcon='quicksilver/image/unit/RolePrivilege.gif', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='Dialog', FIsTreeStructure=0, FMaxTreeLevel=0, FIsSlaveUnit=0, FMasterUnitId=null, FSupportWorkflow=null, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportBusinessLog=0, FSupportNote=null, FSupportSort=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FDataSource='default', FTable='TsRolePrivilege', FKeyField='FId', FKeyType='Uuid', FNameField='FPrivilegeId$', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.privilege.RolePrivilegeHome', FDaoClassName='com.jeedsoft.quicksilver.privilege.dao.impl.RolePrivilegeDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.privilege.service.impl.RolePrivilegeServiceImpl', FActionClassName='com.jeedsoft.quicksilver.privilege.action.impl.RolePrivilegeActionImpl', FUnitFilterSql=null, FBusinessFilterSql=null, FDescription=null, FSourceType='Local';

alter table TsRolePrivilege add FSql varchar(1000);

delete from TsField where FId='f9bef7ff-275a-4847-a2d1-7f6a735c5760';
delete from TsField where FId='1030d4d5-1436-4273-afcc-657665454836';
delete from TsField where FId='e7be493a-7288-47db-968f-37f8877a42fb';
delete from TsField where FId='d8662880-762e-4d12-995f-8d5088040c09';
insert into TsField set FId='f9bef7ff-275a-4847-a2d1-7f6a735c5760', FUnitId='00000000-0000-0000-0001-000000001007', FName='FGlobal',      FTitle='是否全部', FType='CheckBox',      FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FSelectListFilterSql='',   FSourceType='local', FJoinField='',   FSourceField='',   FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor='',   FDefaultValue='',   FValidation='',   FRelationCapacity=null;
insert into TsField set FId='1030d4d5-1436-4273-afcc-657665454836', FUnitId='00000000-0000-0000-0001-000000001007', FName='FOperator',	  FTitle='操作符',   FType='InputBox-Text', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='e7be493a-7288-47db-968f-37f8877a42fb', FUnitId='00000000-0000-0000-0001-000000001007', FName='FExpression',  FTitle='表达式',   FType='InputBox-Text',	FSize=1000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='d8662880-762e-4d12-995f-8d5088040c09', FUnitId='00000000-0000-0000-0001-000000001007', FName='FSql',		  FTitle='SQL',      FType='TextBox',       FSize=1000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=3, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

update TsPage set FActionMethodName='Qs.RolePrivilege.prepareConfig' where FId='06f70e31-cf0c-492c-9793-05b06d9111b7';

update TsParameterDefinition set FIndex = FIndex - 1 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex > 6;
update TsParameterDefinition set FIndex = FIndex + 3 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 8;
update TsParameterDefinition set FIndex = 8 where FId='679ac185-c913-4f16-8662-1fba49ba0a0f';

delete from TsParameterDefinition where FId='afb541c8-9a64-4165-b119-3b8e872c5a2a';
delete from TsParameterDefinition where FId='c9d8f94c-4b9b-4db0-9fe1-ca288c4a2e2e';
delete from TsParameterDefinition where FId='82479d99-fc1f-4640-b34b-07f03811c319';
insert into TsParameterDefinition set FId='afb541c8-9a64-4165-b119-3b8e872c5a2a', FName='空格处理方式',					FCode='QsSolrBlankOperator',		FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=6, FDictionaryId='bcdd0893-3d07-477b-9582-09b9d6dadc92';
insert into TsParameterDefinition set FId='c9d8f94c-4b9b-4db0-9fe1-ca288c4a2e2e', FName='列表是否显示总页数',			FCode='QsListShowPageCount',		FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=9;
insert into TsParameterDefinition set FId='82479d99-fc1f-4640-b34b-07f03811c319', FName='列表是否自动查询',				FCode='QsListAutoQuery',			FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=10;

delete from TsSystemParameter where FKey='QsSolrBlankOperator';
delete from TsSystemParameter where FKey='QsListShowPageCount';
delete from TsSystemParameter where FKey='QsListAutoQuery';
insert into TsSystemParameter set FId='1f0d2fbf-1a2d-47b2-afe5-da94c7eb7d52', FKey='QsSolrBlankOperator',			FValue='And';
insert into TsSystemParameter set FId='74844aad-ad3e-4598-8fee-da90c6fa370a', FKey='QsListShowPageCount',			FValue='false';
insert into TsSystemParameter set FId='aa41bd6e-9195-40b0-8a26-5978527b19ee', FKey='QsListAutoQuery',				FValue='true';

delete from TsDictionary where FId='bcdd0893-3d07-477b-9582-09b9d6dadc92';
delete from TsDictionaryItem where FDictionaryId='bcdd0893-3d07-477b-9582-09b9d6dadc92';
insert into TsDictionary set FId='bcdd0893-3d07-477b-9582-09b9d6dadc92', FName='QS-参数-空格处理方式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='da44e9fa-e06c-4c76-ae0b-0c8b0e460006', FDictionaryId='bcdd0893-3d07-477b-9582-09b9d6dadc92', FValue='And',				FText='解析为且(AND)',	FIndex=1;
insert into TsDictionaryItem set FId='f81f0e76-f0ef-4822-86e5-ef47a43dbe66', FDictionaryId='bcdd0893-3d07-477b-9582-09b9d6dadc92', FValue='Or',					FText='解析为或(OR)',	FIndex=2;

java setFormFields('a6c925a0-8170-49e1-a797-331ed15bed2a', 'FName,FType,FPublic,FVisible,FSqlSource,FSql');

