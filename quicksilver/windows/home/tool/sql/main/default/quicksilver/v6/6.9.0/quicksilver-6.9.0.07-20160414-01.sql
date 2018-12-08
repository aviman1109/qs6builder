--minglei

insert into TsParameterDefinition set FId='88c41a62-1a2c-4c55-a87b-04a942eed99d', FName='禁止其它網域以 iframe 方式打開本系統頁面',	FCode='QsForbidIframeByOtherDomain',					FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=9;

java runOnEmpty(
	'select 1 from TsSystemParameter where FKey=''QsForbidIframeByOtherDomain''',
	'insert into TsSystemParameter set FId=''8a32179e-d3cf-47c1-aaca-544359ea78e5'', FKey=''QsForbidIframeByOtherDomain'',		FValue=''true'''
);
