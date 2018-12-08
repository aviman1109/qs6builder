--minglei

alter table TsField add FMobileListFormat varchar(20);
alter table TsField add FFollowingField varchar(50);
delete from TsField where FId='ad492ba1-63be-4dad-a9db-e2a51b97eb6b';
delete from TsField where FId='db5125a2-fbbf-4609-a266-ca7d8930dc4a';
insert into TsField set FId='ad492ba1-63be-4dad-a9db-e2a51b97eb6b', FUnitId='00000000-0000-0000-0001-000000000002', FName='FMobileListFormat',				FTitle='移動端列表格式',			FType='InputBox-Text',       FSize=20,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='db5125a2-fbbf-4609-a266-ca7d8930dc4a', FUnitId='00000000-0000-0000-0001-000000000002', FName='FFollowingField',				FTitle='後繼欄位',					FType='InputBox-Text',       FSize=50,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295', '基本資訊', '83da7ed2-8248-4c2e-b788-7976e5b8b070', null, 'FTitle,FName,FType,FUnitId,FVisible,FRequired,FReadOnly,FQueryable,FDefaultValueType,FDefaultValue,FHint', '類型資訊', '04234553-4f26-47c1-967d-389b0bdbce6f', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSize,FScale,FRelationTable,FRelationCapacity,FDictionaryId,FSupportI18n', '實體資訊', '7d4ddff1-5d65-41e0-b04a-89d60da24f8b', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FEntityUnitId,FSupportLocalText,FLocalTextField,FSelectListConstantFilterSql,FSelectListVariableFilterSql', '來源資訊', '2d1d1604-9001-461c-b19e-02d044a5d842', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSourceType,FJoinField,FSourceField,FSource', '表單信息', '0c76fb5e-5e71-425e-97b0-38af40b7f88e', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FRowSpan,FColSpan,FLabelColor,FIsNewRow', '清單信息', '7544efe3-6515-42b9-a3bb-2840a68cdb5d', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FListWidth,FListAlign', '其它資訊', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', null, 'FAlwaysBringDataToClient,FValidation,FCustomData', '移動端設置', '0441c2fc-db8d-43b0-a891-571fdb6b2412', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', 'FMobileListFormat,FFollowingField', 'WebService', 'fc0bc310-f065-4423-8312-c33f6ec0418b', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', 'FWebServiceListQueryField,FWebServiceItemQueryField,FWebServiceCreateField');

alter table TsListField drop FFontSize;
alter table TsListField drop FColor;
alter table TsListField add FAlign varchar(10);

delete from TsTextResource where FCode='T.Qs.ListField.Color';
delete from TsTextResource where FCode='T.Qs.ListField.FontSize';
delete from TsTextResource where FCode='T.Qs.ListField.Align';
insert into TsTextResource set FId='fd514482-2d04-46c8-a07b-7927a42cbb7c', FCode='T.Qs.ListField.Align',								FValue='對齊';

update TsPage set FDialogWidth=800 where FCode='Qs.List.Form';

delete from TsDictionary where FId='26cb57d1-6c92-45e1-a465-bde253a85f9b';
delete from TsDictionary where FId='91113b23-cc0b-4c8c-b4a6-99390da20546';
delete from TsDictionary where FId='799557e9-1b71-496d-91b2-9814c977f0ca';
delete from TsDictionaryItem where FDictionaryId='26cb57d1-6c92-45e1-a465-bde253a85f9b';
delete from TsDictionaryItem where FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546';
delete from TsDictionaryItem where FDictionaryId='799557e9-1b71-496d-91b2-9814c977f0ca';

insert into TsDictionary set FId='799557e9-1b71-496d-91b2-9814c977f0ca', FName='QS-手機列表-對齊', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='283a8ac8-40b1-4f91-9e09-956ea20c41ad', FDictionaryId='799557e9-1b71-496d-91b2-9814c977f0ca', FValue='left',					FText='左',	FIndex=1;
insert into TsDictionaryItem set FId='aa77a03d-a584-4805-b4f6-da85188a0d19', FDictionaryId='799557e9-1b71-496d-91b2-9814c977f0ca', FValue='right',					FText='右',	FIndex=2;

delete from TsTextResource where FCode='T.Jui.Page.Refresh';
insert into TsTextResource set FId='ca2f6360-1d0e-48a5-bba2-84c0cfe6c464', FCode='T.Jui.Page.Refresh',								FValue='刷新';

update TsUnit set FServiceClassName='com.jeedsoft.quicksilver.query.service.impl.QuerySchemaServiceImpl' where FCode='Qs.QuerySchema';
