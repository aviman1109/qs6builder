update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 5;
delete from TsParameterDefinition where FId='793c9d3b-94c9-4a17-9c12-b1aa1464524e';
insert into TsParameterDefinition set FId='793c9d3b-94c9-4a17-9c12-b1aa1464524e', FName='登录后隐藏菜单',				FCode='QsMenuHide',							FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='CheckBox',				FRange='SystemAndUser',	FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5;

delete from TsSystemParameter where FId='39a40235-92ad-4ebb-b75f-17bc0a158afb';
insert into TsSystemParameter set FId='39a40235-92ad-4ebb-b75f-17bc0a158afb', FKey='QsMenuHide',						FValue='false';

update TsParameterDefinition set FRequired=0 where FCode='QsLoginHandler';

update TsField set FSize=200 where FId='a1f2fa83-b746-4c28-a2e0-a61fe1815483' and FSize < 200;

delete from TsToolItem where FId='93ecb27d-b56f-4b6f-a399-f26edd14eb23';
delete from TsToolItem where FId='eeecf794-9924-4e29-b041-bff0b8457047';
delete from TsToolItem where FId='ef97f754-f2fe-4585-a47e-2a06b7663078';
delete from TsToolItem where FId='1de03a94-02c6-4e02-8770-549b5273bbcc';
delete from TsToolItem where FId='5465b26f-c791-4b15-891e-78d0e336e5d5';
insert into TsToolItem set FId='93ecb27d-b56f-4b6f-a399-f26edd14eb23', FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FCode='QuerySchema',			FName='请选择查询方案或输入关键字', FLabel=null, FType='ComboBox-Inputable', FAlign='left', FIndex=1, FWidth=175, FIcon=null,                            FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='QuerySchema', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaChange', FHint='请输入关键字并按回车键查询，或下拉选择查询方案查询。您也可以点击查询框右侧的按钮，增加自定义查询方案。';
insert into TsToolItem set FId='eeecf794-9924-4e29-b041-bff0b8457047', FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FCode='QuerySchemaConfig',	FName=null,                         FLabel=null, FType='Button',             FAlign='left',  FIndex=2, FWidth=0,   FDefaultEventHandler='EntityList.doQuerySchemaConfig', FIcon='quicksilver/image/16/Config.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='ef97f754-f2fe-4585-a47e-2a06b7663078', FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FCode='QuerySchemaLock',		FName=null,                         FLabel=null, FType='Button',             FAlign='left', FIndex=3, FWidth=0,   FIcon='quicksilver/image/16/LockOpen.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,          FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FDefaultEventHandler='EntityList.doQuerySchemaLockClick',   FHint='锁定/解锁查询方案或关键字。在锁定状态下，查询方案或关键字将与其它条件联合查询。';
