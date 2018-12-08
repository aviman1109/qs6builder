--Qs.Script

delete from TsPage where FId='b55c185c-edfc-488d-8cbb-8469fa058d52';
delete from TsToolItem where FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52';

insert into TsPage set FId='b55c185c-edfc-488d-8cbb-8469fa058d52', FName='通用指令碼清單', FTitle='通用指令碼',   FCode='Qs.Script.CommonList',	FType='EditableList',	FIcon='quicksilver/image/unit/Script.gif',	FUrl='quicksilver/page/template/EditableList.jsp',  FActionMethodName='Qs.Script.prepareEditableList',	FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000014', FMasterUnitId=null,								   FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

--通用腳本清單
insert into TsToolItem set FId='0c3d9745-3932-4bc0-95db-3debb1934532', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='MoveUp',		FName='上升', FLabel='',	FType='Button',      FAlign='left',  FIndex=1, FWidth=0, FDefaultEventHandler='EditableList.doMoveUp',     FIcon='quicksilver/image/16/MoveUp.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3d53e179-8c62-4c53-b6ae-a66ff7695795', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='MoveDown',	FName='下降', FLabel='',	FType='Button',      FAlign='left',  FIndex=2, FWidth=0, FDefaultEventHandler='EditableList.doMoveDown',   FIcon='quicksilver/image/16/MoveDown.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='eefe1c2e-995c-43fb-b61d-dad2acc88c5a', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='MoveTop',		FName='置頂', FLabel='',	FType='Button',      FAlign='left',  FIndex=3, FWidth=0, FDefaultEventHandler='EditableList.doMoveTop',    FIcon='quicksilver/image/16/MoveTop.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='7a953628-68b5-4823-b21d-da483e8f431a', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='MoveBottom',	FName='置底', FLabel='',	FType='Button',      FAlign='left',  FIndex=4, FWidth=0, FDefaultEventHandler='EditableList.doMoveBottom', FIcon='quicksilver/image/16/MoveBottom.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3c92e2fe-3a9b-4fdc-b0cf-8b831dd49358', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='Add',			FName='新增', FLabel=null,	FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doAdd';
insert into TsToolItem set FId='e88614b2-93c0-4f1c-9ea1-14fc6a66ea9f', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='Delete',		FName='刪除', FLabel=null,	FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Delete.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doDelete';
insert into TsToolItem set FId='f749e08f-c142-40ab-9f9c-febdd704ad9d', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='Save',		FName='保存', FLabel=null,	FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Save.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doSave';
insert into TsToolItem set FId='22f76b61-a935-471a-850f-4fa58746fee1', FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FCode='Refresh',		FName='刷新', FLabel=null,	FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EditableList.doRefresh';

--rename

update TsPage set FName = replace(FName, '腳本', '指令碼') where FName like '%腳本%';
update TsList set FName = replace(FName, '腳本', '指令碼') where FName like '%腳本%';
update TsRelation set FName = replace(FName, '腳本', '指令碼') where FName like '%腳本%';
update TsRelation set FOppositeName = replace(FOppositeName, '腳本', '指令碼') where FOppositeName like '%腳本%';
update TsTextResource set FValue = replace(FValue, '腳本', '指令碼') where FValue like '%腳本%';

--menu

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000010' and FIndex >= 4;
delete from TsMenu where FId='54a55f0e-6d1a-4b7c-b279-ea0aa8957e1d';
insert into TsMenu set		FId='54a55f0e-6d1a-4b7c-b279-ea0aa8957e1d', FParentId='00000000-0000-0000-0008-990000000010',	FIndex=4,	FName='首頁',			FPageId=null,									FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/HomepageItem.gif';
update TsMenu set FParentId='54a55f0e-6d1a-4b7c-b279-ea0aa8957e1d',	FIndex=1 where FId='66e966ae-4bea-4412-a6f7-5b7ecdd38c51';
update TsMenu set FParentId='54a55f0e-6d1a-4b7c-b279-ea0aa8957e1d',	FIndex=2 where FId='09d024e3-b0ce-443c-a8fc-404c3a93bbae';

update TsMenu set FIndex=5 where FId='ed7d81db-c846-4b4f-8a8c-72d72ef31062';

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000010' and FIndex >= 99;
delete from TsMenu where FId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab';
insert into TsMenu set		FId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab', FParentId='00000000-0000-0000-0008-990000000010',   FIndex=99,   FName='其它',			FPageId=null,                                   FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Dictionary.gif';
update TsMenu set FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=1 where FId='a0072d26-bcd3-438c-894d-c76eea60513b' and FParentId='00000000-0000-0000-0008-990000000010';
update TsMenu set FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=2 where FId='b19d60cc-fad6-43c1-af05-469e496f8775' and FParentId='00000000-0000-0000-0008-990000000010';
update TsMenu set FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=3 where FId='9016223b-b209-4a91-9c83-0e1fb4861586' and FParentId='00000000-0000-0000-0008-990000000010';
update TsMenu set FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=4 where FId='b45d3063-3813-4e86-a6a5-489463536c44' and FParentId='00000000-0000-0000-0008-990000000010';
update TsMenu set FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab',	FIndex=5 where FId='2d83c836-8499-4872-8b57-a53b35b90703' and FParentId='00000000-0000-0000-0008-990000000010';

--

update TsMenu set FName='單元', FPageId=null where FId='703d1c45-a229-466f-966f-4eb594c73dbf';
update TsMenu set FParentId='703d1c45-a229-466f-966f-4eb594c73dbf', FIndex=2 where FId='10cadf51-9fe4-4146-ac94-46f756d2c16d';
update TsMenu set FParentId='703d1c45-a229-466f-966f-4eb594c73dbf', FIndex=3 where FId='b398edd8-f02b-45d2-832d-f0bfa70ae273';
update TsMenu set FName='單元轉換設置' where FName='單元轉換';

delete from TsMenu where FId='4f53a946-41a6-4c5c-a368-57026b13ccc8';
insert into TsMenu set	FId='4f53a946-41a6-4c5c-a368-57026b13ccc8', FParentId='703d1c45-a229-466f-966f-4eb594c73dbf',	FIndex=1,	FName='單元設置',		FPageId='9e9619ed-0664-4459-bfd6-6574bd25e4d9', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Unit.gif';

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000020' and FIndex >= 2;
update TsMenu set FName='頁面', FPageId=null, FIndex=2 where FId='195d73e7-b66f-4b14-9da9-55ff3b3d570a';
delete from TsMenu where FId='f29e3e46-c297-47f4-a0ac-a021bcdbfef3';
delete from TsMenu where FId='678a4140-7ca8-441a-8f7e-b27c84ff7cbe';
insert into TsMenu set	FId='f29e3e46-c297-47f4-a0ac-a021bcdbfef3', FParentId='195d73e7-b66f-4b14-9da9-55ff3b3d570a',	FIndex=1,	FName='頁面設置',		FPageId='9610c667-2136-4675-afa6-9f44f7fc1e57', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Page.gif';
insert into TsMenu set	FId='678a4140-7ca8-441a-8f7e-b27c84ff7cbe', FParentId='195d73e7-b66f-4b14-9da9-55ff3b3d570a',	FIndex=2,	FName='通用指令碼設置',	FPageId='b55c185c-edfc-488d-8cbb-8469fa058d52', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Script.gif';

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000020' and FIndex >= 3;
update TsMenu set FIndex=3 where FId='b8f118e7-9001-4a9d-b2db-98e83687604a';
update TsMenu set FParentId='b8f118e7-9001-4a9d-b2db-98e83687604a',	FIndex=3 where FId='93da1126-a118-4c1e-887c-46ea068dabb5';

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000020' and FIndex >= 4;
update TsMenu set FName='伺服器', FIndex=4,	FPageId=null where FId='7eeeb7e2-b8ce-4a3a-b722-3dfc680682a9';
update TsMenu set FParentId='7eeeb7e2-b8ce-4a3a-b722-3dfc680682a9',	FIndex=2 where FId='8c2a7bf9-d5f7-4a74-bbf3-245710ef9280';
update TsMenu set FParentId='7eeeb7e2-b8ce-4a3a-b722-3dfc680682a9',	FIndex=3 where FId='86e31886-b161-4b0b-a98f-6ea1dcd99fe6';
update TsMenu set FParentId='7eeeb7e2-b8ce-4a3a-b722-3dfc680682a9',	FIndex=4 where FId='ed4986eb-eff5-458c-b890-eabbb3a40818';
delete from TsMenu where FId='3964a518-b11c-477b-92d6-4e312912f474';
insert into TsMenu set	FId='3964a518-b11c-477b-92d6-4e312912f474', FParentId='7eeeb7e2-b8ce-4a3a-b722-3dfc680682a9',	FIndex=1,	FName='應用管理',		FPageId='48859b88-6f49-4261-9cf6-c4593debfafd',	FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/16/Server.png';

update TsMenu set FIndex=FIndex+1 where FParentId='00000000-0000-0000-0008-990000000020' and FIndex >= 5;
update TsMenu set FName='其它', FIndex=5,	FPageId=null where FId='813ac0b2-a881-409f-ad05-f16bff890b11';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=2 where FId='c6a04d0e-ad88-4319-bb59-b0c53fedaf22';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=3 where FId='6f503972-8519-4720-8719-3d0b81122fa1';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=4 where FId='4471b273-88a5-40af-b195-8602e4fca8a9';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=5 where FId='dd31c01c-00a5-4f5a-9db8-bfd83dd74ab3';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=6 where FId='5e2ca753-3082-43c4-b1be-b25a7137912e';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=7 where FId='8fec07f5-e217-4908-8238-ada0a99d81e9';
update TsMenu set FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',	FIndex=8, FEnabled=0 where FId='2cd3daaf-26c3-4b4c-9620-05d8c6f38454';
delete from TsMenu where FId='8ec6673c-3202-4d5d-a71d-113bbc3775f7';
insert into TsMenu set	FId='8ec6673c-3202-4d5d-a71d-113bbc3775f7', FParentId='813ac0b2-a881-409f-ad05-f16bff890b11',   FIndex=1,   FName='語言設置',       FPageId='a5753a8c-645d-4558-aa93-fa82f4e5a0b5', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Language.png';

update TsMenu set FLicensed=1 where FLicensed is null;
java refreshSerial('TsMenu');
