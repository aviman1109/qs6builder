delete from TsTextResource where FId='3a0d6071-f64d-41f1-bfbb-85cd0bbcc557';
insert into TsTextResource set FCode='T.Esc.Box.ReadOnlyAlert',								FId='3a0d6071-f64d-41f1-bfbb-85cd0bbcc557', FValue='不能修改只读的内容。';

alter table TsForm add FEditableCondition varchar(200);
delete from TsField where FId='d1d7679a-a14a-4527-ba28-03cb532ccee5';
insert into TsField set FId='d1d7679a-a14a-4527-ba28-03cb532ccee5', FUnitId='ad8dec17-6a8e-45ba-8037-44d43358bc9d', FName='FEditableCondition',	FTitle='可编辑条件',	FType='InputBox-Text',       FSize=200,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSelectListFilterSql=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
java setFormFields('587cc331-cdf0-468c-a59c-51dad3c46c5a', 'FName,FGroupMode,FDefault,FPageId,FEditableCondition');
