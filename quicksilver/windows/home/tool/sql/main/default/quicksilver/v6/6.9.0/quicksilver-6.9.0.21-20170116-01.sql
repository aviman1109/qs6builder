--hotbit.yu

--WorkItem
--我的待辦工作項
update TsQuerySchema set FSql='FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)
and exists (
    select * from TwParticipant
    where FWorkItemId = TwWorkItem.FId and (
        FUserId = ${user.FId}
		or TwWorkItem.FDeputable = 1 and FUserId in (
	    	select FUserId from TwDeputy where FDeputyId = ${user.FId}
        )
        or FUserId in (
			select TsUser.FId
			from TsUser inner join TwDeputy
			on TwDeputy.FUserId = TsUser.FId
			where TsUser.FOnGuard = 0 and TwDeputy.FDeputyId = ${user.FId}
        )
    )
)', FUpdateTime=timestamp('2017-01-11 17:04:28') where FId='d6a812ef-c2f5-4bc3-8571-eb2e77f1906f';

--我的全部工作項
update TsQuerySchema set FSql='FStatus=''Finished'' and FHandleUserId=${user.FId}
or FStatus in (''Drawn'', ''NotDrawn'') and exists (
    select * from TwActivity
    where FId = TwWorkItem.FActivityId and FStatus = ''Running''
)
and exists (
    select * from TwParticipant
    where FWorkItemId = TwWorkItem.FId and (
        FUserId = ${user.FId}
		or TwWorkItem.FDeputable = 1 and FUserId in (
	    	select FUserId from TwDeputy where FDeputyId = ${user.FId}
        )
        or FUserId in (
			select TsUser.FId
			from TsUser inner join TwDeputy
			on TwDeputy.FUserId = TsUser.FId
			where TsUser.FOnGuard = 0 and TwDeputy.FDeputyId = ${user.FId}
        )
    )
)
', FUpdateTime=timestamp('2017-01-11 17:43:43') where FId='34ba4726-69a8-4818-b855-dea71ae85c92';

--部門待辦工作項
update TsQuerySchema set FSql='FStatus in (''Drawn'', ''NotDrawn'') and exists (
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
        or
        FUserId in (
			select TsUser.FId
			from TsUser inner join TwDeputy
			on TwDeputy.FUserId = TsUser.FId
			where TsUser.FOnGuard = 0 and TwDeputy.FDeputyId in (
                select FId from TsUser
                where FDepartmentId = ${department.FId} or FDepartmentId in (
                    select FDescendantId from TsDepartmentAd
                    where FAncestorId = ${department.FId}
                )
            )
        )
    )
)', FUpdateTime=timestamp('2017-01-11 18:02:28') where FId='3a37b9f3-b511-47a3-9d2f-2a133be11f58';


--部門全部工作項
update TsQuerySchema set FSql='FStatus = ''Finished'' and FHandleUserId in (
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
        or
        FUserId in (
			select TsUser.FId
			from TsUser inner join TwDeputy
			on TwDeputy.FUserId = TsUser.FId
			where TsUser.FOnGuard = 0 and TwDeputy.FDeputyId in (
                select FId from TsUser
                where FDepartmentId = ${department.FId} or FDepartmentId in (
                    select FDescendantId from TsDepartmentAd
                    where FAncestorId = ${department.FId}
                )
            )
        )
    )
)', FUpdateTime=timestamp('2017-01-11 18:05:14') where FId='de01b111-e2fe-48cd-ba7d-aa40de74060a';


