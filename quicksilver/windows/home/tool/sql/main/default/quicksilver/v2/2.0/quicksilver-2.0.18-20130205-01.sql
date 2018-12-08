delete from TsParameterDefinition where FId='176e0558-bcb1-4d01-a213-bb87b6060a6e';
insert into TsParameterDefinition set FId='176e0558-bcb1-4d01-a213-bb87b6060a6e', FName='通过系统邮箱发送个人邮件',	FCode='QsUserUseSystemEmail',	FParameterGroupId='d9807c89-34be-42df-9675-5600651280be', FType='CheckBox',				FRange='SystemAndUser',	FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=11;

delete from TsParameterDefinition where FId='c77cb028-1bd0-4656-9798-819a41b57131';
insert into TsParameterDefinition set FId='c77cb028-1bd0-4656-9798-819a41b57131', FName='最近登录语言',			    FCode='QsLastLoginLanguage',		FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Text',		FRange='User',		    FRowSpan=1, FColSpan=1, FRequired=1, FVisible=0, FIndex=5;

update TsField set FTitle='帮助信息' where FId='ac1e147f-bb2d-4b37-8ef6-f247b3145777';
update TsField set FRowSpan=13 where FId='0b9cd021-0bba-420f-8033-a3734c9eaf91';
update TsField set FRowSpan=11 where FId='edc45608-06a2-4b43-8151-108253f6c421';

alter table TsToolItem add FConfirmMessage varchar(200);
alter table TsToolSubItem add FConfirmMessage varchar(200);

delete from TsField where FId='923e5bf9-b40b-4b41-b2ea-7f2095275ce3';
insert into TsField set FId='923e5bf9-b40b-4b41-b2ea-7f2095275ce3', FUnitId='00000000-0000-0000-0001-000000000010', FName='FConfirmMessage',      FTitle='操作确认提示',          FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,     FValidation=null, FRelationCapacity=null, FSupportI18n=1;
java setFormFields('23635fa5-23ef-41d9-8e85-3762ffd3ee91', '(70a304f1-a414-4eeb-b071-0674eaf4ab84,基本信息,FCode|FName|FType|FAlign|FHint|FVisibleCondition|FEnableCondition,(64df8c6e-10e7-4163-8d4d-e1b71ae53e0d,类型相关信息,FIcon|FWidth|FLabel|FScale|FEntityUnitId|FDefaultValue)(4e8433df-64df-4039-8b00-c049b6ce71f5,下拉项设置,FSubItemSource|FDictionaryId|FSubItemRoutine))(3cc8ff6f-678c-4fe0-930b-acf4eae50cd2,默认事件,FHandleType|FHandlePageId|FConfirmMessage|FDefaultEventHandler)');

delete from TsField where FId='2a09981e-6252-425a-a791-7ed34fb39fe8';
insert into TsField set FId='2a09981e-6252-425a-a791-7ed34fb39fe8', FUnitId='b8081c53-782c-43c9-b406-561b29c040c5', FName='FConfirmMessage',   FTitle='操作确认提示',          FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,         FValidation=null, FRelationCapacity=null, FSupportI18n=1;
java setFormFields('2792504b-9609-4fe4-b90d-a7e55d2bace9', '(680d1c15-16fc-4f41-8b10-c5ffe6604103,基本信息,FName|FCode|FExpandMode|FVisibleCondition|FEnableCondition|FIcon)(ec9d2fc7-4a30-4843-8446-0adfa8467b9e,事件处理,FHandleType|FHandlePageId|FConfirmMessage|FEventHandler)');

alter table TsUnit drop FCreateDefaultWorkflow;
alter table TsUnit add column FSupportWorkflow bit;
java refreshUnits();
delete from TsField where FId='c4ea51a6-2653-4408-a904-a681cbc7656c';
insert into TsField set FId='c4ea51a6-2653-4408-a904-a681cbc7656c', FUnitId='00000000-0000-0000-0001-000000000001', FName='FSupportWorkflow',		FTitle='支持工作流',			FType='CheckBox',            FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,                     FValidation=null, FRelationCapacity=null;
java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FOpenViewPageFirst,FSupportVersion');
java setFormFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', '(59d36e10-fa9b-4ca7-8650-f4bc2333c5f0,基本信息,FName|FCode|FIcon|FModuleId|FOpenMode|FIsSlaveUnit|FMasterUnitId|FIsTreeStructure|FSupportWorkflow|FSupportUser|FSupportDepartment|FSupportEditType|FSupportDataPrivilege|FSupportNote|FSupportAttachment|FSupportVersion|FSupportBusinessLog|FRecordCreateInfo|FRecordUpdateInfo|FSupportSort|FEditId,(70cd09f2-5607-4d3d-a4e4-15a010b5c2d0,数据库设置,FDataSource|FTable|FKeyField|FKeyType|FNameField|FMasterField)(f3c8ed03-71a9-44ea-866a-ce74f02fb94e,类设置,FHomeClassName|FDaoClassName|FServiceClassName|FActionClassName)(f3f089fa-9689-41aa-abe8-2430f90869c9,高级设置))(8716f3a5-7c55-4a1d-b4d4-adde4702a211,其它信息,(a9fb9172-544a-4871-a6be-6ac416d6a75b,阅览设置,FOpenViewPageFirst)(d1882fc0-77a8-442f-9cde-2857b6c08760,过滤条件,FUnitFilterSql|FBusinessFilterSql)(88b5af9a-d39d-493d-b1f9-db23b282327e,描述,FDescription))');

alter table TwVersion drop FUnitId;
delete from TsField where FId='e5f06f85-b67d-447d-9565-4c556cf0e2fd';
delete from TsField where FId='50aa6d4f-e212-4181-9663-42b5b3731b2d';
insert into TsField set FId='50aa6d4f-e212-4181-9663-42b5b3731b2d', FUnitId='00000000-0000-0000-0001-000000003002', FName='FDescription',  FTitle='描述',       FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=11, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null;
java setFormFields('5446090f-6384-4b33-9d03-dd71c3638789', '(4962d435-7291-42dd-998c-ead311412859,-,FDescription)');

delete from TsTextResource where FCode='T.Wf.DefaultProcessName';

delete from TsTextResource where FId='8837753f-1fde-47e2-8fc2-74b7d5041933';
delete from TsTextResource where FId='64890c60-c36c-4e57-a443-f226dae5c41a';
delete from TsTextResource where FId='d357b205-c96c-4092-af2b-72ae87e066cf';
delete from TsTextResource where FId='0f5fab05-fc5c-4521-9132-d32b6afdd120';
delete from TsTextResource where FId='b3fe926f-f845-4a42-846d-eb3338707dd3';
delete from TsTextResource where FId='fef44594-9335-4e1c-8466-a7813eeabb16';
delete from TsTextResource where FId='16bbc89e-c671-4ad7-a26d-4900e3492ae5';
delete from TsTextResource where FId='28d7e2ee-ef97-4ef2-851b-e996bd224d92';
delete from TsTextResource where FId='816b0005-3c03-4ca9-95e8-d71d2ff55a67';
delete from TsTextResource where FId='f0ef606a-ce46-4102-a258-c627e184d7d5';
delete from TsTextResource where FId='89e7a5b0-51ec-4449-b6fa-372a1a3bf397';
delete from TsTextResource where FId='7145704f-9922-4c2c-b424-80b8fd091146';
delete from TsTextResource where FId='2b900d95-119e-4c58-b66c-781d07ea8e0d';
delete from TsTextResource where FId='ea43b270-b506-4a7f-9ba3-59917fe65bf2';
delete from TsTextResource where FId='6e8f64d8-2a0c-4cdd-a8ed-58716312c9c5';
delete from TsTextResource where FId='a27262b2-5650-43c4-8940-405cca8ebbb4';
delete from TsTextResource where FId='bab60934-aa1b-4ab8-b776-51e912f596b7';
delete from TsTextResource where FId='78a42cb3-a8c1-43b9-a984-851e1bd1dfc0';
delete from TsTextResource where FId='bdc527ee-876f-4386-931d-969600ef1e3f';
delete from TsTextResource where FId='5e48ac97-2d43-41cf-8903-d5afe360a9cc';
delete from TsTextResource where FId='362a2ec6-8fdc-431a-af97-815dd0964b37';
delete from TsTextResource where FId='d7d24f97-8243-4de3-b419-45fee4686e8b';
delete from TsTextResource where FId='349ea8b5-e678-44b3-8087-02352673b64e';
delete from TsTextResource where FId='e83e3e79-1225-47cf-ae5c-dedbbe0780fe';
delete from TsTextResource where FId='28bf0e72-3adc-460d-b7c4-aa8d0a94239a';
delete from TsTextResource where FId='321f9325-88a5-4acd-b12d-6fea8e48ce1b';
delete from TsTextResource where FId='dfe08750-cea6-4c9d-89a5-b59fce255151';
delete from TsTextResource where FId='dad93482-a687-41de-b39d-1b42f17088bf';
delete from TsTextResource where FId='af2c3b35-2e22-42a1-b896-2951df18e322';
delete from TsTextResource where FId='7d72625d-c294-4eda-a5ff-4548bbae1770';
delete from TsTextResource where FId='8e20c974-e8c0-4dd7-ab94-5813c2bf5eef';
delete from TsTextResource where FId='5b30e3a8-63db-4d57-9ca1-f1e20d7b4e3b';
delete from TsTextResource where FId='93186590-77b3-43af-89bc-88b0aea08084';
delete from TsTextResource where FId='eb812859-be32-4585-bdaa-8832fc2f9871';
delete from TsTextResource where FId='4695a48d-bac9-469a-ab72-448475e86fd5';
delete from TsTextResource where FId='4a69a13c-e034-49cc-bdb7-6551c02c1f5e';
delete from TsTextResource where FId='18a1e812-6ef5-4caf-964c-c555075cb1d7';
delete from TsTextResource where FId='bc12124a-7f2c-48e2-8ee8-7dff2e911eb5';
delete from TsTextResource where FId='210cabec-c52f-4eff-9b99-431956d9162b';
delete from TsTextResource where FId='2ce8503a-7195-4769-912b-a17c5a6cd849';
delete from TsTextResource where FId='4e56e6b1-e107-49d4-85a5-bb79c5c71f0c';
delete from TsTextResource where FId='dcd64b0f-28bc-4dfa-8933-4e0543ca8805';
delete from TsTextResource where FId='e078d578-a42e-4367-a96d-9d1240a66071';
delete from TsTextResource where FId='19699377-f93c-4e8b-9204-5a1556081591';
delete from TsTextResource where FId='66c135d1-ac4d-4f50-a321-ece3aa487f4b';
delete from TsTextResource where FId='f7f31ad6-995e-4475-8556-d37219843252';
delete from TsTextResource where FId='374a48da-e747-499d-a454-9bc5059bb36f';

delete from TsTextResource where FId='b622f1af-4d68-4804-9f85-d56d81ee04e4';
delete from TsTextResource where FId='7f5930ed-e5c2-43fd-9dcb-de35da85fdab';
delete from TsTextResource where FId='dd958f51-a7e2-488c-8882-b01340432ff1';
delete from TsTextResource where FId='169fa072-5e06-453d-81dd-b97abda2af25';
delete from TsTextResource where FId='92505b30-3f8f-49fa-925b-976157cb912f';
delete from TsTextResource where FId='3d366a3d-7c13-428c-9125-02ec59d562b4';
delete from TsTextResource where FId='04d54703-3b5f-451b-8455-e93cf80241ae';
delete from TsTextResource where FId='fea73ce6-d829-4939-8305-c61dc60eddd5';
delete from TsTextResource where FId='52a069c5-7b3f-46fe-af26-b9ed5c5e8e0a';
delete from TsTextResource where FId='7250618a-482e-45f3-ba0b-35021a1116d2';
delete from TsTextResource where FId='c323701f-2def-4dc2-82be-71e6a86838a0';
delete from TsTextResource where FId='4ef70d54-8557-4926-b7f1-69a5761b24da';
delete from TsTextResource where FId='ffd6b006-36a5-4ddd-8b3b-40f1cf78289a';

insert into TsTextResource set FCode='T.Wf.Button.DropdownItem',							FId='b622f1af-4d68-4804-9f85-d56d81ee04e4', FValue='下拉项';
insert into TsTextResource set FCode='T.Wf.Button.Name.Agree',								FId='7f5930ed-e5c2-43fd-9dcb-de35da85fdab', FValue='同意';
insert into TsTextResource set FCode='T.Wf.Button.Name.Back',								FId='dd958f51-a7e2-488c-8882-b01340432ff1', FValue='打回';
insert into TsTextResource set FCode='T.Wf.Button.Name.Submit',								FId='169fa072-5e06-453d-81dd-b97abda2af25', FValue='提交';
insert into TsTextResource set FCode='T.Wf.Line.Name.Agree',								FId='92505b30-3f8f-49fa-925b-976157cb912f', FValue='同意';
insert into TsTextResource set FCode='T.Wf.Line.Name.Back',									FId='3d366a3d-7c13-428c-9125-02ec59d562b4', FValue='打回';
insert into TsTextResource set FCode='T.Wf.Node.Button',									FId='04d54703-3b5f-451b-8455-e93cf80241ae', FValue='按钮';
insert into TsTextResource set FCode='T.Wf.Node.DuplicateCode',								FId='fea73ce6-d829-4939-8305-c61dc60eddd5', FValue='编码“${0}”已存在。';
insert into TsTextResource set FCode='T.Wf.Node.Name.Audit',								FId='52a069c5-7b3f-46fe-af26-b9ed5c5e8e0a', FValue='审核';
insert into TsTextResource set FCode='T.Wf.Node.Name.Back',									FId='7250618a-482e-45f3-ba0b-35021a1116d2', FValue='返回修改';
insert into TsTextResource set FCode='T.Wf.Node.Name.End',									FId='c323701f-2def-4dc2-82be-71e6a86838a0', FValue='结束';
insert into TsTextResource set FCode='T.Wf.Node.Name.Start',								FId='4ef70d54-8557-4926-b7f1-69a5761b24da', FValue='开始';
insert into TsTextResource set FCode='T.Wf.Node.Page',										FId='ffd6b006-36a5-4ddd-8b3b-40f1cf78289a', FValue='页面';

delete from TwVersion where FId='e2995c64-3119-43db-ae9b-5d5d14e3a8b6';

alter table TwNode drop FWorkflowId;
delete from TsField where FId='5965f749-6471-4d2e-b38c-b79e508617d2';
delete from TsRelation where FId='421662ac-b1ed-49d3-8a3d-ffa4f5cb1477';
delete from TsRelation where FId='237ea400-1dcb-4de0-a1b7-697d742eed95';

delete from TsField where FId='91640c8b-5972-4aee-ad19-771ca19e0b08';
delete from TsField where FId='a11a3f34-21e4-4582-8f64-28f94bdec5b8';
delete from TsField where FId='70e2c7e4-e9b1-46ac-ac2a-22468553c5c9';
insert into TsField set FId='91640c8b-5972-4aee-ad19-771ca19e0b08', FUnitId='00000000-0000-0000-0001-000000003001', FName='FCode',        FTitle='编码',         FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null, FRelationCapacity=null;
insert into TsField set FId='a11a3f34-21e4-4582-8f64-28f94bdec5b8', FUnitId='00000000-0000-0000-0001-000000003001', FName='FName',        FTitle='名称',         FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null, FRelationCapacity=null, FSupportI18n=1;
insert into TsField set FId='70e2c7e4-e9b1-46ac-ac2a-22468553c5c9', FUnitId='00000000-0000-0000-0001-000000003001', FName='FUnitId',      FTitle='单元',         FType='EntityBox',           FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000001', FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,  FValidation=null, FRelationCapacity=null;
java setOrderFields('00000000-0000-0000-0001-000000003001', 'FCode', '0');
