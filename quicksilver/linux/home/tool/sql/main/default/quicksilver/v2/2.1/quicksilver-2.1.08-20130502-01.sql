--email

update TsParameterDefinition set FIndex = FIndex + 4 where FParameterGroupId='d9807c89-34be-42df-9675-5600651280be' and FIndex > 2;
insert into TsParameterDefinition set FId='1c533584-6f4a-47be-b2c3-30b94e3fdd76', FName='邮件发送端口',					FCode='QsSmtpPort',							FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='958024f8-454f-4d01-bee5-97faad228631', FName='邮件接收端口',					FCode='QsPop3Port',							FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;
insert into TsParameterDefinition set FId='2bfa4441-af7a-4ce1-8bb8-d2515668206b', FName='邮件发送加密方式',				FCode='QsSmtpEncryption',					FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5, FDictionaryId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3';
insert into TsParameterDefinition set FId='429908e0-67f3-45da-8a24-9a784fda2e17', FName='邮件接收加密方式',				FCode='QsPop3Encryption',					FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=6, FDictionaryId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3';
insert into TsParameterDefinition set FId='65ab5a08-e099-4b8c-bd9d-f37d69101a01', FName='用 Base64 加密邮箱账户/密码',	FCode='QsEmailAuthenticationWithBase64',	FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=15;

insert into TsDictionary set FId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3', FName='QS-参数-邮件连接加密方式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='54082c0e-86d6-477e-8a7a-f4ddf1dc14d2', FDictionaryId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3', FValue='None',				FText='无',		FIndex=1;
insert into TsDictionaryItem set FId='17e4656e-ff68-424e-980e-f674a6158c68', FDictionaryId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3', FValue='SSL',				FText='SSL',	FIndex=2;
insert into TsDictionaryItem set FId='c2ee8771-ac0b-40ef-acf2-8365e970c3c9', FDictionaryId='d2740fe6-bff7-47db-89c1-14b4cd3c16c3', FValue='TLS',				FText='TLS',	FIndex=3;

--notice

alter table TsNotice add FEmailCc varchar(200);
insert into TsField set FId='dbdfab53-da65-4392-b728-272dbca76f8b', FUnitId='00000000-0000-0000-0001-000000000023', FName='FEmailCc',              FTitle='邮件抄送',         FType='InputBox-Text', FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0;
