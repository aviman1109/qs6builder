--minglei

drop table TsMenuNumberSql;

create table TsMenuNumberSql
(
	FId uuid primary key,
	FSql varchar(1000)
);

delete from TsRelation where FId='0d87c155-b797-4556-a978-ccc6d5b33b7a';
delete from TsRelation where FId='95e5f8cd-0f9f-4129-b1ae-b352a0f68a70';
