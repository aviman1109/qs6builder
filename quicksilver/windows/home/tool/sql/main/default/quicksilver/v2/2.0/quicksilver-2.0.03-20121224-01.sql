create table TsDepartmentAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

create table TsFieldGroupAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

create table TsMenuAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

create table TsParameterGroupAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

create table TsReportCatalogAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

create table TsChartCatalogAd
(
	FAncestorId uuid,
	FDescendantId uuid,
	unique (FAncestorId, FDescendantId)
);

--修改控件类型编码

delete from TsDictionaryItem where FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110';
insert into TsDictionaryItem set FId='21ec9012-eee3-4486-a916-c4b265cf4f6e', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Text',			FText='文本框',			FIndex=1;
insert into TsDictionaryItem set FId='fae88f82-0339-4cad-8d02-449c6873d5d7', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='TextBox',				FText='多行文本框',		FIndex=2;
insert into TsDictionaryItem set FId='80b4a3af-e2b5-48b8-8751-6fd98188b1fe', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Integer',		FText='整数框',			FIndex=3;
insert into TsDictionaryItem set FId='d1cd3091-167c-4396-98ea-fa81ec95183c', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-BigInt',		FText='大整数框',		FIndex=4;
insert into TsDictionaryItem set FId='1f29b29a-704b-4911-8abc-95d77387ace7', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Double',		FText='小数框',			FIndex=5;
insert into TsDictionaryItem set FId='666b7be1-873d-49bc-aa59-661e09da6bf1', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Percent',		FText='百分比框',		FIndex=6;
insert into TsDictionaryItem set FId='24c13c2a-a110-4449-b761-9867a83a7c9a', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Email',			FText='电子信箱框',		FIndex=7;
insert into TsDictionaryItem set FId='08eae235-8071-44f5-a53e-425f7bf138c0', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Phone',			FText='电话框',		    FIndex=8; 
insert into TsDictionaryItem set FId='5269cc53-16e9-4e9a-9094-0b62d3e190b9', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Url',			FText='网址框',			FIndex=9; 
insert into TsDictionaryItem set FId='7af59530-f93d-4b52-88ca-95da3cb0524a', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='CheckBox',				FText='勾选框',			FIndex=10;
insert into TsDictionaryItem set FId='5f3e8a9b-e2a9-4fa5-a4bc-e075d88b306b', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='MultiCheckBox',			FText='多勾选框',		FIndex=11;
insert into TsDictionaryItem set FId='9e5f854f-5223-4788-a278-b2af39b9efe8', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='RadioBox',				FText='点选框',			FIndex=12;
insert into TsDictionaryItem set FId='0cd901e1-9d1e-4eee-b02d-97cf25a35985', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='ComboBox-Inputable',		FText='可输入下拉框',	FIndex=13;
insert into TsDictionaryItem set FId='04de78eb-b3c5-4464-be82-639da6767243', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='ComboBox-SelectOnly',	FText='只选下拉框',		FIndex=14;
insert into TsDictionaryItem set FId='d2ded188-5e1d-4263-8018-da854a47cac5', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='DateBox-Date',			FText='日期框',			FIndex=15;
insert into TsDictionaryItem set FId='2c91b9bb-4897-4857-b6bd-1b27079be8d8', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='DateBox-DateTime',		FText='日期时间框',		FIndex=16;
insert into TsDictionaryItem set FId='83017c2a-8822-4a96-b354-dff7b94a6dc3', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='EntityBox',				FText='实体框',			FIndex=17;
insert into TsDictionaryItem set FId='62277e98-f0c1-43bf-adaa-a7afd000c26e', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='MultiEntityBox',			FText='多实体框',		FIndex=18;
insert into TsDictionaryItem set FId='887e6ff9-9380-4ae9-99f7-b44ef5b02366', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='PictureBox',				FText='图片框',			FIndex=19;
insert into TsDictionaryItem set FId='274945bb-3878-4d56-8802-343feb30e3d3', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='HtmlBox',				FText='HTML编辑框',		FIndex=20;
insert into TsDictionaryItem set FId='bd33e9e9-c203-47b6-947c-3fbeecf2fff1', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Key',			FText='键',				FIndex=21;
insert into TsDictionaryItem set FId='3a61641e-8ded-4f36-98ff-a3cc7f2a99fd', FDictionaryId='4d2eec6d-5f41-4c38-9ad1-c04ded9e3110', FValue='InputBox-Uuid',			FText='UUID',			FIndex=22;

update TsField set FType = 'RadioBox' where FType = 'MultiCheckBox-Single';
update TsField set FType = 'MultiCheckBox' where FType = 'MultiCheckBox-Multiple';

--调整单元字段宽度

alter table TsField add column FRelationCapacity int;
update TsField set FRelationCapacity = FEntityCapacity;
update TsField set FRelationCapacity = 20 where FRelationCapacity is null and FType in ('MultiEntityBox', 'MultiCheckBox');
alter table TsField drop column FEntityCapacity;

delete from TsField where FId='a883ff9a-feb8-4543-ad88-afc574ed387b';
insert into TsField set FId='a883ff9a-feb8-4543-ad88-afc574ed387b', FUnitId='00000000-0000-0000-0001-000000000002', FName='FRelationCapacity',      FTitle='最大关联数量',     FType='InputBox-Integer',    FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null;

java setFormFields('75138d58-0c96-43ed-962e-39b66f28a295', '(83da7ed2-8248-4c2e-b788-7976e5b8b070,基本信息,FTitle|FName|FType|FUnitId|FVisible|FRequired|FReadOnly|FQueryable|FDefaultValue|FValidation,(04234553-4f26-47c1-967d-389b0bdbce6f,类型信息,FSize|FScale|FRelationTable|FRelationCapacity|FDictionaryId)(7d4ddff1-5d65-41e0-b04a-89d60da24f8b,实体信息,FEntityUnitId|FSupportLocalText|FLocalTextField|FSelectListFilterSql)(2d1d1604-9001-461c-b19e-02d044a5d842,来源信息,FSourceType|FJoinField|FSourceField|FSource)(0c76fb5e-5e71-425e-97b0-38af40b7f88e,表单信息,FRowSpan|FColSpan|FLabelColor|FIsNewRow)(7544efe3-6515-42b9-a3bb-2840a68cdb5d,列表信息,FListWidth|FListAlign))');

--------------------------------------------------------------------------------

java refreshSerial('TsDepartment');
java refreshSerial('TsFieldGroup', 'FFormId');
java refreshSerial('TsMenu');
java refreshSerial('TsParameterGroup');
java refreshSerial('TsReportCatalog');
java refreshSerial('TsChartCatalog');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20121224-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20121224-01';
