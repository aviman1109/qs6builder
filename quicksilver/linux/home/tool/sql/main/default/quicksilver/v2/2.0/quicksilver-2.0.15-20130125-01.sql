delete from TsToolSubItem where FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8';
insert into TsToolSubItem set FId='97e70a76-3637-48d9-8f12-411698191ce9', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='KeywordFieldConfig',	FName='关键字字段设置', FExpandMode='None', FIndex=1, FIcon='quicksilver/image/unit/Keyword.gif',           FEventHandler='FieldList.doKeywordFieldConfig',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='73f39942-4f98-4072-9d5a-f4be4a105235', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='QueryFormConfig',		FName='查询表单设置',   FExpandMode='None', FIndex=2, FIcon='quicksilver/image/16/Query.gif',				FEventHandler='FieldList.doQueryFormConfig',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='171f55c4-1815-4869-b1b8-42be8d919e75', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='OrderFieldConfig',		FName='排序设置',       FExpandMode='None', FIndex=3, FIcon='quicksilver/image/16/Sort.gif',				FEventHandler='FieldList.doOrderFieldConfig',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='19c09649-3abc-481a-ad5e-5d6527561281', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='CopyFieldConfig',		FName='复制设置',       FExpandMode='None', FIndex=4, FIcon='quicksilver/image/16/Copy.gif',				FEventHandler='FieldList.doCopyFieldConfig',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='b0588205-eb35-4c50-a85e-faa4ce4ccba0', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='PrivilegeFieldConfig', FName='权限字段设置',   FExpandMode='None', FIndex=5, FIcon='quicksilver/image/unit/Privilege.gif',         FEventHandler='FieldList.doPrivilegeFieldConfig',	FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='81955c8a-aac2-4a76-b1aa-14560ca94181', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='Splitter1',			FName='-',              FExpandMode='None', FIndex=6, FIcon=null,											FEventHandler=null,									FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='324713b9-be10-40cc-9268-26bbd6654359', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='GenerateSlavePage',	FName='生成从页面',     FExpandMode='None', FIndex=7, FIcon='quicksilver/image/16/GenerateSlavePage.gif',	FEventHandler='FieldList.doGenerateSlavePage',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='e8b5d980-b135-4426-a3d2-3723309a6856', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='Splitter2',			FName='-',              FExpandMode='None', FIndex=8, FIcon=null,											FEventHandler=null,									FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='663e5b76-f586-431f-94ab-622bc0099cf1', FToolItemId='37c4a3f6-b0b9-44c9-9dd7-1f8dde5d2ec8', FCode='SqlExport',			FName='导出 SQL',       FExpandMode='None', FIndex=9, FIcon='quicksilver/image/16/Sql.gif',					FEventHandler='EntityList.doSqlExport',				FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsPage where FId='b84af04f-78ca-4637-9561-5be6f1e6ef37';
delete from TsScript where FPageId='b84af04f-78ca-4637-9561-5be6f1e6ef37';
delete from TsToolItem where FPageId='b84af04f-78ca-4637-9561-5be6f1e6ef37';
insert into TsPage set FId='b84af04f-78ca-4637-9561-5be6f1e6ef37', FName='单元字段复制设置',		FTitle='复制设置',		FCode='Qs.Field.CopyConfig',			FType='Other',        FIcon='quicksilver/image/16/Sort.gif',		   FUrl='quicksilver/page/template/DoubleSorter.jsp', FActionMethodName=null,    FLoadHandler=null,               FRelationId=null,                                   FUnitId='00000000-0000-0000-0001-000000000002', FMasterUnitId=null,                                   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;
insert into TsScript set FId='410d6d3b-caf6-4df8-85f1-a1597f0b98c9', FIndex=1, FPageId='b84af04f-78ca-4637-9561-5be6f1e6ef37', FUrl='quicksilver/page/unit/FieldCopyConfig.js';
insert into TsToolItem set FId='e9e06e2d-884d-4cbc-b2e9-8a4364103ffc', FPageId='b84af04f-78ca-4637-9561-5be6f1e6ef37', FCode='Save',       FName='保存', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='DoubleSorter.doSave',       FIcon='quicksilver/image/16/Save.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

create table TsCopyIgnoreField
(
	FUnitId			uuid,
	FFieldName		varchar(50),
	primary key (FUnitId, FFieldName)
);

delete from TsTextResource where FId='e8b400e9-f14d-4fd6-9a0c-6d4eae2b0dcb';
delete from TsTextResource where FId='9336d683-31c2-43b5-9ad9-c1edd52d983b';
insert into TsTextResource set FCode='T.Qs.Field.CopyFields',							FId='e8b400e9-f14d-4fd6-9a0c-6d4eae2b0dcb', FValue='复制的字段';
insert into TsTextResource set FCode='T.Qs.Field.NotCopyFields',						FId='9336d683-31c2-43b5-9ad9-c1edd52d983b', FValue='忽略的字段';

--delete UnitCopy unit

drop table TsUnitCopy;
drop table TsUnitCopyIgnoreField;

delete from TsMenu where FId='68ffeb4c-f143-445c-9721-d473ebcff540';
delete from TsUnit where FId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsField where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsQueryFormField where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsRelation where FUnitId1='360485aa-e259-4899-be0b-9ed4321fff01' or FUnitId2='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsToolItemProperty where FToolItemId in (
	select FId from TsToolItem where FPageId in (
		select FId from TsPage where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01' or FMasterUnitId='360485aa-e259-4899-be0b-9ed4321fff01'
	)
);
delete from TsToolSubItem where FToolItemId in (
	select FId from TsToolItem where FPageId in (
		select FId from TsPage where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01' or FMasterUnitId='360485aa-e259-4899-be0b-9ed4321fff01'
	)
);
delete from TsScript where FPageId in (
	select FId from TsPage where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01' or FMasterUnitId='360485aa-e259-4899-be0b-9ed4321fff01'
);
delete from TsToolItem where FPageId in (
	select FId from TsPage where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01' or FMasterUnitId='360485aa-e259-4899-be0b-9ed4321fff01'
);
delete from TsPage where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01' or FMasterUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsFormField where FFormId in (select FId from TsForm where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01');
delete from TsListField where FListId in (select FId from TsList where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01');
delete from TsForm where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsList where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsPrivilege where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
delete from TsQuerySchema where FUnitId='360485aa-e259-4899-be0b-9ed4321fff01';
