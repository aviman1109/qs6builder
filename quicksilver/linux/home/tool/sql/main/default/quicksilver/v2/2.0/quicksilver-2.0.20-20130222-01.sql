delete from TsTextResource where FId='530c848d-ae58-45a5-a4c5-f7fb87d2ce44';
delete from TsTextResource where FId='7d65835f-b802-48c3-acd7-c5447803ecd5';
insert into TsTextResource set FCode='E.Basic.File.FormatError',							FId='530c848d-ae58-45a5-a4c5-f7fb87d2ce44', FValue='文件“${0}”格式错误。';
insert into TsTextResource set FCode='E.Basic.File.IoError',								FId='7d65835f-b802-48c3-acd7-c5447803ecd5', FValue='文件“${0}”输入/输出操作失败。';

update TsParameterGroup set FIndex = FIndex + 1 where FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec' and FIndex >= 5;
delete from TsParameterGroup where FId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a';
insert into TsParameterGroup set FId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FName='全文检索(Solr)设置',	FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec',	FIndex=5;

update TsParameterDefinition set FName='LOGO 地址' where FId='a84d0c41-ad55-4886-b965-637eb17fe17a';
update TsParameterDefinition set FName='LOGO 高度' where FId='beef7a4f-bd74-48a1-a19c-45a0e6761492';
update TsParameterDefinition set FName='启用 HTML 编辑框图片上传' where FId='e4da6330-14fa-4968-a36d-80b65d0cbccb';

delete from TsParameterDefinition where FId='ff3234a2-e4cf-4c18-8cd2-6dd915316c61';
delete from TsParameterDefinition where FId='86b0a06f-0664-4ece-a8b8-0584cda07cc7';
delete from TsParameterDefinition where FId='0462e2ce-7e09-4fa2-ba6d-53aac82e4ce7';
delete from TsParameterDefinition where FId='d5a1e462-0e50-491d-8266-2164d8a79648';
delete from TsParameterDefinition where FId='144d2814-d50e-458d-bcea-76a7c139d703';
insert into TsParameterDefinition set FId='ff3234a2-e4cf-4c18-8cd2-6dd915316c61', FName='启用全文检索',					FCode='QsSolrEnabled',				FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=1;
insert into TsParameterDefinition set FId='86b0a06f-0664-4ece-a8b8-0584cda07cc7', FName='Solr 服务器 URL',				FCode='QsSolrServerUrl',			FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='InputBox-Url',			FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='0462e2ce-7e09-4fa2-ba6d-53aac82e4ce7', FName='索引最大查询笔数',				FCode='QsSolrMaxResultCount',		FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='d5a1e462-0e50-491d-8266-2164d8a79648', FName='索引创建时每次查询笔数',		FCode='QsSolrBuildPageSize',		FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;
insert into TsParameterDefinition set FId='144d2814-d50e-458d-bcea-76a7c139d703', FName='索引创建时每批提交字节数(KB)',	FCode='QsSolrBuildCommitSize',		FParameterGroupId='4f1e5fa0-9fc0-4190-b7cd-de32df87ff1a', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5;

delete from TsSystemParameter where FKey='ff3234a2-e4cf-4c18-8cd2-6dd915316c61';
delete from TsSystemParameter where FKey='86b0a06f-0664-4ece-a8b8-0584cda07cc7';
delete from TsSystemParameter where FKey='0462e2ce-7e09-4fa2-ba6d-53aac82e4ce7';
delete from TsSystemParameter where FKey='d5a1e462-0e50-491d-8266-2164d8a79648';
delete from TsSystemParameter where FKey='144d2814-d50e-458d-bcea-76a7c139d703';
insert into TsSystemParameter set FId='0e1732df-df8c-4a2e-aaf2-d280da977a08', FKey='ff3234a2-e4cf-4c18-8cd2-6dd915316c61', FValue='true';
insert into TsSystemParameter set FId='5d44c3da-a051-4039-afbe-0476398fb055', FKey='86b0a06f-0664-4ece-a8b8-0584cda07cc7', FValue='http://127.0.0.1:12821/solr';
insert into TsSystemParameter set FId='b68f42f5-3e5a-4cd4-9412-fe6ad7ecbe40', FKey='0462e2ce-7e09-4fa2-ba6d-53aac82e4ce7', FValue='1000';
insert into TsSystemParameter set FId='99931ec6-6c1d-4c75-85a1-f6991f3c44d6', FKey='d5a1e462-0e50-491d-8266-2164d8a79648', FValue='1000';
insert into TsSystemParameter set FId='9238f62f-5e77-403a-952c-b4f6142fd0f4', FKey='144d2814-d50e-458d-bcea-76a7c139d703', FValue='1024';

java setEditHiddenPages('8b7ebd7e-8173-4787-9e34-3d27ad4c9c29', 'Qs.Unit.FieldList,Qs.Unit.RelationList,Qs.Unit.EditList,Qs.Unit.FormList,Qs.Unit.ListList,Qs.Unit.OperationList,Qs.Unit.EntityEventList,Qs.Unit.PageList,Qs.Unit.PrivilegeList,Qs.Unit.SerialNumberList,Qs.Unit.ImportConfig,Qs.Unit.WorkflowList,Qs.Unit.DuplicationList,Qs.Unit.ViewItemList');

delete from TsUnit where FId='a2501354-6062-40b5-b623-a3a8548d515d';
insert into TsUnit set FId='a2501354-6062-40b5-b623-a3a8548d515d', FCode='Qs.FullText', FName='全文检索', FIcon='quicksilver/image/unit/FullText.png', FEditId='8b7ebd7e-8173-4787-9e34-3d27ad4c9c29', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='System', FIsTreeStructure=null, FMaxTreeLevel=null, FIsSlaveUnit=null, FMasterUnitId=null, FSupportUser=null, FSupportDepartment=null, FSupportEditType=null, FSupportAttachment=null, FSupportDataPrivilege=null, FSupportBusinessLog=null, FSupportNote=null, FSupportSort=null, FSupportPrivilegeField=0, FSupportEqualQuery=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FQueryFormAutoQuery=0, FOpenViewPageFirst=0, FDataSource='default', FTable=null, FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.query.FullTextHome', FDaoClassName='com.jeedsoft.quicksilver.query.dao.impl.FullTextDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.query.service.impl.FullTextServiceImpl', FActionClassName='com.jeedsoft.quicksilver.query.action.impl.FullTextActionImpl', FUnitFilterSql=null, FBusinessFilterSql=null, FDescription='', FSupportVersion=null, FUseSystemI18nTable=null, FSupportWorkflow=null;

alter table TsUnit add FIsFullTextSearch bit default 0;
alter table TsUnit add FSearchAttachment bit default 0;
delete from TsField where FId='d54d97fa-c55b-40cc-a645-940b29ddf455';
delete from TsField where FId='111c8f88-ee47-4b4f-b092-8a47273f6fe3';
insert into TsField set FId='d54d97fa-c55b-40cc-a645-940b29ddf455', FUnitId='00000000-0000-0000-0001-000000000001', FName='FIsFullTextSearch',		FTitle='启用全文检索',			FType='CheckBox',            FSize=0,   FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='false',                  FValidation=null, FRelationCapacity=null;
insert into TsField set FId='111c8f88-ee47-4b4f-b092-8a47273f6fe3', FUnitId='00000000-0000-0000-0001-000000000001', FName='FSearchAttachment',		FTitle='是否检索附件',			FType='CheckBox',            FSize=0,   FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='false',                  FValidation=null, FRelationCapacity=null;

delete from TsToolItem where FId='6c8e3904-f255-40ab-8cae-c2e219d73a76';
delete from TsToolSubItem where FId='b64c9df5-fd02-435f-8b1a-e242f7be0123';
delete from TsToolSubItem where FId='6b9831f0-d630-4673-87d7-d80e6ea6c5d1';
insert into TsToolItem set FId='6c8e3904-f255-40ab-8cae-c2e219d73a76', FPageId='6515aede-f3a2-431e-93f9-5ca2ed736a81', FCode='FullTextSearch',	FName='全文检索',	FLabel='', FType='ComboButton', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='', FIcon='quicksilver/image/16/Index.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null;
insert into TsToolSubItem set FId='b64c9df5-fd02-435f-8b1a-e242f7be0123', FToolItemId='6c8e3904-f255-40ab-8cae-c2e219d73a76', FCode='Build',      FName='保存设置并建立索引',	FExpandMode='None', FIndex=1, FIcon=null,                         FEventHandler='KeywordFieldConfig.doBuildIndex',                               FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript';
insert into TsToolSubItem set FId='6b9831f0-d630-4673-87d7-d80e6ea6c5d1', FToolItemId='6c8e3904-f255-40ab-8cae-c2e219d73a76', FCode='Delete',     FName='清除索引',				FExpandMode='None', FIndex=2, FIcon=null,                         FEventHandler='KeywordFieldConfig.doDeleteIndex',                              FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript';

delete from TsTextResource where FId='660516c5-ed0e-48af-be4c-3dd06dfb393e';
delete from TsTextResource where FId='c4cd17e1-658c-4835-b3c9-96cf08abd07a';
insert into TsTextResource set FCode='T.Qs.Keyword.SelectKeywordFieldAlert',				FId='660516c5-ed0e-48af-be4c-3dd06dfb393e', FValue='请选择关键字字段。';
insert into TsTextResource set FCode='T.Qs.Keyword.SelectUnitAlert',						FId='c4cd17e1-658c-4835-b3c9-96cf08abd07a', FValue='请选择单元。';

delete from TsTextResource where FId='b1136374-26d2-45f1-b5e5-4cf11b078e73';
delete from TsTextResource where FId='e0106763-a64a-445b-8af6-ed2580320558';
insert into TsTextResource set FCode='E.Qs.FullText.BatchIndexBuilding',					FId='b1136374-26d2-45f1-b5e5-4cf11b078e73', FValue='批量全文索引正在建立中，不能重复执行。';
insert into TsTextResource set FCode='E.Qs.FullText.ServerUrlNotConfiged',					FId='e0106763-a64a-445b-8af6-ed2580320558', FValue='未配置 Solr 服务器的 Url。';

alter table TsAttachment add FTextFileVersion int default 0;
alter table TsAttachment add FTextFileHasError bit default 0;
alter table TsAttachment add FTextFileErrorMessage varchar(200);

delete from TsField where FId='78f46eb6-7941-4be8-a195-83eb35078967';
delete from TsField where FId='6093e402-5537-407b-b03b-6937ad407378';
delete from TsField where FId='6d023678-7ad3-42e5-94d9-6e9a1255f06c';
insert into TsField set FId='78f46eb6-7941-4be8-a195-83eb35078967', FUnitId='00000000-0000-0000-0001-000000000019', FName='FTextFileVersion',	FTitle='文本文件管理器版本',	FType='InputBox-Integer',	FSize=0,	FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='6093e402-5537-407b-b03b-6937ad407378', FUnitId='00000000-0000-0000-0001-000000000019', FName='FTextFileHasError',			FTitle='文本文件是否错误',		FType='CheckBox',			FSize=0,	FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='6d023678-7ad3-42e5-94d9-6e9a1255f06c', FUnitId='00000000-0000-0000-0001-000000000019', FName='FTextFileErrorMessage',      FTitle='文件文件错误信息',		FType='InputBox-Text',		FSize=200,	FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
