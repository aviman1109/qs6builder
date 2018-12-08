--minglei

delete from TsParameterDefinition where FId='573d8926-e779-41f3-a6f6-322d5590af4d';
insert into TsParameterDefinition set FId='573d8926-e779-41f3-a6f6-322d5590af4d', FName='UUID 前置位',				FCode='QsUuidLeadHexes',				FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=0, FIndex=8;

insert into TsSystemParameter set FId='7f36c172-58f2-485d-b7b8-f36468d29320', FKey='QsUuidLeadHexes',				FValue=null;
update TsSystemParameter set FValue = 'FFFFFF' where FKey='QsUuidLeadHexes' and FValue is null and exists (select * from TsTimerLog);
