update TsPage set FDialogWidth=750 where FDialogWidth=604 and FType='EntityForm';
update TsPage set FDialogHeight=500 where FDialogHeight=453 and FType='EntityForm';
update TsPage set FDialogWidth=null where FDialogWidth=0;
update TsPage set FDialogHeight=null where FDialogHeight=0;

update TsViewItem set FTitleFontSize=14 where FTitleFontSize=12;
update TsViewItem set FContentFontSize=14 where FContentFontSize=12;

alter table TsUser add FTakeOfficeDate date;
insert into TsField set FId='5d7cf5cd-5860-415a-8a19-b4c52aebe19a', FUnitId='00000000-0000-0000-0001-000000001002', FName='FTakeOfficeDate',	FTitle='到職日期',	FType='DateBox-Date',        FSize=0,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
