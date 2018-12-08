--minglei

delete from TsParameterDefinition where FCode='QsProcessHttpResponseForVscan';
insert into TsParameterDefinition set FId='b59e69d4-d847-40ca-b281-6abe24e5f2a0', FName='對 HTTP 回應進行弱掃處理',						FCode='QsProcessHttpResponseForVscan',					FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=11;

java runOnEmpty(
	'select 1 from TsSystemParameter where FKey = ''QsProcessHttpResponseForVscan''',
	'insert into TsSystemParameter set FId=''8c0191c5-b59a-4ba4-aeee-c39ed19a96c9'', FKey=''QsProcessHttpResponseForVscan'',			FValue=''true'''
);
