--minglei

java runOnError
(
	'select 1 from TsImportLog limit 1',
	'create table TsImportLog (
		FId uuid primary key,
		FUnitId uuid,
		FUserId uuid,
		FStartTime timestamp,
		FEndTime timestamp,
		FTotalCount int,
		FSuccessCount int,
		FErrorCount int,
		FIgnoreCount int,
		FErrorMessage varchar(2000)
	)'
);
