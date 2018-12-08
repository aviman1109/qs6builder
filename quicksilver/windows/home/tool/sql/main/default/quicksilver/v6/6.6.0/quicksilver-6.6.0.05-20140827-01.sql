--minglei

--TsField.FDefaultValueType

alter table TsField add FDefaultValueType varchar(20);

insert into TsField set FId='51dd2da7-11ab-4cc6-b2f1-e111a1063f93', FUnitId='00000000-0000-0000-0001-000000000002', FName='FDefaultValueType',				FTitle='缺省值類型',				FType='ComboBox-SelectOnly', FSize=20,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='dab79b18-82bc-4bc2-ad08-190abafea094', FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=1,    FListWidth=60,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
update TsField set FColSpan=2 where FId='f0ddfb57-9caa-48af-83bc-754cbdf01849';

java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295', '基本資訊', '83da7ed2-8248-4c2e-b788-7976e5b8b070', null, 'FTitle,FName,FType,FUnitId,FVisible,FRequired,FReadOnly,FQueryable,FDefaultValueType,FDefaultValue,FHint', '類型資訊', '04234553-4f26-47c1-967d-389b0bdbce6f', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSize,FScale,FRelationTable,FRelationCapacity,FDictionaryId,FSupportI18n', '實體資訊', '7d4ddff1-5d65-41e0-b04a-89d60da24f8b', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FEntityUnitId,FSupportLocalText,FLocalTextField,FSelectListConstantFilterSql,FSelectListVariableFilterSql', '來源資訊', '2d1d1604-9001-461c-b19e-02d044a5d842', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FSourceType,FJoinField,FSourceField,FSource', '表單信息', '0c76fb5e-5e71-425e-97b0-38af40b7f88e', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FRowSpan,FColSpan,FLabelColor,FIsNewRow', '清單信息', '7544efe3-6515-42b9-a3bb-2840a68cdb5d', '83da7ed2-8248-4c2e-b788-7976e5b8b070', 'FListWidth,FListAlign', '其它資訊', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', null, 'FAlwaysBringDataToClient,FValidation,FCustomData', 'WebService', 'fc0bc310-f065-4423-8312-c33f6ec0418b', '8ad6c087-edf2-4925-bf19-ad76b8c6d030', 'FWebServiceListQueryField,FWebServiceItemQueryField,FWebServiceCreateField');

insert into TsDictionary set FId='dab79b18-82bc-4bc2-ad08-190abafea094', FName='QS-欄位-缺省值類型', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='f24fe84c-b1a1-4067-b309-9edd7765be4d', FDictionaryId='dab79b18-82bc-4bc2-ad08-190abafea094', FValue='ServerValue',			FText='伺服器端值',		FIndex=1;
insert into TsDictionaryItem set FId='83086e6f-7e5f-496a-9621-54c022adbb6b', FDictionaryId='dab79b18-82bc-4bc2-ad08-190abafea094', FValue='ClientJavaScript',		FText='用戶端指令碼',	FIndex=2;

update TsField set FDefaultValueType='ServerJavaScript' where FDefaultValue is not null and trim(FDefaultValue) <> '';

--EXCEL 最大匯出筆數

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9' and FIndex >= 4;
insert into TsParameterDefinition set FId='a4829ecc-d70b-464f-bbd1-4a4660ddb009', FName='EXCEL 最大匯出筆數',			FCode='QsExcelMaxExportCount',				FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Integer', 	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=4;
insert into TsSystemParameter set FId='575c40af-8fdc-4896-8ebc-c1f5fe093ce0', FKey='QsExcelMaxExportCount',				FValue='5000';

insert into TsTextResource set FId='ee39217f-6f96-4a39-a6f4-a83c233096e9', FCode='T.Qs.Export.ExcelMaxCountConfirm',					FValue='根據系統限制，每次匯出不超過 ${0} 筆。如果當前查詢結果超過 ${0} 筆，系統將僅匯出前 ${0} 筆。';

--Homepage

alter table TsHomepageItem add FPageId uuid;
alter table TsHomepageItem add FShowTotalCount bit;

insert into TsField set FId='741e6604-d393-4cc3-8882-bf3bb9554705', FUnitId='00000000-0000-0000-0001-000000000017', FName='FPageId',		   FTitle='頁面',	  FType='EntityBox',		FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,	FEntityUnitId='00000000-0000-0000-0001-000000000006', FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null, FRelationCapacity=null;
insert into TsField set FId='ad939a4e-8fb4-47e6-9fdd-a1315fac0132', FUnitId='00000000-0000-0000-0001-000000000017', FName='FShowTotalCount',   FTitle='顯示總數', FType='CheckBox',			FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,	FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='0',   FValidation=null, FRelationCapacity=null;

java setEditFields('9cc262fe-70e4-420e-9be9-6a74f63f412c', 'FName,FQuerySchemaId,FRowCount,FPageId,FShowTotalCount');
java setFormFields('9cc262fe-70e4-420e-9be9-6a74f63f412c', '基本資訊', '7e193179-b1de-42d4-a2e0-16ca546e7941', null, 'FName,FQuerySchemaId,FChartId,FReportId,FHeight,FRowCount,FPageId,FShowTotalCount,FHandlerClassName');

insert into TsTextResource set FId='73e99a53-f465-41bd-8e53-cf8d727da615', FCode='T.Qs.Homepage.CountText.Total',						FValue='(共${0}筆)';
insert into TsTextResource set FId='ebd489ac-87b1-4610-912b-c8b9830095c9', FCode='T.Qs.Homepage.CountText.First',						FValue='(前${0}筆)';
insert into TsTextResource set FId='aa304232-5f1e-495d-a88e-ba044ba54950', FCode='T.Qs.Homepage.CountText.TotalAndFirst',				FValue='(共${0}筆，前${1}筆)';

--Form

insert into TsTextResource set FId='a42194b7-6dea-43fa-b31e-17a9529d1e8e', FCode='T.Qs.Form.ReadOnlyMessage',							FValue='當前業務處於不可編輯狀態，您對表單的修改將無法保存。';
