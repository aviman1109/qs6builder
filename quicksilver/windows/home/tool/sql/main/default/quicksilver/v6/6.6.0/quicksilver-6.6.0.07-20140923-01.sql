--minglei

--Timer Arguments

alter table TsTimer add FArguments varchar(200);
insert into TsField set FId='225348e7-9654-4672-8828-a543347b3eab', FUnitId='00000000-0000-0000-0001-000000000022', FName='FArguments',				FTitle='參數',			   FType='TextBox',             FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=3, FIsNewRow=null, FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
java setFormFields('fad82588-f46b-4b0c-9b9d-a22e98a00354', '基本資訊', '04d7c872-3fb2-4614-9485-5894185700a1', null, 'FName,FType,FRoutine,FArguments', '時間資訊', 'df2264d3-cdf7-46e5-b9a8-1493e5a3337f', '04d7c872-3fb2-4614-9485-5894185700a1', 'FBaseTime,FIntervalType,FIntervalLength,FLastTime,FNextTime', '控制選項', '4316b02b-73f5-42d5-b5a5-36c334d5536c', '04d7c872-3fb2-4614-9485-5894185700a1', 'FSystemStartupAction,FMonthEnd,FAllowConcurrentRun,FEnabled');

update TsPage set FLoadHandler='TimerForm.doLoad' where FCode='Qs.Timer.Form';
update TsScript set FUrl=replace(FUrl, 'TimerEdit', 'TimerForm') where FPageId='0953493e-d9f6-4f0e-a9a5-21a36b3fd97b';
update TsToolItem set FDefaultEventHandler=replace(FDefaultEventHandler, 'TimerEdit', 'TimerForm') where FPageId='0953493e-d9f6-4f0e-a9a5-21a36b3fd97b';

--TabStrip

insert into TsTextResource set FId='9e2f856d-2fa8-419c-97d0-95a79a80b4ee', FCode='T.Jui.TabStrip.LockTab',								FValue='固定標籤頁';
insert into TsTextResource set FId='f924e5f4-5bcf-4698-a48c-c06092e299b7', FCode='T.Jui.TabStrip.UnlockTab',							FValue='取消固定標籤頁';
insert into TsTextResource set FId='3e96e6b5-b2a5-4b80-aee1-b222a0757e6b', FCode='T.Jui.TabStrip.CloseTab',								FValue='關閉標籤頁';
insert into TsTextResource set FId='2887bb0c-5c3d-4c0e-ab64-4ee88db07d6c', FCode='T.Jui.TabStrip.CloseOtherTabs',						FValue='關閉其它標籤頁';
insert into TsTextResource set FId='37c3bcb8-c25e-44fb-8c24-e65822e4b1a2', FCode='T.Jui.TabStrip.CloseRightTabs',						FValue='關閉右側標籤頁';

--Search Menu

insert into TsToolItem set FId='191d4713-843c-4b4c-b6ee-ac9c83e2d07c', FPageId='5d90172c-155e-4e52-bded-9d2c61b19a44', FCode='SearchMenu', FName='搜索功能表',		FLabel='', FType='Button',      FAlign='left',  FIndex=2, FWidth=0, FDefaultEventHandler='MainFrame.doSearchMenuClick', FIcon='quicksilver/image/16/Search.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null,                                   FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsTextResource set FId='3a4a3f6b-cae5-4c40-bcd7-d388cbe1be2c', FCode='T.Public.KeywordBoxEmptyText',						FValue='請輸入關鍵字並按回車鍵';

--Menu Expand Level

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex > (select FIndex from TsParameterDefinition where FCode='QsMenuWidth');
insert into TsParameterDefinition set FId='bb12d1e3-0ab5-47b0-b3b0-e62e28cf0911', FName='功能表默認展開層數',			FCode='QsMenuExpandLevel',					FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=9;
insert into TsSystemParameter set FId='45d5e97d-61ba-477c-ae6f-61ca527e4880', FKey='QsMenuExpandLevel',					FValue='2';

--TsMenu.FAlwaysOpenNewTab

alter table TsMenu add FAlwaysOpenNewTab bit;
insert into TsField set FId='793e07bc-9841-4ece-ada2-978be2a36336', FUnitId='00000000-0000-0000-0001-000000000008', FName='FAlwaysOpenNewTab',	FTitle='總是打開新頁簽',		FType='CheckBox',            FSize=0,	FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,        FValidation=null;
java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FType,FEnabled,FIcon', '頁簽', '959840c4-fce5-406d-b761-f7ca735a77cd', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FTabTitleSource,FTabTitle,FAlwaysOpenNewTab', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FQueryFormHidden,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine', '數值推送', 'bed706e5-6954-4834-8d08-3f95483d2348', null, 'FCountType', '按欄位統計', 'd05ec7f7-f7e6-444b-946b-25f10f57427a', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountUnitId,FCountUserField,FCountStatusField,FCountStatus1,FCountStatus2,FCountStatus3,FCountStatus4', '特殊統計', 'b952ada0-aad2-4343-9db5-2a89e9035357', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountJavaClass');

--Attachment

insert into TsTextResource set FId='36da0834-c122-4871-b248-982c9013b5b9', FCode='E.Qs.Attachment.CannotDeleteForOtherUser',			FValue='您不能刪除其他使用者的附件。';

--TsFieldGroup.FCollapse

alter table TsFieldGroup add FCollapse bit;
insert into TsField set FId='d88cef5a-7e08-49e6-b807-a826c59c205f', FUnitId='00000000-0000-0000-0001-000000000003', FName='FCollapse',	 FTitle='默認折疊',	FType='CheckBox',         FSize=0,	 FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsTextResource set FId='cb92d1d3-cae8-4290-b575-283316bf38f5', FCode='T.Qs.FieldGroup.Collapse',							FValue='默認折疊';
update TsPage set FDialogWidth=400, FDialogHeight=200 where FCode='Qs.FieldGroup.Form';
