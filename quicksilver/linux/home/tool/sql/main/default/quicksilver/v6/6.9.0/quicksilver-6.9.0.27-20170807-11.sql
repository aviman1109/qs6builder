--minglei

delete from TsTextResource where FId='36625adc-572b-4888-920b-39207b505a5d';

delete from TsTextResource where FId='d6545c5a-1c62-43f6-90ba-90314d894e9e';
delete from TsTextResource where FId='8b9bdd86-79e4-46be-9c49-5673dde046eb';
delete from TsTextResource where FId='48421f7f-5387-4d03-98cc-40b6b7a1837b';
delete from TsTextResource where FId='940bbe41-76ad-4855-b316-faa01376e804';
delete from TsTextResource where FId='8abc1381-20c1-44a5-8218-b3cee0b53ef8';
delete from TsTextResource where FId='49e03998-8345-4ae2-8967-089f0bf23082';
delete from TsTextResource where FId='4c1d6f3c-4d3e-4a3c-a50a-720bd2067dc2';
delete from TsTextResource where FId='4397654b-e482-43fc-b05a-03a555a3ae60';
delete from TsTextResource where FId='29e749c3-533a-4744-8308-1c57c17ee1cb';

delete from TsTextResource where FId='03b6d0af-7817-4c0d-b71e-9b43c0dda3c4';
delete from TsTextResource where FId='8af03979-573d-4106-b226-2ca8b28a0719';
delete from TsTextResource where FId='6abfc51f-db57-483d-9a61-8e0cab809676';
delete from TsTextResource where FId='bc520ab7-be92-421e-8183-f001565d34a6';

insert into TsTextResource set FId='36625adc-572b-4888-920b-39207b505a5d', FCode='E.License.AddressNotMatch',					FValue='License 中的 IP 或 MAC 與本機不匹配。';

insert into TsTextResource set FId='d6545c5a-1c62-43f6-90ba-90314d894e9e', FCode='T.Qs.Index.LicenseWarning',         				FValue='系統 License 存在以下異常，請儘快更換：';
insert into TsTextResource set FId='8b9bdd86-79e4-46be-9c49-5673dde046eb', FCode='T.Qs.License.FileInvalid', 					FValue='License 檔不存在或格式錯誤。';
insert into TsTextResource set FId='48421f7f-5387-4d03-98cc-40b6b7a1837b', FCode='T.Qs.License.AddressNotMatch',				FValue='License 中的 IP 或 MAC 與本機不匹配。';
insert into TsTextResource set FId='940bbe41-76ad-4855-b316-faa01376e804', FCode='T.Qs.License.ExpiredInExtension',         			FValue='License 已過期，自 ${0} 起將不允許用戶登錄。';
insert into TsTextResource set FId='8abc1381-20c1-44a5-8218-b3cee0b53ef8', FCode='T.Qs.License.ExpiredOutOfExtension',         			FValue='License 已過期，不允許用戶登錄。';
insert into TsTextResource set FId='49e03998-8345-4ae2-8967-089f0bf23082', FCode='T.Qs.License.TooManyRegisteredUsers',				FValue='註冊用戶數量超過 License 限制，不允許用戶登錄。';
insert into TsTextResource set FId='4c1d6f3c-4d3e-4a3c-a50a-720bd2067dc2', FCode='T.Qs.About.MaxRegistered',					FValue='最大註冊用戶數';
insert into TsTextResource set FId='4397654b-e482-43fc-b05a-03a555a3ae60', FCode='T.Qs.About.MaxRecentLogin',					FValue='最大近期登錄用戶數';
insert into TsTextResource set FId='29e749c3-533a-4744-8308-1c57c17ee1cb', FCode='T.Qs.About.MaxRecentLoginData',				FValue='${0} 人 / ${1} 天';

insert into TsTextResource set FId='8af03979-573d-4106-b226-2ca8b28a0719', FCode='E.Qs.Auth.LicenseExpired',					FValue='License 已過期，不允許用戶登錄。';
insert into TsTextResource set FId='6abfc51f-db57-483d-9a61-8e0cab809676', FCode='E.Qs.Auth.TooManyRecentLoginUsers',				FValue='近期累計登錄用戶數量超過 License 限制。';
insert into TsTextResource set FId='bc520ab7-be92-421e-8183-f001565d34a6', FCode='E.Qs.Auth.TooManyRegisteredUsers',				FValue='註冊用戶數量超過 License 限制，不允許用戶登錄。';

update TsPage set FDialogHeight=426 where FCode = 'Qs.Misc.About';
