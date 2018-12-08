--lei.lei
insert into TsParameterDefinition set FCode='QsPasswordCompelMifty',             FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='2ce9a6d6-94ab-408b-a5cb-04ea0a96741a', FIndex=19, FName='強制要求帳戶變更密碼',           FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordInputFailNotice',         FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='bbdbb46c-31b1-4f06-b59d-f32bec3b00db', FIndex=20, FName='密碼登誤通知',                   FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
insert into TsParameterDefinition set FCode='QsPasswordUpdateIntervalDay',       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='450113af-7167-4a93-923d-57679a2921b9', FIndex=21, FName='密碼變更间隔天數',                   FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',    FRequired=1, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;
insert into TsSystemParameter set FId='6aae26a6-51d8-4366-b5d1-446e1149fb34', FKey='QsPasswordUpdateIntervalDay',       FValue='0';

alter table TsUserInputPasswordErrorCount add FLock bit default 0;

insert into TsTextResource set FCode='E.Qs.User.ModifyPasswordIntervalDay', FId='a52d84da-1d34-47d3-9474-7d1c32c3495e', FValue='密碼變更時間必須要間隔${0}天。';

delete from TsParameterDefinition where FId='31466662-609d-434e-a215-215362b02d3f';
insert into TsParameterDefinition set FCode='QsPasswordUpdateRate',              FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='31466662-609d-434e-a215-215362b02d3f', FIndex=4,  FName='密碼變更頻率(天)',               FParameterGroupId='8656df49-af32-4a45-8d55-a516a3776ade', FRange='System',        FRequired=1, FRowSpan=1, FScale=null, FType='InputBox-Integer',    FVisible=1;

insert into TsTextResource set FCode='T.Qs.Parameter.InvalidPasswordRate', FId='fe3cb83e-f9ec-433d-90a4-dfb9c1076cf0', FValue='密碼變更天數必須大於密碼間隔天數。';


insert into TsTextResource set FCode='E.Qs.User.Lock.Notice', FId='57d82116-2a82-4288-a219-86137c158798', FValue='登錄名為"${0}"已被鎖住，請通知系統管理員。';
