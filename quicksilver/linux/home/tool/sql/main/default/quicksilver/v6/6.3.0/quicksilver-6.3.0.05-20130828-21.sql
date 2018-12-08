--列表相关系统参数

update TsParameterGroup set FIndex = FIndex + 1 where FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec' and FIndex >= 7;
insert into TsParameterGroup set FId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FName='列表设置',				FParentId='1b380ee1-cbdb-44e4-980c-7a789b428cec',	FIndex=7;

update TsParameterDefinition set FIndex = FIndex - 3 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 10;
update TsParameterDefinition set FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FIndex=1 where FId='679ac185-c913-4f16-8662-1fba49ba0a0f';
update TsParameterDefinition set FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FIndex=5 where FId='c9d8f94c-4b9b-4db0-9fe1-ca288c4a2e2e';
update TsParameterDefinition set FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FIndex=6 where FId='82479d99-fc1f-4640-b34b-07f03811c319';

delete from TsParameterDefinition where FId='75e43c57-a6c0-46e3-aad4-df7ad6835ac4';
delete from TsParameterDefinition where FId='ca6d7b50-eace-4f65-8ec7-d6e0d508f107';
delete from TsParameterDefinition where FId='708b4d93-b409-4cbc-a1f4-3d7056408537';
insert into TsParameterDefinition set FId='75e43c57-a6c0-46e3-aad4-df7ad6835ac4', FName='查询方案/关键字背景色',		FCode='QsListQueryBoxBackgroundColor',		FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2; 
insert into TsParameterDefinition set FId='ca6d7b50-eace-4f65-8ec7-d6e0d508f107', FName='查询方案框宽度',				FCode='QsListQuerySchemaBoxWidth',			FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FType='InputBox-Integer',		FRange='System',        FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3; 
insert into TsParameterDefinition set FId='708b4d93-b409-4cbc-a1f4-3d7056408537', FName='关键字框宽度',					FCode='QsListKeywordBoxWidth',				FParameterGroupId='cfb3395e-3468-4a49-a1ee-0d651e7d02d6', FType='InputBox-Integer',		FRange='System',        FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4; 

insert into TsSystemParameter set FId='46beb329-2eea-4d8b-8ac3-1daeb5f12044', FKey='QsListQuerySchemaBoxWidth',			FValue='200';
insert into TsSystemParameter set FId='fa8d8a44-6015-4e7e-90a6-8f6fac67eae6', FKey='QsListKeywordBoxWidth',				FValue='200';
