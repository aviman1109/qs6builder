--minglei

delete from TsParameterDefinition where FCode='QsReturnErrorStack';
insert into TsParameterDefinition set FId='720d5438-00b6-4d23-b3cc-cf7a41b6fa56', FName='返回錯誤棧到用戶端',						FCode='QsReturnErrorStack',					FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=10;

java runOnEmpty(
	'select 1 from TsSystemParameter where FKey = ''QsReturnErrorStack''',
	'insert into TsSystemParameter set FId=''68deefe0-c4b7-485d-bb26-908a3b2e745f'', FKey=''QsReturnErrorStack'',			FValue=''false'''
);
