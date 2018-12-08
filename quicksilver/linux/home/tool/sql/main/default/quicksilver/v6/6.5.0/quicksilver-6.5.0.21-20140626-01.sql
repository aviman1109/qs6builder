--Minglei

java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FType,FEnabled,FIcon', '頁簽', '959840c4-fce5-406d-b761-f7ca735a77cd', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FTabTitleSource,FTabTitle', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FQueryFormHidden,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine', '數值推送', 'bed706e5-6954-4834-8d08-3f95483d2348', null, 'FCountType', '按欄位統計', 'd05ec7f7-f7e6-444b-946b-25f10f57427a', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountUnitId,FCountUserField,FCountStatusField,FCountStatus1,FCountStatus2,FCountStatus3,FCountStatus4', '特殊統計', 'b952ada0-aad2-4343-9db5-2a89e9035357', 'bed706e5-6954-4834-8d08-3f95483d2348', 'FCountJavaClass');

update TsUnit			set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';
update TsPage			set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';
update TsMenu			set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';
update TwButton			set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';
update TsToolItem		set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';
update TsToolSubItem	set FIcon='quicksilver/image/unit/WorkItem.png' where FIcon='quicksilver/image/unit/WorkItem.gif';

delete from TsTextResource where FCode='E.Wf.WorkItem.DrawnByOthers';
insert into TsTextResource set FId='f4049803-9ead-4db1-94cd-4667bbe86a9a', FCode='E.Wf.WorkItem.DrawnByOthers',							FValue='您不是工作項的參與者，或工作項已被其他用戶領取。';

update TsMenu set FIndex = FIndex + 1 where FParentId='00000000-0000-0000-0008-990000000010' and FIndex >= 6;
insert into TsMenu set		FId='cb20bb9d-aec1-4471-9229-57156fb86897', FParentId='00000000-0000-0000-0008-990000000010',	FIndex=6,	FName='工作流管理',		FPageId=null,									FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Workflow.png';

update TsMenu set FParentId='cb20bb9d-aec1-4471-9229-57156fb86897',	FIndex=1 where FId='9016223b-b209-4a91-9c83-0e1fb4861586';
update TsMenu set FIndex = FIndex - 1 where FParentId='aaf0f03c-66f5-4456-aaff-f2aea0b70bab' and FIndex >= 4;

delete from TsMenu where FId='e7e132e5-2665-4774-843e-d757670cf27e';
insert into TsMenu set  FId='e7e132e5-2665-4774-843e-d757670cf27e', FParentId='cb20bb9d-aec1-4471-9229-57156fb86897',   FIndex=2,   FName='工作項管理',     FPageId='ec36c420-4d34-49fa-a5a9-57129eda1246', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/WorkItem.png';

java refreshSerial('TsMenu');

insert into TsQuerySchema set FId='3a37b9f3-b511-47a3-9d2f-2a133be11f58', FUnitId='00000000-0000-0000-0001-000000003005', FName='部門待辦工作項', FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)
and exists (
    select * from TwParticipant
    where FWorkItemId = TwWorkItem.FId and (
        FUserId in (
            select FId from TsUser
            where FDepartmentId = ${department.FId} or FDepartmentId in (
                select FDescendantId from TsDepartmentAd
                where FAncestorId = ${department.FId}
            )
        )
        or
        TwWorkItem.FDeputable = 1 and FUserId in (
            select FUserId from TwDeputy
            where FDeputyId in (
                select FId from TsUser
                where FDepartmentId = ${department.FId} or FDepartmentId in (
                    select FDescendantId from TsDepartmentAd
                    where FAncestorId = ${department.FId}
                )
            )
        )
    )
)', FIndex=4, FUpdateTime=timestamp('2014-06-26 14:37:53'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='6b4a2dab-1163-4e54-85ee-aa1584aba3b3', FUnitId='00000000-0000-0000-0001-000000003005', FName='部門已辦工作項', FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus = ''Finished'' and FHandleUserId in (
	select FId from TsUser
	where FDepartmentId = ${department.FId} or FDepartmentId in (
		select FDescendantId from TsDepartmentAd
		where FAncestorId = ${department.FId}
	)
)', FIndex=5, FUpdateTime=timestamp('2014-06-26 14:52:35'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='de01b111-e2fe-48cd-ba7d-aa40de74060a', FUnitId='00000000-0000-0000-0001-000000003005', FName='部門全部工作項', FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus = ''Finished'' and FHandleUserId in (
	select FId from TsUser
	where FDepartmentId = ${department.FId} or FDepartmentId in (
		select FDescendantId from TsDepartmentAd
		where FAncestorId = ${department.FId}
	)
)
or FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)
and exists (
    select * from TwParticipant
    where FWorkItemId = TwWorkItem.FId and (
        FUserId in (
            select FId from TsUser
            where FDepartmentId = ${department.FId} or FDepartmentId in (
                select FDescendantId from TsDepartmentAd
                where FAncestorId = ${department.FId}
            )
        )
        or
        TwWorkItem.FDeputable = 1 and FUserId in (
            select FUserId from TwDeputy
            where FDeputyId in (
                select FId from TsUser
                where FDepartmentId = ${department.FId} or FDepartmentId in (
                    select FDescendantId from TsDepartmentAd
                    where FAncestorId = ${department.FId}
                )
            )
        )
    )
)', FIndex=6, FUpdateTime=timestamp('2014-06-26 14:56:18'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='e4ad4618-856f-4fec-9639-18d4315f32af', FUnitId='00000000-0000-0000-0001-000000003005', FName='全部待辦工作項', FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)', FIndex=7, FUpdateTime=timestamp('2014-06-26 13:05:01'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='7dd9e21f-2961-4e6e-8ee8-b4edbf25291e', FUnitId='00000000-0000-0000-0001-000000003005', FName='全部已辦工作項', FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus=''Finished''',                                                                               FIndex=8, FUpdateTime=timestamp('2014-06-26 14:26:02'), FOriginSchemaId=null, FParentId=null;
insert into TsQuerySchema set FId='244ec586-31d8-4236-9a92-cd54d73ba449', FUnitId='00000000-0000-0000-0001-000000003005', FName='全部工作項',     FType='condition', FPublic=1, FVisible=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null, FSqlSource='Text', FSql='FStatus = ''Finished''
or FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)', FIndex=9, FUpdateTime=timestamp('2014-06-26 14:27:46'), FOriginSchemaId=null, FParentId=null;
