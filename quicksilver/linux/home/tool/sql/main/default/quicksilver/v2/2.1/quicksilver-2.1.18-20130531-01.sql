alter table TsViewItemField add FFontSize varchar(100);
insert into TsField set FId='649f34e9-c510-4a75-8e8d-c17ca356ed29', FUnitId='0bd0ac10-dded-4d37-a03a-a284856445be', FName='FFontSize',   FTitle='字体大小(JavaScript)', FType='InputBox-Text',       FSize=100,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=0, FRowSpan=1, FIsNewRow=0,    FListWidth=150, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
update TsField set FListWidth=150 where FId='2c5e7d9b-5a4c-4974-bc88-d15d092ae856';

java setFormFields('893625c8-50e3-4cb6-b304-a300ee9d5b35', '基本信息', '5a764670-cfea-4e41-807e-c2bdf610fbf8', null, 'FFieldName,FColor,FFontSize');
java setListFields('d9731e12-d84e-4c36-a60f-7905aa672543', 'FFieldName,FColor,FFontSize');
java setListFields('c3842b98-0d18-4e73-ab52-e47731c74b04', 'FFieldName,FColor,FFontSize');
java setListFields('cc40823a-0f4e-471d-8d30-b787c9943636', 'FFieldName,FColor,FFontSize');
