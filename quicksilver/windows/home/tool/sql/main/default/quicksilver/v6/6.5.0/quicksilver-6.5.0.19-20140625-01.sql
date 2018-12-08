--Victor.Wang
alter table TwButton add FCommentRequired bit default 0;
insert into TsField set FId='141b3c4a-7407-4dc7-a0d8-3bb64728632d', FUnitId='5077e462-0080-48e3-aa65-7b38a3342d71', FName='FCommentRequired', FTitle='辦理意見是否必填',   FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='',  FAlwaysBringDataToClient=0;
java setEditFields('4886f7a5-17b9-4e1c-bc0b-064eac98e99c', 'FName,FCode,FIcon,FHandleType,FPageId,FEntityEventCode,FSaveForm,FScript,FCommentRequired');
java setFormFields('0e21bc0f-1a4a-4386-b06d-b350fece466e', '-', '9fb0c348-579d-43c4-b819-463575bc2778', null, 'FName,FCode,FIcon', '事件處理', '21ddd7f1-1f6d-44ba-ad6e-40ab3afd3993', null, 'FHandleType,FPageId,FEntityEventCode,FSaveForm,FCommentRequired,FScript');

update TwButton set FCommentRequired = 0 where FCommentRequired is null;
update TsField set FRowSpan=7 where FId='20333603-8b4b-44be-b6cd-e8195fbdd859';
