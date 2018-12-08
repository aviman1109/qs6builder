--minglei

create table TsJocketEndpoint
(
	FId uuid primary key,
	FClassName varchar(100) unique,
	FEnabled bit default 1
);
