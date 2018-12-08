--minglei--------------------------------------------------

--add new report parameter type

delete from TsDictionaryItem where FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d';
insert into TsDictionaryItem set FId='d5e88843-56d5-48c0-bca1-25a7522b529d', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Text',			FText='文字方塊',		FIndex=1;
insert into TsDictionaryItem set FId='6a84a005-fb0c-4cf5-aa08-ea9984eea3d9', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Integer',		FText='整數框',			FIndex=3;
insert into TsDictionaryItem set FId='bff4007b-37cd-471a-871a-1398149fa0d1', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-BigInt',		FText='大整數框',		FIndex=4;
insert into TsDictionaryItem set FId='761c8d58-0c2a-4724-8ee4-560446187274', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Double',		FText='小數框',			FIndex=5;
insert into TsDictionaryItem set FId='9a7ae279-0275-4b62-a7f2-0adbe6c815e8', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Percent',		FText='百分比框',		FIndex=6;
insert into TsDictionaryItem set FId='41a7407f-eb4a-415b-9ab4-858066f89122', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='CheckBox',				FText='勾選框',			FIndex=9;
insert into TsDictionaryItem set FId='9a3565f5-c413-46b9-9c6c-87ad667c8ec3', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='ComboBox-Inputable',		FText='可輸入下拉清單',	FIndex=10;
insert into TsDictionaryItem set FId='3c931b15-916b-4f45-af72-4305598be93e', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='ComboBox-SelectOnly',	FText='只選下拉清單',	FIndex=11;
insert into TsDictionaryItem set FId='07233aff-0ddf-4edb-a476-4937a091c266', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='MultiCheckComboBox',		FText='多選下拉清單',	FIndex=12;
insert into TsDictionaryItem set FId='40289e39-126f-4bc2-941f-294b3f79df0e', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='DateBox-Date',			FText='日期框',			FIndex=13;
insert into TsDictionaryItem set FId='e9f723e4-2fca-4bb7-9599-35a77682c6e1', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='DateBox-DateTime',		FText='日期時間框',		FIndex=14;
insert into TsDictionaryItem set FId='28ada6a3-411c-4a13-b2ae-fe56e728dcce', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='EntityBox',				FText='實體框',			FIndex=15;

--Qs.ReportScript---------------------------------------------------------------

create table TsReportScript
(
	FId uuid primary key,
	FPath varchar(100),
	FIndex int,
	FReportId uuid
);

insert into TsUnit set FId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FCode='Qs.ReportScript', FName='報表指令碼', FIcon='quicksilver/image/unit/ReportScript.png', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='System', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=1, FMasterUnitId='00000000-0000-0000-0001-000000000027', FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=1, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable='TsReportScript', FKeyField='FId', FKeyType='Uuid', FNameField='FPath', FMasterField='FReportId', FHomeClassName='com.jeedsoft.quicksilver.report.ReportScriptHome', FDaoClassName='com.jeedsoft.quicksilver.report.dao.impl.ReportScriptDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.report.service.impl.ReportScriptServiceImpl', FActionClassName='com.jeedsoft.quicksilver.report.action.impl.ReportScriptActionImpl', FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='769130e6-6dd9-44b3-8320-7751f1d9b3ef', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FName='FId',       FTitle='ID',   FType='InputBox-Key',     FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='78bc1441-8fe7-457f-93f7-92e3e352c6fb', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FName='FIndex',    FTitle='順序', FType='InputBox-Integer', FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='f6c0842f-a72c-493a-ac85-6fecd4b6a830', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FName='FPath',     FTitle='路徑', FType='InputBox-Text',    FSize=100,  FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='b4aa3999-ddd4-4f88-b50a-68944717fdc8', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FName='FReportId', FTitle='報表', FType='EntityBox',        FSize=null, FVisible=0, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=0, FDictionaryId=null, FEntityUnitId='00000000-0000-0000-0001-000000000027', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;

java setOrderFields('b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', 'FIndex', '0');

insert into TsRelation set FId='5e239b64-1de1-4b2a-b6ce-2c019e703de2', FOppositeId='59e1391b-855c-499b-804a-2c6ad07d3af4', FName='報表指令碼-報表', FOppositeName='報表-報表指令碼', FUnitId1='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FUnitId2='00000000-0000-0000-0001-000000000027', FType='field', FTable='', FField1='FId', FField2='FReportId', FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

insert into TsPage set FId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FName='報表指令碼主清單',   FTitle='報表指令碼清單', FCode='Qs.ReportScript.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/ReportScript.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.ReportScript.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='003f028f-c942-4b63-9abc-efaf06195eb8', FName='報表指令碼選擇清單', FTitle='報表指令碼清單', FCode='Qs.ReportScript.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/ReportScript.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.ReportScript.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FName='報表指令碼排序',     FTitle='排序',           FCode='Qs.ReportScript.Sort',       FPlatform='Computer', FType='Sort',       FIcon='quicksilver/image/unit/ReportScript.png', FUrl='quicksilver/page/template/Sorter.jsp',     FActionMethodName='Qs.ReportScript.prepareSort', FLoadHandler=null, FRelationId=null, FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='288ed502-27da-4d85-8b04-2a8b49cdd25f', FName='報表指令碼表單',     FTitle='表單',           FCode='Qs.ReportScript.Form',       FPlatform='Computer', FType='EntityForm', FIcon='quicksilver/image/unit/Form.png',         FUrl='quicksilver/page/template/EntityForm.jsp', FActionMethodName='Qs.ReportScript.prepareForm', FLoadHandler=null, FRelationId=null, FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FMasterUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FIsSlavePage=1, FIndex=1,    FDialogWidth=750,  FDialogHeight=500,  FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;

--報表指令碼主清單
insert into TsToolItem set FId='d9471d4f-066d-453d-bcbb-e54e213ee6f5', FPageId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FCode='Add',     FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='151d57c6-d228-4130-9ac0-77dd459b2b8f', FPageId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='fa02bdc8-6c09-42e9-b413-97cff8787c2c', FPageId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='a9aaab1c-82ec-4f69-846b-54cb793376ce', FPageId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='0820a9d0-1e6a-404f-b7a6-d6aa81fe9260', FPageId='8da1e3c2-2e02-4c54-8b1c-6dd4efeab0d4', FCode='Other',   FName=null,   FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='b3604424-ef42-4493-b8cd-5e062c8cd9d1', FToolItemId='0820a9d0-1e6a-404f-b7a6-d6aa81fe9260', FCode='Sort',        FName='排序',       FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.png',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doSort';

--報表指令碼選擇清單
insert into TsToolItem set FId='791398d4-2b08-423e-9cda-59c9bfacfb68', FPageId='003f028f-c942-4b63-9abc-efaf06195eb8', FCode='ConfirmSelection', FName='確定', FHint=null,                                                   FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Ok.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='be1c1e38-63aa-461c-9c9e-230ded854c80', FPageId='003f028f-c942-4b63-9abc-efaf06195eb8', FCode='Add',              FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Add.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='7e21cc72-12fa-415c-8b99-96efea45ca47', FPageId='003f028f-c942-4b63-9abc-efaf06195eb8', FCode='Open',             FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Open.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';

--報表指令碼排序
insert into TsToolItem set FId='e0cb16a1-c128-423e-8045-7a91292fd86c', FPageId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FCode='MoveUp',     FName='上升', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=1, FWidth=0, FIcon='quicksilver/image/16/MoveUp.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveUp';
insert into TsToolItem set FId='c00141a6-78df-4e4a-b374-4dc9e2387e09', FPageId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FCode='MoveDown',   FName='下降', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=2, FWidth=0, FIcon='quicksilver/image/16/MoveDown.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveDown';
insert into TsToolItem set FId='cd916840-c52d-418f-93aa-1d7abf24f6b8', FPageId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FCode='MoveTop',    FName='置頂', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=3, FWidth=0, FIcon='quicksilver/image/16/MoveTop.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveTop';
insert into TsToolItem set FId='a051108f-4aeb-4cf9-b6f2-d4032a3626e4', FPageId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FCode='MoveBottom', FName='置底', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=4, FWidth=0, FIcon='quicksilver/image/16/MoveBottom.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveBottom';
insert into TsToolItem set FId='90de3381-9adb-4935-8600-a2caee511a7e', FPageId='0749440c-88dc-4bc5-a9bc-25a23f2a5883', FCode='Save',       FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doSave';

--報表指令碼表單
insert into TsToolItem set FId='4fad73cf-90f4-4154-bc50-696a290d6b6d', FPageId='288ed502-27da-4d85-8b04-2a8b49cdd25f', FCode='Save',  FName='保存', FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='316289c3-9ff5-44fa-8f0f-fa608693d512', FIndex=1, FName='默認', FPageId=null, FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc';
java setFormFields('316289c3-9ff5-44fa-8f0f-fa608693d512', '基本資訊', 'e20e2eb8-379e-4db4-a67f-55898e30e000', null, 'FPath');

insert into TsList set FDefault=1, FId='813c7931-632c-46b1-84c3-df906512b230', FIndex=null, FMultiPage=1, FName='報表指令碼清單',     FPageId=null,                                   FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc';
insert into TsList set FDefault=0, FId='b0792c4d-d3a7-45da-bf4b-10baaf025e1c', FIndex=null, FMultiPage=1, FName='報表指令碼選擇清單', FPageId='003f028f-c942-4b63-9abc-efaf06195eb8', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc';
insert into TsList set FDefault=0, FId='9d3c14f1-a50f-4efd-9201-4b4206a12f29', FIndex=null, FMultiPage=1, FName='報表指令碼首頁清單', FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc';
java setListFields('813c7931-632c-46b1-84c3-df906512b230', 'FPath');
java setListFields('b0792c4d-d3a7-45da-bf4b-10baaf025e1c', 'FPath');
java setListFields('9d3c14f1-a50f-4efd-9201-4b4206a12f29', 'FPath');

insert into TsSlaveUnitPrivilege set FId='74cbd150-b417-4da0-be8e-d94d7db65555', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FCreatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadPrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadUserFieldName='', FUpdatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FUpdateUserFieldName='', FDeletePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FDeleteUserFieldName='';

--slave page

update TsPage set FIndex=4 where FId='299ceead-9587-4302-afeb-ee65679d57db';

insert into TsPage set FId='ecbfad83-144e-446c-b443-345a5291e5b7', FName='報表指令碼清單',	FTitle='指令碼', FCode='Qs.Report.ReportScriptList',    FPlatform='Computer', FType='EditableList', FIcon='quicksilver/image/unit/ReportScript.png',    FUrl='quicksilver/page/template/EditableList.jsp', FActionMethodName='Qs.ReportScript.prepareEditableList', FLoadHandler=null,                FRelationId='59e1391b-855c-499b-804a-2c6ad07d3af4', FUnitId='b24a4d7c-3f0e-4de7-a3c5-caa407755bbc', FMasterUnitId='00000000-0000-0000-0001-000000000027', FIsSlavePage=1, FIndex=3,    FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0,    FQueryFormAutoQuery=0,    FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='',   FVisible=1, FVisibleCondition=null, FDescription='';

--報表報表指令碼清單
insert into TsToolItem set FId='f8478b74-ed6b-4ec9-a9e2-511b02e6f5ad', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='MoveUp',     FName='上升', FHint=null,                 FLabel=null, FType='Button',      FAlign='left',  FIndex=1, FWidth=0, FIcon='quicksilver/image/16/MoveUp.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doMoveUp';
insert into TsToolItem set FId='2bff7977-3a1a-46a8-8ff2-06991a873fdb', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='MoveDown',   FName='下降', FHint=null,                 FLabel=null, FType='Button',      FAlign='left',  FIndex=2, FWidth=0, FIcon='quicksilver/image/16/MoveDown.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doMoveDown';
insert into TsToolItem set FId='251e7cdc-0ca5-45a2-b4a1-590352d27730', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='MoveTop',    FName='置頂', FHint=null,                 FLabel=null, FType='Button',      FAlign='left',  FIndex=3, FWidth=0, FIcon='quicksilver/image/16/MoveTop.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doMoveTop';
insert into TsToolItem set FId='ce8bd951-ac14-4138-b07c-9041d6aaecae', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='MoveBottom', FName='置底', FHint=null,                 FLabel=null, FType='Button',      FAlign='left',  FIndex=4, FWidth=0, FIcon='quicksilver/image/16/MoveBottom.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doMoveBottom';
insert into TsToolItem set FId='c7317072-80bc-49a0-9c55-9c8f6ead4306', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='Add',        FName='新增', FHint='新增一筆記錄',       FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.png',        FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doAdd';
insert into TsToolItem set FId='7d2025f7-c699-4ba0-a267-bbf2894227a1', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='Delete',     FName='刪除', FHint='刪除當前選中的記錄', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Delete.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doDelete';
insert into TsToolItem set FId='35d9bd94-a1a6-452b-822e-6e5d7748d5fd', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='Save',       FName='保存', FHint=null,                 FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Save.png',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doSave';
insert into TsToolItem set FId='5ce8d54c-d905-4508-8204-4b0c5fcab366', FPageId='ecbfad83-144e-446c-b443-345a5291e5b7', FCode='Refresh',    FName='刷新', FHint='刷新清單內容',       FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EditableList.doRefresh';

--update icons

update TsUnit			set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';
update TsPage			set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';
update TsMenu			set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';
update TwButton			set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Add.png' where FIcon='quicksilver/image/16/Add.gif';

update TsUnit			set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';
update TsPage			set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';
update TsMenu			set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';
update TwButton			set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Back.png' where FIcon='quicksilver/image/16/Back.gif';

update TsUnit			set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';
update TsPage			set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';
update TsMenu			set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';
update TwButton			set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';
update TsToolItem		set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/BatchAdd.png' where FIcon='quicksilver/image/16/BatchAdd.gif';

update TsUnit			set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';
update TsPage			set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';
update TsMenu			set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';
update TwButton			set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Config.png' where FIcon='quicksilver/image/16/Config.gif';

update TsUnit			set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';
update TsPage			set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';
update TsMenu			set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';
update TwButton			set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Copy.png' where FIcon='quicksilver/image/16/Copy.gif';

update TsUnit			set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';
update TsPage			set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';
update TsMenu			set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';
update TwButton			set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Delete.png' where FIcon='quicksilver/image/16/Delete.gif';

update TsUnit			set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';
update TsPage			set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';
update TsMenu			set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';
update TwButton			set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Excel.png' where FIcon='quicksilver/image/16/Excel.gif';

update TsUnit			set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';
update TsPage			set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';
update TsMenu			set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';
update TwButton			set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Execute.png' where FIcon='quicksilver/image/16/Execute.gif';

update TsUnit			set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';
update TsPage			set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';
update TsMenu			set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';
update TwButton			set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Export.png' where FIcon='quicksilver/image/16/Export.gif';

update TsUnit			set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';
update TsPage			set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';
update TsMenu			set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';
update TwButton			set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Finish.png' where FIcon='quicksilver/image/16/Finish.gif';

update TsUnit			set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';
update TsPage			set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';
update TsMenu			set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';
update TwButton			set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Hand.png' where FIcon='quicksilver/image/16/Hand.gif';

update TsUnit			set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';
update TsPage			set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';
update TsMenu			set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';
update TwButton			set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Import.png' where FIcon='quicksilver/image/16/Import.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveBottom.png' where FIcon='quicksilver/image/16/MoveBottom.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveDown.png' where FIcon='quicksilver/image/16/MoveDown.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveLeft.png' where FIcon='quicksilver/image/16/MoveLeft.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveRight.png' where FIcon='quicksilver/image/16/MoveRight.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveTop.png' where FIcon='quicksilver/image/16/MoveTop.gif';

update TsUnit			set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';
update TsPage			set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';
update TsMenu			set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';
update TwButton			set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';
update TsToolItem		set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/MoveUp.png' where FIcon='quicksilver/image/16/MoveUp.gif';

update TsUnit			set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';
update TsPage			set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';
update TsMenu			set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';
update TwButton			set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';
update TsToolItem		set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/NewWindow.png' where FIcon='quicksilver/image/16/NewWindow.gif';

update TsUnit			set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';
update TsPage			set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';
update TsMenu			set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';
update TwButton			set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Ok.png' where FIcon='quicksilver/image/16/Ok.gif';

update TsUnit			set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';
update TsPage			set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';
update TsMenu			set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';
update TwButton			set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Open.png' where FIcon='quicksilver/image/16/Open.gif';

update TsUnit			set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';
update TsPage			set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';
update TsMenu			set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';
update TwButton			set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Other.png' where FIcon='quicksilver/image/16/Other.gif';

update TsUnit			set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';
update TsPage			set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';
update TsMenu			set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';
update TwButton			set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Refresh.png' where FIcon='quicksilver/image/16/Refresh.gif';

update TsUnit			set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';
update TsPage			set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';
update TsMenu			set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';
update TwButton			set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Save.png' where FIcon='quicksilver/image/16/Save.gif';

update TsUnit			set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';
update TsPage			set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';
update TsMenu			set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';
update TwButton			set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Share.png' where FIcon='quicksilver/image/16/Share.gif';

update TsUnit			set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';
update TsPage			set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';
update TsMenu			set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';
update TwButton			set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Sort.png' where FIcon='quicksilver/image/16/Sort.gif';

update TsUnit			set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';
update TsPage			set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';
update TsMenu			set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';
update TwButton			set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';
update TsToolItem		set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';
update TsToolSubItem	set FIcon='quicksilver/image/16/Submit.png' where FIcon='quicksilver/image/16/Submit.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';
update TsPage			set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';
update TwButton			set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Attachment.png' where FIcon='quicksilver/image/unit/Attachment.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';
update TsPage			set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';
update TwButton			set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Bill.png' where FIcon='quicksilver/image/unit/Bill.gif';

update TsUnit			set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';
update TsPage			set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';
update TsMenu			set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';
update TwButton			set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/BusinessLog.png' where FIcon='quicksilver/image/unit/BusinessLog.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';
update TsPage			set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';
update TwButton			set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Chart.png' where FIcon='quicksilver/image/unit/Chart.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';
update TsPage			set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';
update TwButton			set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Note.png' where FIcon='quicksilver/image/unit/Note.gif';

update TsUnit			set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';
update TsPage			set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';
update TsMenu			set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';
update TwButton			set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/QuerySchema.png' where FIcon='quicksilver/image/unit/QuerySchema.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';
update TsPage			set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';
update TwButton			set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Report.png' where FIcon='quicksilver/image/unit/Report.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';
update TsPage			set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';
update TwButton			set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Script.png' where FIcon='quicksilver/image/unit/Script.gif';

update TsUnit			set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
update TsPage			set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
update TsMenu			set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
update TwButton			set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/Version.png' where FIcon='quicksilver/image/unit/Version.gif';
