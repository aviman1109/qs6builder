--阅览项按钮增加可见、可用条件

alter table TsViewItemButton add FVisibleCondition varchar(200);
alter table TsViewItemButton add FEnableCondition varchar(200);
delete from TsField where FId='94e647ae-29d2-419f-af1b-5f944615fd26';
delete from TsField where FId='746fd84a-a6f6-44a5-9d40-b98c8f861df6';
insert into TsField set FId='94e647ae-29d2-419f-af1b-5f944615fd26', FUnitId='1483fd8c-d559-45c4-879f-df0edbae3f7a', FName='FVisibleCondition',	FTitle='可见条件',             FType='InputBox-Text',    FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1,  FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
insert into TsField set FId='746fd84a-a6f6-44a5-9d40-b98c8f861df6', FUnitId='1483fd8c-d559-45c4-879f-df0edbae3f7a', FName='FEnableCondition',	FTitle='可用条件',             FType='InputBox-Text',    FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1,  FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
java setFormFields('2b74283a-fac6-4755-9976-50917f47e8e6', '基本信息', 'ab1130a1-53bb-440e-bf7b-46ed57208fde', null, 'FName,FCode,FVisibleCondition,FEnableCondition,FEventHandler');
update TsField set FRowSpan=10 where FId='1f8c9058-ce88-4f28-8f63-833452bb4177';

--阅览界面相关调整

delete from TsTextResource where FId='859cd09e-563a-4f28-9f06-0e33e453883c';
delete from TsTextResource where FId='ae2e45a3-17fa-4a6c-b7ee-78388d181e73';
insert into TsTextResource set FCode='T.Qs.Attachment.View',								FId='859cd09e-563a-4f28-9f06-0e33e453883c', FValue='阅览';
insert into TsTextResource set FCode='T.Qs.Attachment.Size',								FId='ae2e45a3-17fa-4a6c-b7ee-78388d181e73', FValue='大小';

update TsField set FListWidth=120 where FId='ba9c55fa-0230-4535-9a32-00b85e5eefe9';
update TsField set FTitle='最大列数' where FId='4014220d-49ba-4e22-be3e-4fcb60c0afc4';

alter table TsViewItem add FCollapsed bit;
delete from TsField where FId='89ec72de-7778-4926-996c-4913c1710619';
insert into TsField set FId='89ec72de-7778-4926-996c-4913c1710619', FUnitId='20b2c483-c0e2-47db-afef-ac31628da984', FName='FCollapsed',        FTitle='是否默认收起',         FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',                           FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,   FValidation=null, FRelationCapacity=null;
java setFormFields('754c3fcb-ec47-40df-904a-16bce2ce2662', '基本信息', '1c65209a-d510-4797-905b-63b637e95bbe', null, 'FName,FType,FMarginTop,FBreakLine,FIsAnchor,FCollapsed', '标题', '7d03e988-0729-4f94-ad9a-8522877ddecd', '1c65209a-d510-4797-905b-63b637e95bbe', 'FTitleType,FTitleFontSize,FTitleText,FTitleField,FTitleColor', '字段组', 'c2f26f9b-0663-477b-ae99-3f5d75c53101', '1c65209a-d510-4797-905b-63b637e95bbe', 'FFieldArrangeType,FColumnCount,FContentFontSize', 'HTML字段', '65371d76-dde4-4c36-bd67-e4abe85d4a4c', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHtmlField', '列表', '41810f07-46ee-49df-b803-ad976076614e', '1c65209a-d510-4797-905b-63b637e95bbe', 'FRelationId,FRecordCount', '自定义', '7315643a-27a0-49e1-b1c0-9818b052a871', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHandlerClassName');
java setListFields('a0f758e4-a0a0-4821-ad13-f9b2d30c1d61', 'FName,FType,FIsAnchor,FCollapsed,FFieldArrangeType');
java setListFields('37fe8631-d3a1-44a1-9177-4392e2dfbca0', 'FName,FType,FIsAnchor,FCollapsed,FFieldArrangeType');
java setListFields('b0943e52-7e8c-450b-b14f-4dd7175fc43e', 'FName,FType,FIsAnchor,FCollapsed,FFieldArrangeType');

update TsViewItem set FBreakLine=null where FBreakLine is not null;

--附件阅览界面

delete from TsPage where FId='54201b04-0438-4fe3-bd80-11bdcd2ab18d';
delete from TsScript where FId='31b9cb74-c6b3-49c2-85d6-1086d12317d5';
delete from TsScript where FId='8e8f9f65-5c82-4392-ad69-601c61f6f489';
insert into TsPage set FId='54201b04-0438-4fe3-bd80-11bdcd2ab18d', FName='附件阅览',         FTitle='附件',     FCode='Qs.Attachment.View',                    FPlatform='Computer', FType='EntityView', FIcon='quicksilver/image/unit/Attachment.gif',            FUrl='quicksilver/page/template/EntityView.jsp',     FActionMethodName='Qs.Attachment.prepareView',            FLoadHandler=null,                  FRelationId=null,                                   FUnitId='00000000-0000-0000-0001-000000000019', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FHasViewFrame=0,    FVisible=1, FDescription='',   FQuerySchemaId=null, FQueryFormAutoQuery=1, FQueryOnLoad=null;
insert into TsScript set FId='31b9cb74-c6b3-49c2-85d6-1086d12317d5', FIndex=1, FPageId='54201b04-0438-4fe3-bd80-11bdcd2ab18d', FUrl='quicksilver/page/attachment/DiskFileFlashViewItem.js';
insert into TsScript set FId='8e8f9f65-5c82-4392-ad69-601c61f6f489', FIndex=2, FPageId='54201b04-0438-4fe3-bd80-11bdcd2ab18d', FUrl='quicksilver/page/attachment/AttachmentView.js';

delete from TsViewItem where FUnitId='00000000-0000-0000-0001-000000000019';
insert into TsViewItem set FId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FBreakLine=null, FColumnCount=3,    FFieldArrangeType='Table', FHandlerClassName=null,																	FHtmlField=null, FIndex=1, FIsAnchor=0, FMarginTop=null, FName='字段组',   FRecordCount=null, FRelationId=null, FTitleColor=null, FTitleField='FName', FTitleFontSize=null, FTitleText=null, FTitleType='Field', FType='FieldGroup', FUnitId='00000000-0000-0000-0001-000000000019';
insert into TsViewItem set FId='1bbe93f5-74d0-417b-ac61-6003eb1fcba9', FBreakLine=null, FColumnCount=null, FFieldArrangeType=null,    FHandlerClassName='com.jeedsoft.quicksilver.handler.view.DiskFileFlashViewItemHandler',	FHtmlField=null, FIndex=2, FIsAnchor=0, FMarginTop=null, FName='文件预览', FRecordCount=null, FRelationId=null, FTitleColor=null, FTitleField=null,    FTitleFontSize=null, FTitleText=null, FTitleType='None',  FType='Custom',     FUnitId='00000000-0000-0000-0001-000000000019';

delete from TsViewItemButton where FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769';
insert into TsViewItemButton set FId='1eebc5b1-d291-4656-8f9b-26b60dccb07f', FName='下载',     FCode='Download',	FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FEventHandler='AttachmentView.doDownload',	FVisibleCondition='',      FIndex=1;
insert into TsViewItemButton set FId='ece29e11-7778-4950-ac87-9689a28c4f9c', FName='编辑',     FCode='Edit',		FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FEventHandler='',							FVisibleCondition='false', FIndex=2;

delete from TsViewItemField where FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769';
insert into TsViewItemField set FId='e351e74d-4069-4784-b484-09af3c08f94e', FFieldName='FUploadTime',   FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FColor=null, FIndex=1;
insert into TsViewItemField set FId='c64e0cdc-e56d-49c9-b833-eeff0d52db91', FFieldName='FSize',         FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FColor=null, FIndex=2;
insert into TsViewItemField set FId='1c1bb8f7-efc0-4d87-9d02-3dc412ab8e35', FFieldName='FUserId',       FViewItemId='de76ddf3-dbc7-4232-99d0-7f8efd6b1769', FColor=null, FIndex=3;

--角色页面对所有查询方案可见

delete from TsEditHiddenPage where FEditId='224aa0c8-3461-4bd7-9fd6-3283cdbc9867';
delete from TsEditHiddenPage where FEditId='9cc262fe-70e4-420e-9be9-6a74f63f412c';
delete from TsEditHiddenPage where FEditId='c3470bbc-1381-4038-9b7f-323abee59825';
delete from TsEditHiddenPage where FEditId='f6f4ec41-5e7d-41f0-8872-8f22fe55a581';

--更新表单页面的标题

update TsPage set FTitle='表单' where FCode='Qs.Bill.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Chart.Edit';
update TsPage set FTitle='表单' where FCode='Qs.ChartCatalog.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Department.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Dictionary.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Edit.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Field.Edit';
update TsPage set FTitle='表单' where FCode='Qs.HomepageItem.Edit';
update TsPage set FTitle='表单' where FCode='Qs.List.Edit';
update TsPage set FTitle='表单' where FCode='Qs.LoginLog.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Menu.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Page.Edit';
update TsPage set FTitle='表单' where FCode='Qs.ParameterDefinition.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Privilege.Edit';
update TsPage set FTitle='表单' where FCode='Qs.PrivilegeType.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Relation.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Report.Edit';
update TsPage set FTitle='表单' where FCode='Qs.ReportCatalog.Edit';
update TsPage set FTitle='表单' where FCode='Qs.ReportParameter.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Role.Edit';
update TsPage set FTitle='表单' where FCode='Qs.RolePrivilege.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Script.Edit';
update TsPage set FTitle='表单' where FCode='Qs.SerialNumber.Edit';
update TsPage set FTitle='表单' where FCode='Qs.SerialNumberPart.Edit';
update TsPage set FTitle='表单' where FCode='Qs.SystemMessage.Edit';
update TsPage set FTitle='表单' where FCode='Qs.TextResource.Edit';
update TsPage set FTitle='表单' where FCode='Qs.ToolItem.Edit';
update TsPage set FTitle='表单' where FCode='Qs.Unit.Edit';
update TsPage set FTitle='表单' where FCode='Qs.User.Edit';

--查询相关调整

delete from TsTextResource where FCode='T.Qs.ToolItem.QuerySchema';
delete from TsTextResource where FCode='T.Qs.ToolItem.Hint.QuerySchema';
delete from TsTextResource where FCode='T.Qs.ToolItem.Hint.QuerySchemaLock';
delete from TsTextResource where FCode='T.Qs.ToolItem.Hint.Keyword';

update TsToolItem set FName='', FHint='' where FCode='QuerySchema' and FType like 'ComboBox%';
delete from TsToolItemProperty where FId='2f741af6-560c-4794-b6e2-7c0fddf357fa';
delete from TsToolItemProperty where FId='6d5b40da-af39-473c-a95f-c6ccf72ecd61';

delete from TsToolItemProperty where FName='onkeydown' and FToolItemId in (
	select FId from TsToolItem where FCode in ('Keyword', 'QuerySchema') and FPageId in (
		'c87597b5-53e9-46e6-b08a-84f5ebcdffb3',
		'9e9619ed-0664-4459-bfd6-6574bd25e4d9',
		'85bcda91-266c-487d-846d-447707fd8531',
		'946daef7-fb60-4580-93d7-599a2167998d',
		'e1d3e143-1b06-42db-905c-8d83e35543d4',
		'4b2b868b-3ab3-42e5-b577-433f3ebfbc36',
		'9610c667-2136-4675-afa6-9f44f7fc1e57',
		'6b40d650-3790-452f-9cf4-230e835d3390',
		'4d3af4c8-284b-46a6-9fd4-9cc93911bba2',
		'bc2e9463-1f93-4c73-b5c4-14694454deb1',
		'302e9e91-874c-47b5-9830-9b6b8c3e65f0',
		'4a970b97-6eca-4dc8-bff4-03bb1b1205ec',
		'c4e085ff-2fd5-4ea8-80f8-574df6061af0',
		'a5753a8c-645d-4558-aa93-fa82f4e5a0b5',
		'cf4d6f9e-0b62-4874-88c9-0e079b08cd06',
		'3d485cb0-ab24-4edc-b3f9-3b1e216192d1',
		'84d7bbc3-8a37-4955-b178-bb6873de6978',
		'3549a1fc-ceb6-4105-a9c8-80f65a7c1b87',
		'18357e9a-6eab-4710-b71d-8d587c3d947c',
		'570078bc-8eaf-44ef-a3dd-dadb3bcb7224',
		'ff34468b-679f-4812-bee8-042cc79b5340',
		'54b2abdb-d9ff-49cd-b675-0876aaf0f48c',
		'e85e9ed6-3903-47b5-8d14-106a71cf340d',
		'690574f3-62bf-4ac7-93b4-2f59ff9e6067',
		'9c0fa5f3-4904-4bfb-a237-26fac1198552',
		'f0f5b230-8679-4b16-9855-9381733f05c1',
		'89b36224-1a44-45ea-bba6-8c81e6bf3225',
		'bd705945-9109-430f-9623-92630ca35376',
		'7078d9d5-111b-43d0-a8f3-44fa57074e29',
		'a3e84409-2374-4093-aa37-cfbbc5d26f19',
		'e8489c16-dab2-420f-bec5-eb764c705fbf',
		'0bd984fb-0561-4c7b-aecf-1f296eee5894',
		'83befce1-d238-4522-965c-0915b5434b86',
		'0017ebe4-b826-4dd3-8ca1-53f0766facfa',
		'0ea362cc-9fbc-4004-94b7-8db0d6c2cd7f',
		'4cacd16c-1ae0-466a-9d87-5715a215947a',
		'b552e9fb-126b-480d-8296-2a3ef9fb72b2',
		'47db540f-0166-439e-af12-b0d55befe28f',
		'228470b6-62fc-4ebc-a630-1380cb1043a4',
		'58a40a38-017c-4b2a-affd-0692caab35cd',
		'7f35b6b9-37de-4dc4-977c-bd1aa70afe8f',
		'eaa06693-4d59-4d51-905c-1d845ca8903c',
		'5b45309a-053e-423c-9271-4ed6f30f32af',
		'8beada1c-7f71-4b3e-b357-4f088f96c7a3',
		'648b7891-dbc2-4ad3-a09b-587581430cd8',
		'27729d66-df4b-4fb5-99a8-92351b5fd830',
		'97df8845-301a-4d00-a28b-fa557772a3a7',
		'15c0a91b-7ae2-46c8-8a97-7de10711577c',
		'e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5',
		'78c6ffa1-7ec8-452a-adfc-8c1e75db0a3d',
		'fc06ccdc-09cf-4561-87b6-27f105f665f5',
		'79fb1a28-1f37-470d-a1c8-891180aa43bb',
		'be81b943-c758-4f81-8f30-95a056b32b38',
		'2bbea6fb-1e90-4b21-9887-2278ab7fd805',
		'5a3291d1-9759-4c35-b969-25758a38019e',
		'1bfcad81-a2b2-4cbf-a0b0-c51c7659f77d',
		'222a1232-6590-4fa2-92e1-18445254cf3a',
		'7280cf5a-43d5-4d10-b0af-727d4052c994',
		'0c662df8-5541-42cb-93f4-40f255015600',
		'fb7f9611-1cd6-41d9-a47b-86da7439b907',
		'1754a043-ada0-4226-bf18-88fa7d028e34',
		'f954cac1-593a-4eca-a8e4-c1504ee01fe9',
		'a46ce7dd-0931-4c6f-b5a0-13f81c187e7a',
		'e821121e-0eab-4ec6-9025-b80b66714567',
		'b29b2c3b-8909-4f19-a38e-7de1ea707f1d',
		'bc59818f-1a72-438a-937f-c7b04fcaa25b',
		'e865b144-bdb4-40ae-a547-a8ed24e9a80e',
		'5c313496-abec-4704-9a21-f586d178eba5',
		'5eb40c6a-5f5a-4696-a97c-3a1b2c55eaa5',
		'62555738-84f0-40f3-ae6f-2d2865b5fe06',
		'5a7b0208-25ab-4585-867e-cf092e9083d5',
		'f64312f5-9d6f-4001-9c30-23d6ff320927',
		'fdc6a9c3-b511-4a76-b5cf-44ab8135a6cf',
		'808acc42-b414-461d-8142-e4940092cd2c',
		'4aa5dfb3-2cb8-4f86-8500-e10f5e6c856e',
		'5a09af98-1b1b-4803-bf7b-eefefbc1a62a',
		'd6d99318-1562-4bae-a9c2-1e79b0b9a59b',
		'ec36c420-4d34-49fa-a5a9-57129eda1246',
		'8088557d-46f1-42e7-8177-06a58e99e819',
		'fec1e1aa-3cb6-4b2f-8302-c407d14e8275',
		'f74055e2-dad3-454c-9e04-3f52c7e2d93a',
		'88999b24-9939-4647-8ad6-da95b640fcb8',
		'43fad7b7-b513-4f31-ab7d-b4a9091c2dd3',
		'4a5d312a-e8bf-4ce1-a5e9-0d86b470e6fe',
		'ae7626b0-fb59-44f4-81ca-ad6595b1434f',
		'dba0b4ef-65c8-45ef-a54f-d66618582706',
		'183bcaf2-01a7-4d2c-be45-32aa5aa878c9',
		'2f872ffa-07d8-43b8-8798-f1e1c2797806',
		'1039cf65-5900-4501-a05c-16819a04ae7b',
		'4b3447ec-7e9b-4b1f-88ec-d03a22190d76',
		'1bc596e3-4d1a-44aa-9333-de877b05caab',
		'64dbc44e-733c-4672-9242-d1c1988a903c',
		'8169c956-d6d0-4b72-b728-c554a74b9914',
		'cba105bc-458c-4aee-bbb5-e6bf3b02d0be',
		'37c35cde-2f79-4592-b765-ee7fbe47f0b5'
	)
);

delete from TsToolItem where FCode in ('Keyword', 'QuerySchemaLock') and FPageId in (
	'c87597b5-53e9-46e6-b08a-84f5ebcdffb3',
	'9e9619ed-0664-4459-bfd6-6574bd25e4d9',
	'85bcda91-266c-487d-846d-447707fd8531',
	'946daef7-fb60-4580-93d7-599a2167998d',
	'e1d3e143-1b06-42db-905c-8d83e35543d4',
	'4b2b868b-3ab3-42e5-b577-433f3ebfbc36',
	'9610c667-2136-4675-afa6-9f44f7fc1e57',
	'6b40d650-3790-452f-9cf4-230e835d3390',
	'4d3af4c8-284b-46a6-9fd4-9cc93911bba2',
	'bc2e9463-1f93-4c73-b5c4-14694454deb1',
	'302e9e91-874c-47b5-9830-9b6b8c3e65f0',
	'4a970b97-6eca-4dc8-bff4-03bb1b1205ec',
	'c4e085ff-2fd5-4ea8-80f8-574df6061af0',
	'a5753a8c-645d-4558-aa93-fa82f4e5a0b5',
	'cf4d6f9e-0b62-4874-88c9-0e079b08cd06',
	'3d485cb0-ab24-4edc-b3f9-3b1e216192d1',
	'84d7bbc3-8a37-4955-b178-bb6873de6978',
	'3549a1fc-ceb6-4105-a9c8-80f65a7c1b87',
	'18357e9a-6eab-4710-b71d-8d587c3d947c',
	'570078bc-8eaf-44ef-a3dd-dadb3bcb7224',
	'ff34468b-679f-4812-bee8-042cc79b5340',
	'54b2abdb-d9ff-49cd-b675-0876aaf0f48c',
	'e85e9ed6-3903-47b5-8d14-106a71cf340d',
	'690574f3-62bf-4ac7-93b4-2f59ff9e6067',
	'9c0fa5f3-4904-4bfb-a237-26fac1198552',
	'f0f5b230-8679-4b16-9855-9381733f05c1',
	'89b36224-1a44-45ea-bba6-8c81e6bf3225',
	'bd705945-9109-430f-9623-92630ca35376',
	'7078d9d5-111b-43d0-a8f3-44fa57074e29',
	'a3e84409-2374-4093-aa37-cfbbc5d26f19',
	'e8489c16-dab2-420f-bec5-eb764c705fbf',
	'0bd984fb-0561-4c7b-aecf-1f296eee5894',
	'83befce1-d238-4522-965c-0915b5434b86',
	'0017ebe4-b826-4dd3-8ca1-53f0766facfa',
	'0ea362cc-9fbc-4004-94b7-8db0d6c2cd7f',
	'4cacd16c-1ae0-466a-9d87-5715a215947a',
	'b552e9fb-126b-480d-8296-2a3ef9fb72b2',
	'47db540f-0166-439e-af12-b0d55befe28f',
	'228470b6-62fc-4ebc-a630-1380cb1043a4',
	'58a40a38-017c-4b2a-affd-0692caab35cd',
	'7f35b6b9-37de-4dc4-977c-bd1aa70afe8f',
	'eaa06693-4d59-4d51-905c-1d845ca8903c',
	'5b45309a-053e-423c-9271-4ed6f30f32af',
	'8beada1c-7f71-4b3e-b357-4f088f96c7a3',
	'648b7891-dbc2-4ad3-a09b-587581430cd8',
	'27729d66-df4b-4fb5-99a8-92351b5fd830',
	'97df8845-301a-4d00-a28b-fa557772a3a7',
	'15c0a91b-7ae2-46c8-8a97-7de10711577c',
	'e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5',
	'78c6ffa1-7ec8-452a-adfc-8c1e75db0a3d',
	'fc06ccdc-09cf-4561-87b6-27f105f665f5',
	'79fb1a28-1f37-470d-a1c8-891180aa43bb',
	'be81b943-c758-4f81-8f30-95a056b32b38',
	'2bbea6fb-1e90-4b21-9887-2278ab7fd805',
	'5a3291d1-9759-4c35-b969-25758a38019e',
	'1bfcad81-a2b2-4cbf-a0b0-c51c7659f77d',
	'222a1232-6590-4fa2-92e1-18445254cf3a',
	'7280cf5a-43d5-4d10-b0af-727d4052c994',
	'0c662df8-5541-42cb-93f4-40f255015600',
	'fb7f9611-1cd6-41d9-a47b-86da7439b907',
	'1754a043-ada0-4226-bf18-88fa7d028e34',
	'f954cac1-593a-4eca-a8e4-c1504ee01fe9',
	'a46ce7dd-0931-4c6f-b5a0-13f81c187e7a',
	'e821121e-0eab-4ec6-9025-b80b66714567',
	'b29b2c3b-8909-4f19-a38e-7de1ea707f1d',
	'bc59818f-1a72-438a-937f-c7b04fcaa25b',
	'e865b144-bdb4-40ae-a547-a8ed24e9a80e',
	'5c313496-abec-4704-9a21-f586d178eba5',
	'5eb40c6a-5f5a-4696-a97c-3a1b2c55eaa5',
	'62555738-84f0-40f3-ae6f-2d2865b5fe06',
	'5a7b0208-25ab-4585-867e-cf092e9083d5',
	'f64312f5-9d6f-4001-9c30-23d6ff320927',
	'fdc6a9c3-b511-4a76-b5cf-44ab8135a6cf',
	'808acc42-b414-461d-8142-e4940092cd2c',
	'4aa5dfb3-2cb8-4f86-8500-e10f5e6c856e',
	'5a09af98-1b1b-4803-bf7b-eefefbc1a62a',
	'd6d99318-1562-4bae-a9c2-1e79b0b9a59b',
	'ec36c420-4d34-49fa-a5a9-57129eda1246',
	'8088557d-46f1-42e7-8177-06a58e99e819',
	'fec1e1aa-3cb6-4b2f-8302-c407d14e8275',
	'f74055e2-dad3-454c-9e04-3f52c7e2d93a',
	'88999b24-9939-4647-8ad6-da95b640fcb8',
	'43fad7b7-b513-4f31-ab7d-b4a9091c2dd3',
	'4a5d312a-e8bf-4ce1-a5e9-0d86b470e6fe',
	'ae7626b0-fb59-44f4-81ca-ad6595b1434f',
	'dba0b4ef-65c8-45ef-a54f-d66618582706',
	'183bcaf2-01a7-4d2c-be45-32aa5aa878c9',
	'2f872ffa-07d8-43b8-8798-f1e1c2797806',
	'1039cf65-5900-4501-a05c-16819a04ae7b',
	'4b3447ec-7e9b-4b1f-88ec-d03a22190d76',
	'1bc596e3-4d1a-44aa-9333-de877b05caab',
	'64dbc44e-733c-4672-9242-d1c1988a903c',
	'8169c956-d6d0-4b72-b728-c554a74b9914',
	'cba105bc-458c-4aee-bbb5-e6bf3b02d0be',
	'37c35cde-2f79-4592-b765-ee7fbe47f0b5'
);

insert into TsToolItem set FId='12e74198-12e7-4198-fa7f-8038fa7f8038', FPageId='c87597b5-53e9-46e6-b08a-84f5ebcdffb3', FCode='Keyword',			  FName=null,	FLabel='',	FType='InputBox-Text',			FAlign='left',	FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='09ec48c6-09ec-48c6-b3c1-e0ccb3c1e0cc', FPageId='9e9619ed-0664-4459-bfd6-6574bd25e4d9', FCode='Keyword',			  FName=null,   FLabel='',	FType='InputBox-Text',			FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='655d41ba-655d-41ba-4f92-14c64f9214c6', FPageId='85bcda91-266c-487d-846d-447707fd8531', FCode='Keyword',			  FName=null,   FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='135c4e8e-135c-4e8e-2e34-11ae2e3411ae', FPageId='946daef7-fb60-4580-93d7-599a2167998d', FCode='Keyword',			  FName=null,   FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='53434c7e-5343-4c7e-0f83-b9330f83b933', FPageId='e1d3e143-1b06-42db-905c-8d83e35543d4', FCode='Keyword',				FName=null,     FLabel='',	FType='InputBox-Text',			FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='2e5d46f4-2e5d-46f4-2978-d8022978d802', FPageId='4b2b868b-3ab3-42e5-b577-433f3ebfbc36', FCode='Keyword',				FName=null,     FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='631545d5-6315-45d5-741a-48d5741a48d5', FPageId='9610c667-2136-4675-afa6-9f44f7fc1e57', FCode='Keyword',				FName=null,     FLabel=null,	FType='InputBox-Text',			FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='7be4fcfb-1f37-476e-9b99-e5965c412d1a', FPageId='6b40d650-3790-452f-9cf4-230e835d3390', FCode='Keyword',				FName=null,     FHint=null, FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='29f5bf81-97a7-4a0b-bb94-684fde32130a', FPageId='4d3af4c8-284b-46a6-9fd4-9cc93911bba2', FCode='Keyword',			  FName=null,   FHint=null, FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='86c74128-86c7-4128-6c5f-8f116c5f8f11', FPageId='bc2e9463-1f93-4c73-b5c4-14694454deb1', FCode='Keyword',				FName=null,     FLabel='', FType='InputBox-Text',		FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b1f44d14-b1f4-4d14-d887-150ed887150e', FPageId='302e9e91-874c-47b5-9830-9b6b8c3e65f0', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='f017411e-f017-411e-21d3-800721d38007', FPageId='4a970b97-6eca-4dc8-bff4-03bb1b1205ec', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='fb6d4d0c-fb6d-4d0c-c32d-99ecc32d99ec', FPageId='c4e085ff-2fd5-4ea8-80f8-574df6061af0', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='2ae43bf5-0429-417c-8515-ef49928fc717', FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FCode='Keyword',				FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='8a72938e-e975-4c51-bacf-1e9103562444', FPageId='cf4d6f9e-0b62-4874-88c9-0e079b08cd06', FCode='Keyword',				FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='cb5d4d91-cb5d-4d91-1338-7f0613387f06', FPageId='3d485cb0-ab24-4edc-b3f9-3b1e216192d1', FCode='Keyword',				FName=null,     FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='d3344ab1-d334-4ab1-94ee-944894ee9448', FPageId='84d7bbc3-8a37-4955-b178-bb6873de6978', FCode='Keyword',				FName=null,     FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='653742bc-6537-42bc-7265-4f8a72654f8a', FPageId='3549a1fc-ceb6-4105-a9c8-80f65a7c1b87', FCode='Keyword',				FName=null,     FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='7573736f-d309-4157-9482-aaa21e76aac7', FPageId='18357e9a-6eab-4710-b71d-8d587c3d947c', FCode='Keyword',           FName=null,   FHint=null,																						FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='425948e5-dd00-4cf6-a46e-b1967606ab4d', FPageId='570078bc-8eaf-44ef-a3dd-dadb3bcb7224', FCode='Keyword',           FName=null,   FHint=null,                                                                       FLabel=null, FType='InputBox-Text',      FAlign='left',  FIndex=3, FWidth=175, FIcon=null,                                FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='af1241ce-af12-41ce-d593-81d1d59381d1', FPageId='ff34468b-679f-4812-bee8-042cc79b5340', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='9a914272-9a91-4272-9366-e2a59366e2a5', FPageId='54b2abdb-d9ff-49cd-b675-0876aaf0f48c', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='267d4c6a-267d-4c6a-e83b-84d1e83b84d1', FPageId='e85e9ed6-3903-47b5-8d14-106a71cf340d', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='0965436d-0965-436d-731b-43ff731b43ff', FPageId='690574f3-62bf-4ac7-93b4-2f59ff9e6067', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='1049d090-17fe-4b37-b150-1798033650e0', FPageId='9c0fa5f3-4904-4bfb-a237-26fac1198552', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='091516d7-01e8-4cb7-b743-96fe78d98d91', FPageId='f0f5b230-8679-4b16-9855-9381733f05c1', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='63094a33-6309-4a33-92bf-941c92bf941c', FPageId='89b36224-1a44-45ea-bba6-8c81e6bf3225', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b48b4ad5-b48b-4ad5-2353-5b1b23535b1b', FPageId='bd705945-9109-430f-9623-92630ca35376', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='fb28405e-fb28-405e-3348-d7a83348d7a8', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='bba841a2-bba8-41a2-3bd8-a4e93bd8a4e9', FPageId='a3e84409-2374-4093-aa37-cfbbc5d26f19', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='de634680-de63-4680-3278-cf863278cf86', FPageId='e8489c16-dab2-420f-bec5-eb764c705fbf', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='600343bc-6003-43bc-cc8d-f552cc8df552', FPageId='0bd984fb-0561-4c7b-aecf-1f296eee5894', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='cefc458a-cefc-458a-e162-64fae16264fa', FPageId='83befce1-d238-4522-965c-0915b5434b86', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='08d744a7-08d7-44a7-c37f-dc27c37fdc27', FPageId='0017ebe4-b826-4dd3-8ca1-53f0766facfa', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='3b8c486d-3b8c-486d-7f12-13e87f1213e8', FPageId='0ea362cc-9fbc-4004-94b7-8db0d6c2cd7f', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='420545b1-4205-45b1-fd65-71edfd6571ed', FPageId='4cacd16c-1ae0-466a-9d87-5715a215947a', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='11d047e0-11d0-47e0-e85b-e1ffe85be1ff', FPageId='b552e9fb-126b-480d-8296-2a3ef9fb72b2', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b7b9153b-d140-447d-8c8c-00889fbab51d', FPageId='47db540f-0166-439e-af12-b0d55befe28f', FCode='Keyword',	  FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='d0e64379-d0e6-4379-3a88-d36e3a88d36e', FPageId='228470b6-62fc-4ebc-a630-1380cb1043a4', FCode='Keyword',   FName=null,                         FLabel=null,             FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='e0134adf-e013-4adf-d56c-462ad56c462a', FPageId='58a40a38-017c-4b2a-affd-0692caab35cd', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='dbac49af-dbac-49af-0073-444100734441', FPageId='7f35b6b9-37de-4dc4-977c-bd1aa70afe8f', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='1af14958-1af1-4958-68a0-b85068a0b850', FPageId='eaa06693-4d59-4d51-905c-1d845ca8903c', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='04ed4e84-04ed-4e84-2694-061026940610', FPageId='5b45309a-053e-423c-9271-4ed6f30f32af', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='dee3422c-dee3-422c-4388-74ec438874ec', FPageId='8beada1c-7f71-4b3e-b357-4f088f96c7a3', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='073149a8-0731-49a8-db90-41d8db9041d8', FPageId='648b7891-dbc2-4ad3-a09b-587581430cd8', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='dac94006-dac9-4006-f49f-4d7cf49f4d7c', FPageId='27729d66-df4b-4fb5-99a8-92351b5fd830', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='9bd2493b-9bd2-493b-d3d0-e9c4d3d0e9c4', FPageId='97df8845-301a-4d00-a28b-fa557772a3a7', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='c264ef08-cdd0-4241-8c9a-e96a68afc1e1', FPageId='15c0a91b-7ae2-46c8-8a97-7de10711577c', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='a40fdfdd-f729-4eff-a8d0-f882d3eb8b87', FPageId='e0ae2795-d9c5-41a1-a7e0-84e8c5b2beb5', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='a4ae47a1-a4ae-47a1-dcd0-d9f6dcd0d9f6', FPageId='78c6ffa1-7ec8-452a-adfc-8c1e75db0a3d', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='a8c242af-a8c2-42af-8a48-0ba58a480ba5', FPageId='fc06ccdc-09cf-4561-87b6-27f105f665f5', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='3338648e-4c72-49b2-aca5-97915468fb43', FPageId='79fb1a28-1f37-470d-a1c8-891180aa43bb', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='4bf4f4a5-6dee-489b-8456-e65359a7d5aa', FPageId='be81b943-c758-4f81-8f30-95a056b32b38', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='3c7f8ab2-8bd1-4ee8-a5a7-6b3b4b7cd10b', FPageId='2bbea6fb-1e90-4b21-9887-2278ab7fd805', FCode='Keyword',		FName=null,                         FLabel='',	FType='InputBox-Text',             FAlign='left',	FIndex=3, FWidth=0,		FDefaultEventHandler=null,								FIcon=null,	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,			FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',		FHandlePageId=null;
insert into TsToolItem set FId='0ee940fc-38ed-487a-989a-1f5c8a6cfa89', FPageId='5a3291d1-9759-4c35-b969-25758a38019e', FCode='Keyword',		FName=null,                         FLabel='', FType='InputBox-Text',				FAlign='left',	FIndex=3, FWidth=0,		FDefaultEventHandler=null,								FIcon=null,	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,			FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolItem set FId='a5f4432d-a5f4-432d-bb29-2a95bb292a95', FPageId='1bfcad81-a2b2-4cbf-a0b0-c51c7659f77d', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='5da04413-5da0-4413-9c62-02199c620219', FPageId='222a1232-6590-4fa2-92e1-18445254cf3a', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='906d4367-906d-4367-2c07-9d642c079d64', FPageId='7280cf5a-43d5-4d10-b0af-727d4052c994', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='2d3c4d0e-2d3c-4d0e-954e-3506954e3506', FPageId='0c662df8-5541-42cb-93f4-40f255015600', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b5904c13-b590-4c13-10e4-62ec10e462ec', FPageId='fb7f9611-1cd6-41d9-a47b-86da7439b907', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b9101ebd-f20f-4512-8300-0a0304ad4b37', FPageId='1754a043-ada0-4226-bf18-88fa7d028e34', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='5c04c192-3d91-4519-8a17-50e47a0c7faf', FPageId='f954cac1-593a-4eca-a8e4-c1504ee01fe9', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='132c048d-c139-4b3d-8df5-c023acb31270', FPageId='a46ce7dd-0931-4c6f-b5a0-13f81c187e7a', FCode='Keyword',			  FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='16bfd12e-1f69-4a27-a53a-378dfb78b2c0', FPageId='e821121e-0eab-4ec6-9025-b80b66714567', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='69a44bc6-69a4-4bc6-88e6-4f5388e64f53', FPageId='b29b2c3b-8909-4f19-a38e-7de1ea707f1d', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='625c4688-625c-4688-d0bb-901cd0bb901c', FPageId='bc59818f-1a72-438a-937f-c7b04fcaa25b', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='205b0365-eeae-4835-9d85-e56a1416685b', FPageId='e865b144-bdb4-40ae-a547-a8ed24e9a80e', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='11d40242-850d-47a6-83bc-24bf27201357', FPageId='5c313496-abec-4704-9a21-f586d178eba5', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b20bd534-4639-47a3-bd54-21a9d2ca1fc3', FPageId='5eb40c6a-5f5a-4696-a97c-3a1b2c55eaa5', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='9d4d9a1f-7cec-4f81-8fe3-ac802847f56b', FPageId='62555738-84f0-40f3-ae6f-2d2865b5fe06', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='6703aa73-778b-4b28-89f0-f6258cf4496e', FPageId='5a7b0208-25ab-4585-867e-cf092e9083d5', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='f6bbbdd3-9257-45e8-875d-527f0cdb99fe', FPageId='f64312f5-9d6f-4001-9c30-23d6ff320927', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='0b8c35d9-7139-4d2a-94de-0b8896a514ac', FPageId='fdc6a9c3-b511-4a76-b5cf-44ab8135a6cf', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='a522ae71-5c45-431c-a0f2-5183104bf85d', FPageId='808acc42-b414-461d-8142-e4940092cd2c', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='077d4e22-077d-4e22-db81-2256db812256', FPageId='4aa5dfb3-2cb8-4f86-8500-e10f5e6c856e', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b5b8c1c3-3c89-4518-9c8c-2710b5d2c729', FPageId='5a09af98-1b1b-4803-bf7b-eefefbc1a62a', FCode='Keyword',				FName='',				FLabel=null, FType='InputBox-Text',			FAlign='left',  FIndex=1, FWidth=150, FDefaultEventHandler=null,								FIcon=null,							FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null;
insert into TsToolItem set FId='8b55447e-8b55-447e-988c-1278988c1278', FPageId='d6d99318-1562-4bae-a9c2-1e79b0b9a59b', FCode='Keyword',			  FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='ef97f754-f2fe-4585-a47e-2a06b7663078', FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FCode='Keyword',				FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='fab84483-fab8-4483-6108-1a8c61081a8c', FPageId='8088557d-46f1-42e7-8177-06a58e99e819', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='17c9475f-17c9-475f-fc86-1519fc861519', FPageId='fec1e1aa-3cb6-4b2f-8302-c407d14e8275', FCode='Keyword', FName=null,                         FLabel=null, FType='InputBox-Text',             FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='c21171c0-7600-4e77-a1bd-d4c4db182cd0', FPageId='f74055e2-dad3-454c-9e04-3f52c7e2d93a', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='4be61760-09f2-47f2-aab4-db04c7e6f2a9', FPageId='88999b24-9939-4647-8ad6-da95b640fcb8', FCode='Keyword',			  FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='d771aab2-cfd5-4333-92dc-706e582fd536', FPageId='43fad7b7-b513-4f31-ab7d-b4a9091c2dd3', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='8b722547-41db-433f-974e-1aa154e3adbf', FPageId='4a5d312a-e8bf-4ce1-a5e9-0d86b470e6fe', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='8a6f5721-7cf4-4892-8dd9-730c57924652', FPageId='ae7626b0-fb59-44f4-81ca-ad6595b1434f', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='cda2be33-5963-425c-92ef-c740eaf57cbc', FPageId='dba0b4ef-65c8-45ef-a54f-d66618582706', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='3eedec28-d328-4758-99ae-2d9525e06b35', FPageId='183bcaf2-01a7-4d2c-be45-32aa5aa878c9', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='d9d1bc10-a03e-466d-b26e-556119b97eb7', FPageId='2f872ffa-07d8-43b8-8798-f1e1c2797806', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='4756b147-92b7-4775-8a6d-776ca3cbed3e', FPageId='1039cf65-5900-4501-a05c-16819a04ae7b', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='b692776f-5a0e-489a-a0f0-6dee791ddee8', FPageId='4b3447ec-7e9b-4b1f-88ec-d03a22190d76', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='d671145a-1678-4d6c-b867-51efb450a260', FPageId='1bc596e3-4d1a-44aa-9333-de877b05caab', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='a7f12ace-f0ff-42b5-b58a-51dc1a4a4ea1', FPageId='64dbc44e-733c-4672-9242-d1c1988a903c', FCode='Keyword',   FName=null,                         FHint=null, FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItem set FId='513f62ef-93c5-47ea-93e5-1865cfdc3720', FPageId='8169c956-d6d0-4b72-b728-c554a74b9914', FCode='Keyword',   FName=null,                         FHint=null,					FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='efef070f-c451-4f72-ad26-505ab0a983cb', FPageId='cba105bc-458c-4aee-bbb5-e6bf3b02d0be', FCode='Keyword',   FName=null,                         FHint=null,           FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null, FConfirmMessage=null;
insert into TsToolItem set FId='1c507e19-606b-43a0-a4bd-7b9a4c1ca83d', FPageId='37c35cde-2f79-4592-b765-ee7fbe47f0b5', FCode='Keyword',			  FName=null,                         FHint=null,					FLabel=null, FType='InputBox-Text',             FAlign='left',  FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',		 FHandlePageId=null, FDefaultEventHandler=null,											FConfirmMessage=null;

insert into TsToolItemProperty set FId='1ead8612-43fa-45ce-bc79-56c8ebfceb29', FToolItemId='12e74198-12e7-4198-fa7f-8038fa7f8038', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='c308e6ba-a329-4324-9dc2-a9d9bcccd22a', FToolItemId='09ec48c6-09ec-48c6-b3c1-e0ccb3c1e0cc', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='fd1000bb-60ac-48e2-88f9-250ebcf623c3', FToolItemId='655d41ba-655d-41ba-4f92-14c64f9214c6', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='0d22d437-e20d-4f29-839c-bd1450e0245c', FToolItemId='135c4e8e-135c-4e8e-2e34-11ae2e3411ae', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='e438e96a-9c83-4ff6-b422-e5860d0fe537', FToolItemId='53434c7e-5343-4c7e-0f83-b9330f83b933', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='e8942ec1-9b55-47ba-a6e1-3fc0c7070322', FToolItemId='2e5d46f4-2e5d-46f4-2978-d8022978d802', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6b26d20a-3030-420c-98dc-669593dfc95e', FToolItemId='631545d5-6315-45d5-741a-48d5741a48d5', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='3b578395-4230-4ba6-8676-2554fe3e5198', FToolItemId='7be4fcfb-1f37-476e-9b99-e5965c412d1a', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='dfb54769-4d4a-41e0-ac2b-3e661a1238c1', FToolItemId='29f5bf81-97a7-4a0b-bb94-684fde32130a', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='cbbe6886-415e-4f6c-83c1-1d41399624db', FToolItemId='86c74128-86c7-4128-6c5f-8f116c5f8f11', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='1379702d-d9e0-4edc-af70-7f04d44f4b21', FToolItemId='b1f44d14-b1f4-4d14-d887-150ed887150e', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='a1df7e68-9a03-4e08-94fb-e81b5ef7d9d2', FToolItemId='f017411e-f017-411e-21d3-800721d38007', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='129d9404-2090-4573-b3ae-c56040280252', FToolItemId='fb6d4d0c-fb6d-4d0c-c32d-99ecc32d99ec', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='49bd010f-a336-4582-8daf-37b7ca28ea84', FToolItemId='2ae43bf5-0429-417c-8515-ef49928fc717', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='80b834b8-1e3e-4a89-a043-c8c0c43d2cae', FToolItemId='8a72938e-e975-4c51-bacf-1e9103562444', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='afd5780b-7fd0-42e1-957e-7b980dfeff38', FToolItemId='cb5d4d91-cb5d-4d91-1338-7f0613387f06', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='7139a14d-5ad5-4050-886a-9577f154faab', FToolItemId='d3344ab1-d334-4ab1-94ee-944894ee9448', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='2102dd3f-bffb-49bc-a88f-0dcf2477f4b2', FToolItemId='653742bc-6537-42bc-7265-4f8a72654f8a', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='8aab9f29-8666-4c1f-9008-6e63b40ce7bf', FToolItemId='7573736f-d309-4157-9482-aaa21e76aac7', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='70122228-64bd-44f1-b505-15c3f652b385', FToolItemId='425948e5-dd00-4cf6-a46e-b1967606ab4d', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='2a5877db-b88d-4f52-b12e-8f7e845604e5', FToolItemId='af1241ce-af12-41ce-d593-81d1d59381d1', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='07bc0f0d-1030-40f0-9d8b-5a3865437eed', FToolItemId='9a914272-9a91-4272-9366-e2a59366e2a5', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='fee1ca51-1cdb-4474-8e2a-5a01630fbf18', FToolItemId='267d4c6a-267d-4c6a-e83b-84d1e83b84d1', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='141eba1f-49f2-41fb-bff2-b3f7e8507f0e', FToolItemId='0965436d-0965-436d-731b-43ff731b43ff', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='3b692fa2-c199-48eb-9767-b8dd150038d4', FToolItemId='1049d090-17fe-4b37-b150-1798033650e0', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='eb080513-c825-4ba1-be6b-6157ecb16d17', FToolItemId='091516d7-01e8-4cb7-b743-96fe78d98d91', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='f0587e6c-aa9d-42de-8d62-ff072771b12c', FToolItemId='63094a33-6309-4a33-92bf-941c92bf941c', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='2f741af6-560c-4794-b6e2-7c0fddf357fa', FToolItemId='b48b4ad5-b48b-4ad5-2353-5b1b23535b1b', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='deb63aa1-5821-412d-a268-0d2f28d54ccd', FToolItemId='fb28405e-fb28-405e-3348-d7a83348d7a8', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='fcc573e3-4c4e-48b0-9032-7034070fa196', FToolItemId='bba841a2-bba8-41a2-3bd8-a4e93bd8a4e9', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='77c42cc6-4bfc-4888-9684-a54b5ce931f2', FToolItemId='de634680-de63-4680-3278-cf863278cf86', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='776064fa-9e02-4fd4-962f-f70058b8b46d', FToolItemId='600343bc-6003-43bc-cc8d-f552cc8df552', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='e6f2c526-2a75-4494-90e8-edae14770981', FToolItemId='cefc458a-cefc-458a-e162-64fae16264fa', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='e9f82186-c10c-498d-b5f4-e703416e0db7', FToolItemId='08d744a7-08d7-44a7-c37f-dc27c37fdc27', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='06788c97-769c-46ce-b2ec-f45dc60aea46', FToolItemId='3b8c486d-3b8c-486d-7f12-13e87f1213e8', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='fdf96db9-c13b-414d-bd9d-bb0ee865aa76', FToolItemId='420545b1-4205-45b1-fd65-71edfd6571ed', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6f382f18-1046-45c7-b428-d1f1a9b7a9f6', FToolItemId='11d047e0-11d0-47e0-e85b-e1ffe85be1ff', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='ae8442e7-f179-4b38-b40a-eed05a273aa8', FToolItemId='b7b9153b-d140-447d-8c8c-00889fbab51d', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='3d8a436f-a00c-4e2c-9bca-e857c583fb77', FToolItemId='d0e64379-d0e6-4379-3a88-d36e3a88d36e', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='ed59b0b3-071d-493b-861d-87763b259245', FToolItemId='e0134adf-e013-4adf-d56c-462ad56c462a', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='56bbbc8b-1273-4ea0-bddb-3b32c9016b61', FToolItemId='dbac49af-dbac-49af-0073-444100734441', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='c7cf70fe-e512-469d-b2f9-3f71f1568e91', FToolItemId='1af14958-1af1-4958-68a0-b85068a0b850', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='eb5e7430-a928-4fa6-83dc-9bc988dc1c7b', FToolItemId='04ed4e84-04ed-4e84-2694-061026940610', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='364ea664-45c9-423e-8656-0404630dc22f', FToolItemId='dee3422c-dee3-422c-4388-74ec438874ec', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='c9efda1a-c00c-4117-ae6c-2ed7bf679062', FToolItemId='073149a8-0731-49a8-db90-41d8db9041d8', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6db9e609-bb1f-43e8-a248-dc0baa1d5e5f', FToolItemId='dac94006-dac9-4006-f49f-4d7cf49f4d7c', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6dc4711b-7ffc-48c8-97c2-49ece92a3df5', FToolItemId='9bd2493b-9bd2-493b-d3d0-e9c4d3d0e9c4', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='e8346dcd-d71e-4ac4-8c9e-1c0afa8fd028', FToolItemId='c264ef08-cdd0-4241-8c9a-e96a68afc1e1', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='edcf05a2-a7dc-4ae6-9f97-e5bfcb998b13', FToolItemId='a40fdfdd-f729-4eff-a8d0-f882d3eb8b87', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='67f491af-0f63-4655-a899-9b6f88fa901a', FToolItemId='a4ae47a1-a4ae-47a1-dcd0-d9f6dcd0d9f6', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='9d3a1b14-db3f-4bff-9bfa-e17cdaaeba86', FToolItemId='a8c242af-a8c2-42af-8a48-0ba58a480ba5', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='40f9f0b6-11dc-4c22-b852-ce26573dd5c2', FToolItemId='3338648e-4c72-49b2-aca5-97915468fb43', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='2c680cd4-ee50-4330-b0d0-aefaec9a4d42', FToolItemId='4bf4f4a5-6dee-489b-8456-e65359a7d5aa', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='13a18e31-ecfb-499f-bbdc-685c278eb6d2', FToolItemId='3c7f8ab2-8bd1-4ee8-a5a7-6b3b4b7cd10b', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='19579423-89fa-41f2-8d64-3b2bb9156d78', FToolItemId='0ee940fc-38ed-487a-989a-1f5c8a6cfa89', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='059c6c79-0225-43b5-905b-fd4ff152e552', FToolItemId='a5f4432d-a5f4-432d-bb29-2a95bb292a95', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='00db389f-6a88-4e74-a810-7f899f8836b7', FToolItemId='5da04413-5da0-4413-9c62-02199c620219', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='1ba9f81c-7b76-43d2-9ed8-7bbd687fc50d', FToolItemId='906d4367-906d-4367-2c07-9d642c079d64', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='1ab3893f-a55a-4c85-a117-b569f909db0c', FToolItemId='2d3c4d0e-2d3c-4d0e-954e-3506954e3506', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='4a342915-4742-47a0-b756-44363704e99b', FToolItemId='b5904c13-b590-4c13-10e4-62ec10e462ec', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='5d8fe6a0-2403-49b5-8ab6-2e51c6d81c05', FToolItemId='b9101ebd-f20f-4512-8300-0a0304ad4b37', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='63a4b551-51e8-4722-9892-cef61dab3d7f', FToolItemId='5c04c192-3d91-4519-8a17-50e47a0c7faf', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='ffb3670a-baf5-43a3-8a5b-8828f5723148', FToolItemId='132c048d-c139-4b3d-8df5-c023acb31270', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='0adf6660-f0f7-4b2a-9957-5d3d66ccef3a', FToolItemId='16bfd12e-1f69-4a27-a53a-378dfb78b2c0', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='cfd143df-3402-4e50-a6c3-be7748f9a660', FToolItemId='69a44bc6-69a4-4bc6-88e6-4f5388e64f53', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='a93d6240-f234-4e54-89ed-35482bc2670c', FToolItemId='625c4688-625c-4688-d0bb-901cd0bb901c', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='34096864-2a5b-4dfc-8600-292f50f4ad7f', FToolItemId='205b0365-eeae-4835-9d85-e56a1416685b', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='ffc0a338-1fa7-48af-b901-33308956c147', FToolItemId='11d40242-850d-47a6-83bc-24bf27201357', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='943a9e26-0cf4-445b-bb77-96d681f6b485', FToolItemId='b20bd534-4639-47a3-bd54-21a9d2ca1fc3', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='cbd3d19a-25ef-4a7a-83ba-abde618f7f7c', FToolItemId='9d4d9a1f-7cec-4f81-8fe3-ac802847f56b', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='b4628b4f-2d51-4e2a-a2ee-30d6c01f8165', FToolItemId='6703aa73-778b-4b28-89f0-f6258cf4496e', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='d71bbd2d-19af-4fc9-9322-e8e44dd7208e', FToolItemId='f6bbbdd3-9257-45e8-875d-527f0cdb99fe', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='0f13090d-b853-4f29-9c14-373cdc071960', FToolItemId='0b8c35d9-7139-4d2a-94de-0b8896a514ac', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='7461bc5e-9d57-49f0-874d-1e561a5ba0f4', FToolItemId='a522ae71-5c45-431c-a0f2-5183104bf85d', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='a5e16281-8cfb-45aa-a2d5-c02ca7c4f566', FToolItemId='077d4e22-077d-4e22-db81-2256db812256', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='b47d9bfd-9378-471f-83ec-a0a81fcf5eb7', FToolItemId='b5b8c1c3-3c89-4518-9c8c-2710b5d2c729', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='18129c03-cafc-422c-916c-e3267feddff5', FToolItemId='8b55447e-8b55-447e-988c-1278988c1278', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6d5b40da-af39-473c-a95f-c6ccf72ecd61', FToolItemId='ef97f754-f2fe-4585-a47e-2a06b7663078', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='dee1aa04-bd81-4912-9ace-aa8ddcabfa96', FToolItemId='fab84483-fab8-4483-6108-1a8c61081a8c', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='4f277944-af34-4ac0-a203-7c77f0357df7', FToolItemId='17c9475f-17c9-475f-fc86-1519fc861519', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='0c7d3585-1395-467a-88eb-af507b10dcfa', FToolItemId='c21171c0-7600-4e77-a1bd-d4c4db182cd0', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='fc5a7215-5246-4c92-875c-5057485a738d', FToolItemId='4be61760-09f2-47f2-aab4-db04c7e6f2a9', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='923bc150-a7f4-471e-b86e-31ae5af640bb', FToolItemId='d771aab2-cfd5-4333-92dc-706e582fd536', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='306910cc-a07d-45db-a0a2-c7b766ec1e73', FToolItemId='8b722547-41db-433f-974e-1aa154e3adbf', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='f4b985a9-2e53-4209-a047-cd177a9f25bc', FToolItemId='8a6f5721-7cf4-4892-8dd9-730c57924652', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='37d27f07-1c52-4e08-9c7e-10d39478cfa5', FToolItemId='cda2be33-5963-425c-92ef-c740eaf57cbc', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='66b05217-04ea-436d-9a5c-3e8f5bb74965', FToolItemId='3eedec28-d328-4758-99ae-2d9525e06b35', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='5c11c445-ce4c-4eb7-8539-47d26bc0a31d', FToolItemId='d9d1bc10-a03e-466d-b26e-556119b97eb7', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='17d7a669-f076-43bc-9ab6-a43b5738ef0c', FToolItemId='4756b147-92b7-4775-8a6d-776ca3cbed3e', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='f794c9ba-8b12-466d-a854-ece037ba481d', FToolItemId='b692776f-5a0e-489a-a0f0-6dee791ddee8', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='6166dae1-21e9-4529-b4dc-64cc6d33fe10', FToolItemId='d671145a-1678-4d6c-b867-51efb450a260', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='c76c7899-63e9-408c-93ff-706ef4e1d8a5', FToolItemId='a7f12ace-f0ff-42b5-b58a-51dc1a4a4ea1', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='9c5a2d59-de01-44a8-b317-22908f6e5dfe', FToolItemId='513f62ef-93c5-47ea-93e5-1865cfdc3720', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='1c07eabc-7806-4ced-9bf4-35876d53755c', FToolItemId='efef070f-c451-4f72-ad26-505ab0a983cb', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
insert into TsToolItemProperty set FId='bf55f01d-94e1-43bb-a9c3-c6d37d08e15d', FToolItemId='1c507e19-606b-43a0-a4bd-7b9a4c1ca83d', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';

--菜单选择列表补查询方案/关键字框

delete from TsToolItem where FId='ee14aff8-e8ce-4012-aae6-f0f148e88d65';
delete from TsToolItem where FId='f51c5e6d-62df-410f-8e6f-8862884ec58c';
delete from TsToolItem where FId='6bfbd35e-55c0-46cf-ad44-9403d71dde46';
delete from TsToolItemProperty where FId='d1b69b69-15ca-4556-bf14-d684b1e07152';
insert into TsToolItem set FId='ee14aff8-e8ce-4012-aae6-f0f148e88d65', FPageId='427e30c2-1d38-4dce-8bb7-8d655d2a0e96', FCode='QuerySchema',			FName=null,		FLabel='', FType='ComboBox-SelectOnly', FAlign='left', FIndex=1, FWidth=175, FIcon=null,                            FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange';
insert into TsToolItem set FId='f51c5e6d-62df-410f-8e6f-8862884ec58c', FPageId='427e30c2-1d38-4dce-8bb7-8d655d2a0e96', FCode='QuerySchemaConfig',	FName=null,     FLabel='', FType='Button',				FAlign='left', FIndex=2, FWidth=0,   FDefaultEventHandler='EntityList.doQuerySchemaConfig', FIcon='quicksilver/image/16/Config.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='6bfbd35e-55c0-46cf-ad44-9403d71dde46', FPageId='427e30c2-1d38-4dce-8bb7-8d655d2a0e96', FCode='Keyword',				FName=null,     FLabel='', FType='InputBox-Text',		FAlign='left', FIndex=3, FWidth=0,   FIcon=null, FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null, FDefaultEventHandler=null;
insert into TsToolItemProperty set FId='d1b69b69-15ca-4556-bf14-d684b1e07152', FToolItemId='6bfbd35e-55c0-46cf-ad44-9403d71dde46', FName='onkeydown', FValue='EntityList.doKeywordKeyDown';
