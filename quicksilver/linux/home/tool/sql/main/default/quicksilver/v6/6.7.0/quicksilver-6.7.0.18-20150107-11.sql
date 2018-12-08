--minglei

--bugfix

update TsParameterDefinition set FName='列表是否載入時查詢', FCode='QsListQueryOnLoad' where FCode='QsListAutoQuery';
update TsSystemParameter set FKey='QsListQueryOnLoad' where FKey='QsListAutoQuery';

--Qs.SystemMessage

delete from TsToolSubItem where FId='6e2a85cc-29cd-4576-87f8-8c009ae61aeb';
delete from TsToolSubItem where FId='e2c9ba81-2f57-4463-a875-9cc6a4dfd120';
delete from TsToolSubItem where FId='ccbb00f2-7951-41c5-a30f-c2cd659775ec';
update TsToolSubItem set FIndex = FIndex + 3 where FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4';
insert into TsToolSubItem set FId='6e2a85cc-29cd-4576-87f8-8c009ae61aeb', FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FCode='OpenSystemMessageRemind',	FName='打開系統消息提醒',		FExpandMode='None', FIndex=1, FIcon='quicksilver/image/unit/SystemMessage.gif',	FEventHandler='MainFrame.doOpenSystemMessageRemind',	FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='e2c9ba81-2f57-4463-a875-9cc6a4dfd120', FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FCode='OpenSystemMessageList',	FName='打開系統消息清單',		FExpandMode='None', FIndex=2, FIcon='quicksilver/image/unit/SystemMessage.gif',	FEventHandler='MainFrame.doOpenSystemMessageList',		FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolSubItem set FId='ccbb00f2-7951-41c5-a30f-c2cd659775ec', FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FCode='Splitter1',				FName='-',						FExpandMode='None', FIndex=3, FIcon=null,										FEventHandler=null,										FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;

insert into TsTextResource set FId='87a417f7-2306-4dd5-a25e-341a298d4a13', FCode='T.Jui.MessageReminder.DefaultTitle',					FValue='即時提醒';
insert into TsTextResource set FId='07b6f25e-fa16-48a9-9803-4437c7145839', FCode='T.Qs.SystemMessage.NoWaitingItems',					FValue='沒有未讀的系統消息。';

insert into TsMenu set		FId='2652fb74-e3a1-49fa-9962-ba7fa7d93ce2', FParentId='00000000-0000-0000-0008-010000000020',	FIndex=4,	FName='系統消息',		FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/SystemMessage.gif';

java refreshSerial('TsMenu');

delete from TsSystemMessage;

update TsUnit set FNameField='FContent' where FCode='Qs.SystemMessage';

alter table TsSystemMessage drop FUnread;
alter table TsSystemMessage drop FSubject;
alter table TsSystemMessage alter FContent set data type varchar(200);
alter table TsSystemMessage add FTimeoutTime timestamp;
alter table TsSystemMessage add FRead bit;
alter table TsSystemMessage add FTimeout bit;
alter table TsSystemMessage add FUnitId uuid;
alter table TsSystemMessage add FEntityId uuid;

delete from TsField where FId='5633c783-8248-4a7e-8f9b-78c36038fe58'; --FSubject

update TsField set FName='FRead', FTitle='已讀', FListWidth=40, FDefaultValue='0' where FId='d6ae6e8f-46a6-443c-afc5-bb378c597ac8';
update TsField set FSize=200, FRowSpan=6 where FId='6ab1d9a4-1eac-486d-9d79-75c8aaa1ab76'; --FContent
update TsField set FListWidth=130 where FId='fdd451ae-bd80-496e-a8a9-67106d606fd8'; --FSendTime
delete from TsField where FId='ae7c92f5-04a8-47e2-bf2f-ed69e9904909';
delete from TsField where FId='26b5a6c2-f8ab-4d9b-b826-293ee76183cf';
delete from TsField where FId='6198e1cc-1797-4d82-9571-08ad0752b9a0';
delete from TsField where FId='c8967c09-0612-4b2b-a95b-cf5f8a036db8';
delete from TsField where FId='b118400a-0117-47fb-82ba-f8dad97e0562';
insert into TsField set FId='ae7c92f5-04a8-47e2-bf2f-ed69e9904909', FUnitId='00000000-0000-0000-0001-000000000024', FName='FTimeoutTime',	FTitle='超時時間',	FType='DateBox-DateTime',	FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FAlwaysBringDataToClient=1;
insert into TsField set FId='26b5a6c2-f8ab-4d9b-b826-293ee76183cf', FUnitId='00000000-0000-0000-0001-000000000024', FName='FTimeout',		FTitle='超時',		FType='CheckBox',			FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=40,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='0',  FValidation=null, FRelationCapacity=null;
insert into TsField set FId='6198e1cc-1797-4d82-9571-08ad0752b9a0', FUnitId='00000000-0000-0000-0001-000000000024', FName='FEntityId',		FTitle='實體',		FType='InputBox-Uuid',		FSize=0,	FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=0, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FAlwaysBringDataToClient=1;
insert into TsField set FId='c8967c09-0612-4b2b-a95b-cf5f8a036db8', FUnitId='00000000-0000-0000-0001-000000000024', FName='FUnitId',		FTitle='單元',		FType='EntityBox',			FSize=0,	FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId='00000000-0000-0000-0001-000000000001', FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FAlwaysBringDataToClient=1;
insert into TsField set FId='b118400a-0117-47fb-82ba-f8dad97e0562', FUnitId='00000000-0000-0000-0001-000000000024', FName='FWaiting',		FTitle='待讀',		FType='CheckBox',			FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='sql',   FJoinField=null, FSourceField=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=40,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null, FRelationCapacity=null, FSource='case when FRead = 0 and FTimeout = 0 then 1 else 0 end';

update TsPage set FDialogHeight=322, FLoadHandler='SystemMessageForm.doLoad' where FCode='Qs.SystemMessage.Form';
update TsScript set FUrl='quicksilver/page/message/SystemMessageForm.js' where FUrl='quicksilver/page/message/SystemMessageEdit.js';
delete from TsToolItem where FId='985e85f0-7341-479d-9b29-95f0dab265fe'; --SystemMessageForm.Save

update TsPage set FLoadHandler='SystemMessageList.doLoad' where FCode='Qs.SystemMessage.List';
delete from TsScript where FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29';
insert into TsScript set FId='5d2da7d1-b804-4a0c-8a54-50a6f1acbbba', FIndex=1, FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FUrl='quicksilver/page/message/SystemMessage.js';
insert into TsScript set FId='ec9cbe74-d62f-4bcf-87be-e65f0bd57796', FIndex=2, FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FUrl='quicksilver/page/message/SystemMessageList.js';
delete from TsToolItem where FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29';
insert into TsToolItem set FId='9f369ce3-2bd1-4748-8ab1-bbb64f4300ef', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Open',				FName='打開',                       FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FDefaultEventHandler='SystemMessageList.doOpen',		  FIcon='quicksilver/image/16/Open.png',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3be25147-5e73-4652-a94e-74fad82052b5', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Refresh',				FName='刷新',                       FLabel=null, FType='Button',             FAlign='right', FIndex=4, FWidth=0,   FDefaultEventHandler='EntityList.doRefresh',           FIcon='quicksilver/image/16/Refresh.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='7e598a03-e571-4cc7-b046-e440f0345e55', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Other',				FName=null,                         FLabel=null, FType='ComboButton',        FAlign='right', FIndex=5, FWidth=0,   FDefaultEventHandler=null,                             FIcon='quicksilver/image/16/Other.png',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;

java setOrderFields('00000000-0000-0000-0001-000000000024', 'FSendTime', '1');
java setFormFields('8367a192-26e9-4393-8cb3-a67173e4b3e4', '基本資訊', '78717c84-e36e-4254-b6d2-26b75d0bbed2', null, 'FSendTime,FTimeoutTime,FContent');
java setListFields('40a60b42-0eb1-4d1a-b60d-38d41502269e', 'FRead,FTimeout,FSendTime,FContent');
java setListFields('d9db5130-b39b-4947-bcc5-4909ae9c1336', 'FSendTime,FContent');

delete from TsQuerySchema where FId='dc65373b-11fe-4d3c-910b-8a0bc1488286'; --系統消息我的最愛
alter table TsNotice alter FSystemMessageContent set data type varchar(500);
update TsField set FSize=500 where FId='1cb5b11d-6172-490f-81e0-686ad63b0c91';

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9' and FIndex >= 5;
insert into TsParameterDefinition set FId='83e90600-923f-4770-b132-8a56a6e00ad1', FName='系統消息保留天數',				FCode='QsSystemMessageKeepDays',			FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Integer', 	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=5;
insert into TsSystemParameter set FId='6bd1628b-d818-49bf-9588-3a5d04e00e49', FKey='QsSystemMessageKeepDays',			FValue='15';

--Wf.Node

alter table TwNode add FAutoCompleteTimeLength int;
alter table TwNode add FAutoCompleteTimeType varchar(10);
alter table TwNode add FInstant bit;
alter table TwNode add FPageLoadHandler varchar(100);
update TwNode set FAutoCompleteTimeLength=FAutoCompleteHours, FAutoCompleteTimeType='hour' where FAutoCompleteMode='FinishActivity' and FAutoCompleteTimeLength is null;
--alter table TwNode drop FAutoCompleteHours;

insert into TsDictionaryItem set FId='538da9c9-e8b1-4432-a5c3-6b3ea582f3de', FDictionaryId='3dba32fc-8d83-4cb7-a620-cec84c7f97ee', FValue='second',				FText='秒',		FIndex=6;
update TsDictionaryItem set FValue='day' where FDictionaryId='3dba32fc-8d83-4cb7-a620-cec84c7f97ee' and FValue='date';
update TsTimer set FIntervalType='day' where FIntervalType='date';

delete from TsField where FId='190e74dd-c992-4680-a2c8-e4ca5645120f';
delete from TsField where FId='57acedee-f1a5-43dc-a038-3b475d1d8f06';
delete from TsField where FId='b1e21632-15f5-4ee1-84b8-a90afb71b442';
delete from TsField where FId='a67e397f-eadb-4f94-9f99-eb1858be6ced';
insert into TsField set FId='190e74dd-c992-4680-a2c8-e4ca5645120f', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FAutoCompleteTimeLength',	FTitle='超時時間長度',		FType='InputBox-Integer',    FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null,                                                                                                 FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='57acedee-f1a5-43dc-a038-3b475d1d8f06', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FAutoCompleteTimeType',		FTitle='超時時間類型',		FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='3dba32fc-8d83-4cb7-a620-cec84c7f97ee', FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null,                                                                                                 FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='b1e21632-15f5-4ee1-84b8-a90afb71b442', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FInstant',					FTitle='即時處理',			FType='CheckBox',			 FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='a67e397f-eadb-4f94-9f99-eb1858be6ced', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FPageLoadHandler',			FTitle='頁面載入函數',		FType='InputBox-Text',		 FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setEditFields('6df4a7d7-e1a4-4306-ae26-dc6be86dee45', 'FName,FCode,FAutoFinish,FJoinMode,FJoinConditionType,FJoinCondition,FAutoCompleteMode,FAutoCompleteResult,FAutoCompleteTimeLength,FAutoCompleteTimeType');
java setEditFields('ae542383-9d52-43d7-8940-962af2465fbb', 'FName,FCode,FMultiWorkItem,FJoinMode,FJoinCondition,FJoinConditionType,FUrl,FUrlType,FPrivilegeId,FExpectedResult,FSupportClone,FSupportTransfer,FDeputeMode,FAutoCompleteMode,FAutoCompleteResult,FAutoCompleteTimeLength,FAutoCompleteTimeType,FDeputeHours,FInstant,FPageLoadHandler');
java setFormFields('dc16b2d8-e4e9-4801-926f-7b9479d7146c', '-', '38720435-2b81-4bbf-8288-591d481ab509', null, 'FName,FCode,FMultiWorkItem,FExpectedResult,FAutoFinish', '聚合', 'a78770f1-5a4e-4b1e-b081-1b03002e6c02', null, 'FJoinMode,FJoinConditionType,FJoinCondition', '自動完成設置', '5cfe8dda-fb78-4d1c-8e8f-8af8a0f72b1c', null, 'FAutoCompleteMode,FAutoCompleteResult,FAutoCompleteTimeLength,FAutoCompleteTimeType', '代理設置', '50496f53-fe5c-4861-a33e-2f20c2bffd52', null, 'FDeputeMode,FDeputeHours', '其它', '941b466d-e4f5-48f3-965c-d37e30a05daf', null, 'FPrivilegeId,FInstant');
java setFormFields('f2a2f17c-4860-4ce2-8edb-3c0822bc2d04', 'FUrlType,FUrl,FPageLoadHandler,FSupportClone,FSupportTransfer');
java setListFields('d10d89d8-ff83-4b64-80a8-3c1bf462239d', 'FName,FCode,FDeputeMode,FAutoCompleteMode,FAutoCompleteTimeLength,FAutoCompleteTimeType,FDeputeHours');

insert into TsTextResource set FId='0068f219-7807-4456-ba01-03d26e3efbe0', FCode='T.Wf.Activity.InstantActivityFinished',				FValue='處理完畢';
insert into TsTextResource set FId='732664c3-1463-4349-af19-2b713f99205f', FCode='T.Wf.Activity.InstantWaitCountdown',					FValue='請等待 ${0} 秒';
insert into TsTextResource set FId='318e6a01-369c-446a-bf0c-934d40c85da3', FCode='T.Wf.Activity.QueryInstantResult',					FValue='查詢處理結果...';

--Qs.Notice

alter table TsNotice add FSystemMessageFieldValues varchar(200);
insert into TsField set FId='c6c9e8d7-2168-4c66-abbf-3d84be7726a1', FUnitId='00000000-0000-0000-0001-000000000023', FName='FSystemMessageFieldValues',	FTitle='系統消息欄位元值',	FType='TextBox',       FSize=200,		FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=5, FIsNewRow=null, FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0, FDefaultValue='{FUnitId:null, FEntityId:null, FTimeoutTime:null}';

insert into TsTextResource set FId='fe7a99b9-e42f-473f-9791-3ca9dc16e154', FCode='T.Qs.FieldGroup.AdvancedConfig',						FValue='高級設置';

update TsNotice set FSendSystemMessage=1, FSystemMessageContent='您有新的待辦事項。流程：${process.FName}，啟動者：${process.FUserId.FName}。',			FSystemMessageFieldValues='{FUnitId:${activity.FEntityUnitId}, FEntityId:${activity.FEntityId}, FTimeoutTime:${activity.FTimeoutTime}}' where FId='4bac11b3-6779-4cdc-992d-fd843634f9f8';
update TsNotice set FSendSystemMessage=1, FSystemMessageContent='您提交的流程“${process.FName}”已經完成。'												where FId='5da6c6f9-053d-4bb6-a554-bdce5df5e029';
update TsNotice set FSendSystemMessage=1, FSystemMessageContent='您提交的流程“${process.FName}”被強制終止。操作人：${process.FTerminatorId.FName}。'	where FId='649a7798-4ca8-4f2c-a902-72560f9e23bb';

--Wf.Activity

alter table TwActivity add FInstant bit;
alter table TwActivity add FWaitingUserId uuid;
insert into TsField set FId='6a040338-bcd1-4262-9bf0-db639d73b42e', FUnitId='00000000-0000-0000-0001-000000003004', FName='FInstant',		FTitle='即時處理',			FType='CheckBox',				FSize=0,    FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='253c1ced-4c0a-4718-9bc8-dae8fbedeee6', FUnitId='00000000-0000-0000-0001-000000003004', FName='FWaitingUserId',	FTitle='前端等待用户ID',	FType='InputBox-Uuid',			FSize=0,    FVisible=0, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=0, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
