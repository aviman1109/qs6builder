--minglei

delete from TsTextResource where FId='a52d84da-1d34-47d3-9474-7d1c32c3495e';
delete from TsTextResource where FId='7d33ec67-6136-47ac-b17f-e7fe3e52e86e';
delete from TsTextResource where FId='ebc2273d-681c-4441-b5ad-8bbc8ee623dd';
delete from TsTextResource where FId='7b92db4e-0ba3-4090-a3bd-075dfd1226a9';
delete from TsTextResource where FId='3d9cb5ca-cc39-4eef-85e6-6b9112c9257a';
delete from TsTextResource where FId='82fc65be-d7c5-4379-9373-0cc1e0cb5028';
delete from TsTextResource where FId='b4d74122-22b6-4177-99ef-f05162a722bf';
delete from TsTextResource where FId='57d82116-2a82-4288-a219-86137c158798';

delete from TsTextResource where FCode='E.Qs.User.ModifyPasswordIntervalDay';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordContainsNumAndChar';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordContainsNumAndCharAndSpecial';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordCharRepeatNumber';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordLength';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordBeforeSame';
delete from TsTextResource where FCode='E.Qs.User.InvalidPasswordLength';
delete from TsTextResource where FCode='E.Qs.User.Lock';
delete from TsTextResource where FCode='E.Qs.User.Lock.Notice';

insert into TsTextResource set FId='a52d84da-1d34-47d3-9474-7d1c32c3495e', FCode='E.Qs.User.PasswordModifyTooFrequently',  				FValue='兩次修改密碼至少要間隔 ${0} 天。';
insert into TsTextResource set FId='7d33ec67-6136-47ac-b17f-e7fe3e52e86e', FCode='E.Qs.User.PasswordTooSimple1',         				FValue='密碼需要包含字母、數字、特殊字元中的兩種。';
insert into TsTextResource set FId='ebc2273d-681c-4441-b5ad-8bbc8ee623dd', FCode='E.Qs.User.PasswordTooSimple2',         				FValue='密碼需要同時包含字母、數字、特殊字元。';
insert into TsTextResource set FId='7b92db4e-0ba3-4090-a3bd-075dfd1226a9', FCode='E.Qs.User.PasswordRepeatExceed',           			FValue='密碼同一字元不能重複  ${0} 次。';
insert into TsTextResource set FId='3d9cb5ca-cc39-4eef-85e6-6b9112c9257a', FCode='E.Qs.User.PasswordInvalidLength',						FValue='密碼長度必須介於 ${0} ~ ${1} 之間。';
insert into TsTextResource set FId='82fc65be-d7c5-4379-9373-0cc1e0cb5028', FCode='E.Qs.User.PasswordDuplicateWithHistory',              FValue='密碼不能與前 ${0} 次相同。';
insert into TsTextResource set FId='b4d74122-22b6-4177-99ef-f05162a722bf', FCode='E.Qs.User.LockedShortTime', 							FValue='您的帳號已被鎖住，請等待 ${0} 分鐘後再試。';
insert into TsTextResource set FId='57d82116-2a82-4288-a219-86137c158798', FCode='E.Qs.User.LockedLongTime',  							FValue='您的帳號已被鎖住，請聯繫系統管理員處理。';

delete from TsDictionaryItem where FId='5ccc95ec-bf82-4042-99d5-4362d7941771';
insert into TsDictionaryItem set FDictionaryId='4f2dbf3f-ee88-4704-a766-d788e46cf850', FId='5ccc95ec-bf82-4042-99d5-4362d7941771', FIndex=17,	FParentValue=null, FText='匯出',     FValue='Export';

delete from TsDictionaryItem where FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a';
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='a1cf6a3f-7a73-43ac-89cd-29039a718eec', FIndex=1, FParentValue=null, FText='[低] 不限制',                 FValue='low';
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='ea9f18b7-4d9a-4529-8f4d-99d2cc75c264', FIndex=2, FParentValue=null, FText='[中] 包含字母、數字、特殊字元中的兩種',          FValue='medium';
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='ba17cfa8-330c-4ce8-9343-b4810883a326', FIndex=3, FParentValue=null, FText='[高] 同時包含字母、數字、特殊字元', FValue='high';
