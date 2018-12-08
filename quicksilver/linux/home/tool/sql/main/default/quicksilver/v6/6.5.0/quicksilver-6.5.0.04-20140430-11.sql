--minglei--------------------------------------------------

insert into TsDictionary set FId='9e0e979c-be7c-4ddb-ba73-622674294625', FName='QS-參數-HTML 編輯器', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='c1e65b7a-5948-4c0c-b4a0-157a0c2f7543', FDictionaryId='9e0e979c-be7c-4ddb-ba73-622674294625', FValue='ckeditor',			FText='CKEditor',		FIndex=1;
insert into TsDictionaryItem set FId='6a1908e7-8c8a-4621-b9f4-7b3a7709566d', FDictionaryId='9e0e979c-be7c-4ddb-ba73-622674294625', FValue='kindeditor',			FText='KindEditor',		FIndex=2;

update TsParameterDefinition set FIndex = FIndex - 2 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 4 and FIndex <= 9;
update TsParameterDefinition set FIndex = FIndex + 2 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 10;
update TsParameterDefinition set FIndex = 8 where FCode='QsMenuWidth';
update TsParameterDefinition set FIndex = 9 where FCode='QsMenuHide';
update TsParameterDefinition set FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FIndex = 11 where FCode = 'QsHtmlBoxImageAutoUpload';
update TsParameterDefinition set FIndex = 6 where FCode='QsLastLoginLanguage';

delete from TsParameterDefinition where FId='084d9aa9-09fc-4109-98ea-e489a77d818a';
insert into TsParameterDefinition set FId='084d9aa9-09fc-4109-98ea-e489a77d818a', FName='HTML 編輯器',					FCode='QsHtmlBoxEditor',						FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=1, FVisible=1, FIndex=10, FDictionaryId='9e0e979c-be7c-4ddb-ba73-622674294625';
delete from TsSystemParameter where FKey='QsHtmlBoxEditor';
insert into TsSystemParameter set FId='ea274521-6cd1-4451-998e-b6daf623b67c', FKey='QsHtmlBoxEditor',	FValue='ckeditor';
