--Minglei.Lee

create table TsStartupListener
(
	FId uuid primary key,
	FClassName varchar(100) unique,
	FEnabled bit,
	FIndex int
);

delete from TsTextResource where FCode='E.Qs.WebSocket.NoHttpSession';
delete from TsTextResource where FCode='E.Qs.WebSocket.NotLoggedIn';
