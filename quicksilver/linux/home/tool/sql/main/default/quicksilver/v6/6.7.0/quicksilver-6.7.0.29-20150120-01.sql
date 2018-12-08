--minglei

insert into TsTextResource set FId='153dad6f-f758-472c-a0e9-252e7de6b007', FCode='E.Public.DateCannotAfterToday',						FValue='${0}不能晚於當前日期。';
insert into TsTextResource set FId='ec6a64f0-9973-4154-881f-f15c6961c22d', FCode='E.Public.DateCannotBeforeToday',						FValue='${0}不能早於當前日期。';
insert into TsTextResource set FId='d528d02a-0a05-421c-aece-fb01335a54d0', FCode='E.Public.DateMustAfterToday',							FValue='${0}必須晚於當前日期。';
insert into TsTextResource set FId='ce93733c-c7bf-468d-abf0-1a8d1399e143', FCode='E.Public.DateMustBeforeToday',						FValue='${0}必須早於當前日期。';
insert into TsTextResource set FId='507eb761-ec4b-4357-a388-5e8f813c52dc', FCode='E.Public.TimeCannotAfterNow',							FValue='${0}不能晚於當前時間。';
insert into TsTextResource set FId='ac78e3a7-5d85-4f60-8ec6-3b5e5a9bef5c', FCode='E.Public.TimeCannotBeforeNow',						FValue='${0}不能早於當前時間。';

insert into TsTextResource set FId='c55b08d8-8778-4544-85fb-882000720c4b', FCode='T.Public.DateCannotAfterToday',						FValue='${0}不能晚於當前日期。';
insert into TsTextResource set FId='c39f532a-099f-4e8f-9af7-b6f017784ce1', FCode='T.Public.DateCannotBeforeToday',						FValue='${0}不能早於當前日期。';
insert into TsTextResource set FId='b77eecb1-a863-4b9e-bc88-9926cfe004e0', FCode='T.Public.DateMustAfterToday',							FValue='${0}必須晚於當前日期。';
insert into TsTextResource set FId='e9d32ec8-462e-4440-b70c-a95b488b4359', FCode='T.Public.DateMustBeforeToday',						FValue='${0}必須早於當前日期。';
insert into TsTextResource set FId='de209986-a04d-42c1-8777-adb171d0094e', FCode='T.Public.TimeCannotAfterNow',							FValue='${0}不能晚於當前時間。';
insert into TsTextResource set FId='e447d2f3-5b6a-4ef5-ba4a-352214c2c16d', FCode='T.Public.TimeCannotBeforeNow',						FValue='${0}不能早於當前時間。';

java setQueryFormFields('87fba20b-4452-48bf-96f8-596881680b43', 'FName,FStatus,FStartTime,FEndTime');
java setListFields('93ae3cc4-cc9f-452b-803e-cf92f949d458', 'FStartTime,FEndTime,FStatus,FName');
java setListFields('9086fe2b-30b8-48bf-aec8-cbfd23359ec6', 'FStartTime,FEndTime,FStatus,FName');
java setListFields('e2aef28e-3ab6-4ad8-8b5b-09693c29a601', 'FStartTime,FEndTime,FStatus,FName');
