--Qs.DiskFile-------------------------------------------------------------------

create table TsDiskFile
(
	FId uuid primary key,
	FName varchar(100),
	FPath varchar(100),
	FUploadTime timestamp,
	FSize int,
	FMessageDigest varchar(50),
	FTextFileVersion int,
	FTextFileHasError bit,
	FTextFileErrorMessage varchar(500),
	FFlashFileVersion int,
	FFlashFileTime timestamp,
	FFlashFileHasError bit,
	FFlashFileErrorMessage varchar(500)
);

insert into TsUnit set FId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FCode='Qs.DiskFile', FName='磁盘文件', FIcon='quicksilver/image/unit/DiskFile.png', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='Dialog', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=0, FMasterUnitId=null, FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=0, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FOpenViewPageFirst=0, FDataSource='default', FTable='TsDiskFile', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.attachment.DiskFileHome', FDaoClassName='com.jeedsoft.quicksilver.attachment.dao.impl.DiskFileDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.attachment.service.impl.DiskFileServiceImpl', FActionClassName='com.jeedsoft.quicksilver.attachment.action.impl.DiskFileActionImpl', FWebServiceProviderId=null, FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='7cc42ab8-6c19-4fa8-8b2a-102fb18ac9c9', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FFlashFileErrorMessage', FTitle='预览文件错误信息', FType='TextBox',          FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=3, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='8a918f3e-7e0c-44ec-b867-f99e37b20690', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FFlashFileHasError',     FTitle='预览文件是否错误', FType='CheckBox',         FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='afbf19bf-a859-465e-a842-d6aafac3c83a', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FFlashFileTime',         FTitle='预览文件处理时间', FType='DateBox-DateTime', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='f4d2b2ce-75ee-4a6e-be16-579b14ff28d0', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FFlashFileVersion',      FTitle='预览文件版本',     FType='InputBox-Integer', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='bef70ecb-5ed1-4ed7-bbdd-edbed95472c8', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FId',                    FTitle='ID',               FType='InputBox-Key',     FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='7800a707-eaca-40ce-b3d6-196b91653943', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FMessageDigest',         FTitle='信息摘要',         FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='863304b2-a0d7-4e15-b545-d956c790c2a4', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FName',                  FTitle='名称',             FType='InputBox-Text',    FSize=100,  FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='7339cc81-b1d9-45cb-940b-411a2a43e41d', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FPath',                  FTitle='路径',             FType='InputBox-Text',    FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='783a191d-ec69-47a6-8b86-5286cc698b85', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FSize',                  FTitle='文件大小',         FType='InputBox-Integer', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='468ea87d-f8f4-43a0-ba5c-49ef5bd51834', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FTextFileErrorMessage',  FTitle='文件文件错误信息', FType='TextBox',          FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=3, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='8bfd2be8-534f-45a5-af2a-df7837262bb7', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FTextFileHasError',      FTitle='文本文件是否错误', FType='CheckBox',         FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='160acf73-dd27-45ad-931c-b5102e40d943', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FTextFileVersion',       FTitle='文本文件版本',     FType='InputBox-Integer', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='be6fc0b8-6c94-4157-84cc-0a2a73d31517', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='FUploadTime',            FTitle='上传时间',         FType='DateBox-DateTime', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

java setQueryFormFields('ecb46e4b-10f8-4bbc-afce-048fff475e0e', 'FName');

insert into TsPage set FId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FName='磁盘文件主列表',   FTitle='磁盘文件列表', FCode='Qs.DiskFile.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/DiskFile.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.DiskFile.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FQueryFormAutoQuery=1, FVisible=1, FDescription=null;
insert into TsPage set FId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FName='磁盘文件选择列表', FTitle='磁盘文件列表', FCode='Qs.DiskFile.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/DiskFile.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.DiskFile.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FQueryFormAutoQuery=1, FVisible=1, FDescription=null;
insert into TsPage set FId='10b942a2-df94-4b43-8177-43817a2611d6', FName='磁盘文件表单',     FTitle='表单',         FCode='Qs.DiskFile.Edit',       FPlatform='Computer', FType='EntityEdit', FIcon='quicksilver/image/unit/Edit.gif',     FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.DiskFile.prepareEdit', FLoadHandler=null, FRelationId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FMasterUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FIsSlavePage=1, FIndex=1,    FDialogWidth=604,  FDialogHeight=453,  FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FQueryFormAutoQuery=1, FVisible=1, FDescription=null;

--磁盘文件主列表
insert into TsToolItem set FId='0c1fd03a-1440-4a2b-83db-9d5d3b66230d', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint='请输入关键字并按回车键查询，或下拉选择查询方案查询。您也可以点击查询框右侧的按钮，增加自定义查询方案。', FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema',  FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='45393bf8-879b-43d0-b824-fc1147530af5', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='QuerySchemaConfig', FName=null,                         FHint='查询方案设置',                                                                                       FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='c264ef08-cdd0-4241-8c9a-e96a68afc1e1', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='QuerySchemaLock',   FName=null,                         FHint='切换将查询方案与查询表单的锁定状态。锁定后，只显示同时满足查询方案和查询表单条件的数据。',           FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='0f951736-a1ac-4063-9a34-5fd3fdb14a46', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='Open',              FName='打开',                       FHint='打开当前选中的记录。如果选中了多笔，第一笔将被打开。',                                               FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='17cedd86-0caa-4b28-97dc-0bab5efaa953', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='Refresh',           FName='刷新',                       FHint='刷新列表内容',                                                                                       FLabel=null, FType='Button',             FAlign='right', FIndex=4, FWidth=0,   FIcon='quicksilver/image/16/Refresh.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItemProperty set FId='e8346dcd-d71e-4ac4-8c9e-1c0afa8fd028', FToolItemId='0c1fd03a-1440-4a2b-83db-9d5d3b66230d', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

--磁盘文件选择列表
insert into TsToolItem set FId='30ef51b2-096e-41ef-814b-8fb72bf7181d', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='QuerySchema',       FName='请选择查询方案或输入关键字', FHint='请输入关键字并按回车键查询，或下拉选择查询方案查询。您也可以点击查询框右侧的按钮，增加自定义查询方案。', FLabel=null, FType='ComboBox-Inputable', FAlign='left',  FIndex=1, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='b705e58d-2587-4d04-a746-4a1bc612c355', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='QuerySchemaConfig', FName=null,                         FHint='查询方案设置',                                                                                       FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FIcon='quicksilver/image/16/Config.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaConfig';
insert into TsToolItem set FId='a40fdfdd-f729-4eff-a8d0-f882d3eb8b87', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='QuerySchemaLock',   FName=null,                         FHint='切换将查询方案与查询表单的锁定状态。锁定后，只显示同时满足查询方案和查询表单条件的数据。',           FLabel=null, FType='Button',             FAlign='left',  FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick';
insert into TsToolItem set FId='41728e6a-12d0-4bb2-9302-2fbebb56f23b', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='ConfirmSelection',  FName='确定',                       FHint=null,                                                                                                 FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FIcon='quicksilver/image/16/Ok.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='5e30f01a-d717-4adc-97c0-15c89873ce68', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='Open',              FName='打开',                       FHint='打开当前选中的记录。如果选中了多笔，第一笔将被打开。',                                               FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/Open.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItemProperty set FId='edcf05a2-a7dc-4ae6-9f97-e5bfcb998b13', FToolItemId='30ef51b2-096e-41ef-814b-8fb72bf7181d', FName='onkeydown', FValue='EntityList.doQuerySchemaKeyDown';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='34c7d612-2599-475c-814b-8d92446cac70', FIndex=1, FName='默认', FPageId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e';
java setFormFields('34c7d612-2599-475c-814b-8d92446cac70', '基本信息', 'd679a8ae-8aad-45b3-a23d-394b317864aa', null, 'FName');

insert into TsList set FDefault=1, FId='648faaf0-323c-4216-8cb7-bca942d8cea3', FIndex=null, FMultiPage=1, FName='磁盘文件列表（默认）', FPageId=null,                                   FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e';
insert into TsList set FDefault=0, FId='0141a2b0-71aa-465d-afd5-d691578f2907', FIndex=null, FMultiPage=1, FName='磁盘文件选择列表',     FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e';
insert into TsList set FDefault=0, FId='823adb96-d5f8-44b7-b71f-ed36b6e79c28', FIndex=null, FMultiPage=1, FName='磁盘文件首页列表',     FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e';
java setListFields('648faaf0-323c-4216-8cb7-bca942d8cea3', 'FName');
java setListFields('0141a2b0-71aa-465d-afd5-d691578f2907', 'FName');
java setListFields('823adb96-d5f8-44b7-b71f-ed36b6e79c28', 'FName');

insert into TsPrivilege set FId='ab47959c-16a6-4c82-9f62-cf012531ebf5', FName='磁盘文件管理', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000006', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;

insert into TsQuerySchema set FId='c9bf8b5d-4315-4b23-a0dc-eb806d353030', FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FName='全部磁盘文件',   FType='condition',  FPublic=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId=null, FConditionId=null, FSqlSource='None', FSql=null, FIndex=1, FUpdateTime=null, FOriginSchemaId=null;

--Attachment Data Migiration

alter table TsAttachment add FDiskFileId uuid;
insert into TsField set FId='319b604e-dbb9-4733-b701-2cc33a8a2bf1', FUnitId='00000000-0000-0000-0001-000000000019', FName='FDiskFileId',			FTitle='磁盘文件',				FType='EntityBox',			FSize=0,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=60,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

insert into TsDiskFile
(
	FId,
	FName,
	FPath,
	FUploadTime,
	FSize,
	FTextFileVersion,
	FTextFileHasError,
	FTextFileErrorMessage,
	FFlashFileVersion,
	FFlashFileTime,
	FFlashFileHasError,
	FFlashFileErrorMessage
)
select
	uuid(),
	FStoreName,
	FStorePath,
	FUploadTime,
	FSize,
	FTextFileVersion,
	FTextFileHasError,
	FTextFileErrorMessage,
	FFlashFileVersion,
	FFlashFileTime,
	FFlashFileHasError,
	FFlashFileErrorMessage
from
	TsAttachment
where not exists (
	select * from TsDiskFile
	where FPath = TsAttachment.FStorePath and FName = TsAttachment.FStoreName
);

update TsAttachment set FDiskFileId = (
	select FId from TsDiskFile
	where FPath = TsAttachment.FStorePath and FName = TsAttachment.FStoreName
	limit 1
)
where FDiskFileId is null;

--alter table TsAttachment drop column FStoreName;
--alter table TsAttachment drop column FStorePath;
--alter table TsAttachment drop column FTextFileVersion;
--alter table TsAttachment drop column FTextFileHasError;
--alter table TsAttachment drop column FTextFileErrorMessage;
--alter table TsAttachment drop column FFlashFileVersion;
--alter table TsAttachment drop column FFlashFileTime;
--alter table TsAttachment drop column FFlashFileHasError;
--alter table TsAttachment drop column FFlashFileErrorMessage;
delete from TsField where FId='52ed5482-f11d-40b1-a32d-741c07428767';
delete from TsField where FId='f88a2aee-3e6a-46e1-9459-3be4cef2ae9b';
delete from TsField where FId='78f46eb6-7941-4be8-a195-83eb35078967';
delete from TsField where FId='6093e402-5537-407b-b03b-6937ad407378';
delete from TsField where FId='6d023678-7ad3-42e5-94d9-6e9a1255f06c';
delete from TsField where FId='050f9d9f-aa1a-430e-9366-04f57e6ef93e';
delete from TsField where FId='ee1e7d51-a89a-4dc1-853a-9e4b79dab314';
delete from TsField where FId='a0c3c53d-1c39-43ee-8838-ad3e4628a281';
delete from TsField where FId='380b50a2-4100-4852-8690-04eb68438131';

delete from TsFormField where FFormId='82880b60-242e-4271-8192-3ddd24868eb8' and FFieldName='FStoreName';
delete from TsFormField where FFormId='82880b60-242e-4271-8192-3ddd24868eb8' and FFieldName='FStorePath';

--Picture Data Migration

alter table TsPicture add FDiskFileId uuid;
insert into TsField set FId='5c4ba374-de0f-435f-b36e-2dd65ba58a1b', FUnitId='b785eab6-c1fb-458c-a67a-ea8ba0484a11', FName='FDiskFileId',   FTitle='磁盘文件',	FType='EntityBox',		  FSize=0,	  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=60,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

insert into TsDiskFile (FId, FName, FPath, FUploadTime)
select uuid(), FStoreName, FStorePath, FUploadTime
from TsPicture
where not exists (
	select * from TsDiskFile
	where FPath = TsPicture.FStorePath and FName = TsPicture.FStoreName
);

update TsPicture set FDiskFileId = (
	select FId from TsDiskFile
	where FPath = TsPicture.FStorePath and FName = TsPicture.FStoreName
	limit 1
)
where FDiskFileId is null;

alter table TsPicture drop column FStorePath;
alter table TsPicture drop column FStoreName;
delete from TsField where FId='94534c8c-31c2-44e2-a4de-41703ef8bea2';
delete from TsField where FId='bad109b9-a8b8-4718-93d6-6c7cc5c894eb';

java setFormFields('017f8a7c-3de9-434d-a556-742bd8e7d467', '基本信息', 'afc478cd-603d-4efa-9051-7b8f38c25f95', null, 'FName,FFileSize,FWidth,FHeight,FUploadUserId,FUploadTime');

--Move Page

delete from TsPage where FId='a1d31485-d546-4d17-ad4c-7b160c3cd115';
delete from TsPage where FId='bf724a07-ee1a-498c-a6cc-0526bf4111b4';
insert into TsPage set FId='a1d31485-d546-4d17-ad4c-7b160c3cd115', FName='文件上传',	 FTitle='上传',		  FCode='Qs.Misc.FileUpload',            FType='Other', FIcon='quicksilver/image/unit/Attachment.gif',			FUrl='quicksilver/page/misc/FileUpload.jsp',					FActionMethodName='Qs.Misc.prepareUpload',					FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;
insert into TsPage set FId='bf724a07-ee1a-498c-a6cc-0526bf4111b4', FName='文件批量上传', FTitle='上传',		  FCode='Qs.Misc.FileBatchUpload',       FType='Other', FIcon='quicksilver/image/unit/Attachment.gif',			FUrl='quicksilver/page/misc/FileBatchUpload.jsp',				FActionMethodName='Qs.Misc.prepareBatchUpload',				FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsTextResource where FId='d25021a6-0cab-4494-a094-1001bc9735e0';
delete from TsTextResource where FId='fd63db13-e586-4b1d-a631-5cdaf1e8a44d';
delete from TsTextResource where FId='cb94c3ce-f7c2-4245-b1f4-072e6a0120d4';
delete from TsTextResource where FId='33191d51-f3f5-4a94-8091-e7793a32577b';
insert into TsTextResource set FCode='T.Qs.FileUpload.Browse',								FId='d25021a6-0cab-4494-a094-1001bc9735e0', FValue='浏览...';
insert into TsTextResource set FCode='T.Qs.FileUpload.File',								FId='fd63db13-e586-4b1d-a631-5cdaf1e8a44d', FValue='文件';
insert into TsTextResource set FCode='T.Qs.FileUpload.Progress',							FId='cb94c3ce-f7c2-4245-b1f4-072e6a0120d4', FValue='上传进度：';
insert into TsTextResource set FCode='T.Qs.FileUpload.Success',								FId='33191d51-f3f5-4a94-8091-e7793a32577b', FValue='文件均已成功上传。';

--Attachment Management Mode Parameter

insert into TsDictionary set FId='8887b5f2-e986-4818-b0d5-4e418dab043d', FName='QS-参数-附件单元', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='150ddb35-7ef5-4544-a5df-cf378d9fcdc1', FDictionaryId='8887b5f2-e986-4818-b0d5-4e418dab043d', FValue='Qs.Attachment',		FText='附件', FIndex=1;

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId = '936deb2e-c0b7-4205-a8e9-4446aaa33173' and FIndex >= 4;
insert into TsParameterDefinition set FId='8fe6223f-1747-455a-8204-de8a7671d818', FName='附件单元',						FCode='QsAttachmentUnitCode',				FParameterGroupId='936deb2e-c0b7-4205-a8e9-4446aaa33173', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=0, FIndex=4, FDictionaryId='8887b5f2-e986-4818-b0d5-4e418dab043d';
