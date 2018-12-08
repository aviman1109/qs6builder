--查询表单栏位最近使用值和最近使用、树是否隐藏

create table TsQueryFormDetail
(
	FId uuid primary key,
	FUnitId uuid,
	FFieldName varchar(50),
	FUserId uuid,
	FRecentVisible bit default 1,
	FTreeVisible bit default 1,
	FRecentItems varchar(2000)
);

--工作项转办及加签

alter table TwNode add FExpectedResult varchar(50);
delete from TsField where FId='b1628e38-64d4-41bc-a8f6-175c8ba5841f';
insert into TsField set FId='b1628e38-64d4-41bc-a8f6-175c8ba5841f', FUnitId='fd32e77e-07ce-442a-9687-671c017d03ef', FName='FExpectedResult',    FTitle='预期结果',     FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint='存在多个参与者时，如果其中一个参与者的处理结果不等于预期结果，则该环节直接完成，不等待其它参与者。不填写时，默认为“Agree”。', FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setEditFields('ae542383-9d52-43d7-8940-962af2465fbb', 'FName,FCode,FMultiWorkItem,FJoinMode,FJoinCondition,FJoinConditionType,FTimeoutMode,FTimeoutDays,FTimeoutResult,FUrl,FUrlType,FPrivilegeId,FExpectedResult');
java setFormFields('dc16b2d8-e4e9-4801-926f-7b9479d7146c', '-', '38720435-2b81-4bbf-8288-591d481ab509', null, 'FName,FCode,FMultiWorkItem,FExpectedResult,FAutoFinish', '聚合', 'a78770f1-5a4e-4b1e-b081-1b03002e6c02', null, 'FJoinMode,FJoinConditionType,FJoinCondition', '超时', '5cfe8dda-fb78-4d1c-8e8f-8af8a0f72b1c', null, 'FTimeoutMode,FTimeoutDays,FTimeoutResult', '其它', '941b466d-e4f5-48f3-965c-d37e30a05daf', null, 'FPrivilegeId');

delete from TsDictionaryItem where FId='269cd495-c4ee-4769-bc3a-46b717d0803f';
insert into TsDictionaryItem set FId='269cd495-c4ee-4769-bc3a-46b717d0803f', FDictionaryId='bbb93944-7973-408b-a8fe-c948daf0356c', FValue='Transfer',				FText='转办',		FIndex=7;

delete from TsDictionaryItem where FId='94e150ec-e6f0-48cc-896b-475ee1661ecd';
delete from TsDictionaryItem where FId='763ffd32-c4d1-4ee8-8acb-5b90c502fd21';
insert into TsDictionaryItem set FDictionaryId='4f2dbf3f-ee88-4704-a766-d788e46cf850', FId='94e150ec-e6f0-48cc-896b-475ee1661ecd', FIndex=14,	FParentValue=null, FText='转办',     FValue='Transfer';
insert into TsDictionaryItem set FDictionaryId='4f2dbf3f-ee88-4704-a766-d788e46cf850', FId='763ffd32-c4d1-4ee8-8acb-5b90c502fd21', FIndex=15,	FParentValue=null, FText='加签',     FValue='AppendParticipant';

delete from TsDictionaryItem where FId='11165d22-6ce5-478b-804a-2c3a6ca746ad';
delete from TsDictionaryItem where FId='d7ffb9af-76ea-432a-8c97-8d008670fec2';
insert into TsDictionaryItem set FId='d7ffb9af-76ea-432a-8c97-8d008670fec2', FDictionaryId='d8da3463-788c-4061-a22d-e1d20c179633', FValue='OnWorkItemTerminateAfter',	FText='工作项终止后',	FIndex=15;

delete from TsDictionaryItem where FId='a518fede-22c1-41ce-8a8a-bc006f2a01e2';

delete from TsTextResource where FId='327c8cce-b348-4ea1-888d-11b2d966c344';
delete from TsTextResource where FId='395d8717-7701-41a4-b567-ae0f23deb95e';
delete from TsTextResource where FId='3e40efea-aac8-4511-99b7-bf83bd9d83fa';

delete from TsTextResource where FId='218ca3ed-ad39-4cde-93f9-931c8bcdea57';
delete from TsTextResource where FId='28d6e0a0-1912-45a2-be2f-97068506eff6';
delete from TsTextResource where FId='d48b893c-a330-490a-bc74-c3d1bbf71dd8';
delete from TsTextResource where FId='d6221a61-fbbf-4220-8af7-9263e2fe07de';
insert into TsTextResource set FCode='E.Wf.Activity.ParticipantAlreadyExist',				FId='218ca3ed-ad39-4cde-93f9-931c8bcdea57', FValue='“${0}”已经是当前的参与者，不能重复增加。';
insert into TsTextResource set FCode='E.Wf.WorkItem.NotDrawn',								FId='28d6e0a0-1912-45a2-be2f-97068506eff6', FValue='工作项尚未被领取或已经完成，不能执行该操作。';
insert into TsTextResource set FCode='E.Wf.WorkItem.InvalidParticipantCount',				FId='d48b893c-a330-490a-bc74-c3d1bbf71dd8', FValue='工作项不存在或存在多个参与者，不能执行该操作。';
insert into TsTextResource set FCode='E.Wf.WorkItem.UserNotParticipant',					FId='d6221a61-fbbf-4220-8af7-9263e2fe07de', FValue='您不是该工作项的参与者，不能执行该操作。';

delete from TsTextResource where FId='334b7398-b425-4ea0-ba91-2b212446cbb9';
delete from TsTextResource where FId='50666980-fe71-4e31-8508-aa2fdda252a7';
delete from TsTextResource where FId='a577feed-a81d-48e8-934a-3bcc98e641e7';
delete from TsTextResource where FId='32525872-6474-4f0c-bb5e-b3e39eb2f464';
delete from TsTextResource where FId='d7e062e6-402e-4f81-956e-8f8b82cc8e66';
delete from TsTextResource where FId='30fc88a7-66ac-4d81-bb90-b71fe5787a57';
delete from TsTextResource where FId='467a97b7-c7c8-4721-b526-cb941e6801bb';
delete from TsTextResource where FId='b521cbbb-be2a-4faa-811a-8d1ed688f48f';
insert into TsTextResource set FCode='T.Wf.WorkItem.Clone',									FId='334b7398-b425-4ea0-ba91-2b212446cbb9', FValue='加签';
insert into TsTextResource set FCode='T.Wf.WorkItem.CloneComment',							FId='50666980-fe71-4e31-8508-aa2fdda252a7', FValue='加签说明';
insert into TsTextResource set FCode='T.Wf.WorkItem.CloneInformation',						FId='a577feed-a81d-48e8-934a-3bcc98e641e7', FValue='请选择加签用户并输入加签说明。加签用户和您将共同参与当前处理环节。';
insert into TsTextResource set FCode='T.Wf.WorkItem.CloneUser',								FId='32525872-6474-4f0c-bb5e-b3e39eb2f464', FValue='加签用户';
insert into TsTextResource set FCode='T.Wf.WorkItem.Transfer',								FId='d7e062e6-402e-4f81-956e-8f8b82cc8e66', FValue='转办';
insert into TsTextResource set FCode='T.Wf.WorkItem.TransferComment',						FId='30fc88a7-66ac-4d81-bb90-b71fe5787a57', FValue='转办说明';
insert into TsTextResource set FCode='T.Wf.WorkItem.TransferInformation',					FId='467a97b7-c7c8-4721-b526-cb941e6801bb', FValue='请选择转办用户并输入转办说明。您在当前处理环节的参与权将被移交给转办用户，您不再参与该环节。';
insert into TsTextResource set FCode='T.Wf.WorkItem.TransferUser',							FId='b521cbbb-be2a-4faa-811a-8d1ed688f48f', FValue='转办用户';

insert into TsPage set FId='548cdb50-546e-488d-a7c5-aafc8f68085e', FName='工作项转办',     FTitle='转办',       FCode='Wf.WorkItem.Transfer',       FPlatform='Computer', FType='Other',      FIcon='quicksilver/image/unit/WorkItem.gif', FUrl='quicksilver/page/wfinstance/WorkItemTransfer.jsp',      FActionMethodName=null,                            FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000003005', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=500,  FDialogHeight=230,  FDialogMaximized=0,    FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FQueryFormAutoQuery=1,    FVisible=1, FDescription='';
insert into TsPage set FId='50e5d6ac-f5a8-4b30-b0bd-c6bcca7c1685', FName='工作项加签',     FTitle='加签',       FCode='Wf.WorkItem.Clone',          FPlatform='Computer', FType='Other',      FIcon='quicksilver/image/unit/WorkItem.gif', FUrl='quicksilver/page/wfinstance/WorkItemClone.jsp',         FActionMethodName=null,                            FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000003005', FMasterUnitId=null,                                   FIsSlavePage=0, FIndex=null, FDialogWidth=500,  FDialogHeight=230,  FDialogMaximized=0,    FHasViewFrame=0,    FQueryOnLoad=null, FQuerySchemaId=null, FQueryFormAutoQuery=1,    FVisible=1, FDescription='';

insert into TsToolItem set FId='da9ae08e-9563-4c57-9968-1b91b760d691', FPageId='548cdb50-546e-488d-a7c5-aafc8f68085e', FCode='Confirm', FName='确定', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver/image/16/Confirm.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine='', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='WorkItemTransfer.doConfirm';
insert into TsToolItem set FId='4c627c28-4117-4394-a294-6c68993953d0', FPageId='50e5d6ac-f5a8-4b30-b0bd-c6bcca7c1685', FCode='Confirm', FName='确定', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=null, FIcon='quicksilver/image/16/Confirm.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine='', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='WorkItemClone.doConfirm';

--工作流版本支持部门

alter table TwVersion add FDepartmentId uuid;
delete from TsField where FId='af9c4516-52a4-41b8-8e66-e820ed544b54';
insert into TsField set FId='af9c4516-52a4-41b8-8e66-e820ed544b54', FUnitId='00000000-0000-0000-0001-000000003002', FName='FDepartmentId',           FTitle='部门',         FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001001', FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
update TsField set FRowSpan=6 where FId='50aa6d4f-e212-4181-9663-42b5b3731b2d';
insert into TsRelation set FId='82729743-b4be-4fe9-ac8c-dbe733002938', FOppositeId='f133ffb9-d923-4a0b-b982-acadf8a45936', FName='工作流版本-部门',       FOppositeName='部门-工作流版本',       FUnitId1='00000000-0000-0000-0001-000000003002', FUnitId2='00000000-0000-0000-0001-000000001001', FType='field', FTable=null, FField1='FId',        FField2='FDepartmentId', FDeleteAction1='unset',   FDeleteAction2='cancel',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
java setFormFields('5446090f-6384-4b33-9d03-dd71c3638789', '-', '776a0ebc-f12c-41f1-b841-598e96c0fefe', null, 'FDepartmentId', '启动流程时，触发的单元事件和写入的业务日志', '0304ca74-7558-416d-b4c7-da93ce59495f', null, 'FEntityEventCode,FBusinessLogCode,FBusinessLogDescription', '描述', '4962d435-7291-42dd-998c-ead311412859', null, 'FDescription');
java setListFields('f2761a0d-d662-4296-b79b-4874f05d1a7f', 'FDepartmentId,FVersion,FStatus,FReleaseTime,FDescription');

delete from TsTextResource where FId='4c0f3781-2ff8-4f57-9ec4-bb19a0b0e91a';
delete from TsTextResource where FId='7b369051-c461-4722-92f3-07b09373a44e';
delete from TsTextResource where FId='7a16957c-9eae-4eb8-ba89-129427153c97';
insert into TsTextResource set FCode='E.Wf.Workflow.NoDefaultActiveVersion',				FId='4c0f3781-2ff8-4f57-9ec4-bb19a0b0e91a', FValue='该工作流没有默认（部门为空）的有效版本。';
insert into TsTextResource set FCode='E.Wf.Workflow.NoDepartmentAndDefaultActiveVersion',	FId='7b369051-c461-4722-92f3-07b09373a44e', FValue='该工作流既没有部门为“${0}”的有效版本，也没有默认（部门为空）的有效版本。';
insert into TsTextResource set FCode='E.Wf.Workflow.CannotEnable',							FId='7a16957c-9eae-4eb8-ba89-129427153c97', FValue='该工作流没有默认（部门为空）的有效版本，不能启用。请在启用前首先设置默认的有效版本。';

update TsField set FType='InputBox-Text', FDictionaryId=null where FId='66526bd6-459b-4ceb-afbb-bbd9310867d3';
update TsField set FType='InputBox-Text', FDictionaryId=null where FId='bcd42545-1172-43ad-b436-362b91f04542';

--增加单独的关键字查询输入框

update TsToolItem set FIndex = FIndex + 1
where exists (
	select * from TsToolItem T
	where FPageId = TsToolItem.FPageId and FCode = 'QuerySchemaLock' and FAlign = TsToolItem.FAlign and FIndex <= TsToolItem.FIndex
)
and not exists (
	select * from TsToolItem T
	where FPageId = TsToolItem.FPageId and FCode = 'Keyword'
);

insert into TsToolItem (FId, FPageId, FCode, FType, FAlign, FIndex, FWidth, FHandleType)
select uuid(), FPageId, 'Keyword', 'InputBox-Text', FAlign, FIndex - 1, 175, 'None'
from TsToolItem
where FCode='QuerySchemaLock' and not exists (
	select * from TsToolItem T
	where FPageId = TsToolItem.FPageId and FCode = 'Keyword'
);

insert into TsToolItemProperty (FId, FToolItemId, FName, FValue)
select uuid(), FId, 'onkeydown', 'EntityList.doKeywordKeyDown'
from TsToolItem
where FCode = 'Keyword' and not exists (
	select * from TsToolItemProperty
	where FToolItemId = TsToolItem.FId and FName = 'onkeydown'
);

delete from TsTextResource where FId='232a8d36-4096-4ab8-a221-8654b045f6a1';
insert into TsTextResource set FCode='T.Qs.ToolItem.Hint.Keyword',							FId='232a8d36-4096-4ab8-a221-8654b045f6a1', FValue='请输入关键字并按回车键查询。';
