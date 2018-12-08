--minglei

--BigIcon

update TsField set FDefaultValue='quicksilver/image/unit/New-64.png' where FId='962ac84f-b1cf-412e-95e2-774e751c647c';
update TsUnit set FBigIcon='quicksilver/image/unit/New-64.png' where FBigIcon='quicksilver/image/unit/New-64.gif';

--local text field for MultiEntityBox

delete from TsTextResource where FId='3a517fe7-3411-4e86-8933-839d7ba5472d';
insert into TsTextResource set FId='3a517fe7-3411-4e86-8933-839d7ba5472d', FCode='T.Qs.Field.SizeTitle.LocalText',					FValue='實體名稱長度';

update TsField set FSize=300 where (FSize is null or FSize < 300) and FType='MultiEntityBox';
