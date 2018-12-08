﻿delete from TsTextResource where FId='b3a77dfc-6b00-4411-aef9-d08fc4b7c480';
insert into TsTextResource set FCode='E.Qs.Entity.CannotDeleteBuiltin',						FId='b3a77dfc-6b00-4411-aef9-d08fc4b7c480', FValue='不能删除内建的${0}。';

delete from TsPage where FId='df646dde-b009-476a-aada-af580158b71f';
insert into TsPage set FId='df646dde-b009-476a-aada-af580158b71f', FName='磁盘文件阅览Flash页面',	FTitle='阅览',			FCode='Qs.DiskFile.FlashPreview',	FPlatform='Computer', FType='Other',		FIcon='quicksilver/image/unit/Attachment.gif',	FUrl='quicksilver/page/attachment/DiskFileFlashPreview.jsp',	FActionMethodName='',							FLoadHandler=null, FRelationId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FMasterUnitId=null,								   FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsTextResource where FId='f8792997-b780-4bd9-9774-610fb9ba226d';
delete from TsTextResource where FId='93e2c0cf-59f4-499b-b92e-174ab38d8c97';
delete from TsTextResource where FId='dd9cfdaf-0b42-4a05-9b96-e767fe73cf49';
delete from TsTextResource where FId='b410af51-f31f-485f-93bd-359389e656d0';
insert into TsTextResource set FCode='T.Qs.DiskFile.FileDeleted',							FId='f8792997-b780-4bd9-9774-610fb9ba226d', FValue='文件已被删除。';
insert into TsTextResource set FCode='T.Qs.DiskFile.Preview.NotSupportable',				FId='93e2c0cf-59f4-499b-b92e-174ab38d8c97', FValue='不支持阅览该类型的文件。';
insert into TsTextResource set FCode='T.Qs.DiskFile.Preview.HasError',						FId='dd9cfdaf-0b42-4a05-9b96-e767fe73cf49', FValue='无法预览该文件。';
insert into TsTextResource set FCode='T.Qs.DiskFile.Preview.WaitForGeneration',				FId='b410af51-f31f-485f-93bd-359389e656d0', FValue='在线阅览正在处理中，请稍后再试。';

delete from TsSystemParameter where FId='64f62d04-df93-42c1-8a94-a010b5091995';
insert into TsSystemParameter set FId='64f62d04-df93-42c1-8a94-a010b5091995', FKey='QsAttachmentUnitCode',			FValue='Qs.Attachment';

delete from TsToolItem where FPageId in (select FId from TsPage where FCode='Qs.ToolSubItem.Sort');
delete from TsPage where FCode='Qs.ToolSubItem.Sort';
insert into TsPage set FId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FName='工具条子项排序界面', FTitle='排序',           FCode='Qs.ToolSubItem.Sort',	   FType='Sort',         FIcon='quicksilver/image/16/Sort.gif',      FUrl='quicksilver/page/template/Sorter.jsp',			FActionMethodName='Qs.ToolSubItem.prepareSort',         FLoadHandler=null,                  FRelationId=null,										FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FMasterUnitId=null,                                   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FVisible=1;
insert into TsToolItem set FId='e5f7493b-7573-436e-95a2-44b255a05189', FPageId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FCode='MoveUp',     FName='上升', FLabel='', FType='Button', FAlign='left',  FIndex=1, FWidth=0, FDefaultEventHandler='Sorter.doMoveUp',     FIcon='quicksilver/image/16/MoveUp.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='7163b145-022c-4024-9bf1-402fa017ce91', FPageId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FCode='MoveDown',   FName='下降', FLabel='', FType='Button', FAlign='left',  FIndex=2, FWidth=0, FDefaultEventHandler='Sorter.doMoveDown',   FIcon='quicksilver/image/16/MoveDown.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='5cfa2a48-312b-489c-8788-c74b55e1799e', FPageId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FCode='MoveTop',    FName='置顶', FLabel='', FType='Button', FAlign='left',  FIndex=3, FWidth=0, FDefaultEventHandler='Sorter.doMoveTop',    FIcon='quicksilver/image/16/MoveTop.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='6ae2b873-d282-4197-9116-a14c5cd4ca5c', FPageId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FCode='MoveBottom', FName='置底', FLabel='', FType='Button', FAlign='left',  FIndex=4, FWidth=0, FDefaultEventHandler='Sorter.doMoveBottom', FIcon='quicksilver/image/16/MoveBottom.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='4cc8e828-9791-43fd-9f2b-75b225ec51f9', FPageId='ce44e9ed-fdeb-47cf-bce4-7191c0780620', FCode='Save',       FName='保存', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='Sorter.doSave',       FIcon='quicksilver/image/16/Save.gif',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
