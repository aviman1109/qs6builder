--minglei

--delete template scripts

delete from TsScript where FUrl='quicksilver-mobile/page/entity/EntityList.js';
delete from TsScript where FUrl='quicksilver-mobile/page/entity/EntityList.css';
delete from TsScript where FUrl='quicksilver-mobile/page/entity/EntityForm.js';
delete from TsScript where FUrl='quicksilver-mobile/page/entity/EntityForm.css';

--add mobile buttons

insert into TsPage set FId='ee3c6d92-9ba1-4920-a14b-c41652e03e7a', FName='手機部門表單', FTitle='部門',     FCode='Qs.Department.MobileForm', FType='EntityForm', FIcon='quicksilver/image/unit/Department.gif', FUrl=null,													FActionMethodName='Qs.Department.prepareMobileForm',	FLoadHandler=null, FRelationId=null,                                   FUnitId='00000000-0000-0000-0001-000000001001', FMasterUnitId=null,                                   FIsSlavePage=0, FEditId='5c6ae004-d69f-4c45-acb1-d1a049bd8aa9', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

--手機部門列表
delete from TsToolItem where FPageId='de4f1c18-18b1-41b1-b7ce-6ae363a80d69' and FCode='Add';
insert into TsToolItem set FId='04d2bb0b-8cc9-46c4-a890-ee9e44831b22', FPageId='de4f1c18-18b1-41b1-b7ce-6ae363a80d69', FCode='Add', FName='', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Add.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Qs.EntityList.doAdd', FChartId=null;

--手機部門表单
insert into TsToolItem set FId='4a05e5cd-3adb-4ca1-bfe8-3dacaccac34c', FPageId='ee3c6d92-9ba1-4920-a14b-c41652e03e7a', FCode='Save',    FName='', FLabel='', FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='Qs.EntityForm.doSave',  FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Save.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3bf000f5-fb33-4d0b-932a-e4767ebaa772', FPageId='ee3c6d92-9ba1-4920-a14b-c41652e03e7a', FCode='Menu',    FName='', FLabel='', FType='ComboButton', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='',						FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Menu.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null;

--手機員工列表
delete from TsToolItem where FPageId='f90faf7a-b6f6-4f2c-bd81-fb53a319de05' and FCode='Add';
insert into TsToolItem set FId='94191e07-dbad-4a1c-bdc2-47d2f9ae3e11', FPageId='f90faf7a-b6f6-4f2c-bd81-fb53a319de05', FCode='Add', FName='', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Add.png', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='Qs.EntityList.doAdd', FChartId=null;

--手機員工表單
insert into TsToolItem set FId='9bd20850-7d9b-4a4d-a512-fc5f92133278', FPageId='f6347085-d019-450c-bfdf-2b3ca4a8122b', FCode='Save',    FName='', FLabel='', FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='Qs.EntityForm.doSave',  FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Save.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='9106fb1a-e759-4012-ba46-f329c61c1957', FPageId='f6347085-d019-450c-bfdf-2b3ca4a8122b', FCode='Menu',    FName='', FLabel='', FType='ComboButton', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='',						FIcon='quicksilver-mobile/jeedui-mobile/theme/iphone/image/Menu.png',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='SubItemTable', FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='None', FHandlePageId=null;

--other

java setListFields('7a087677-fce8-47a6-a36e-fe30b64eb076', 'FProcessId:0:0,FCreateTime:1:0,FStatus:0:0,FProcessUserId:1:0,FWorkflowId:0:0');
