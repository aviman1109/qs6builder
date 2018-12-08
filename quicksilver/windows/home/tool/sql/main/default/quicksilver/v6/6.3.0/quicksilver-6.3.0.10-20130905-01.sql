--清理

delete from TsRelation where not exists (select * from TsUnit where FId = TsRelation.FUnitId1);
delete from TsRelation where not exists (select * from TsUnit where FId = TsRelation.FUnitId2);

--圖表

alter table TsChart alter FGroupField1 set data type varchar(50);
alter table TsChart alter FGroupField2 set data type varchar(50);

update TsField set FTitle='分組欄位1', FSize=50 where FId='1500c6ed-984d-43a8-9f06-c6f5d975c3f0';
update TsField set FTitle='分組欄位2', FSize=50 where FId='a036d432-c3f6-4013-90e6-5700de6b5722';
update TsField set FTitle='分組選項1' where FId='0f8ba9da-f996-4a66-b990-a481ab075a13';
update TsField set FTitle='分組選項2' where FId='31101024-8b15-445d-8337-56e385053d77';
update TsField set FTitle='分組標題1' where FId='3f73cf2d-497e-4f10-bcc4-6314e6107691';
update TsField set FTitle='分組標題2' where FId='66059c4c-38cf-4e94-b56d-7cc6c50913d8';

alter table TsChart add FGroupField3 varchar(50);
alter table TsChart add FGroupTitle3 varchar(50);
alter table TsChart add FGroupOption3 varchar(20);
alter table TsChart add FGridHorizontalExpand varchar(10);
alter table TsChart add FGridShowCount bit;
alter table TsChart add FGridShowPercent bit;
alter table TsChart add FGridPercentType varchar(10);

update TsChart set FGridShowCount=1 where FGridShowCount is null;
update TsChart set FGridShowPercent=1 where FGridShowPercent is null;

delete from TsField where FId='d2e5a15a-38fa-4662-b12f-e6e3bbd0ead6';
delete from TsField where FId='4f586fb9-07b0-4b3d-b6d1-68f7c6a0c2fa';
delete from TsField where FId='aaa3a9ff-7e0c-42cc-91d1-92e69bbe6549';
delete from TsField where FId='4c432f99-9949-49c4-90d8-27618a2ec77f';
delete from TsField where FId='f3d002fa-1d3f-4d46-831a-c29bde45a8d3';
delete from TsField where FId='e8fff657-da0b-437d-a8ab-366e812daceb';
delete from TsField where FId='c24f40db-0658-4032-9de7-017f0e9ce30a';
insert into TsField set FId='d2e5a15a-38fa-4662-b12f-e6e3bbd0ead6', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGroupField3',			FTitle='分組欄位3',			FType='ComboBox-SelectOnly', FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='95946633-af58-4644-8658-ef6a3017994a', FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=1,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='4f586fb9-07b0-4b3d-b6d1-68f7c6a0c2fa', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGroupOption3',			FTitle='分組選項3',			FType='ComboBox-SelectOnly', FSize=20,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId='ad4b4c2c-37cc-4400-8c2c-ecd408f1a5fb', FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='aaa3a9ff-7e0c-42cc-91d1-92e69bbe6549', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGroupTitle3',			FTitle='分組標題3',			FType='InputBox-Text',       FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=1, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null, FSupportI18n=1;
insert into TsField set FId='4c432f99-9949-49c4-90d8-27618a2ec77f', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGridHorizontalExpand',	FTitle='橫向擴展',			FType='CheckBox',			 FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='f3d002fa-1d3f-4d46-831a-c29bde45a8d3', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGridShowCount',         FTitle='是否顯示數量',		FType='CheckBox',            FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='e8fff657-da0b-437d-a8ab-366e812daceb', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGridShowPercent',		FTitle='是否顯示百分比',	FType='CheckBox',            FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;
insert into TsField set FId='c24f40db-0658-4032-9de7-017f0e9ce30a', FUnitId='00000000-0000-0000-0001-000000000018', FName='FGridPercentType',		FTitle='百分比統計方式',    FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='62489365-8d36-4a18-8994-51336688e23f', FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,      FValidation=null, FRelationCapacity=null;

java setEditFields('54ba42a7-e200-486d-aceb-672598dbd92f', 'FName,FChartCatalogId,FUnitId,FDisplayType,FLimitType,FLimit,FQuerySchemaId,FGroupField1,FGroupTitle1,FGroupOption1,FGroupField2,FGroupTitle2,FGroupOption2,FGroupField3,FGroupTitle3,FGroupOption3,FValueField,FValueTitle,FGridHorizontalExpand,FGridShowCount,FGridShowPercent,FGridPercentType,FSqlType,FSql,FCustomProperties');
java setEditFields('a46b22eb-9d2a-41a2-8982-282d50304e8f', 'FName,FUnitId,FDisplayType,FQuerySchemaId,FLimitType,FLimit,FGroupField1,FGroupTitle1,FGroupOption1,FGroupField2,FGroupTitle2,FGroupOption2,FGroupField3,FGroupTitle3,FGroupOption3,FValueField,FValueTitle,FGridHorizontalExpand,FGridShowCount,FGridShowPercent,FGridPercentType');
java setFormFields('75df8a5e-f105-4ae0-b38c-cb5e95e618dd', '基本資訊', 'b7cb7844-b035-40a5-84f1-b532e2b75860', null, 'FName,FUnitId,FChartCatalogId,FSupportQuerySchema,FDisplayType,FQuerySchemaId,FLimitType,FLimit,FEditId,FPublic', '欄位設置', '8fa280a0-bb51-4852-a2fe-3ae711cf3743', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FGroupField1,FGroupTitle1,FGroupOption1,FGroupField2,FGroupTitle2,FGroupOption2,FGroupField3,FGroupTitle3,FGroupOption3,FValueField,FValueTitle', '表格設置', '988de96d-371f-4811-b6a7-e49e65e806c2', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FGridHorizontalExpand,FGridShowCount,FGridShowPercent,FGridPercentType', '查詢語句定制', '42935865-51ea-4dbc-8904-da9766e3b252', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FSqlType,FSql', '處理', '430584dd-08b2-4c52-94ee-63fd8b8a826e', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FHandleType,FHandler', '自訂屬性', 'b0314c2b-d247-480f-8690-0e6d3e2feb5b', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FCustomProperties');

insert into TsDictionary set FId='11b1e71d-9365-49d4-90ee-08c3e216a362', FName='QS-圖表-表格橫向擴展方式', FParentId=null, FBuiltin=1, FTextAsValue=0, FDescription='';
insert into TsDictionaryItem set FId='e38defc5-5c88-4d51-af26-7cc969ea163b', FDictionaryId='11b1e71d-9365-49d4-90ee-08c3e216a362', FValue='0',	FText='不擴展',			FIndex=1;
insert into TsDictionaryItem set FId='aba425ed-9a7c-4aa5-8d5e-c7d013158722', FDictionaryId='11b1e71d-9365-49d4-90ee-08c3e216a362', FValue='1',	FText='按分組1擴展',	FIndex=2;
insert into TsDictionaryItem set FId='51d2d684-1bdd-4ddd-933d-c773a99cd14d', FDictionaryId='11b1e71d-9365-49d4-90ee-08c3e216a362', FValue='2',	FText='按分組2擴展',	FIndex=3;
insert into TsDictionaryItem set FId='dd6ce330-298e-4116-bf11-51cd38c5aa33', FDictionaryId='11b1e71d-9365-49d4-90ee-08c3e216a362', FValue='3',	FText='按分組3擴展',	FIndex=4;

insert into TsDictionary set FId='62489365-8d36-4a18-8994-51336688e23f', FName='QS-圖表-表格百分比統計方式', FParentId=null, FBuiltin=1, FTextAsValue=0, FDescription='';
insert into TsDictionaryItem set FId='e11c172e-8490-4f8e-9f19-12ad174f5401', FDictionaryId='62489365-8d36-4a18-8994-51336688e23f', FValue='Value',	FText='按值統計',		FIndex=1;
insert into TsDictionaryItem set FId='518d60f5-0a99-4179-8d50-e1c4b099a028', FDictionaryId='62489365-8d36-4a18-8994-51336688e23f', FValue='Zero',	FText='按是否為零統計',	FIndex=2;

delete from TsTextResource where FId='1f199db0-64c2-45c5-8bcc-66de404f58d0';
delete from TsTextResource where FId='e3338335-ca60-4775-bd3c-d98ac0048f73';
insert into TsTextResource set FId='1f199db0-64c2-45c5-8bcc-66de404f58d0', FCode='T.Qs.Chart.Group3WithoutGroup2',				    FValue='如果填寫了分組3，則分組2也必須填寫。';
insert into TsTextResource set FId='e3338335-ca60-4775-bd3c-d98ac0048f73', FCode='T.Qs.Chart.HorizontalExpandGroupRequired',		FValue='表格橫向擴展方式對應的分組不能為空。';

delete from TsTextResource where FId='08d15610-1545-4e48-8107-9a91516b0fe9';
delete from TsTextResource where FId='db7dc666-0e3d-46cc-ba6b-917ba761ad10';
delete from TsTextResource where FId='47bb03ae-512e-4d86-b9a0-30e93394f2f6';
delete from TsTextResource where FId='38494c13-d605-45d7-8008-f70bb5832f50';
insert into TsTextResource set FId='08d15610-1545-4e48-8107-9a91516b0fe9', FCode='T.Qs.Chart.Grid.GrandTotal',							FValue='總計';
insert into TsTextResource set FId='db7dc666-0e3d-46cc-ba6b-917ba761ad10', FCode='T.Qs.Chart.Grid.SubTotal',							FValue='小計';
insert into TsTextResource set FId='47bb03ae-512e-4d86-b9a0-30e93394f2f6', FCode='T.Qs.Chart.Grid.Total',								FValue='合計';
insert into TsTextResource set FId='38494c13-d605-45d7-8008-f70bb5832f50', FCode='T.Qs.Chart.Grid.ExtraHint',							FValue='實際數字為 ${0}。因圖表數量限制，部分資料不予顯示。';
