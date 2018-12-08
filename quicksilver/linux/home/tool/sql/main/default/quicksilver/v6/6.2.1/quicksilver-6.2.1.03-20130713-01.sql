delete from TsTextResource where FId='47bdde39-2c07-4430-81f6-83246352d17b';
delete from TsTextResource where FId='24eb64df-a37b-408f-a37b-46279ed89c73';
delete from TsTextResource where FId='8b2b6a5a-5ea1-45f1-b8e9-3aa04c0c5def';
delete from TsTextResource where FId='6fade42a-f0b9-4ba1-b030-c62848be5812';
delete from TsTextResource where FId='e72d5e6a-6f7d-4ba9-8c6a-ba4349ae61bc';
insert into TsTextResource set FCode='T.Public.CannotDeleteNewDataAlert',					FId='47bdde39-2c07-4430-81f6-83246352d17b', FValue='数据尚未保存，无需删除。';
insert into TsTextResource set FCode='T.Qs.Misc.OnlineArgsFromEmailInfo',					FId='24eb64df-a37b-408f-a37b-46279ed89c73', FValue='您已经登录系统。请在系统中，点击右上的下拉图标，并选择“打开来自邮件的页面”。';
insert into TsTextResource set FCode='T.Qs.Misc.NoOnlineArgsFromEmail',						FId='8b2b6a5a-5ea1-45f1-b8e9-3aa04c0c5def', FValue='没有要打开的页面，请首先点击邮件中的相关链接。';
insert into TsTextResource set FCode='T.Wf.WorkItem.CloneTemplate',							FId='6fade42a-f0b9-4ba1-b030-c62848be5812', FValue='${0}加签';
insert into TsTextResource set FCode='T.Wf.WorkItem.TransferTemplate',						FId='e72d5e6a-6f7d-4ba9-8c6a-ba4349ae61bc', FValue='${0}转办';

java setOrderFields('6ea3572b-c3ea-49cb-bb78-48ac163bfb03', 'FTime', '1');
java setQueryFormFields('6ea3572b-c3ea-49cb-bb78-48ac163bfb03', 'FTime,FLevel,FPosition,FUserId,FName,FDescription');

delete from TsPage where FId='0491c23f-c2ed-48ba-9713-3f9106a56d92';
insert into TsPage set FId='0491c23f-c2ed-48ba-9713-3f9106a56d92', FName='打开来自邮件的页面',	FTitle='打开页面',	    FCode='Qs.Misc.OpenPageFromEmail',	   FType='Other', FIcon=null,												FUrl='quicksilver/page/misc/OpenPageFromEmail.jsp',		FActionMethodName='Qs.Misc.prepareOpenPageFromEmail',		FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsToolItem where FId='ee56ccf6-93e4-49db-b71a-5418b0b680a4';
delete from TsToolSubItem where FId='48bf295e-6184-47fe-acd9-535560f70e76';
insert into TsToolItem set FId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FPageId='5d90172c-155e-4e52-bded-9d2c61b19a44', FCode='Other',      FName='',              FLabel='', FType='ComboButton', FAlign='right', FIndex=4, FWidth=0, FDefaultEventHandler=null,                          FIcon='quicksilver/image/16/Other.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null,                                   FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='48bf295e-6184-47fe-acd9-535560f70e76', FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FCode='OpenPageFromEmail',	FName='打开来自邮件的页面',		FExpandMode='None', FIndex=1, FIcon='quicksilver/image/unit/Page.gif',	FEventHandler='MainFrame.doOpenPageFromEmail',	FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

alter table TwWorkItem add FFromType varchar(10);
alter table TwWorkItem add FFromUserName varchar(50);
alter table TwWorkItem add FToUserName varchar(50);
delete from TsField where FId='55d51762-9666-47a2-acb5-e622dd17a121';
delete from TsField where FId='b56d1006-40a6-4906-be3d-8656f1bda0df';
delete from TsField where FId='dd86648b-cef3-45ae-955d-8287399ee7bf';
insert into TsField set FId='55d51762-9666-47a2-acb5-e622dd17a121', FUnitId='00000000-0000-0000-0001-000000003005', FName='FFromType',        FTitle='来源类型',   FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId='1a12fdfe-9817-4013-98de-e608e7381211', FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='b56d1006-40a6-4906-be3d-8656f1bda0df', FUnitId='00000000-0000-0000-0001-000000003005', FName='FFromUserName',	  FTitle='来自',       FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='dd86648b-cef3-45ae-955d-8287399ee7bf', FUnitId='00000000-0000-0000-0001-000000003005', FName='FToUserName',	  FTitle='转办',       FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

delete from TsDictionary where FId='1a12fdfe-9817-4013-98de-e608e7381211';
delete from TsDictionaryItem where FId='e35d56bc-6bab-4afb-bc81-7a9585f22201';
delete from TsDictionaryItem where FId='34b9f76e-998e-40d9-a56e-9df452d59141';
delete from TsDictionaryItem where FId='c0237420-8b57-4238-97a2-6a660e17356a';
insert into TsDictionary set FId='1a12fdfe-9817-4013-98de-e608e7381211', FName='QS-工作项-来源类型', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='e35d56bc-6bab-4afb-bc81-7a9585f22201', FDictionaryId='1a12fdfe-9817-4013-98de-e608e7381211', FValue='Normal',					FText='常规',		FIndex=1;
insert into TsDictionaryItem set FId='34b9f76e-998e-40d9-a56e-9df452d59141', FDictionaryId='1a12fdfe-9817-4013-98de-e608e7381211', FValue='Clone',					FText='加签',		FIndex=2;
insert into TsDictionaryItem set FId='c0237420-8b57-4238-97a2-6a660e17356a', FDictionaryId='1a12fdfe-9817-4013-98de-e608e7381211', FValue='Transfer',				FText='转办',		FIndex=3;
