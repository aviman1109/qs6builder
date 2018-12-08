alter table TsAttachment add FFlashFileVersion int default 0;
alter table TsAttachment add FFlashFileHasError bit default 0;
alter table TsAttachment add FFlashFileErrorMessage varchar(500);

delete from TsField where FId='380b50a2-4100-4852-8690-04eb68438131';
delete from TsField where FId='a0c3c53d-1c39-43ee-8838-ad3e4628a281';
delete from TsField where FId='050f9d9f-aa1a-430e-9366-04f57e6ef93e';
insert into TsField set FId='380b50a2-4100-4852-8690-04eb68438131', FUnitId='00000000-0000-0000-0001-000000000019', FName='FFlashFileErrorMessage', FTitle='预览文件错误信息',   FType='TextBox',          FSize=500,  FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=3, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null, FWebServiceFieldName=null;
insert into TsField set FId='a0c3c53d-1c39-43ee-8838-ad3e4628a281', FUnitId='00000000-0000-0000-0001-000000000019', FName='FFlashFileHasError',     FTitle='预览文件是否错误',   FType='CheckBox',         FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null, FWebServiceFieldName=null;
insert into TsField set FId='050f9d9f-aa1a-430e-9366-04f57e6ef93e', FUnitId='00000000-0000-0000-0001-000000000019', FName='FFlashFileVersion',      FTitle='预览文件版本',       FType='InputBox-Integer', FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null, FWebServiceFieldName=null;

alter table TsAttachment alter FTextFileErrorMessage set data type varchar(500);
update TsField set FSize=500, FRowSpan=3, FColSpan=0 where FId='6d023678-7ad3-42e5-94d9-6e9a1255f06c';

delete from TsTextResource where FCode='T.Qs.Attachment.FileDeleted';
delete from TsTextResource where FCode='T.Qs.Attachment.Preview.NotSupportable';
delete from TsTextResource where FCode='T.Qs.Attachment.Preview.HasError';
delete from TsTextResource where FCode='T.Qs.Attachment.Preview.WaitForGeneration';

delete from TsTextResource where FId='f8792997-b780-4bd9-9774-610fb9ba226d';
delete from TsTextResource where FId='93e2c0cf-59f4-499b-b92e-174ab38d8c97';
delete from TsTextResource where FId='dd9cfdaf-0b42-4a05-9b96-e767fe73cf49';
delete from TsTextResource where FId='b410af51-f31f-485f-93bd-359389e656d0';
insert into TsTextResource set FCode='T.Qs.Attachment.FileDeleted',							FId='f8792997-b780-4bd9-9774-610fb9ba226d', FValue='附件已被删除。';
insert into TsTextResource set FCode='T.Qs.Attachment.Preview.NotSupportable',				FId='93e2c0cf-59f4-499b-b92e-174ab38d8c97', FValue='不支持阅览该类型的附件。';
insert into TsTextResource set FCode='T.Qs.Attachment.Preview.HasError',					FId='dd9cfdaf-0b42-4a05-9b96-e767fe73cf49', FValue='无法预览该附件。';
insert into TsTextResource set FCode='T.Qs.Attachment.Preview.WaitForGeneration',			FId='b410af51-f31f-485f-93bd-359389e656d0', FValue='在线阅览正在处理中，请稍后再试。';

delete from TsPage where FId='df646dde-b009-476a-aada-af580158b71f';
insert into TsPage set FId='df646dde-b009-476a-aada-af580158b71f', FName='附件阅览Flash页面',	FTitle='附件阅览',	   FCode='Qs.Attachment.FlashPreview', FType='Other', FIcon='quicksilver/image/unit/Attachment.gif', FUrl='quicksilver/page/attachment/AttachmentFlashPreview.jsp', FActionMethodName='', FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000000019', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

alter table TsField add FCustomData varchar(500);
insert into TsField set FId='cd7756d8-92d4-42b4-b8c4-084b5ba5aa5d', FUnitId='00000000-0000-0000-0001-000000000002', FName='FCustomData',          FTitle='自定义数据',       FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=3, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null, FWebServiceFieldName=null, FCustomData=null;
java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295', '基本信息', '83da7ed2-8248-4c2e-b788-7976e5b8b070', null, 'FTitle,FName,FType,FUnitId,FVisible,FRequired,FReadOnly,FQueryable,FDefaultValue,FHint,FValidation', '类型信息', '04234553-4f26-47c1-967d-389b0bdbce6f', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSize,FScale,FRelationTable,FRelationCapacity,FDictionaryId,FSupportI18n', '实体信息', '7d4ddff1-5d65-41e0-b04a-89d60da24f8b', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FEntityUnitId,FSupportLocalText,FLocalTextField,FSelectListFilterSql', '来源信息', '2d1d1604-9001-461c-b19e-02d044a5d842', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSourceType,FJoinField,FSourceField,FWebServiceFieldName,FSource', '表单信息', '0c76fb5e-5e71-425e-97b0-38af40b7f88e', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FRowSpan,FColSpan,FLabelColor,FIsNewRow', '列表信息', '7544efe3-6515-42b9-a3bb-2840a68cdb5d', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FListWidth,FListAlign', '其它信息', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', null, 'FCustomData');

delete from TsFieldProperty where FFieldId='1aabdb94-e5cb-4440-9197-be0f08f3d901';
insert into TsFieldProperty set FId='ceb9122c-6347-4568-ae68-47dd9a520aeb', FFieldId='1aabdb94-e5cb-4440-9197-be0f08f3d901', FName='onlinkclick', FValue='AttachmentSlaveList.doNameClick';

delete from TsTextResource where FId='51bc06c7-c434-45ee-91c7-739e89a0adce';
delete from TsTextResource where FId='fbab08cd-a7b6-46a1-a90c-0876799429c9';
insert into TsTextResource set FCode='T.Esc.DateBox.Clear',									FId='fbab08cd-a7b6-46a1-a90c-0876799429c9', FValue='清空';
