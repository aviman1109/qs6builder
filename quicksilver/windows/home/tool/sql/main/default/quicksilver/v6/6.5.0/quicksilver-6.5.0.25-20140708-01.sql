--minglei

java setEditFields('4e9b96a5-4c20-42a0-8929-d83efc27af4e', 'FActionMethodName,FUrl,FMasterUnitId,FCode,FName,FUnitId,FIcon,FEditId,FDialogWidth,FDialogHeight,FToolItemInitArguments,FDescription,FIsSlavePage,FCreateQuerySchemaBox,FQueryFormAutoQuery,FDialogMaximized,FQueryOnLoad,FRelationId,FCreateKeywordBox,FVisibleCondition,FTitle,FLoadHandler,FQuerySchemaId,FType,FHasViewFrame');

insert into TsParameterDefinition set FId='1576bf34-dabd-4979-80b6-8aaa1e54701f', FName='系統多語言 Excel 快照',		FCode='QsSystemI18nExcelSnap',				FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=0, FIndex=7;

--工具条项可以指定图表

alter table TsToolItem add FChartId uuid;
alter table TsToolSubItem add FChartId uuid;
insert into TsField set FId='3b3c4317-9c07-4028-a6f6-4836c44e90fe', FUnitId='00000000-0000-0000-0001-000000000010', FName='FChartId',			  FTitle='圖表',				  FType='EntityBox',           FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000018', FSupportLocalText=0,    FLocalTextField='',   FSourceType='local', FJoinField='',   FSourceField='',   FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=0,    FLabelColor='',   FDefaultValue='',       FValidation='',   FRelationCapacity=null;
insert into TsField set FId='e33fca89-d6dd-4601-9edc-4b576f17c228', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FChartId',		   FTitle='圖表',				    FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000018', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,	FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FSupportI18n=0;
java setFormFields('23635fa5-23ef-41d9-8e85-3762ffd3ee91', '基本資訊', '70a304f1-a414-4eeb-b071-0674eaf4ab84', null, 'FCode,FName,FType,FAlign,FHint,FVisibleCondition,FEnableCondition', '類型相關資訊', '64df8c6e-10e7-4163-8d4d-e1b71ae53e0d', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FIcon,FWidth,FLabel,FScale,FEntityUnitId,FDefaultValue', '下拉項設置', '4e8433df-64df-4039-8b00-c049b6ce71f5', '70a304f1-a414-4eeb-b071-0674eaf4ab84', 'FSubItemSource,FDictionaryId,FSubItemRoutine', '默認事件', '3cc8ff6f-678c-4fe0-930b-acf4eae50cd2', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FDefaultEventHandler');
java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '基本資訊', '680d1c15-16fc-4f41-8b10-c5ffe6604103', null, 'FName,FCode,FExpandMode,FVisibleCondition,FEnableCondition,FIcon', '事件處理', 'ec9d2fc7-4a30-4843-8446-0adfa8467b9e', null, 'FHandleType,FHandlePageId,FChartId,FConfirmMessage,FEventHandler');

delete from TsDictionaryItem where FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='8bdf8671-a42b-4650-8a81-71a3a83de42c', FIndex=1, FText='無動作',                FValue='None';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='14998f1e-9837-494f-a3db-5a34bd39da36', FIndex=2, FText='彈出表單頁面',          FValue='Form';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='61087639-3733-4eae-b094-8f8e0a548162', FIndex=3, FText='打開圖表頁面',			FValue='Chart';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='862e41c5-8ade-4a3c-b010-281fdfa59763', FIndex=4, FText='批量修改頁面',          FValue='BatchModify';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='87ba6853-56fb-4325-bd4f-3f6bcf7ac1ff', FIndex=5, FText='觸發後端事件',          FValue='Event';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='a3c1cf20-4282-42ee-bd49-970d3237e19d', FIndex=6, FText='函數/語句(JavaScript)',	FValue='JavaScript';
