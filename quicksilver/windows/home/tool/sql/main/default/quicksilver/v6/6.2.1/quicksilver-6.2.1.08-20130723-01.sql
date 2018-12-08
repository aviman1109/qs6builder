delete from TsTextResource where FCode='T.Qs.List.SchemaHint';
delete from TsTextResource where FCode='T.Qs.List.SchemaEmptyText';
delete from TsTextResource where FCode='T.Qs.List.DefaultSchemaEmptyText';
delete from TsTextResource where FCode='T.Qs.List.KeywordHint';
insert into TsTextResource set FCode='T.Qs.List.SchemaHint',							FId='09afe609-4473-415c-93ad-82fbb5f0c6d3', FValue='请选择查询方案。';
insert into TsTextResource set FCode='T.Qs.List.SchemaEmptyText',						FId='2d4e5d0f-ede2-4fb0-97c7-35280ac0961e', FValue='请选择查询方案';
insert into TsTextResource set FCode='T.Qs.List.DefaultSchemaEmptyText',				FId='cacf5ac9-1591-4720-837a-e6a9bfdbbe78', FValue='已预设为“${0}”';
insert into TsTextResource set FCode='T.Qs.List.KeywordHint',							FId='30f56807-0a05-4575-96e8-c70b441d6d17', FValue='请输入${0}，并按回车键查询。';

update TsToolItem set FType='ComboBox-SelectOnly' where FCode='QuerySchema' and FType='ComboBox-Inputable';
update TsToolItem set FHint=null where FCode='QuerySchema' and FType='ComboBox-SelectOnly';
update TsToolItem set FHint=null where FCode='Keyword' and FType='InputBox-Text';
delete from TsToolItemProperty where FName='onkeydown' and FToolItemId in (
	select FId from TsToolItem where FType='ComboBox-SelectOnly' and FCode='QuerySchema'
);
delete from TsToolItem where FType='Button' and FCode='QuerySchemaLock';

create table TsQuerySchemaDefault
(
	FUnitId			uuid,
	FUserId			uuid,
	FQuerySchemaId	uuid,
	primary key (FUnitId, FUserId)
);

alter table TsQuerySchema add FVisible bit default 1;
update TsQuerySchema set FVisible = case when FTemp=1 then 0 else 1 end where FVisible is null;
update TsQuerySchema set FVisible=0 where FPublic=1 and exists (
	select * from TsQuerySchemaHidden
	where FQuerySchemaId=TsQuerySchema.FId and FUserId='00000000-0000-0000-1002-000000000001'
);
update TsQuerySchema set FVisible=0 where FPublic=0 and exists (
	select * from TsQuerySchemaHidden
	where FQuerySchemaId=TsQuerySchema.FId and FUserId=TsQuerySchema.FUserId
);

delete from TsField where FId='7fbe02ab-d445-440d-a078-c07d579408ef'; --FAutoQuery
delete from TsField where FId='39e86e6b-494e-4934-bbe1-822b9f31e841'; --FVisible
insert into TsField set FId='39e86e6b-494e-4934-bbe1-822b9f31e841', FUnitId='00000000-0000-0000-0001-000000000013', FName='FVisible',         FTitle='是否可见',             FType='CheckBox',            FSize=0,		FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='1',         FValidation=null, FRelationCapacity=null;
java setFormFields('a6c925a0-8170-49e1-a797-331ed15bed2a', 'FName,FType,FPublic,FSqlSource,FSql');

delete from TsPage where FId='835207d4-aa52-448a-a1e8-939ea2c09698';
delete from TsPage where FId='c806ea32-cd63-4805-a4ec-ca0acbd6a8d7';
insert into TsPage set FId='835207d4-aa52-448a-a1e8-939ea2c09698', FName='查询方案设置界面',	FTitle='查询方案设置',	FCode='Qs.QuerySchema.Config',				FType='Other',      FIcon='quicksilver/image/unit/QuerySchema.gif', FUrl='quicksilver/page/query/QuerySchemaConfig.jsp',FActionMethodName='Qs.QuerySchema.prepareConfig',						FLoadHandler=null,						FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000013', FMasterUnitId=null,                                   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=780,  FDialogHeight=500,  FDescription=null, FVisible=1;
insert into TsPage set FId='c806ea32-cd63-4805-a4ec-ca0acbd6a8d7', FName='查询方案选择与排序',	FTitle='选择与排序',	FCode='Qs.QuerySchema.Sort',				FType='Other',      FIcon='quicksilver/image/unit/QuerySchema.gif', FUrl='quicksilver/page/template/DoubleSorter.jsp',	FActionMethodName='Qs.QuerySchema.prepareVisibleIndexAndDefaultConfig',	FLoadHandler=null,						FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000013', FMasterUnitId=null,                                   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=500,  FDialogHeight=520,  FDescription=null, FVisible=1;

delete from TsToolItem where FPageId='835207d4-aa52-448a-a1e8-939ea2c09698';
insert into TsToolItem set FId='1595728d-0cb2-4adb-ba1f-91d3cec91dde', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='SelectAndSort',	FName='选择与排序', FLabel='', FType='Button', FAlign='left',  FIndex=1, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doSelectAndSort',	FIcon='quicksilver/image/16/Sort.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='07d2ce39-78ad-4d39-b326-15de139e86f2', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='Save',			FName='保存',		FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doSave',				FIcon='quicksilver/image/16/Save.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='d785bbf3-7a1f-40cb-9d3d-1e3a569be051', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='Execute',			FName='执行',		FLabel='', FType='Button', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doExecute',			FIcon='quicksilver/image/16/Execute.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='421fd2fc-1bc1-4286-9ddc-339e72a014fd', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='Add',				FName='新增',		FLabel='', FType='Button', FAlign='right', FIndex=3, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doAdd',				FIcon='quicksilver/image/16/Add.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='c36c5e09-62e2-46b7-8b00-38a85fd46386', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='Copy',			FName='复制',		FLabel='', FType='Button', FAlign='right', FIndex=4, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doCopy',				FIcon='quicksilver/image/16/Copy.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='5b0e2e48-7a93-4c6a-94f2-724fafc21052', FPageId='835207d4-aa52-448a-a1e8-939ea2c09698', FCode='Delete',			FName='删除',		FLabel='', FType='Button', FAlign='right', FIndex=5, FWidth=0, FDefaultEventHandler='QuerySchemaConfig.doDelete',			FIcon='quicksilver/image/16/Delete.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

--查询方案选择与排序
insert into TsScript set FId='6cecb16b-5b42-4326-992a-f410f0ff81c9', FIndex=1, FPageId='c806ea32-cd63-4805-a4ec-ca0acbd6a8d7', FUrl='quicksilver/page/query/QuerySchemaSort.js';
insert into TsToolItem set FId='b701ab5f-31c3-4547-b4ea-46e6c9f2b0ea', FPageId='c806ea32-cd63-4805-a4ec-ca0acbd6a8d7', FCode='Save',       FName='保存', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='QuerySchemaSort.doSave',       FIcon='quicksilver/image/16/Save.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsTextResource where FId='951eb6a0-ce7d-41b5-a5cf-db37dd427031';
delete from TsTextResource where FId='02d1a4d7-aa5a-47d3-b19a-97e884bc3495';
delete from TsTextResource where FId='2900a30a-9799-4e41-8e77-0d388a6d633a';
delete from TsTextResource where FId='43044cee-7cf7-4cc2-9102-ae31dbe91ab7';
delete from TsTextResource where FId='ac2dce35-39fd-45be-aa68-d72e06a490f2';
delete from TsTextResource where FId='36bfb59b-e761-435f-afd0-259e3fd2ab13';
insert into TsTextResource set FCode='T.Qs.QuerySchema.PrivateQuerySchema',						FId='951eb6a0-ce7d-41b5-a5cf-db37dd427031', FValue='我的查询方案';
insert into TsTextResource set FCode='T.Qs.QuerySchema.PublicQuerySchema',						FId='02d1a4d7-aa5a-47d3-b19a-97e884bc3495', FValue='公共查询方案';
insert into TsTextResource set FCode='T.Qs.QuerySchema.CannotSortPublic',						FId='2900a30a-9799-4e41-8e77-0d388a6d633a', FValue='您没有系统管理权限，不能调整公共查询方案的可见性及顺序。';
insert into TsTextResource set FCode='T.Qs.QuerySchema.MyDefaultSchema',						FId='43044cee-7cf7-4cc2-9102-ae31dbe91ab7', FValue='我的预设查询方案';
insert into TsTextResource set FCode='T.Qs.QuerySchema.Hidden',									FId='ac2dce35-39fd-45be-aa68-d72e06a490f2', FValue='隐藏';
insert into TsTextResource set FCode='T.Qs.QuerySchema.Visible',								FId='36bfb59b-e761-435f-afd0-259e3fd2ab13', FValue='可见';

update TsField set FVisible=0 where FId='4ec766f2-cbaf-4ced-b5e9-49b1684f785f';