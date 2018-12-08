--xiawei
java runOnError(
'select FIpAddress from TsBusinessLog ','alter table TsBusinessLog add FIpAddress varchar(50)'
);

java runOnEmpty(
'select FId FROM TsField WHERE  FId =''156b1b5e-a4f0-0f47-6b4a-c65444558360'' ','insert into TsField set FId=''156b1b5e-a4f0-0f47-6b4a-c65444558360'', FUnitId=''e30a32e0-cbdc-4060-8525-a2d14c1486d7'', FName=''FIpAddress'',           FTitle=''IP地址'',     FType=''InputBox-Address'',    FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                         FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType=''local'', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign=''default'', FScale=null, FLabelColor=null, FDefaultValueType=''ServerValue'', FDefaultValue=null, FHint='''',   FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='''' '
)
;
java setFormFields('807f5347-d7f4-4326-9ba4-3c12b38ea39a', '基本資訊', 'f0b2056d-10ec-4131-8d18-672e3111a302', null, 'FUserId,FOperation,FUnitId,FEntityName,FMasterUnitId,FMasterEntityName,FTime,FIpAddress,FDescription');
java setListFields('80642188-6fac-41c9-9ce5-bbaa92f0ab69', 'FTime,FIpAddress,FUserId,FOperation,FUnitId,FEntityName,FDescription');
java setListFields('c8626236-c605-447d-802c-6eedd6f25d82', 'FTime,FIpAddress,FUserId,FOperation,FUnitId,FEntityName,FMasterUnitId,FMasterEntityName,FDescription');
