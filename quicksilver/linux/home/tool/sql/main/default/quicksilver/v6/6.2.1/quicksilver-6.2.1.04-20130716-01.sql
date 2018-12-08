java setKeywordFields('00000000-0000-0000-0001-000000000021', 'FName,FCode');

alter table TsConditionPart alter FValue set data type varchar(2000);
alter table TsConditionPart alter FText set data type varchar(2000);
alter table TsQuerySchema alter FSql set data type varchar(10000);
update TsField set FSize=10000 where FId='1f90ec68-5f01-4ffc-bfb0-22a4ec254ce1';

delete from TsToolItemProperty where FId='990cc6ed-7ed9-45dd-b742-f7b972526f15';
insert into TsToolItemProperty set FId='990cc6ed-7ed9-45dd-b742-f7b972526f15', FToolItemId='06c61324-2a9f-4929-b2f1-88d27c5b656e', FName='onkeydown', FValue='MultiEntityBoxItems.doQuerySchemaKeyDown';
update TsToolItemProperty set FValue='MultiEntityBoxItems.doKeywordKeyDown' where FName='onkeydown' and exists (
	select * from TsToolItem where FId = TsToolItemProperty.FToolItemId and FCode = 'Keyword' and FPageId='37c35cde-2f79-4592-b765-ee7fbe47f0b5'
);

update TsMenu set FIcon='quicksilver/image/unit/EventLog.png' where FId='43c87362-44c5-4339-aa06-6e5f60caa5a3';
update TsMenu set FIcon='quicksilver/image/unit/EventLog.png' where FIcon='quicksilver/image/unit/EventLog.gif';
