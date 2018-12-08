--minglei

update TsField set FName='FChartId', FTitle='圖表' where FId='3b3c4317-9c07-4028-a6f6-4836c44e90fe';
java setFormFields('23635fa5-23ef-41d9-8e85-3762ffd3ee91', '基本資訊', '70a304f1-a414-4eeb-b071-0674eaf4ab84', null, 'FCode,FName,FType,FAlign,FHint,FVisibleCondition,FEnableCondition', '類型相關資訊', '64df8c6e-10e7-4163-8d4d-e1b71ae53e0d', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FIcon,FWidth,FLabel,FScale,FEntityUnitId,FDefaultValue', '下拉項設置', '4e8433df-64df-4039-8b00-c049b6ce71f5', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FSubItemSource,FDictionaryId,FSubItemRoutine', '默認事件', '3cc8ff6f-678c-4fe0-930b-acf4eae50cd2', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FDefaultEventHandler');

update TsField set FName='FChartId', FTitle='圖表' where FId='e33fca89-d6dd-4601-9edc-4b576f17c228';
java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '基本資訊', '680d1c15-16fc-4f41-8b10-c5ffe6604103', null, 'FName,FCode,FExpandMode,FVisibleCondition,FEnableCondition,FIcon', '事件處理', 'ec9d2fc7-4a30-4843-8446-0adfa8467b9e', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FEventHandler');

java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '基本資訊', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', null, 'FType,FEditId,FIsSlavePage,FRelationId,FUnitId,FMasterUnitId,FVisibleCondition', '通用資訊', '66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FCode,FName,FTitle,FUrl,FActionMethodName,FLoadHandler', '清單資訊', '6fdfaf24-efd9-444f-952b-a738654a4d68', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FQueryFormAutoQuery,FHasViewFrame,FQueryOnLoad,FQuerySchemaId,FCreateQuerySchemaBox,FCreateKeywordBox,FToolItemInitArguments', '表單資訊', '96092207-b917-41bf-bdcc-2afe6950572f', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FFormColumnCount', '電腦資訊', '0e78d39e-0a96-4520-9c64-499b583b9897', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FIcon,FDialogWidth,FDialogHeight,FDialogMaximized', '描述', 'ed6e4ca6-8917-4648-9247-5d158179fb97', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FDescription');

update TsPage set FFormColumnCount=2, FDialogWidth=750 where FCode='Qs.ListColor.Form';
update TsField set FColSpan=0 where FId='0359398e-72e8-4969-9a67-093c27b84c29';
