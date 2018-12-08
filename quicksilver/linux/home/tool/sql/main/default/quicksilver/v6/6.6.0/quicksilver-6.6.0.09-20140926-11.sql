--minglei

--HTML Report/Bill

update TsField set FTitle='編碼' where FId='e0a2d7a8-fe92-4675-ab7f-80d81eff3c23';
java setOrderFields('12a6880c-0e15-4ea3-83c6-0f9d9f6e469c', 'FCode', '0');

alter table TsField alter FHint set data type varchar(500);
update TsField set FSize=500, FType='TextBox', FRowSpan=2 where FId='d837d7ff-749f-4288-945c-fd647bb90a99';

update TsField set FTitle='總是打開新頁簽' where FId='793e07bc-9841-4ece-ada2-978be2a36336';
