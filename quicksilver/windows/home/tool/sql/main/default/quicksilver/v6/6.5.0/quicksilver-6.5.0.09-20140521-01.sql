--minglei

update TsMenu set FName='短信日誌' where FId='2d83c836-8499-4872-8b57-a53b35b90703';

insert into TsDictionary set FBuiltin=1, FId='164f000d-95d3-4ba3-ac75-91bebfb67e7e', FName='QS-系統郵件-狀態', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FId='161bf9dc-0007-4a4c-8ba8-4c70d712a11e', FDictionaryId='164f000d-95d3-4ba3-ac75-91bebfb67e7e', FEnabled=1, FIndex=1, FValue='Sending', FText='發送中';
insert into TsDictionaryItem set FId='7637f1e9-06f6-4e09-8c6c-e8aa94b9b199', FDictionaryId='164f000d-95d3-4ba3-ac75-91bebfb67e7e', FEnabled=1, FIndex=2, FValue='Sent',    FText='已發送';
insert into TsDictionaryItem set FId='20e39cf0-57c6-49f5-9a40-dc8654b11644', FDictionaryId='164f000d-95d3-4ba3-ac75-91bebfb67e7e', FEnabled=1, FIndex=3, FValue='Failed',  FText='發送失敗';

--Qs.SystemEmail----------------------------------------------------------------

create table TsSystemEmail
(
	FId uuid primary key,
	FSubject varchar(200),
	FTo varchar(500),
	FCc varchar(500),
	FBcc varchar(500),
	FSendTime timestamp,
	FStatus varchar(20),
	FContent varchar(2000),
	FErrorMessage varchar(2000)
);

insert into TsUnit set FId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FCode='Qs.SystemEmail', FName='系統郵件', FIcon='quicksilver/image/unit/SystemEmail.png', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='System', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=0, FMasterUnitId=null, FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=0, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable='TsSystemEmail', FKeyField='FId', FKeyType='Uuid', FNameField='FSubject', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.message.SystemEmailHome', FDaoClassName='com.jeedsoft.quicksilver.message.dao.impl.SystemEmailDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.message.service.impl.SystemEmailServiceImpl', FActionClassName='com.jeedsoft.quicksilver.message.action.impl.SystemEmailActionImpl', FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='93d23e13-556d-4463-8c6b-8b4d22ff07a9', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FBcc',          FTitle='密送',     FType='InputBox-Text',       FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='52cb00fe-95d3-48f6-9185-35459744790c', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FCc',           FTitle='抄送',     FType='InputBox-Text',       FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='0039b8c0-b721-41f3-b41d-385fc48b2575', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FContent',      FTitle='內容',     FType='HtmlBox',             FSize=2000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=10, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='fc8bd3de-fbd5-456e-8e3f-fd62cfc21a84', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FErrorMessage', FTitle='錯誤資訊', FType='TextBox',             FSize=2000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=8,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='acf6a7c9-3b0c-4f37-be73-f295cfccbc56', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FId',           FTitle='ID',       FType='InputBox-Key',        FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='7d70c82e-778b-4af3-bfb2-5d511b9d13c8', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FSendTime',     FTitle='發送時間', FType='DateBox-DateTime',    FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=130, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='8a6c113f-3cca-45e1-bc07-a641191e9de6', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FStatus',       FTitle='狀態',     FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='164f000d-95d3-4ba3-ac75-91bebfb67e7e', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='25a11d1a-1349-42d9-926b-7e44cec609e9', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FSubject',      FTitle='標題',     FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=200, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='3e7e4fe2-375e-4614-8302-d832f8f0a5b0', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='FTo',           FTitle='收件人',   FType='InputBox-Text',       FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=250, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';

java setOrderFields('fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', 'FSendTime', '1');
java setQueryFormFields('fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', 'FSendTime,FTo,FStatus,FSubject');

insert into TsPage set FId='0fb371ae-feec-488e-945c-3b4293b4b058', FName='系統郵件主清單',   FTitle='系統郵寄清單', FCode='Qs.SystemEmail.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/SystemEmail.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.SystemEmail.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='a11146d8-8a64-4c03-8237-c05133b7c6e7', FName='系統郵件選擇清單', FTitle='系統郵寄清單', FCode='Qs.SystemEmail.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/SystemEmail.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.SystemEmail.prepareList', FLoadHandler=null, FRelationId=null, FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='9d957233-e5a7-431b-b38c-9b6426475bb1', FName='系統郵件表單',     FTitle='表單',         FCode='Qs.SystemEmail.Form',       FPlatform='Computer', FType='EntityForm', FIcon='quicksilver/image/unit/Form.png',        FUrl='quicksilver/page/template/EntityForm.jsp', FActionMethodName='Qs.SystemEmail.prepareForm', FLoadHandler=null, FRelationId=null, FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FMasterUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FIsSlavePage=1, FIndex=1,    FDialogWidth=750,  FDialogHeight=500,  FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;

--系統郵件主清單
insert into TsToolItem set FId='11aba704-313c-4a5d-8281-02fc093a6eec', FPageId='0fb371ae-feec-488e-945c-3b4293b4b058', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='762ea8aa-4674-4dbc-9883-0f6c8a0956b4', FPageId='0fb371ae-feec-488e-945c-3b4293b4b058', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Delete.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='c3d22d0e-2677-41bd-ae27-8e7f66f477f1', FPageId='0fb371ae-feec-488e-945c-3b4293b4b058', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='56176d0f-6082-483b-b2a7-05445c4a89ad', FPageId='0fb371ae-feec-488e-945c-3b4293b4b058', FCode='Other',   FName=null,   FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='a43c0bdd-7437-43de-aeb3-e1bbc4c7e40c', FToolItemId='56176d0f-6082-483b-b2a7-05445c4a89ad', FCode='ExcelExport', FName='匯出 Excel', FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Excel.png',  FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doExcelExport';

--系統郵件選擇清單
insert into TsToolItem set FId='4d817611-8afb-49b2-a77f-ea7d1cf6fc49', FPageId='a11146d8-8a64-4c03-8237-c05133b7c6e7', FCode='ConfirmSelection', FName='確定', FHint=null,                                                   FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Ok.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='22392e75-030a-4149-a19c-0ca3452c48ee', FPageId='a11146d8-8a64-4c03-8237-c05133b7c6e7', FCode='Open',             FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='9a979bde-f4d7-49cc-ad85-7bed0ac60b6b', FIndex=1, FName='默認', FPageId=null, FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d';
java setFormFields('9a979bde-f4d7-49cc-ad85-7bed0ac60b6b', '基本資訊', 'f2b04f12-3d75-475a-ac3d-fbdd1bac9062', null, 'FSubject,FTo,FCc,FBcc,FSendTime,FStatus,FContent', '其它', '876a455d-886f-41f8-a6ef-10378db6bee3', null, 'FErrorMessage');

insert into TsList set FDefault=1, FId='87c5b894-3b63-4266-8821-db1422bc1d89', FIndex=null, FMultiPage=1, FName='系統郵寄清單',     FPageId=null,                                   FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d';
insert into TsList set FDefault=0, FId='fdef9c7f-c5c2-4236-9efe-14024b81e119', FIndex=null, FMultiPage=1, FName='系統郵件選擇清單', FPageId='a11146d8-8a64-4c03-8237-c05133b7c6e7', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d';
insert into TsList set FDefault=0, FId='01d015d4-82d0-47d5-992c-f207f56151a0', FIndex=null, FMultiPage=1, FName='系統郵件首頁清單', FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d';
java setListFields('87c5b894-3b63-4266-8821-db1422bc1d89', 'FSendTime,FTo,FStatus,FSubject');
java setListFields('fdef9c7f-c5c2-4236-9efe-14024b81e119', 'FSubject,FTo,FSendTime,FStatus');
java setListFields('01d015d4-82d0-47d5-992c-f207f56151a0', 'FSubject,FTo,FSendTime,FStatus');

insert into TsPrivilege set FId='2f21d7c2-aeed-4c3f-b15c-a6bf83bf2efe', FName='系統郵件查看', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000002', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;
insert into TsPrivilege set FId='b040ac90-89d8-4e85-afe4-6281070539e1', FName='系統郵件管理', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FModuleId='00000000-0000-0000-0008-990000000010', FPrivilegeTypeId='00000000-0000-0000-1005-000000000006', FUseExisting=0, FSourcePrivilegeId=null, FEditId='5992c3d2-0b4a-478c-bbfa-2089819ad575', FIndex=null;

insert into TsQuerySchema set FId='9920497c-c25f-45a3-949d-3cb74450230b', FUnitId='fcd47c16-d0f1-42d0-9f9c-e40e10c4329d', FName='全部系統郵件',     FType='condition',  FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId=null, FConditionId=null, FSqlSource='None', FSql=null, FIndex=1, FUpdateTime=null, FOriginSchemaId=null, FParentId=null;

insert into TsMenu set	FId='fd2bb6a1-6a66-48f9-ab7f-a29068589400', FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=6,	FName='系統郵件日誌', FType='InternalPage',	FPageId='0fb371ae-feec-488e-945c-3b4293b4b058', FLicensed=1, FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/SystemEmail.png';

--icon

update TsUnit			set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';
update TsPage			set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';
update TsMenu			set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';
update TwButton			set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';
update TsToolItem		set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';
update TsToolSubItem	set FIcon='quicksilver/image/unit/ShortMessage.png' where FIcon='quicksilver/image/16/ShortMessage.png';

--ShortMessage

drop table TsShortMessage; --這張表目前並未使用，可以drop

create table TsShortMessage
(
	FId uuid primary key,
	FMobile varchar(50),
	FSendTime timestamp,
	FStatus varchar(20),
	FContent varchar(1000),
	FErrorMessage varchar(2000)
);

delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FTimed';
delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FDirection';
delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FReceiveTime';
delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FScheduleTime';
delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FDepartmentId';
delete from TsField where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FUserId';
update TsField set FListWidth=130 where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FSendTime';
update TsField set FRowSpan=8 where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FContent';
update TsField set FDefaultValue=null where FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8' and FName='FStatus';
insert into TsField set FId='713151a7-d35f-4e0e-8e2e-5d31d5d6b99f', FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8', FName='FErrorMessage', FTitle='錯誤資訊', FType='TextBox',             FSize=2000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FSourceType='local', FColSpan=0, FRowSpan=10, FListWidth=100, FListAlign='default';

java setQueryFormFields('4a31273a-b5ba-4214-a06c-ee59035869a8', 'FSendTime,FMobile,FStatus,FContent');

delete from TsRelation where FId='0c7beedc-0671-4008-99b2-05189bf2a698';
delete from TsRelation where FId='dd180555-981a-4ff4-a305-1db4ad7e0f99';
delete from TsRelation where FId='3e4c07e1-0f72-4a4d-8dc6-0fc7dbdb31f9';
delete from TsRelation where FId='86aabbe2-6e45-410d-813e-09460bac886d';

update TsPage set FDialogHeight=424 where FCode='Qs.ShortMessage.Form';

delete from TsToolItem where FPageId='27729d66-df4b-4fb5-99a8-92351b5fd830';
insert into TsToolItem set FId='5301f200-9909-48fb-9783-2286a0fd1c47', FPageId='27729d66-df4b-4fb5-99a8-92351b5fd830', FCode='ConfirmSelection',  FName='確定',                       FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='EntityList.doSelectListConfirm', FIcon='quicksilver/image/16/Ok.png',        FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='JavaScript';
insert into TsToolItem set FId='fd0e127f-ebea-463c-9063-593af79ca354', FPageId='27729d66-df4b-4fb5-99a8-92351b5fd830', FCode='Open',              FName='打開',                       FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FDefaultEventHandler='EntityList.doOpen',              FIcon='quicksilver/image/16/Open.png',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='JavaScript';

delete from TsToolItem where FPageId='97df8845-301a-4d00-a28b-fa557772a3a7';
insert into TsToolItem set FId='75c2255d-83f5-4685-98ea-3591ca06f437', FPageId='97df8845-301a-4d00-a28b-fa557772a3a7', FCode='Open',              FName='打開',                       FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='EntityList.doOpen',              FIcon='quicksilver/image/16/Open.png',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='JavaScript';
insert into TsToolItem set FId='5f9bcf9d-8c55-46f9-b1f9-1dda4e56c5fe', FPageId='97df8845-301a-4d00-a28b-fa557772a3a7', FCode='Delete',            FName='刪除',                       FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FDefaultEventHandler='EntityList.doDelete',            FIcon='quicksilver/image/16/Delete.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='JavaScript';
insert into TsToolItem set FId='f691605f-8193-469b-b25a-cb09c26c335f', FPageId='97df8845-301a-4d00-a28b-fa557772a3a7', FCode='Refresh',           FName='刷新',                       FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FDefaultEventHandler='EntityList.doRefresh',           FIcon='quicksilver/image/16/Refresh.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='JavaScript';
insert into TsToolItem set FId='d6147dad-0f10-4a27-95e4-896b9a086b12', FPageId='97df8845-301a-4d00-a28b-fa557772a3a7', FCode='Other',             FName=null,                         FLabel=null, FType='ComboButton',        FAlign='right', FIndex=4, FWidth=0,   FDefaultEventHandler=null,                             FIcon='quicksilver/image/16/Other.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandlePageId=null, FHandleType='None';

delete from TsToolItem where FPageId='eb9e0964-d78a-4593-b8f5-be4d189263c2';

delete from TsForm where FId='58636698-59e1-4147-aa64-df5e7c9628f8';
insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Double', FId='58636698-59e1-4147-aa64-df5e7c9628f8', FIndex=1, FName='默認', FPageId=null, FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8';
java setFormFields('58636698-59e1-4147-aa64-df5e7c9628f8', '基本資訊', '69e28dd0-3eec-43c0-999f-dc259709e281', null, 'FMobile,FSendTime,FStatus,FContent', '其它', 'd3724cc2-838c-4866-9a7a-730c11010ea6', null, 'FErrorMessage');

java setListFields('cd417a1a-c714-4a73-95b3-759ee8f7212c', 'FSendTime,FMobile,FStatus,FContent');
java setListFields('ba67b394-7373-4bed-8d94-8b5c9fbb0f63', 'FSendTime,FMobile,FStatus,FContent');
java setListFields('8472ea28-13db-4b33-af4e-6d806ca42355', 'FSendTime,FMobile,FStatus,FContent');

delete from TsDictionaryItem where FDictionaryId='7de137a4-98ad-43cd-bec9-6655bbfdf8eb';
insert into TsDictionaryItem set FDictionaryId='7de137a4-98ad-43cd-bec9-6655bbfdf8eb', FId='5a850f68-568f-46d3-b423-eb050518dc0b', FIndex=1, FParentValue=null, FText='發送中',		FValue='Sending';
insert into TsDictionaryItem set FDictionaryId='7de137a4-98ad-43cd-bec9-6655bbfdf8eb', FId='8ff7587b-d453-496a-848a-246feaf41123', FIndex=2, FParentValue=null, FText='已發送',		FValue='Sent';
insert into TsDictionaryItem set FDictionaryId='7de137a4-98ad-43cd-bec9-6655bbfdf8eb', FId='8a4d272a-f6a8-4c82-a2f1-e6aeca0c6877', FIndex=3, FParentValue=null, FText='發送失敗',	FValue='Failed';

--SystemMessage

update TsMenu set FIndex = FIndex - 1
where FParentId = (select FParentId from TsMenu where FId='08978019-db07-4f15-9b86-d45d93d6d715')
and FIndex > (select FIndex from TsMenu where FId='08978019-db07-4f15-9b86-d45d93d6d715');

delete from TsMenu where FId='08978019-db07-4f15-9b86-d45d93d6d715';
delete from TsRoleMenu where FMenuId='08978019-db07-4f15-9b86-d45d93d6d715';
delete from TsWorkbench where FMenuId='08978019-db07-4f15-9b86-d45d93d6d715';

--Menu Number

drop table TsEntityCountByUserAndStatus;

create table TsMenuNumberCollectByField
(
	FUnitId			uuid,
	FUserField		varchar(50),
	FUserId			uuid,
	FStatusField	varchar(50),
	FStatus			varchar(50),
	FCount			int,
	FBatch			int
);

create index IsMenuNumberCollectByField1 on TsMenuNumberCollectByField (FUserId);

create table TsMenuNumberCollectByJava
(
	FJavaClass		varchar(100),
	FUserId			uuid,
	FUuidArgument	uuid,
	FTextArgument	varchar(50),
	FCount			int,
	FBatch			int
);

create index IsMenuNumberCollectByJava1 on TsMenuNumberCollectByJava (FUserId);

delete from TsDictionary where FId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f';
delete from TsDictionaryItem where FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f';
insert into TsDictionary set FBuiltin=1, FDescription='', FId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FName='QS-功能表數位-類型', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='4d8ed9c1-bf79-4362-a1df-ed6fd5b4cb78', FIndex=1, FParentValue=null, FText='按欄位統計', FValue='Field';
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='c911eb20-94a5-47c9-862f-de9206185f34', FIndex=2, FParentValue=null, FText='特殊統計',   FValue='JavaClass';

update TsDictionary set FBuiltin=1 where FId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e';
update TsDictionary set FBuiltin=1 where FId='0d8049d6-d50a-4b7c-b411-b276cc234684';
update TsDictionary set FBuiltin=1 where FId='f0ad5575-d8c6-4128-a791-99be2d979098';
update TsDictionary set FBuiltin=1 where FId='01d9c1a9-365e-4dc3-bfc4-798c25a7fd22';
update TsDictionary set FBuiltin=1 where FId='b4ac2d00-5014-4c08-b9b2-3788a84a7d87';
update TsDictionary set FBuiltin=1 where FId='1fc03438-332f-4506-b815-6e62475da44b';
update TsDictionary set FBuiltin=1 where FId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab';
update TsDictionary set FBuiltin=1 where FId='76ee88e3-20f0-4267-9eba-03b14a9ce9f7';

--Qs.MenuNumber-----------------------------------------------------------------

create table TsMenuNumber
(
	FId uuid primary key,
	FName varchar(50),
	FMenuId uuid,
	FIndex int,
	FType varchar(10),
	FColor varchar(10),
	FBold bit,
	FUserFieldId uuid,
	FStatusFieldId uuid,
	FStatusValues varchar(200),
	FJavaClass varchar(100),
	FArguments varchar(500)
);

insert into TsUnit set FId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FCode='Qs.MenuNumber', FName='功能表數位', FIcon='quicksilver/image/unit/MenuNumber.png', FEditId='541c707d-79dd-4dbb-85fc-1a214fd5fce4', FModuleId='00000000-0000-0000-0008-990000000020', FOpenMode='System', FIsTreeStructure=0, FMaxTreeLevel=null, FIsSlaveUnit=1, FMasterUnitId='00000000-0000-0000-0001-000000000008', FSupportWorkflow=0, FSupportUser=0, FSupportDepartment=0, FSupportEditType=0, FSupportAttachment=0, FSupportDataPrivilege=0, FSupportVersion=0, FSupportBusinessLog=0, FSupportNote=0, FSupportSort=1, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=1, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable='TsMenuNumber', FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField='FMenuId', FHomeClassName='com.jeedsoft.quicksilver.menu.MenuNumberHome', FDaoClassName='com.jeedsoft.quicksilver.menu.dao.impl.MenuNumberDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.menu.service.impl.MenuNumberServiceImpl', FActionClassName='com.jeedsoft.quicksilver.menu.action.impl.MenuNumberActionImpl', FWebServiceUniqueField=null, FUnitFilterSql='', FBusinessFilterSql='', FDescription='';

insert into TsField set FId='29ce494b-ec03-48b9-a089-c7f1831c5f6b', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FArguments',		FTitle='參數',		FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=0, FRowSpan=3, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='dd6efe78-1cdd-49e8-b76e-dca167d4ecde', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FId',			FTitle='ID',		FType='InputBox-Key',        FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FSupportLocalText=null, FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;
insert into TsField set FId='217580ec-a8db-4cce-9f08-beaf1bbbc02a', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FIndex',			FTitle='順序',		FType='InputBox-Integer',    FSize=null, FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;
insert into TsField set FId='60b45e72-8042-41bc-a169-d90b89cb9e14', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FJavaClass',		FTitle='Java 類',	FType='InputBox-Text',       FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=0, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='296fa2a3-4f6e-4030-adea-ae95211fa317', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FMenuId',		FTitle='菜單',		FType='EntityBox',           FSize=null, FVisible=0, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000008', FSupportLocalText=null, FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;
insert into TsField set FId='6b6b2fb9-eacb-4902-9067-f27d014cb045', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FName',			FTitle='名稱',		FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=1, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;
insert into TsField set FId='0ab39d7c-fc79-45b2-b83e-0bf8e132f65e', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FStatusFieldId',	FTitle='狀態列位',	FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000002', FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='a51f2550-ebca-43e6-af54-4ee57aac93ae', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FStatusValues',	FTitle='狀態值',	FType='MultiCheckBox',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=20,   FSourceType='local', FColSpan=0, FRowSpan=0, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='d541645e-8f5a-42f1-88d7-005a66e36140', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FType',			FTitle='類型',		FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='666aa0ca-5c4b-4921-bffe-4de9bd357cde', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FUserFieldId',	FTitle='用戶欄位',	FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000002', FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='32753dff-eaa4-46a3-9029-3801eb6f88d0', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FColor',         FTitle='顏色',		FType='InputBox-Text',       FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;
insert into TsField set FId='382fc6f3-6819-47d8-a679-fe1641ab426e', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FBold',			FTitle='粗體',		FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=1, FRowSpan=1, FListWidth=100, FListAlign='default', FCustomData=null;

insert into TsFieldProperty set FId='dc41cfe0-a5dd-4d80-9cf6-23279a64a7c9', FFieldId='0ab39d7c-fc79-45b2-b83e-0bf8e132f65e', FName='hasMagnifier', FValue='false';
insert into TsFieldProperty set FId='254d32e1-9dda-4772-9723-7036e9f4085a', FFieldId='666aa0ca-5c4b-4921-bffe-4de9bd357cde', FName='hasMagnifier', FValue='false';

java setOrderFields('e622af1a-9c68-42a8-9059-21f0cf4550a7', 'FIndex', '0');

insert into TsRelation set FId='7705427b-2a53-4378-a7d2-1c09eadffcf6', FOppositeId='40bc184e-7e4f-499e-b1fc-3b0baee617ea', FName='功能表數位-用戶欄位元', FOppositeName='用戶欄位元-功能表數位', FUnitId1='e622af1a-9c68-42a8-9059-21f0cf4550a7', FUnitId2='00000000-0000-0000-0001-000000000002', FType='field', FTable=null, FField1='FId', FField2='FUserFieldId',   FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='cfd7464d-3e81-469c-9010-367bf683a7a8', FOppositeId='e68338ec-73de-435a-8e80-b7203f695d39', FName='功能表數位-狀態列位元', FOppositeName='狀態列位元-功能表數位', FUnitId1='e622af1a-9c68-42a8-9059-21f0cf4550a7', FUnitId2='00000000-0000-0000-0001-000000000002', FType='field', FTable=null, FField1='FId', FField2='FStatusFieldId', FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='7a3e3eb0-c581-46c4-810c-7f36c06f31e0', FOppositeId='f698af39-f66d-4830-84e2-f1138bdd18bc', FName='功能表數位-功能表',     FOppositeName='功能表-功能表數位',     FUnitId1='e622af1a-9c68-42a8-9059-21f0cf4550a7', FUnitId2='00000000-0000-0000-0001-000000000008', FType='field', FTable='',   FField1='FId', FField2='FMenuId',      FDeleteAction1='unset', FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

insert into TsPage set FId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FName='功能表數位主清單',   FTitle='功能表數位清單', FCode='Qs.MenuNumber.List',       FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/MenuNumber.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.MenuNumber.prepareList', FLoadHandler=null,						FRelationId=null, FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='1ea4b313-5191-4307-8aa7-fe67ebbb5165', FName='功能表數位選擇清單', FTitle='功能表數位清單', FCode='Qs.MenuNumber.SelectList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/MenuNumber.png', FUrl='quicksilver/page/template/EntityList.jsp', FActionMethodName='Qs.MenuNumber.prepareList', FLoadHandler=null,						FRelationId=null, FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FName='功能表數位排序',     FTitle='排序',         FCode='Qs.MenuNumber.Sort',       FPlatform='Computer', FType='Sort',       FIcon='quicksilver/image/unit/MenuNumber.png', FUrl='quicksilver/page/template/Sorter.jsp',     FActionMethodName='Qs.MenuNumber.prepareSort', FLoadHandler=null,						FRelationId=null, FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1, FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;
insert into TsPage set FId='f194cb0b-3ea9-4e62-ab8b-66da260f7d35', FName='功能表數位表單',     FTitle='表單',         FCode='Qs.MenuNumber.Form',       FPlatform='Computer', FType='EntityForm', FIcon='quicksilver/image/unit/Form.png',       FUrl='quicksilver/page/template/EntityForm.jsp', FActionMethodName='Qs.MenuNumber.prepareForm', FLoadHandler='MenuNumberForm.doLoad',	FRelationId=null, FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FMasterUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FIsSlavePage=1, FIndex=1,    FDialogWidth=750,  FDialogHeight=412,  FDialogMaximized=0,    FQueryFormAutoQuery=0, FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments='',   FVisible=1, FVisibleCondition=null, FDescription='';

--功能表數位主清單
insert into TsToolItem set FId='da3eb8be-2292-477c-ada6-4169b949a525', FPageId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FCode='Add',     FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='8772f3f5-398d-4e44-9cd3-9b95374177df', FPageId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='4622c1bf-44b3-4aad-81b4-3f9592cd3b02', FPageId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='82339b9e-1fc2-438a-aa70-cd139f193d8b', FPageId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='4af647f9-db3d-46e7-b676-a437c489a026', FPageId='a72085e1-d14f-4932-b3a4-b5f45c4be902', FCode='Other',   FName=null,   FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='fe58fecb-f1b4-4c09-a201-daf0f4ca8991', FToolItemId='4af647f9-db3d-46e7-b676-a437c489a026', FCode='Sort',        FName='排序',       FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.png',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doSort';
insert into TsToolSubItem set FId='fe2add5a-5c48-4f34-a7f0-e2ac5b485b75', FToolItemId='4af647f9-db3d-46e7-b676-a437c489a026', FCode='ExcelExport', FName='匯出 Excel', FExpandMode='None', FIndex=2, FIcon='quicksilver/image/16/Excel.png',  FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doExcelExport';

--功能表數位選擇清單
insert into TsToolItem set FId='16f1548d-f9ca-422c-b8aa-e216ff8d16fd', FPageId='1ea4b313-5191-4307-8aa7-fe67ebbb5165', FCode='ConfirmSelection', FName='確定', FHint=null,                                                   FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Ok.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doSelectListConfirm';
insert into TsToolItem set FId='c4ac2c2c-6ef6-4d65-9983-a698124f4ba5', FPageId='1ea4b313-5191-4307-8aa7-fe67ebbb5165', FCode='Add',              FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Add.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='e332c59c-489c-436e-aa55-8d385633eaf2', FPageId='1ea4b313-5191-4307-8aa7-fe67ebbb5165', FCode='Open',             FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Open.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';

--功能表數位排序
insert into TsToolItem set FId='fdeec30f-8d15-4cbc-b060-7ab0e8ffd0c7', FPageId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FCode='MoveUp',     FName='上升', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=1, FWidth=0, FIcon='quicksilver/image/16/MoveUp.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveUp';
insert into TsToolItem set FId='c84735c6-54a1-40a1-9f7b-0d88b567ee89', FPageId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FCode='MoveDown',   FName='下降', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=2, FWidth=0, FIcon='quicksilver/image/16/MoveDown.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveDown';
insert into TsToolItem set FId='db40de67-a528-4fff-8524-bed9af00af44', FPageId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FCode='MoveTop',    FName='置頂', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=3, FWidth=0, FIcon='quicksilver/image/16/MoveTop.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveTop';
insert into TsToolItem set FId='276a1c18-9d2f-40b4-8d87-3041af06aabc', FPageId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FCode='MoveBottom', FName='置底', FHint=null, FLabel=null, FType='Button', FAlign='left',  FIndex=4, FWidth=0, FIcon='quicksilver/image/16/MoveBottom.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doMoveBottom';
insert into TsToolItem set FId='3a4d9595-6f1f-4c48-8912-eb2dde1e57b1', FPageId='fc3ad51d-c13d-4877-bbb2-bf45c04fde10', FCode='Save',       FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Sorter.doSave';

--功能表數位表單
insert into TsScript set FId='f04d9c5b-0f7b-4fad-9da2-830410427b1c', FIndex=1, FPageId='f194cb0b-3ea9-4e62-ab8b-66da260f7d35', FUrl='quicksilver/page/menu/MenuNumberForm.js';
insert into TsToolItem set FId='7c76ea2b-d86f-4178-a9bf-df19f403d8cb', FPageId='f194cb0b-3ea9-4e62-ab8b-66da260f7d35', FCode='Save',  FName='保存', FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';

insert into TsForm set FDefault=1, FEditableCondition=null, FGroupMode='Single', FId='1cd57983-b2cc-4fe1-adf8-fde42da4e224', FIndex=1, FName='默認', FPageId=null, FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7';
java setFormFields('1cd57983-b2cc-4fe1-adf8-fde42da4e224', '-', 'b00aa1cf-33d2-4c22-8601-3387947a2b49', null, 'FName,FType,FColor,FBold', '按欄位統計', '4b685fe0-f21e-443c-86d2-998b02cfdf47', null, 'FUserFieldId,FStatusFieldId,FStatusValues', '特殊統計', 'aa67481c-33c7-4e32-a021-289d2faf58c8', null, 'FJavaClass,FArguments');

insert into TsList set FDefault=1, FId='74d8a1b4-3ced-44aa-a1d9-3f9039aa2cce', FIndex=null, FMultiPage=1, FName='功能表數位清單',     FPageId=null,                                   FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7';
insert into TsList set FDefault=0, FId='978818b8-3e76-40fe-a5f0-1b2d57d925f9', FIndex=null, FMultiPage=1, FName='功能表數位選擇清單', FPageId='1ea4b313-5191-4307-8aa7-fe67ebbb5165', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7';
insert into TsList set FDefault=0, FId='f7701994-a5b5-4cea-9270-338c39075f90', FIndex=null, FMultiPage=1, FName='功能表數位首頁清單', FPageId='9b796431-f132-49d1-b306-5d1d618f9c1b', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7';
java setListFields('74d8a1b4-3ced-44aa-a1d9-3f9039aa2cce', 'FName,FType,FUserFieldId,FStatusFieldId,FStatusValues');
java setListFields('978818b8-3e76-40fe-a5f0-1b2d57d925f9', 'FName,FType,FUserFieldId,FStatusFieldId,FStatusValues');
java setListFields('f7701994-a5b5-4cea-9270-338c39075f90', 'FName,FType,FUserFieldId,FStatusFieldId,FStatusValues');

insert into TsSlaveUnitPrivilege set FId='c2abe1fb-57d0-4c1a-b98a-5ac0532d5122', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FCreatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadPrivilegeTypeId='00000000-0000-0000-1005-000000000003', FReadUserFieldName='', FUpdatePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FUpdateUserFieldName='', FDeletePrivilegeTypeId='00000000-0000-0000-1005-000000000003', FDeleteUserFieldName='';

insert into TsPage set FId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FName='功能表數位清單', FTitle='功能表數位',   FCode='Qs.Menu.MenuNumberList', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/MenuNumber.png', FUrl='quicksilver/page/template/EntityList.jsp',  FActionMethodName='Qs.MenuNumber.prepareList',          FLoadHandler=null,              FRelationId='f698af39-f66d-4830-84e2-f1138bdd18bc', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FMasterUnitId='00000000-0000-0000-0001-000000000008', FIsSlavePage=1, FIndex=2,    FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1,    FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;

--功能表功能表數位清單
insert into TsToolItem set FId='cd05e406-60bf-4fb5-8ef2-f0bcbc258b1d', FPageId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FCode='Add',     FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='fdd614a1-b72e-4f66-b48a-49e99c119dc1', FPageId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='df3ecd97-645b-43d6-9935-52dfeec627c3', FPageId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.png',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='550f9e7c-c11c-44d0-8136-b1a9c6c6d220', FPageId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';
insert into TsToolItem set FId='9e6b5471-d2c8-4276-8b69-7386c1859f91', FPageId='6454ab8c-a99a-44ec-8591-f13ef29c06a7', FCode='Other',   FName=null,   FHint=null,                                                   FLabel=null, FType='ComboButton', FAlign='right', FIndex=5, FWidth=0, FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler=null;
insert into TsToolSubItem set FId='3cace005-ebff-4921-b37c-3335a00fea33', FToolItemId='9e6b5471-d2c8-4276-8b69-7386c1859f91', FCode='Sort',        FName='排序',       FExpandMode='None', FIndex=1, FIcon='quicksilver/image/16/Sort.png',   FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FEventHandler='EntityList.doSort';

--資料移動

update TsMenuNumber set FIndex = FIndex + 1;

insert into TsMenuNumber
(FId, FMenuId, FIndex, FType, FUserFieldId, FStatusFieldId, FStatusValues)
select uuid(), m.FId, 1, 'Field', uf.FId, sf.FId, ''
from TsMenu m
	inner join TsField uf on uf.FUnitId = m.FCountUnitId and uf.FName = m.FCountUserField
	left join TsField sf on sf.FUnitId = m.FCountUnitId and sf.FName = m.FCountStatusField
where uf.FId is not null
	and not exists (select * from TsMenuNumber where FMenuId = m.FId);

update TsMenuNumber
set FStatusValues = (select FCountStatus1 from TsMenu where FId = TsMenuNumber.FMenuId)
where FIndex = 1 and exists (select * from TsMenu where FId = TsMenuNumber.FMenuId and FCountStatus1 is not null and trim(FCountStatus1) <> '');

update TsMenuNumber
set FStatusValues = case
		when FStatusValues = '' then (select FCountStatus2 from TsMenu where FId = TsMenuNumber.FMenuId)
		else FStatusValues || ',' || (select FCountStatus2 from TsMenu where FId = TsMenuNumber.FMenuId)
	end
where FIndex = 1 and exists (select * from TsMenu where FId = TsMenuNumber.FMenuId and FCountStatus2 is not null and trim(FCountStatus2) <> '');

update TsMenuNumber
set FStatusValues = case
		when FStatusValues = '' then (select FCountStatus3 from TsMenu where FId = TsMenuNumber.FMenuId)
		else FStatusValues || ',' || (select FCountStatus3 from TsMenu where FId = TsMenuNumber.FMenuId)
	end
where FIndex = 1 and exists (select * from TsMenu where FId = TsMenuNumber.FMenuId and FCountStatus3 is not null and trim(FCountStatus3) <> '');

update TsMenuNumber
set FStatusValues = case
		when FStatusValues = '' then (select FCountStatus4 from TsMenu where FId = TsMenuNumber.FMenuId)
		else FStatusValues || ',' || (select FCountStatus4 from TsMenu where FId = TsMenuNumber.FMenuId)
	end
where FIndex = 1 and exists (select * from TsMenu where FId = TsMenuNumber.FMenuId and FCountStatus4 is not null and trim(FCountStatus4) <> '');

update TsField set FVisible=0 where FUnitId='00000000-0000-0000-0001-000000000008' and FName like 'FCount%';
