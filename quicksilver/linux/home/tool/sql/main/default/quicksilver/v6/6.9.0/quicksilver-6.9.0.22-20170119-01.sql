--Figo.Xia 
--Qs.DatabaseMark---------------------------------------------------------------
create table TsDatabaseMark
(
	FId uuid primary key,
	FName varchar(2000),
	FCreateTime timestamp,
	FVersion int,
	FUpdateDepartmentId uuid,
	FUpdateTime timestamp,
	FUpdateUserId uuid
);

insert into TsUnit set FId='158f77f6-8590-0f63-5d3a-c65444558360', FCode='Qs.DatabaseMark', FName='資料庫標記', FIcon='quicksilver/image/unit/New.gif', FBigIcon='quicksilver/image/unit/New-64.gif', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='System', FIsTreeStructure=0, FIsTreeCheckPrivilege=0, FMaxTreeLevel=null, FIsSlaveUnit=0, FMasterUnitId=null, FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=0, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FApiEnabled=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable='TsDatabaseMark', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.database.DatabaseMarkHome', FDaoClassName='com.jeedsoft.quicksilver.database.dao.impl.DatabaseMarkDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.database.service.impl.DatabaseMarkServiceImpl', FActionClassName='com.jeedsoft.quicksilver.database.action.impl.DatabaseMarkActionImpl', FApiClassName=null, FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='158f7863-16a0-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FCreateTime',         FTitle='創建時間',     FType='DateBox-DateTime', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='158f77f6-9150-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FId',                 FTitle='ID',           FType='InputBox-Key',     FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null, FParentField=null, FEntityUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint=null, FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='158f77f6-9190-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FName',               FTitle='描述',         FType='TextBox',          FSize=2000, FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=3, FRowSpan=10, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='158f78e7-4b30-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FUpdateDepartmentId', FTitle='最後修改部門', FType='EntityBox',        FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId='00000000-0000-0000-0001-000000001001', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='158f78a2-6220-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FUpdateTime',         FTitle='最後修改時間', FType='DateBox-DateTime', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='158f790f-8400-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FUpdateUserId',       FTitle='最後修改員工', FType='EntityBox',        FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId='00000000-0000-0000-0001-000000001001', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='158f786e-4290-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='FVersion',            FTitle='版本號',       FType='InputBox-Integer', FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FParentField=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=50,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint='',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

java setQueryFormFields('158f77f6-8590-0f63-5d3a-c65444558360', 'FName,FCreateTime,FVersion,FUpdateTime');
java setKeywordFields('158f77f6-8590-0f63-5d3a-c65444558360', 'FName');

insert into TsRelation set FId='158f78e7-4880-0f63-5d3a-c65444558360', FOppositeId='158f78e7-48b0-0f63-5d3a-c65444558360', FName='資料庫標記-最後修改部門', FOppositeName='最後修改部門-資料庫標記', FUnitId1='158f77f6-8590-0f63-5d3a-c65444558360', FUnitId2='00000000-0000-0000-0001-000000001001', FType='field', FTable=null, FField1='FId', FField2='FUpdateDepartmentId', FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='158f790f-81b0-0f63-5d3a-c65444558360', FOppositeId='158f790f-81d0-0f63-5d3a-c65444558360', FName='資料庫標記-最後修改員工', FOppositeName='最後修改員工-資料庫標記', FUnitId1='158f77f6-8590-0f63-5d3a-c65444558360', FUnitId2='00000000-0000-0000-0001-000000001001', FType='field', FTable=null, FField1='FId', FField2='FUpdateUserId',       FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

insert into TsPage set FId='158fc391-4860-0f63-5d3a-c65444558360', FName='資料庫標記列表',     FTitle='資料庫標記',     FCode='Qs.DatabaseMark.CompareConfig', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FPlatform='Computer', FType='EditableList', FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/database/DatabaseMarkConfig.jsp', FActionMethodName='Qs.DatabaseMark.prepareCompareConfig', FLoadHandler=null, FRelationId=null, FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FFormColumnCount=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0,    FQueryFormAutoQuery=0, FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null,      FCreateKeywordBox=null,  FToolItemInitArguments='',   FVisible=1, FVisibleCondition=null, FDescription='設置忽略標記表，標記表重複條件。';
insert into TsPage set FId='158f77f6-9740-0f63-5d3a-c65444558360', FName='資料庫標記選擇列表', FTitle='資料庫標記列表', FCode='Qs.DatabaseMark.SelectList',    FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FPlatform='Computer', FType='EntityList',   FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/template/EntityList.jsp',         FActionMethodName='Qs.DatabaseMark.prepareList',          FLoadHandler=null, FRelationId=null, FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FFormColumnCount=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null,      FCreateKeywordBox=null,  FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='158f77f6-94b0-0f63-5d3a-c65444558360', FName='資料庫標記主列表',   FTitle='資料庫標記列表', FCode='Qs.DatabaseMark.List',          FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FPlatform='Computer', FType='EntityList',   FIcon='quicksilver/image/unit/New.gif',  FUrl='quicksilver/page/template/EntityList.jsp',         FActionMethodName='Qs.DatabaseMark.prepareList',          FLoadHandler=null, FRelationId=null, FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FFormColumnCount=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=0,    FQueryFormAutoQuery=1, FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox='Default', FCreateKeywordBox='Yes', FToolItemInitArguments='',   FVisible=1, FVisibleCondition=null, FDescription='資料庫標記';
insert into TsPage set FId='158f77f6-9230-0f63-5d3a-c65444558360', FName='資料庫標記表單',     FTitle='表單',           FCode='Qs.DatabaseMark.Form',          FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FPlatform='Computer', FType='EntityForm',   FIcon='quicksilver/image/unit/Form.png', FUrl='quicksilver/page/template/EntityForm.jsp',         FActionMethodName='Qs.DatabaseMark.prepareForm',          FLoadHandler=null, FRelationId=null, FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FMasterUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FIsSlavePage=1, FIndex=1,    FFormColumnCount=null, FDialogWidth=null, FDialogHeight=500,  FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null,      FCreateKeywordBox=null,  FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;

--資料庫標記列表
insert into TsScript set FId='15906457-8dd0-050a-7883-c65444558360', FIndex=1, FPageId='158fc391-4860-0f63-5d3a-c65444558360', FUrl='quicksilver/page/database/DatabaseMarkConfig.js';
insert into TsToolItem set FId='159012ac-6000-05e9-08ec-c65444558360', FPageId='158fc391-4860-0f63-5d3a-c65444558360', FCode='Save', FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver/image/16/Save.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine='', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='DatabaseMarkConfig.doSave';

--資料庫標記選擇列表
insert into TsToolItem set FId='158f77f6-9780-0f63-5d3a-c65444558360', FPageId='158f77f6-9740-0f63-5d3a-c65444558360', FCode='ConfirmSelection', FName='確定', FHint=null,                                                   FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Ok.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='158f77f6-97d0-0f63-5d3a-c65444558360', FPageId='158f77f6-9740-0f63-5d3a-c65444558360', FCode='Add',              FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Add.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='158f77f6-97f0-0f63-5d3a-c65444558360', FPageId='158f77f6-9740-0f63-5d3a-c65444558360', FCode='Open',             FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Open.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';

--資料庫標記主列表
insert into TsScript set FId='15901916-b0d0-038d-1812-c65444558360', FIndex=1, FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FUrl='quicksilver/page/database/DatabaseMarkList.js';
insert into TsToolItem set FId='158f77f6-9540-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='Add',           FName='新增標記', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver/image/16/Add.png',             FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine='',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='158fc1e2-9230-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='compare',       FName='對比',     FHint=null,                                                   FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=null, FIcon='quicksilver/image/16/DatabaseCompare.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine='',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='DatabaseMarkList.doCompare';
insert into TsToolItem set FId='158f77f6-9580-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='Open',          FName='打開',     FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0,    FIcon='quicksilver/image/16/Open.png',            FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='158f77f6-95e0-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='Delete',        FName='刪除',     FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0,    FIcon='quicksilver/image/16/Delete.png',          FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='158f77f6-9640-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='Refresh',       FName='刷新',     FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=5, FWidth=0,    FIcon='quicksilver/image/16/Refresh.png',         FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='158fc21f-c4f0-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='compareConfig', FName='設置',     FHint=null,                                                   FLabel=null, FType='Button',      FAlign='right', FIndex=6, FWidth=null, FIcon='quicksilver/image/16/Config.png',          FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine='',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='DatabaseMarkList.doOpenCompareConfig';
insert into TsToolItem set FId='158f77f6-9660-0f63-5d3a-c65444558360', FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FCode='Other',         FName=null,       FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=7, FWidth=null, FIcon='quicksilver/image/16/Other.png',           FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine='',   FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='';
insert into TsToolSubItem set FId='158f77f6-96e0-0f63-5d3a-c65444558360', FToolItemId='158f77f6-9660-0f63-5d3a-c65444558360', FCode='ExcelExport', FName='匯出 Excel', FExpandMode='None', FIndex=2, FIcon='quicksilver/image/16/Excel.png', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FEventHandler='EntityList.doExcelExport';

--資料庫標記表單
insert into TsToolItem set FId='158f77f6-92d0-0f63-5d3a-c65444558360', FPageId='158f77f6-9230-0f63-5d3a-c65444558360', FCode='Save', FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='158f77f6-9fb0-0f63-5d3a-c65444558360', FIndex=1, FName='默認', FPageId=null, FPlatform='Computer', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360';
java setFormFields('158f77f6-9fb0-0f63-5d3a-c65444558360', '基本資訊', '158f77f6-9fe0-0f63-5d3a-c65444558360', null, 'FVersion,FCreateTime', '描述', '158f79c8-31a0-0f63-5d3a-c65444558360', '158f77f6-9fe0-0f63-5d3a-c65444558360', 'FName');

insert into TsList set FDefault=1, FId='158f77f6-a7a0-0f63-5d3a-c65444558360', FIndex=null, FMultiPage=1, FName='資料庫標記列表',     FPageId=null,                                   FPlatform='Computer', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360';
insert into TsList set FDefault=0, FId='158f77f6-a880-0f63-5d3a-c65444558360', FIndex=null, FMultiPage=1, FName='資料庫標記選擇列表', FPageId='158f77f6-9740-0f63-5d3a-c65444558360', FPlatform='Computer', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360';
insert into TsList set FDefault=0, FId='158f77f6-a8f0-0f63-5d3a-c65444558360', FIndex=null, FMultiPage=1, FName='資料庫標記首頁列表', FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FPlatform='Computer', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360';
java setListFields('158f77f6-a7a0-0f63-5d3a-c65444558360', 'FVersion,FCreateTime,FUpdateTime,FName');
java setListFields('158f77f6-a880-0f63-5d3a-c65444558360', 'FVersion,FCreateTime,FUpdateTime,FName');
java setListFields('158f77f6-a8f0-0f63-5d3a-c65444558360', 'FVersion,FCreateTime,FUpdateTime,FName');

insert into TsPrivilege set FId='158f77f6-ab40-0f63-5d3a-c65444558360', FName='資料庫標記修改', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000003', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='158f77f6-ab90-0f63-5d3a-c65444558360', FName='資料庫標記刪除', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000004', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='158f77f6-aaa0-0f63-5d3a-c65444558360', FName='資料庫標記新增', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000001', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='158f77f6-aaf0-0f63-5d3a-c65444558360', FName='資料庫標記查看', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FModuleId='00000000-0000-0000-0008-990000000020', FPrivilegeTypeId='00000000-0000-0000-1005-000000000002', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;

java setImportTemplateFields('158f77f6-8590-0f63-5d3a-c65444558360', 'FUpdateUserId,FUpdateTime,FUpdateDepartmentId,FName');

insert into TsQuerySchema set FId='158f77f6-ac30-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='全部資料庫標記',     FType='condition',  FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='None', FSql='', FIndex=1, FUpdateTime=timestamp('2016-12-20 15:55:30'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='158f77f6-ac80-0f63-5d3a-c65444558360', FUnitId='158f77f6-8590-0f63-5d3a-c65444558360', FName='資料庫標記我的最愛', FType='collection', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource=null,   FSql='', FIndex=3, FUpdateTime=timestamp('2016-12-20 15:59:48'), FOriginSchemaId=null, FParentId='158f77f6-ac30-0f63-5d3a-c65444558360';

insert into TsMenu set FId='15901f4c-d1d0-0da1-0ace-c65444558360', FParentId='78220d0b-c5c8-413a-84dd-3c27ec6d72bb', FIndex=5,  FTreeLevel=4, FTreeSerial='002.002.005.005', FName='資料庫標記', FIcon='quicksilver/image/unit/DatabaseMark.png', FType='InternalPage', FTabTitleSource='MenuName', FTabTitle=null, FAlwaysOpenNewTab=0,    FPageId='158f77f6-94b0-0f63-5d3a-c65444558360', FQueryFormHidden=0,    FQuerySchemaId=null, FQuerySchemaLocked=0,    FArguments='',   FExternalPageUrl=null, FOpenMode=null,  FFunctionName=null, FLicensed=1, FEnabled=1, FReplaceByChildren=0, FSubMenuSource='MenuTable', FSubMenuRoutine='';

---hander sql 
insert into  TsTextResource   set FId ='00000159-0642-3a65-0000-015906423a65' , FCode = 'T.Qs.DatabaseMarkList.MarkTableIgnoreNotSelected' , FValue ='需要標記的表';
insert into  TsTextResource   set FId ='00000159-0641-a5fb-0000-01590641a5fb' , FCode = 'T.Qs.DatabaseMarkList.MarkTableIgnoreSelected' , FValue ='不用標記的表' ;
insert into  TsTextResource   set FId ='00000159-0641-01ac-0000-0159064101ac' , FCode = 'T.Qs.DatabaseMarkList.MarkTableIgnoreSet' , FValue ='忽略表設置' ;
insert into  TsTextResource   set FId ='00000159-0640-a381-0000-01590640a381' , FCode = 'T.Qs.DatabaseMarkList.MarkTableName' , FValue ='資料庫表' ;
insert into  TsTextResource   set FId ='00000159-063f-ef8c-0000-0159063fef8c' , FCode = 'T.Qs.DatabaseMarkList.MarkFieldName' , FValue ='選擇欄位組合' ;
insert into  TsTextResource   set FId ='00000159-01e6-ef97-0000-015901e6ef97' , FCode = 'T.Qs.DatabaseMarkList.compareWarn' , FValue ='請選擇兩條記錄進行比較!' ;
insert into  TsTextResource   set FId ='00000159-01e9-9217-0000-015901e99217' , FCode = 'T.Qs.DatabaseMarkList.dbMarkTitle' , FValue ='資料庫設置' ;

create  table TsDatabaseMarkIgnoreTable (
  FTableName varchar(200)  primary key,
  FEnabled     bit    default 1
);

create  table TsDatabaseMarkDuplication (
  FTableName varchar(200)  primary key,
  FFieldNames    varchar(200) not null
);

insert into TsDatabaseMarkDuplication set FTableName ='TsChartGroupField',  FFieldNames = 'FChartId,FGroupField,FGroupOption';
insert into TsDatabaseMarkDuplication set FTableName ='TsChartValueField',  FFieldNames = 'FChartId,FValueField';
insert into TsDatabaseMarkDuplication set FTableName ='TsDeletedEntity',  FFieldNames = 'FEntityId,FUnitId';
insert into TsDatabaseMarkDuplication set FTableName ='TsFormField',  FFieldNames = 'FFieldGroupId,FFieldName';
insert into TsDatabaseMarkDuplication set FTableName ='TsHomepageItemArrangement',  FFieldNames = 'FHomepageItemId,FUserId';
insert into TsDatabaseMarkDuplication set FTableName ='TsImportDuplication',  FFieldNames = 'FFieldName,FUnitId';
insert into TsDatabaseMarkDuplication set FTableName ='TsImportMapping',  FFieldNames = 'FFieldName,FUnitId';
insert into TsDatabaseMarkDuplication set FTableName ='TsImportTemplate',  FFieldNames = 'FFieldName,FUnitId';
insert into TsDatabaseMarkDuplication set FTableName ='TsKeywordField',  FFieldNames = 'FFieldName,FUnitId';
insert into TsDatabaseMarkDuplication set FTableName ='TsRoleMenu',  FFieldNames = 'FMenuId,FRoleId';
insert into TsDatabaseMarkDuplication set FTableName ='TsUnitConvertMapping',  FFieldNames = 'FDestFieldName,FSrcFieldName,FUnitConvertId';
insert into TsDatabaseMarkDuplication set FTableName ='TsUserInputPasswordErrorCount',  FFieldNames = 'FLoginName';

insert into TsDatabaseMarkIgnoreTable set FTableName='TsClusterNode',            FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsClusterNodeFileSystem',  FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsClusterNodePerformance', FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsCollection',             FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsI18nText',               FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsLongUrlArguments',       FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsMenuNumberCollection',   FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsMonth',                  FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsOnlineUser',             FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsQuarter',                FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsTempPrivilege',          FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsTimerLog',               FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsUserPasswordHistory',    FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TwProcessLog',             FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsSqlExecuteLog',          FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsSqlUpgradeLog',          FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsLoginLog',               FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsImportLog',              FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsEventLog',               FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsBusinessLog',            FEnabled=1;
insert into TsDatabaseMarkIgnoreTable set FTableName='TsDual',                   FEnabled=1;

create table TsGraphHomepageBakXw20170117
(
	FId					uuid ,
	FBackgroundImage	varchar(100),
	FNodeWidth			int,
	FNodeHeight			int,
	FLineWidth			int,
	FLineColor			varchar(10)
);

create table TsGraphLineBakXw20170117
(
	FId					uuid,
	FGraphId			uuid,
	FContent			varchar(2000)
);

create table TsGraphNodeBakXw20170117
(
	FId					uuid,
	FGraphId			uuid,
	FContent			varchar(2000)
);

insert into TsGraphHomepageBakXw20170117 (FId,FBackgroundImage,FNodeWidth,FNodeHeight,FLineWidth,FLineColor )select FId,FBackgroundImage,FNodeWidth,FNodeHeight,FLineWidth,FLineColor from TsGraphHomepage;

insert into TsGraphLineBakXw20170117 (FId, FGraphId, FContent)select FId, FGraphId, FContent from TsGraphLine;

insert into TsGraphNodeBakXw20170117 (FId, FGraphId, FContent)select FId, FGraphId, FContent from TsGraphNode;

drop table TsGraphHomepage;

drop table TsGraphLine;

drop table TsGraphNode;

create table TsGraphHomepage
(
	FId					uuid 	primary key,
	FBackgroundImage	varchar(100),
	FNodeWidth			int,
	FNodeHeight			int,
	FLineWidth			int,
	FLineColor			varchar(10)
);

create table TsGraphLine
(
	FId					uuid	primary key,
	FGraphId			uuid,
	FContent			varchar(2000)
);

create table TsGraphNode
(
	FId					uuid	primary key,
	FGraphId			uuid,
	FContent			varchar(2000)
);

insert into TsGraphHomepage (FId,FBackgroundImage,FNodeWidth,FNodeHeight,FLineWidth,FLineColor )select FId,FBackgroundImage,FNodeWidth,FNodeHeight,FLineWidth,FLineColor from TsGraphHomepageBakXw20170117;

insert into TsGraphLine (FId, FGraphId, FContent)select FId, FGraphId, FContent from TsGraphLineBakXw20170117;

insert into TsGraphNode(FId, FGraphId, FContent)select FId, FGraphId, FContent from TsGraphNodeBakXw20170117;

drop table TsGraphHomepageBakXw20170117;

drop table TsGraphLineBakXw20170117;

drop table TsGraphNodeBakXw20170117;
