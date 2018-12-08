alter table TsQuerySchema add FParentId uuid;
insert into TsField set FId='5d2c8fab-dc67-4901-b3a0-6d36581d62e0', FUnitId='00000000-0000-0000-0001-000000000013', FName='FParentId',	      FTitle='父查詢方案',			 FType='EntityBox',           FSize=0,      FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000000013', FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='', FColSpan=1, FRowSpan=1, FIsNewRow=0, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FCustomData='', FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null;
insert into TsFieldProperty set FId='0f8d99c1-5002-4311-bcc0-3c07215f58d5', FFieldId='5d2c8fab-dc67-4901-b3a0-6d36581d62e0', FName='hasMagnifier', FValue='false';

insert into TsRelation set FId='62c75d41-d2e0-45a1-8a01-71e52df43b75', FOppositeId='73bf3afe-b3cd-469c-886e-07102efb53d6', FName='查詢方案-父查詢方案', FOppositeName='父查詢方案-查詢方案', FUnitId1='00000000-0000-0000-0001-000000000013', FUnitId2='00000000-0000-0000-0001-000000000013', FType='field', FTable=null, FField1='FId',            FField2='FParentId', FDeleteAction1='unset',   FDeleteAction2='cancel', FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

java setFormFields('a6c925a0-8170-49e1-a797-331ed15bed2a', 'FName,FType,FParentId,FPublic,FSqlSource,FSql');
java setListFields('7dd94fc5-a4f7-4f2f-af3f-e6e763fe65c4', 'FUnitId,FName,FParentId');
java setListFields('42382cd9-cd19-498e-bf0f-a9b5a188fd9f', 'FUnitId,FName,FParentId');

insert into TsTextResource set FId='f801ca3a-a7e5-4621-a43f-80d92d364a55', FCode='E.Qs.QuerySchema.IsSelf',                             FValue='不能用本身做為父查詢方案。';
insert into TsTextResource set FId='45c97443-41a5-45eb-8682-1718b503bbd3', FCode='E.Qs.QuerySchema.HasParentQuerySchema',               FValue='查詢方案“${0}”中已經有父查詢方案，不能再做為父查詢方案。';
insert into TsTextResource set FId='b5a0c70d-b99b-4bb4-971f-4a7504d4fb8a', FCode='E.Qs.QuerySchema.HasSubQuerySchema',                  FValue='該查詢方案已經被用作父查詢方案，不能再有父查詢方案。';
