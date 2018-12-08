create table TsTempEmailLog
(
	FId uuid primary key,
	FTime timestamp,
	FTo varchar(500),
	FCc varchar(500),
	FSubject varchar(500),
	FContent varchar(10000),
	FSuccess bit,
	FErrorMessage varchar(2000)
);
