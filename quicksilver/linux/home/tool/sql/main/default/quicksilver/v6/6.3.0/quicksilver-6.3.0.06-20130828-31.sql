--列表相关系统参数

alter table TsLanguage add FFontFamily varchar(50);
insert into TsField set FId='71be192f-32f7-4901-9d2b-265996dfe2bf', FUnitId='e59603b0-5475-407e-8f1d-b3e2c4fe0c27', FName='FFontFamily',  FTitle='字体',         FType='InputBox-Text',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
java setFormFields('bbe7d774-1926-4635-b518-9cda868b7e95', '基本信息', '429ab835-ad91-4cc3-a7f8-f42fd97c2209', null, 'FName,FEnglishName,FCode,FFontFamily,FDefault');
java setListFields('6bfb1452-684a-4e53-b1a6-c315fc1a58d4', 'FName,FEnglishName,FCode,FDefault,FFontFamily');

--通知邮件内容长度

alter table TsNotice alter FEmailContent set data type varchar(100000);
update TsField set FSize=100000 where FId='5a66f1db-c258-4fd8-add2-c31725111a24';
