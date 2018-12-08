--minglei

java runIgnoreError('drop index IwParticipant1 on TwParticipant');
java runIgnoreError('drop index IwParticipant2 on TwParticipant');
java runIgnoreError('drop index IwParticipant3 on TwParticipant');
java runIgnoreError('drop index IwParticipant4 on TwParticipant');
java runIgnoreError('drop index IwParticipant5 on TwParticipant');
create index IwParticipant1 on TwParticipant (FProcessId);
create index IwParticipant2 on TwParticipant (FActivityId);
create index IwParticipant3 on TwParticipant (FWorkItemId);
create index IwParticipant4 on TwParticipant (FEntityId);
create index IwParticipant5 on TwParticipant (FUserId);

java runIgnoreError('drop index IsDataPrivilege on TsDataPrivilege');
create index IsDataPrivilege on TsDataPrivilege (FEntityId, FUserId);
