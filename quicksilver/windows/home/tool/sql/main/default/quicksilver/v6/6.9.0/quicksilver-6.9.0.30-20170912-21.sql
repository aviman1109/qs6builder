--minglei

delete from TsTextResource where FCode='E.Qs.User.ExceedLicenseLimitation';
delete from TsTextResource where FCode='E.Qs.User.LicenseLimitExceedOnCreate';
delete from TsTextResource where FCode='E.Qs.User.LicenseLimitExceedOnEnable';

insert into TsTextResource set FId='783b3c03-0ea2-42cb-8e48-61eb985cd1ab', FCode='E.Qs.User.LicenseLimitExceedOnCreate',					FValue='啟用用戶已經達到 License 上限，不能增加新用戶。';
insert into TsTextResource set FId='ef60a92e-132b-436c-9daf-bbbfc611ad49', FCode='E.Qs.User.LicenseLimitExceedOnEnable',					FValue='啟用用戶總數不能超過 License 上限。';
