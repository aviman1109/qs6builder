alter table TsViewItemButton add FCode varchar(50);

delete from TsField where FId='53a97723-b12e-4f26-995b-aad5beb1e8e3';
insert into TsField set FId='53a97723-b12e-4f26-995b-aad5beb1e8e3', FUnitId='1483fd8c-d559-45c4-879f-df0edbae3f7a', FName='FCode',         FTitle='编码',                 FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1,  FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;

java setFormFields('2b74283a-fac6-4755-9976-50917f47e8e6', '(ab1130a1-53bb-440e-bf7b-46ed57208fde,基本信息,FName|FCode|FEventHandler)');
java setListFields('bf0ba6e7-8b93-4a05-8182-bc5a6c526c27', 'FName,FCode,FEventHandler');
java setListFields('a454a11a-45ac-48a9-8627-dda65a1b9fb8', 'FName,FCode,FEventHandler');
java setListFields('251ae17b-e885-4fc0-815f-ee31dff1d864', 'FName,FCode,FEventHandler');

java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '(680d1c15-16fc-4f41-8b10-c5ffe6604103,基本信息,FName|FCode|FExpandMode|FVisibleCondition|FEnableCondition|FIcon|FHandleType|FHandlePageId|FEventHandler)');

delete from TsTextResource where FId='fcf34326-a42b-4553-82a6-16cec97e04bb';
delete from TsTextResource where FId='dada7a81-3a0a-46cb-8b75-737e7a2fb4d6';
delete from TsTextResource where FId='f210df32-6a70-4361-bf3c-65677b088136';
delete from TsTextResource where FId='51bc06c7-c434-45ee-91c7-739e89a0adce';
delete from TsTextResource where FId='fbab08cd-a7b6-46a1-a90c-0876799429c9';
insert into TsTextResource set FCode='T.Esc.WeekDays',									   FId='fcf34326-a42b-4553-82a6-16cec97e04bb', FValue='周日|周一|周二|周三|周四|周五|周六';
insert into TsTextResource set FCode='T.Esc.ShortWeekDays',                                FId='dada7a81-3a0a-46cb-8b75-737e7a2fb4d6', FValue='日|一|二|三|四|五|六';
insert into TsTextResource set FCode='T.Esc.DateBox.Today',                                FId='f210df32-6a70-4361-bf3c-65677b088136', FValue='今天';
insert into TsTextResource set FCode='T.Esc.DateBox.EmptyYear',                            FId='51bc06c7-c434-45ee-91c7-739e89a0adce', FValue='空年';
insert into TsTextResource set FCode='T.Esc.DateBox.NullValue',                            FId='fbab08cd-a7b6-46a1-a90c-0876799429c9', FValue='空值';

delete from TsI18nText where FEntityId='fcf34326-a42b-4553-82a6-16cec97e04bb';
delete from TsI18nText where FEntityId='dada7a81-3a0a-46cb-8b75-737e7a2fb4d6';
delete from TsI18nText where FEntityId='f210df32-6a70-4361-bf3c-65677b088136';
delete from TsI18nText where FEntityId='51bc06c7-c434-45ee-91c7-739e89a0adce';
delete from TsI18nText where FEntityId='fbab08cd-a7b6-46a1-a90c-0876799429c9';
insert into TsI18nText set FLanguage='zh-tw', FTableName='TsTextResource', FFieldName='FValue', FEntityId='fcf34326-a42b-4553-82a6-16cec97e04bb', FText='周日|周一|周二|周三|周四|周五|周六';
insert into TsI18nText set FLanguage='zh-tw', FTableName='TsTextResource', FFieldName='FValue', FEntityId='dada7a81-3a0a-46cb-8b75-737e7a2fb4d6', FText='日|一|二|三|四|五|六';              
insert into TsI18nText set FLanguage='zh-tw', FTableName='TsTextResource', FFieldName='FValue', FEntityId='f210df32-6a70-4361-bf3c-65677b088136', FText='今天';                              
insert into TsI18nText set FLanguage='zh-tw', FTableName='TsTextResource', FFieldName='FValue', FEntityId='51bc06c7-c434-45ee-91c7-739e89a0adce', FText='空年';                              
insert into TsI18nText set FLanguage='zh-tw', FTableName='TsTextResource', FFieldName='FValue', FEntityId='fbab08cd-a7b6-46a1-a90c-0876799429c9', FText='空值';                              
insert into TsI18nText set FLanguage='en-us', FTableName='TsTextResource', FFieldName='FValue', FEntityId='fcf34326-a42b-4553-82a6-16cec97e04bb', FText='Sun|Mon|Tue|Thu|Wed|Fri|Sat';
insert into TsI18nText set FLanguage='en-us', FTableName='TsTextResource', FFieldName='FValue', FEntityId='dada7a81-3a0a-46cb-8b75-737e7a2fb4d6', FText='Sun|Mon|Tue|Thu|Wed|Fri|Sat';
insert into TsI18nText set FLanguage='en-us', FTableName='TsTextResource', FFieldName='FValue', FEntityId='f210df32-6a70-4361-bf3c-65677b088136', FText='Today';
insert into TsI18nText set FLanguage='en-us', FTableName='TsTextResource', FFieldName='FValue', FEntityId='51bc06c7-c434-45ee-91c7-739e89a0adce', FText='Empty Year';
insert into TsI18nText set FLanguage='en-us', FTableName='TsTextResource', FFieldName='FValue', FEntityId='fbab08cd-a7b6-46a1-a90c-0876799429c9', FText='Clear';
