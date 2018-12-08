--minglei

drop table TsMenuNumberCollectByField;
drop table TsMenuNumberCollectByJava;

create table TsMenuNumberCollection
(
	FUnitId			uuid,
	FUserField		varchar(50),
	FUserId			uuid,
	FStatusField	varchar(50),
	FStatus			varchar(50),
	FFilterSqlId	uuid,
	FQuerySqlId		uuid,
	FCount			int,
	FBatch			int
);

create table TsMenuNumberSql
(
	FId uuid primary key,
	FSql varchar(1000)
);

alter table TsMenuNumber add FFilterSql varchar(500);
alter table TsMenuNumber add FQuerySql varchar(1000);

delete from TsField where FId='29ce494b-ec03-48b9-a089-c7f1831c5f6b';
delete from TsField where FId='60b45e72-8042-41bc-a169-d90b89cb9e14';
insert into TsField set FId='57df00d5-48da-4c85-8c9e-00aeab66bae6', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FFilterSql',		FTitle='过滤 SQL',	FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=0, FRowSpan=3, FListWidth=100, FListAlign='default', FCustomData='';
insert into TsField set FId='ab89d777-f8a2-403b-a151-ccb356a41a63', FUnitId='e622af1a-9c68-42a8-9059-21f0cf4550a7', FName='FQuerySql',		FTitle='查询 SQL',	FType='TextBox',             FSize=1000, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0, FRelationCapacity=null, FSourceType='local', FColSpan=0, FRowSpan=5, FListWidth=100, FListAlign='default', FCustomData='';

update TsPage set FDialogHeight=522 where FId='f194cb0b-3ea9-4e62-ab8b-66da260f7d35';

java setFormFields('1cd57983-b2cc-4fe1-adf8-fde42da4e224', '-', 'b00aa1cf-33d2-4c22-8601-3387947a2b49', null, 'FName,FType,FColor,FBold', '按欄位統計', '4b685fe0-f21e-443c-86d2-998b02cfdf47', null, 'FUserFieldId,FStatusFieldId,FStatusValues,FFilterSql', '自訂統計', 'aa67481c-33c7-4e32-a021-289d2faf58c8', null, 'FQuerySql');

delete from TsDictionaryItem where FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f';
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='4d8ed9c1-bf79-4362-a1df-ed6fd5b4cb78', FIndex=1, FParentValue=null, FText='按欄位統計', FValue='Field';
insert into TsDictionaryItem set FDictionaryId='22a01a4e-73bb-4bfe-b578-12341e9dfd5f', FEnabled=1, FId='c911eb20-94a5-47c9-862f-de9206185f34', FIndex=2, FParentValue=null, FText='自訂統計',   FValue='Custom';

delete from TsMenuNumber where FMenuId='5456b81a-002b-48d0-8f87-d7a6c733157c';
insert into TsMenuNumber set FId='b9253bae-c65f-44b2-af3b-324e3cf851eb', FName='待辦工作項', FMenuId='5456b81a-002b-48d0-8f87-d7a6c733157c', FIndex=1, FType='Custom', FUserFieldId=null,                                   FStatusFieldId=null,                                   FStatusValues=null, FColor='#0000FF', FBold=1, FFilterSql='',   FQuerySql='select FUserId, count(*) as FCount
from (
    select distinct w.FId as FWorkItemId, u.FId as FUserId
    from TwWorkItem w
        inner join TwParticipant p on p.FWorkItemId = w.FId
        inner join TsUser u on u.FId = p.FUserId or w.FDeputable = 1 and exists (
	    select * from TwDeputy
	    where FUserId = p.FUserId and FDeputyId = u.FId
	)
    where w.FStatus in (''Drawn'', ''NotDrawn'') and exists (
        select * from TwActivity
	where FId = w.FActivityId and FStatus=''Running''
    )
) t
group by FUserId';
