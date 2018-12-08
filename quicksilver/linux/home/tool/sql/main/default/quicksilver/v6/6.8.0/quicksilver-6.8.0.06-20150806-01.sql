--minglei

--頭像編輯頁面

delete from TsTextResource where FId='abfd6fc2-0b95-40a4-ad16-6c3701443244';
insert into TsTextResource set FId='abfd6fc2-0b95-40a4-ad16-6c3701443244', FCode='T.Public.Preview',									FValue='預覽';

delete from TsTextResource where FId='1b3e5c28-922f-41f0-af37-8e5f5c30c4e1';
delete from TsTextResource where FId='4c5ec46d-9a9d-41fa-b51f-927425185a8d';
delete from TsTextResource where FId='e637c833-1ca8-4769-995a-cde620d53996';
insert into TsTextResource set FId='1b3e5c28-922f-41f0-af37-8e5f5c30c4e1', FCode='T.Qs.Avatar.Big',										FValue='大尺寸';
insert into TsTextResource set FId='4c5ec46d-9a9d-41fa-b51f-927425185a8d', FCode='T.Qs.Avatar.Medium',									FValue='中尺寸';
insert into TsTextResource set FId='e637c833-1ca8-4769-995a-cde620d53996', FCode='T.Qs.Avatar.Small',									FValue='小尺寸';

delete from TsPage where FId='0b7d340d-53dc-4a0f-88a4-093404f67fdc';
delete from TsPage where FId='c268105b-82f9-4160-a1ce-c4c296c46e8d';
insert into TsPage set FId='0b7d340d-53dc-4a0f-88a4-093404f67fdc', FName='頭像編輯頁面',	FTitle='頭像',		FCode='Qs.Picture.AvatarEdit', FType='Other',      FIcon='quicksilver/image/16/Avatar.png',		FUrl='quicksilver/page/attachment/AvatarEdit.jsp',  FActionMethodName=null,							FLoadHandler=null,        FRelationId=null, FUnitId='b785eab6-c1fb-458c-a67a-ea8ba0484a11', FMasterUnitId=null,                                   FIsSlavePage=0, FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FIndex=null, FDialogWidth=600,  FDialogHeight=464,  FDescription=null, FVisible=1;
insert into TsPage set FId='c268105b-82f9-4160-a1ce-c4c296c46e8d', FName='我的頭像',		FTitle='我的頭像',	FCode='Qs.Picture.MyAvatar',   FType='Other',      FIcon='quicksilver/image/16/Avatar.png',		FUrl='quicksilver/page/attachment/MyAvatar.jsp',    FActionMethodName='Qs.Picture.prepareMyAvatar', FLoadHandler=null,        FRelationId=null, FUnitId='b785eab6-c1fb-458c-a67a-ea8ba0484a11', FMasterUnitId=null,                                   FIsSlavePage=0, FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

update TsMenu set FIndex = FIndex + 1 where FParentId='9353e310-16a0-41a2-849b-a37834484671' and FIndex > 2;
delete from TsMenu where FId='ac1bc3d2-4309-47eb-a4eb-355ffd8e6140';
insert into TsMenu set	FId='ac1bc3d2-4309-47eb-a4eb-355ffd8e6140', FParentId='9353e310-16a0-41a2-849b-a37834484671',	FIndex=3,	FName='我的頭像',			FPageId='c268105b-82f9-4160-a1ce-c4c296c46e8d', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/16/Avatar.png';

delete from TsToolItem where FPageId='0b7d340d-53dc-4a0f-88a4-093404f67fdc';
insert into TsToolItem set FId='8a309319-6adc-4678-8801-4c12c6f211b2', FPageId='0b7d340d-53dc-4a0f-88a4-093404f67fdc', FCode='Confirm',			  FName='確定',                       FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='AvatarEdit.doConfirm',			FIcon='quicksilver/image/16/Ok.png',			FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='4d19eb95-e000-4891-95d3-d7351be36f68', FPageId='0b7d340d-53dc-4a0f-88a4-093404f67fdc', FCode='Reselect',          FName='重新選擇',                   FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FDefaultEventHandler='AvatarEdit.doReselect',          FIcon='quicksilver/image/16/FolderOpen.gif',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='c268105b-82f9-4160-a1ce-c4c296c46e8d';
insert into TsToolItem set FId='60cfd756-b4e9-47ce-ab77-a58d8ec9c1e9', FPageId='c268105b-82f9-4160-a1ce-c4c296c46e8d', FCode='Select',          FName='選擇圖片',                   FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='MyAvatar.doSelect', FIcon='quicksilver/image/16/FolderOpen.gif',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

--調整員工單元的欄位分組

update TsForm set FGroupMode='Double' where FId='320ab079-f260-4e81-b545-15c08fe1d955' and FGroupMode='None';

insert into TsFieldGroup (FId, FIndex, FTreeLevel, FFormId, FName)
select 'dcee7fb7-69f7-4afc-b834-57f15e24aa94', 1, 1, '320ab079-f260-4e81-b545-15c08fe1d955', '基本資訊'
from TsDual
where not exists (select * from TsFieldGroup where FFormId='320ab079-f260-4e81-b545-15c08fe1d955');

insert into TsFieldGroup set FId='068f4427-0d31-48c7-a18d-d8051e67e05b', FIndex=0, FTreeLevel=2, FFormId='320ab079-f260-4e81-b545-15c08fe1d955', FName='照片與頭像';

update TsFieldGroup set FParentId = (
	select min(FId) from TsFieldGroup A
	where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FTreeLevel=1 and not exists (
		select * from TsFieldGroup B
		where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FTreeLevel=1 and FIndex < A.FIndex
	)
) where FId='068f4427-0d31-48c7-a18d-d8051e67e05b';
update TsFieldGroup set FIndex = (
	select 1 + ifnull(max(FIndex), 0) from TsFieldGroup A
	where FParentId = TsFieldGroup.FParentId and FId <> TsFieldGroup.FId
) where FId='068f4427-0d31-48c7-a18d-d8051e67e05b';

java refreshSerial('TsFieldGroup', 'FFormId');

update TsFormField set FFieldGroupId='dcee7fb7-69f7-4afc-b834-57f15e24aa94'
where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FFieldGroupId is null and exists (
	select * from TsFieldGroup where FId='dcee7fb7-69f7-4afc-b834-57f15e24aa94' and FTreeLevel='001'
);

--增加 FAvatarId，原 FPicture 改為 FPictureId

alter table TsUser add FPictureId uuid;
alter table TsUser add FAvatarId uuid;
update TsUser set FPictureId = FPicture where FPictureId is null and FPicture is not null;

update TsField set FTitle='照片', FName='FPictureId', FRowSpan=6 where FId='86f98974-7fcc-4372-83cc-a8a755323e3b';
update TsFormField set FFieldName='FPictureId' where FFieldName='FPicture' and FFormId in (select FId from TsForm where FUnitId='00000000-0000-0000-0001-000000001002');
update TsListField set FFieldName='FPictureId' where FFieldName='FPicture' and FListId in (select FId from TsList where FUnitId='00000000-0000-0000-0001-000000001002');
update TsEditField set FFieldName='FPictureId' where FFieldName='FPicture' and FEditId in (select FId from TsEdit where FUnitId='00000000-0000-0000-0001-000000001002');

insert into TsField set FId='52e475ba-214f-4b0e-8319-493eec826ee4', FUnitId='00000000-0000-0000-0001-000000001002', FName='FAvatarId',     FTitle='頭像',     FType='PictureBox',          FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='b785eab6-c1fb-458c-a67a-ea8ba0484a11', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=6, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null,          FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsFieldProperty set FId='f6d64625-cb8b-45d9-aeca-30b16f75acd4', FFieldId='52e475ba-214f-4b0e-8319-493eec826ee4', FName='isAvatar', FValue='true';

update TsFormField set FFieldGroupId='068f4427-0d31-48c7-a18d-d8051e67e05b', FIndex=1 where FFormId='320ab079-f260-4e81-b545-15c08fe1d955' and FFieldName='FPictureId';
insert into TsFormField set FFormId='320ab079-f260-4e81-b545-15c08fe1d955', FFieldGroupId='068f4427-0d31-48c7-a18d-d8051e67e05b', FFieldName='FAvatarId', FIndex=2;

--表單中的字典支援多組同樣的上下級，例如國家1、省份1，國家2、省份2

update TsField set FTitle='上級字典' where FId='87a4021b-e988-497b-871a-1c195a0f19fb';

alter table TsField add FParentField varchar(50);
insert into TsField set FId='95efde2d-d1c5-4596-9c7a-09f1e8bf7127', FUnitId='00000000-0000-0000-0001-000000000002', FName='FParentField',					FTitle='上級字典欄位',				FType='InputBox-Text',       FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;

update TsField set FParentField = (
	select FName from TsField F
	where FUnitId = TsField.FUnitId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsField.FDictionaryId)
)
where FDictionaryId is not null and FParentField is null and (
	select count(*) from TsField F
	where FUnitId = TsField.FUnitId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsField.FDictionaryId)
) = 1;

java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295',
	'基本資訊', '83da7ed2-8248-4c2e-b788-7976e5b8b070', null, 'FTitle,FName,FType,FUnitId,FVisible,FRequired,FReadOnly,FQueryable,FDefaultValueType,FDefaultValue,FHint',
		'類型資訊', '04234553-4f26-47c1-967d-389b0bdbce6f', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSize,FScale,FRelationTable,FRelationCapacity,FDictionaryId,FParentField,FSupportI18n',
		'實體資訊', '7d4ddff1-5d65-41e0-b04a-89d60da24f8b', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FEntityUnitId,FSupportLocalText,FLocalTextField,FRelationId,FSelectListConstantFilterSql,FSelectListVariableFilterSql',
		'來源資訊', '2d1d1604-9001-461c-b19e-02d044a5d842', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSourceType,FJoinField,FSourceField,FSource',
		'表單信息', '0c76fb5e-5e71-425e-97b0-38af40b7f88e', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FRowSpan,FColSpan,FLabelColor,FIsNewRow',
		'清單資訊', '7544efe3-6515-42b9-a3bb-2840a68cdb5d', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FListWidth,FListAlign',
	'其它資訊', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', null, 'FAlwaysBringDataToClient,FValidation,FCustomData',
	'移動端設置', '0441c2fc-db8d-43b0-a891-571fdb6b2412', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', 'FMobileListFormat,FFollowingField', 'WebService', 'fc0bc310-f065-4423-8312-c33f6ec0418b', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', 'FWebServiceListQueryField,FWebServiceItemQueryField,FWebServiceCreateField'
);

--圖表的字典支援多組同樣的上下級，例如國家1、省份1，國家2、省份2

alter table TsChartParameter add FParentCode varchar(50);
insert into TsField set FId='19c41ad7-affb-4d9c-bd44-f690192a7455', FUnitId='a282c7fb-8849-463c-9426-345a5583e3cf', FName='FParentCode',     FTitle='上級字典參數編碼',	FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FSourceType='local', FJoinField='',   FSourceField='',   FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=0,    FLabelColor='',   FDefaultValue='',     FValidation='',   FRelationCapacity=null;
update TsField set FListWidth=100 where FId='7ee81d0e-a7f3-413f-928e-e95be3795305';
update TsField set FListWidth=100 where FId='418272d1-9e6a-4bea-8a8d-724abb8ca243';
update TsField set FListWidth=80 where FId='c704fb68-24db-4566-bc9b-76b40065fdee';
update TsField set FListWidth=80 where FId='240e8729-d200-4bc3-a371-d08331cdbd24';
update TsField set FIsNewRow=0 where FId='bd836a70-1fd6-4467-b19c-4ba444365b8a';
java setFormFields('fc7290f8-b109-4bd0-8a3c-e02c8987f29f', '基本資訊', '1f7738d2-30ac-4149-afb6-6fd570212980', null, 'FName,FCode,FType,FRequired,FVisible,FDefaultValue,FChartId', '類型相關資訊', '937612b5-bb29-461e-b6e3-38ac4da53789', '1f7738d2-30ac-4149-afb6-6fd570212980', 'FScale,FDictionaryId,FParentCode,FEntityUnitId,FShowInTree,FTreeField,FCheckPrivilege,FPrivilegeId');
java setListFields('a4173100-8bd2-4c20-9296-0599c80654bb', 'FName,FCode,FType,FRequired,FVisible,FDictionaryId,FParentCode,FCheckPrivilege,FPrivilegeId,FDefaultValue');
update TsChartParameter set FParentCode = (
	select FCode from TsChartParameter A
	where FChartId = TsChartParameter.FChartId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsChartParameter.FDictionaryId)
)
where FDictionaryId is not null and FParentCode is null and (
	select count(*) from TsChartParameter A
	where FChartId = TsChartParameter.FChartId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsChartParameter.FDictionaryId)
) = 1;

--報表的字典支援多組同樣的上下級，例如國家1、省份1，國家2、省份2

alter table TsReportParameter add FParentCode varchar(50);
insert into TsField set FId='09193362-39bc-4c0c-b705-210252e9ec87', FUnitId='00000000-0000-0000-0001-000000000028', FName='FParentCode',     FTitle='上級字典參數編碼',	FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,   FValidation=null, FRelationCapacity=null;
update TsField set FListWidth=100 where FId='d4892a34-4312-4786-b77e-c03cb3c13297';
update TsField set FListWidth=80 where FId='5fb3280c-3f16-41fa-9436-5c3b89e81dff';
update TsField set FListWidth=80 where FId='8e0cafa6-a4f0-4f75-be66-f00fe79ec499';
update TsField set FIsNewRow=0 where FId='5a19c8dc-8a73-4ae9-bb79-78e69b73ecdb';
java setFormFields('bd513682-4427-4830-b4bf-4093f6eeaac8', '基本資訊', 'ba5c96f0-03e7-4635-a3c5-cd6a1feb65ed', null, 'FName,FCode,FType,FRequired,FVisible,FDefaultValue,FReportId', '類型相關資訊', '9dbdf273-b6fd-4107-9baa-240551cb374c', 'ba5c96f0-03e7-4635-a3c5-cd6a1feb65ed', 'FScale,FDictionaryId,FParentCode,FEntityUnitId,FShowInTree,FTreeField,FCheckPrivilege,FPrivilegeId');
java setListFields('2dcfb8cb-3836-4aa7-918a-1fd16864539c', 'FName,FCode,FType,FRequired,FVisible,FDictionaryId,FParentCode,FCheckPrivilege,FPrivilegeId,FDefaultValue');
update TsReportParameter set FParentCode = (
	select FCode from TsReportParameter A
	where FReportId = TsReportParameter.FReportId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsReportParameter.FDictionaryId)
)
where FDictionaryId is not null and FParentCode is null and (
	select count(*) from TsReportParameter A
	where FReportId = TsReportParameter.FReportId
	and FDictionaryId = (select FParentId from TsDictionary where FId = TsReportParameter.FDictionaryId)
) = 1;
