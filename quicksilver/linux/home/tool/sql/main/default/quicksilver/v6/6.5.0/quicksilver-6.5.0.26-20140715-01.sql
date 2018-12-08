--minglei

--表单栏数

alter table TsPage add FFormColumnCount int;
insert into TsField set FId='21fabca8-3b7f-451f-891d-7f9b83a46d3f', FUnitId='00000000-0000-0000-0001-000000000006', FName='FFormColumnCount',		FTitle='表單欄數',			    FType='InputBox-Integer',    FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,									FValidation=null, FRelationCapacity=null;
update TsField set FListWidth=80 where FId='94ae8ea2-3f76-4fd7-9cf0-1bb3939d0ffe';
update TsField set FListWidth=80 where FId='47d790c4-1a27-4213-a5ca-b56c4c3afd8e';
java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '基本資訊', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', null, 'FType,FEditId,FIsSlavePage,FRelationId,FUnitId,FMasterUnitId,FVisibleCondition', '通用資訊', '66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FCode,FName,FTitle,FUrl,FActionMethodName,FLoadHandler', '清單資訊', '6fdfaf24-efd9-444f-952b-a738654a4d68', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FQueryFormAutoQuery,FHasViewFrame,FQueryOnLoad,FQuerySchemaId,FCreateQuerySchemaBox,FCreateKeywordBox,FToolItemInitArguments', '表單資訊', '96092207-b917-41bf-bdcc-2afe6950572f', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FFormColumnCount', '電腦資訊', '0e78d39e-0a96-4520-9c64-499b583b9897', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FIcon,FDialogWidth,FDialogHeight,FDialogMaximized', '描述', 'ed6e4ca6-8917-4648-9247-5d158179fb97', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FDescription');
java setEditFields('4e9b96a5-4c20-42a0-8929-d83efc27af4e', 'FActionMethodName,FUrl,FMasterUnitId,FCode,FName,FUnitId,FIcon,FEditId,FFormColumnCount,FDialogWidth,FDialogHeight,FToolItemInitArguments,FDescription,FIsSlavePage,FCreateQuerySchemaBox,FQueryFormAutoQuery,FDialogMaximized,FQueryOnLoad,FRelationId,FCreateKeywordBox,FVisibleCondition,FTitle,FLoadHandler,FQuerySchemaId,FType,FHasViewFrame');

update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.Form.Form';
update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.Edit.Form';
update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.List.Form';
update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.Relation.Form';
update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.Bill.Form';
update TsPage set FDialogWidth=750 where FCode='Qs.TextResource.Form';
java setFormFields('1956e939-e2ab-43de-be4c-46f0bdf34df5', '基本資訊', '44d5ad3c-4030-484a-ba48-200be9a800f6', null, 'FUserId,FIpAddress,FLoginTime,FLastAccessTime,FLanguageId,FSessionId');

--修正上版的乱码

update TsParameterDefinition set FName='系統多語言 Excel 快照' where FId='1576bf34-dabd-4979-80b6-8aaa1e54701f';
update TsField set FName='FChartId', FTitle='圖表' where FId='3b3c4317-9c07-4028-a6f6-4836c44e90fe';
update TsField set FName='FChartId', FTitle='圖表' where FId='e33fca89-d6dd-4601-9edc-4b576f17c228';
java setFormFields('23635fa5-23ef-41d9-8e85-3762ffd3ee91', '基本資訊', '70a304f1-a414-4eeb-b071-0674eaf4ab84', null, 'FCode,FName,FType,FAlign,FHint,FVisibleCondition,FEnableCondition', '類型相關資訊', '64df8c6e-10e7-4163-8d4d-e1b71ae53e0d', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FIcon,FWidth,FLabel,FScale,FEntityUnitId,FDefaultValue', '下拉項設置', '4e8433df-64df-4039-8b00-c049b6ce71f5', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FSubItemSource,FDictionaryId,FSubItemRoutine', '默認事件', '3cc8ff6f-678c-4fe0-930b-acf4eae50cd2', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FDefaultEventHandler');
java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '基本資訊', '680d1c15-16fc-4f41-8b10-c5ffe6604103', null, 'FName,FCode,FExpandMode,FVisibleCondition,FEnableCondition,FIcon', '事件處理', 'ec9d2fc7-4a30-4843-8446-0adfa8467b9e', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FEventHandler');
delete from TsDictionaryItem where FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='8bdf8671-a42b-4650-8a81-71a3a83de42c', FIndex=1, FText='無動作',                FValue='None';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='14998f1e-9837-494f-a3db-5a34bd39da36', FIndex=2, FText='彈出表單頁面',          FValue='Form';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='61087639-3733-4eae-b094-8f8e0a548162', FIndex=3, FText='打開圖表頁面',			FValue='Chart';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='862e41c5-8ade-4a3c-b010-281fdfa59763', FIndex=4, FText='批量修改頁面',          FValue='BatchModify';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='87ba6853-56fb-4325-bd4f-3f6bcf7ac1ff', FIndex=5, FText='觸發後端事件',          FValue='Event';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='a3c1cf20-4282-42ee-bd49-970d3237e19d', FIndex=6, FText='函數/語句(JavaScript)',	FValue='JavaScript';
