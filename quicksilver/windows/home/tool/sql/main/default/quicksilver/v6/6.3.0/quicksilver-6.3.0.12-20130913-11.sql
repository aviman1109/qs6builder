delete from TsTextResource where FId='a3b97350-6999-4860-84bf-20df6c657ccc';
delete from TsTextResource where FId='8cea0e3b-1266-4464-bcd3-d53d9037a639';
delete from TsTextResource where FId='e17e10c0-e0fd-47b1-9381-3e6fc3806ea1';
insert into TsTextResource set FId='a3b97350-6999-4860-84bf-20df6c657ccc', FCode='E.Qs.Auth.SessionInvalid',							FValue='您尚未登錄或連接中斷，請重新登錄。';
insert into TsTextResource set FId='8cea0e3b-1266-4464-bcd3-d53d9037a639', FCode='T.Qs.Auth.CrowdOut',									FValue='由於線上人數超過系統許可，您已被擠出本系統。請重新登錄，或聯繫系統管理員。';
insert into TsTextResource set FId='e17e10c0-e0fd-47b1-9381-3e6fc3806ea1', FCode='T.Qs.Auth.KickOut',									FValue='您已被踢出系統。請重新登錄，或聯繫系統管理員。';
