--hotbit.yu
delete from TsDictionary where FId='158b8ce5-ede0-069a-6183-c65444558360';
delete from TsDictionaryItem where FId='158b8cf4-c510-069a-6183-c65444558360';
delete from TsDictionaryItem where FId='158b8cf4-c380-069a-6183-c65444558360';
insert into TsDictionary set FBuiltin=0, FDescription='', FId='158b8ce5-ede0-069a-6183-c65444558360', FName='Qs-HTML 編輯器 Enter 按鍵設置', FParentId=null, FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='158b8ce5-ede0-069a-6183-c65444558360', FEnabled=1, FId='158b8cf4-c510-069a-6183-c65444558360', FIndex=1, FParentValue=null, FText='分段', FValue='1';
insert into TsDictionaryItem set FDictionaryId='158b8ce5-ede0-069a-6183-c65444558360', FEnabled=1, FId='158b8cf4-c380-069a-6183-c65444558360', FIndex=2, FParentValue=null, FText='換行', FValue='2';

delete from TsParameterDefinition where FCode='QsHtmlBoxEnterMode';
delete from TsParameterDefinition where FCode='QsHtmlBoxSpellCheck';
insert into TsParameterDefinition set FCode='QsHtmlBoxEnterMode',                FColSpan=1, FDictionaryId='158b8ce5-ede0-069a-6183-c65444558360', FEntityUnitId=null,                                   FId='158b8ce9-f620-069a-6183-c65444558360', FIndex=38, FName='HTML 編輯框中 Enter 鍵設置',               FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FRange='System',        FRequired=1, FRowSpan=1, FScale=null, FType='ComboBox-SelectOnly', FVisible=1;
insert into TsParameterDefinition set FCode='QsHtmlBoxSpellCheck',               FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='158b8d8c-5840-069a-6183-c65444558360', FIndex=39, FName='HTML 編輯器是否開啟拼寫檢查',              FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
