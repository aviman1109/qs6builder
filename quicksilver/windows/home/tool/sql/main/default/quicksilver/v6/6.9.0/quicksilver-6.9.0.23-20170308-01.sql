--hotbit.yu
--代办工作项 数字推送
update TsMenuNumber set FQuerySql='select FUserId, count(*) as FCount
from (
    select distinct w.FId as FWorkItemId, u.FId as FUserId
    from TwWorkItem w
        inner join TwParticipant p on p.FWorkItemId = w.FId
        inner join TsUser u on u.FId = p.FUserId 
		or w.FDeputable = 1 and exists (
			select * from TwDeputy
			where FUserId = p.FUserId and FDeputyId = u.FId
		)
		or p.FUserId in (
			select TsUser.FId
			from TsUser inner join TwDeputy
			on TwDeputy.FUserId = TsUser.FId
			where TsUser.FOnGuard = 0 and TwDeputy.FDeputyId = u.FId
		)
    where w.FStatus in (''Drawn'', ''NotDrawn'') and exists (
        select * from TwActivity
		where FId = w.FActivityId and FStatus=''Running''
    )
) t
group by FUserId' where FId='b9253bae-c65f-44b2-af3b-324e3cf851eb';
