--lei.lei password
insert into TsDictionary set FBuiltin=0, FDescription='', FId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FName='QS-員工-密碼強度', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='a1cf6a3f-7a73-43ac-89cd-29039a718eec', FIndex=1, FParentValue=null, FText='[低]不限制',                 FValue='low';
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='ea9f18b7-4d9a-4529-8f4d-99d2cc75c264', FIndex=2, FParentValue=null, FText='[中]要有英文,數字',          FValue='medium';
insert into TsDictionaryItem set FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEnabled=1, FId='ba17cfa8-330c-4ce8-9343-b4810883a326', FIndex=3, FParentValue=null, FText='[高]要有英文,數字,特殊字元', FValue='high';


insert into TsParameterGroup set FId='8656df49-af32-4a45-8d55-a516a3776ade', FIndex=9,  FName='密碼強度',            FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec', FTreeLevel=2, FTreeSerial='001.009';
insert into TsParameterDefinition set FCode='QsPasswordLengthMin',               FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='43367e0c-89a6-421b-a30a-1d2dba440833', FIndex=1,  FName='密碼長度限制(最少)',             FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=1, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordLengthMax',               FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='4fd53f85-be4f-445a-a369-29515badf7e1', FIndex=2,  FName='密碼長度限制(最多)',             FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=1, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordIntensity',               FColSpan=1, FDictionaryId='e7dded85-ee59-4d61-9d57-6f2fb5c53f6a', FEntityUnitId=null,                                   FId='79329e9a-eebb-4ab3-9cb6-c4045656a0d0', FIndex=3,  FName='密碼強度',                       FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='ComboBox-SelectOnly', FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordUpdateRate',              FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='31466662-609d-434e-a215-215362b02d3f', FIndex=4,  FName='密碼更新頻率(天)',               FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordUpdateNotSameNumber',     FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='05868f3a-4ede-47fd-9b7d-43bf7fb93232', FIndex=5,  FName='密碼修改不可與前x次相同',        FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordSameCharNumber',          FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='eede1922-964d-4fe5-9984-4704191d2dd7', FIndex=6,  FName='密碼同一字元重複次數限制',       FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordInputNumber',             FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='436bf4fd-95f5-4f7f-b5bf-39c36b8e35ef', FIndex=7,  FName='密碼輸入錯誤次數(鎖定)',         FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsParameterDefinition set FCode='QsUserLockTime',                    FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='1d178cd0-4d3b-4ebf-8c87-902758d0b19f', FIndex=8,  FName='鎖定時間(分)',                   FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;

insert into TsSystemParameter set FId='41a69f49-3ff7-4b28-b222-7d4f3b2a769c', FKey='QsPasswordLengthMin',               FValue='6';
insert into TsSystemParameter set FId='39e820c2-3cf9-489b-85b7-ba5c41e53f95', FKey='QsPasswordLengthMax',               FValue='20';
insert into TsSystemParameter set FId='228b7ba4-ab6a-4067-8cc4-b531938af69d', FKey='QsPasswordIntensity',               FValue='low';
insert into TsSystemParameter set FId='d13e7c9d-abb2-49e0-8e61-efecfb4f634e', FKey='QsPasswordUpdateRate',              FValue='90';
insert into TsSystemParameter set FId='706ea3ff-ba3f-4b3f-a45c-6afede6b2ad6', FKey='QsPasswordUpdateNotSameNumber',     FValue='3';
insert into TsSystemParameter set FId='964b4459-e384-4857-bd5b-b2a36d2966eb', FKey='QsPasswordSameCharNumber',          FValue='3';
insert into TsSystemParameter set FId='354f1c2d-b6b2-468b-9b72-a6144fe4d9da', FKey='QsPasswordInputNumber',             FValue='3';
insert into TsSystemParameter set FId='f6e57b23-e3a4-4471-b8ea-f49be8ba7749', FKey='QsUserLockTime',                    FValue='30';

delete from TsTextResource where FId='3d9cb5ca-cc39-4eef-85e6-6b9112c9257a';
insert into TsTextResource set FId='3d9cb5ca-cc39-4eef-85e6-6b9112c9257a', FCode='E.Qs.User.InvalidPasswordLength',						FValue='密碼長度必須介於 ${0}~${1} 之間。';

insert into TsTextResource set FId='82fc65be-d7c5-4379-9373-0cc1e0cb5028', FCode='E.Qs.User.InvalidPasswordBeforeSame',                 FValue='新密碼不能是與前  ${0} 次使用過的密碼。';
insert into TsTextResource set FId='7b92db4e-0ba3-4090-a3bd-075dfd1226a9', FCode='E.Qs.User.InvalidPasswordCharRepeatNumber',           FValue='密碼同一字元不能重複  ${0} 次。';
insert into TsTextResource set FId='7d33ec67-6136-47ac-b17f-e7fe3e52e86e', FCode='E.Qs.User.InvalidPasswordContainsNumAndChar',         FValue='密碼需包含數字，英文。';
insert into TsTextResource set FId='ebc2273d-681c-4441-b5ad-8bbc8ee623dd', FCode='E.Qs.User.InvalidPasswordContainsNumAndCharAndSpecial',FValue='密碼需包含數字，英文，特殊字符。';


create table TsUserPasswordHistory
(
	FUserId uuid,
	FPassword varchar(50),
	FHistoryTime timestamp
);

insert into TsUserPasswordHistory(FUserId, FPassword, FHistoryTime) select FId, FPassword, now() from TsUser;