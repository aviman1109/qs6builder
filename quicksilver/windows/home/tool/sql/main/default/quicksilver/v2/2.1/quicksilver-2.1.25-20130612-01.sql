--单元事件的 FMethod 栏位改名为 FCode

alter table TsEntityEvent add FCode varchar(50);
update TsEntityEvent set FCode = FMethod;
alter table TsEntityEvent drop column FMethod;

delete from TsField where FId='a697f3e9-f068-4077-bab5-4fd834fa2def';
insert into TsField set FId='a697f3e9-f068-4077-bab5-4fd834fa2def', FUnitId='bcd42545-1172-43ad-b436-362b91f04542', FName='FCode',			FTitle='编码',			FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FSelectListFilterSql=null, FSourceType='local', FJoinField='',   FSourceField='',   FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=0,    FLabelColor='',   FDefaultValue='',   FValidation='',   FRelationCapacity=null;

java setOrderFields('bcd42545-1172-43ad-b436-362b91f04542', 'FCode,FOccasion,FIndex', '0,1,0');
java setFormFields('3fe6d67b-efa8-4e3f-963f-a6c1e683a998', '基本信息', '49be80ac-2711-49be-b706-2ac1f36f568b', null, 'FName,FCode,FOccasion,FType,FPrivilegeTypeId,FPrivilegeId,FWorkflowId,FActivityCode,FActivityResult,FNoticeId,FContent,FMessage');
java setListFields('25efd08f-31f4-4415-ba10-6ca999ebc029', 'FName,FCode,FOccasion,FType,FContent,FMessage');

--工作流按钮的 FEntityEventMethod 栏位改名为 FEntityEventCode

alter table TwButton add FEntityEventCode varchar(50);
update TwButton set FEntityEventCode = FEntityEventMethod;
alter table TwButton drop column FEntityEventMethod;

delete from TsField where FId='0209a66b-f677-4cda-be50-9136fe3a5a2c';
insert into TsField set FId='0209a66b-f677-4cda-be50-9136fe3a5a2c', FUnitId='5077e462-0080-48e3-aa65-7b38a3342d71', FName='FEntityEventCode',	FTitle='单元事件编码', FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setEditFields('4886f7a5-17b9-4e1c-bc0b-064eac98e99c', 'FName,FCode,FIcon,FHandleType,FPageId,FEntityEventCode,FSaveForm,FScript');
java setFormFields('0e21bc0f-1a4a-4386-b06d-b350fece466e', '-', '9fb0c348-579d-43c4-b819-463575bc2778', null, 'FName,FCode,FIcon', '事件处理', '21ddd7f1-1f6d-44ba-ad6e-40ab3afd3993', null, 'FHandleType,FPageId,FEntityEventCode,FSaveForm,FScript');

--工作流事件的 FEntityEventMethod 栏位改名为 FEntityEventCode

alter table TwEvent add FEntityEventCode varchar(50);
update TwEvent set FEntityEventCode = FEntityEventMethod;
alter table TwEvent drop column FEntityEventMethod;

delete from TsField where FId='d6c7bbc2-9e58-4e3e-a1b0-eebb33f3b468';
insert into TsField set FId='d6c7bbc2-9e58-4e3e-a1b0-eebb33f3b468', FUnitId='581eafe5-5fd5-499a-ac4d-d9878f0e4a7e', FName='FEntityEventCode',	FTitle='单元事件编码',	FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setFormFields('8aaacd43-c472-4e1a-b5f0-5993cee6da8f', '-', 'a07d3f65-2996-4f50-adea-d8b1fc8e16a0', null, 'FOccasion,FHandleType,FNoticeId,FEntityEventCode,FContent');

--单元事件编码的首字母改为大写

update TsEntityEvent set FCode = upper(substr(FCode, 1, 1)) || substr(FCode, 2, length(FCode) - 1);
update TwButton set FEntityEventCode = upper(substr(FEntityEventCode, 1, 1)) || substr(FEntityEventCode, 2, length(FEntityEventCode) - 1) where length(FEntityEventCode) > 0;
update TwEvent set FEntityEventCode = upper(substr(FEntityEventCode, 1, 1)) || substr(FEntityEventCode, 2, length(FEntityEventCode) - 1) where length(FEntityEventCode) > 0;

--工作流版本中，指定工作流启动时，触发何事件，记录何日志

alter table TwVersion add FEntityEventCode varchar(50);
alter table TwVersion add FBusinessLogCode varchar(50);
alter table TwVersion add FBusinessLogDescription varchar(100);
update TwVersion set FEntityEventCode='Submit' where FEntityEventCode is null;
update TwVersion set FBusinessLogCode='Submit' where FBusinessLogCode is null;

insert into TsField set FId='230024ce-c400-4501-9ea2-510a7e5df69f', FUnitId='00000000-0000-0000-0001-000000003002', FName='FBusinessLogCode',        FTitle='业务日志编码', FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='0ef7b9eb-d70e-4055-b49c-eebb89401126', FUnitId='00000000-0000-0000-0001-000000003002', FName='FBusinessLogDescription', FTitle='业务日志描述', FType='InputBox-Text',       FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='c6081b01-1c12-4f38-892a-633733cec806', FUnitId='00000000-0000-0000-0001-000000003002', FName='FEntityEventCode',        FTitle='单元事件编码', FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
update TsField set FRowSpan=7 where FId='50aa6d4f-e212-4181-9663-42b5b3731b2d';

java setFormFields('5446090f-6384-4b33-9d03-dd71c3638789', '启动流程时，触发的单元事件和写入的业务日志', '0304ca74-7558-416d-b4c7-da93ce59495f', null, 'FEntityEventCode,FBusinessLogCode,FBusinessLogDescription', '描述', '4962d435-7291-42dd-998c-ead311412859', null, 'FDescription');

--增加两个常用业务日志字典

delete from TsDictionaryItem where FId='348f3959-0309-459b-a5fc-5a799f16a1cc';
delete from TsDictionaryItem where FId='dffd4dcd-f124-49b2-a720-cf266ff7223d';
insert into TsDictionaryItem set FDictionaryId='4f2dbf3f-ee88-4704-a766-d788e46cf850', FId='348f3959-0309-459b-a5fc-5a799f16a1cc', FIndex=11,	FParentValue=null, FText='提交执行', FValue='SubmitExecute';
insert into TsDictionaryItem set FDictionaryId='4f2dbf3f-ee88-4704-a766-d788e46cf850', FId='dffd4dcd-f124-49b2-a720-cf266ff7223d', FIndex=12,	FParentValue=null, FText='提交关闭', FValue='SubmitFinish';

--系统参数

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='d9807c89-34be-42df-9675-5600651280be' and FIndex >= 15;
delete from TsParameterDefinition where FId='40109a17-4141-49e8-8a08-81c498562e68';
insert into TsParameterDefinition set FId='40109a17-4141-49e8-8a08-81c498562e68', FName='发送服务器要求验证',			FCode='QsSmtpServerRequireAuthentication',	FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=15;
delete from TsSystemParameter where FKey='QsSmtpServerRequireAuthentication';
insert into TsSystemParameter set FId='f9756dd8-e06d-48ba-b987-a93d0673044f', FKey='QsSmtpServerRequireAuthentication',	FValue='true';
