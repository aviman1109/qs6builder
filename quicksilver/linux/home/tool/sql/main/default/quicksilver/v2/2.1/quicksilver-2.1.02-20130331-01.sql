alter table TsPage add FQueryOnLoad varchar(10);
alter table TsPage add FQuerySchemaId uuid;
alter table TsPage add FQueryFormAutoQuery bit;

update TsPage set FQueryFormAutoQuery = (select FQueryFormAutoQuery from TsUnit where FId = TsPage.FUnitId)
where FType = 'EntityList' and FQueryFormAutoQuery is null;

--alter table TsUnit drop FQueryFormAutoQuery;

delete from TsField where FId='a4c073b5-bd7a-4b6f-9260-4f91f9439d5d';
delete from TsField where FId='4ec766f2-cbaf-4ced-b5e9-49b1684f785f';
delete from TsField where FId='ccc2211a-815b-4f06-b9b0-a52d84546fa6';
insert into TsField set FId='a4c073b5-bd7a-4b6f-9260-4f91f9439d5d', FUnitId='00000000-0000-0000-0001-000000000006', FName='FQueryOnLoad',			FTitle='加载时查询',		FType='ComboBox-SelectOnly', FSize=10,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='b44d43d4-0318-4b80-b0b3-133ad050dffa', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FSelectListFilterSql='',												FSourceType='local', FJoinField='',   FSourceField='',   FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=0,    FLabelColor='',   FDefaultValue=null,									FValidation='',   FRelationCapacity=null;
insert into TsField set FId='4ec766f2-cbaf-4ced-b5e9-49b1684f785f', FUnitId='00000000-0000-0000-0001-000000000006', FName='FQuerySchemaId',			FTitle='查询方案',			FType='EntityBox',           FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000013', FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql='FPublic = 1 and FUnitId = ${form.FUnitId}',	FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,									FValidation=null, FRelationCapacity=null;
insert into TsField set FId='ccc2211a-815b-4f06-b9b0-a52d84546fa6', FUnitId='00000000-0000-0000-0001-000000000006', FName='FQueryFormAutoQuery',	FTitle='查询表单自动查询',	FType='CheckBox',            FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField='',   FSelectListFilterSql='',												FSourceType='local', FJoinField='',   FSourceField='',   FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=60,  FListAlign='default', FScale=0,    FLabelColor='',   FDefaultValue='true',								FValidation='',   FRelationCapacity=null;

java setFormFields('aaf46acb-c21a-4e23-8621-6bd007f59c77', '基本信息', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', null, 'FPlatform,FType,FIsSlavePage,FRelationId,FUnitId,FMasterUnitId', '通用信息', '66ff47a0-2194-4a9b-9b0b-06d0dc1ac27b', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FCode,FName,FTitle,FUrl,FActionMethodName,FLoadHandler', '列表信息', '6fdfaf24-efd9-444f-952b-a738654a4d68', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FQueryOnLoad,FQuerySchemaId,FQueryFormAutoQuery,FHasViewFrame', '电脑信息', '0e78d39e-0a96-4520-9c64-499b583b9897', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FIcon,FDialogWidth,FDialogHeight', '描述', 'ed6e4ca6-8917-4648-9247-5d158179fb97', '0185c28b-3e08-4bf9-9baf-c4a4c4aa4edc', 'FDescription');

delete from TsDictionary where FId='b44d43d4-0318-4b80-b0b3-133ad050dffa';
delete from TsDictionaryItem where FDictionaryId='b44d43d4-0318-4b80-b0b3-133ad050dffa';
insert into TsDictionary set FBuiltin=1, FId='b44d43d4-0318-4b80-b0b3-133ad050dffa', FName='QS-页面-加载时查询动作', FTextAsValue=0;
insert into TsDictionaryItem set FDictionaryId='b44d43d4-0318-4b80-b0b3-133ad050dffa', FId='28a004f8-c593-4aa0-b85f-7e374710f235', FIndex=1, FText='默认(按系统参数设置)',	FValue='Default';
insert into TsDictionaryItem set FDictionaryId='b44d43d4-0318-4b80-b0b3-133ad050dffa', FId='2710f359-9572-4dcf-93e5-8f5b568dbde0', FIndex=2, FText='是',					FValue='Yes';
insert into TsDictionaryItem set FDictionaryId='b44d43d4-0318-4b80-b0b3-133ad050dffa', FId='6c56028f-becb-4792-b65d-f019e7503c15', FIndex=3, FText='否',					FValue='No';

update TsParameterDefinition set FCode='QsListQueryOnLoad' where FCode='QsListAutoQuery';
update TsSystemParameter set FKey='QsListQueryOnLoad' where FKey='QsListAutoQuery';
