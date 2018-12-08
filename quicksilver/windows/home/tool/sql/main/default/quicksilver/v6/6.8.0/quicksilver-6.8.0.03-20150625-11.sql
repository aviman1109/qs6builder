--minglei

insert into TsTextResource set FId='3bddd646-cfe0-4b71-bc77-d0fbea5feb35', FCode='E.Advanced.MongoDb.DataSourceNotExist',				FValue='ID 為“${0}”的 MongoDB 資料來源不存在。';
insert into TsTextResource set FId='7d96c849-0d75-4961-b42e-bb0b968e9953', FCode='E.Advanced.MongoDb.HomeNotInitialized',				FValue='MongoHome 尚未初始化。';
insert into TsTextResource set FId='1f2b11f8-20e2-4e53-b666-e8226278283e', FCode='E.Advanced.MongoDb.InitFailed',						FValue='MongoDB 初始化失敗。';

insert into TsTextResource set FId='28f4b4d4-2d4b-4a5b-b6d4-3126bc096876', FCode='E.Basic.Xml.EmptyText',								FValue='XML 節點“${0}”的值不能為空。';
insert into TsTextResource set FId='3427e982-b310-4632-b309-6993809c5c96', FCode='E.Basic.Xml.NodeMissing',								FValue='XML 必須包含節點“${0}”。';

delete from TsTextResource where FId='07b6f25e-fa16-48a9-9803-4437c7145839';
insert into TsTextResource set FId='07b6f25e-fa16-48a9-9803-4437c7145839', FCode='T.Qs.SystemMessage.NoNewItems',						FValue='沒有未讀的系統消息。';

update TsToolItem set FIndex = FIndex + 1 where FPageId='5d90172c-155e-4e52-bded-9d2c61b19a44' and FAlign='right';
delete from TsToolItem where FId='db814cae-6c66-44b1-bb34-ec1e63202161';
insert into TsToolItem set FId='db814cae-6c66-44b1-bb34-ec1e63202161', FPageId='5d90172c-155e-4e52-bded-9d2c61b19a44', FCode='SystemMessage',   FName='系統消息',			FLabel='', FType='Button',		FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='MainFrame.doOpenSystemMessageList',		FIcon='quicksilver/image/unit/Notice.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null,                                   FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
delete from TsToolSubItem where FId='6e2a85cc-29cd-4576-87f8-8c009ae61aeb';
delete from TsToolSubItem where FId='ccbb00f2-7951-41c5-a30f-c2cd659775ec';
delete from TsToolSubItem where FId='e2c9ba81-2f57-4463-a875-9cc6a4dfd120';

delete from TsToolItem where FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29';
insert into TsToolItem set FId='9f369ce3-2bd1-4748-8ab1-bbb64f4300ef', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Open',				FName='打開',                       FLabel=null, FType='Button',             FAlign='right', FIndex=1, FWidth=0,   FDefaultEventHandler='SystemMessageList.doOpen',		  FIcon='quicksilver/image/16/Open.png',		FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='d78e0061-9a4a-4b1c-87d0-e069f0ffe6b1', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='ReadAll',				FName='全部標為已讀',               FLabel=null, FType='Button',             FAlign='right', FIndex=2, FWidth=0,   FDefaultEventHandler='SystemMessageList.doReadAll',	  FIcon='quicksilver/image/16/EmailRead.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3be25147-5e73-4652-a94e-74fad82052b5', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Refresh',				FName='刷新',                       FLabel=null, FType='Button',             FAlign='right', FIndex=3, FWidth=0,   FDefaultEventHandler='EntityList.doRefresh',           FIcon='quicksilver/image/16/Refresh.png',		FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='7e598a03-e571-4cc7-b046-e440f0345e55', FPageId='7078d9d5-111b-43d0-a8f3-44fa57074e29', FCode='Other',				FName=null,                         FLabel=null, FType='ComboButton',        FAlign='right', FIndex=4, FWidth=0,   FDefaultEventHandler=null,                             FIcon='quicksilver/image/16/Other.png',		FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;

update TsQuerySchema set FIndex=2 where FId='316dda0d-1191-48be-a767-72706e65b10e';
insert into TsQuerySchema set FId='9d91d631-5948-446b-bab4-da8c3ffd8d90', FUnitId='00000000-0000-0000-0001-000000000024', FName='未讀系統消息', FType='condition', FPublic=1, FTemp=0, FGlobalAutoQuery=0, FShare=0,    FUserId=null, FConditionId='4a01d8c4-a33c-4158-bb15-d82bc338feda', FSqlSource='None', FSql='',   FIndex=1, FVisible=1;
