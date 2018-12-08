update TsField set FReadOnly=1 where FId='553e504f-a2b9-4e6f-9088-f4f2371bbf97';

delete from TsTextResource where FId='8de3fa83-8708-4744-a9c1-b5fdc99628a6';
delete from TsTextResource where FId='c928a24c-d1b7-4159-b66d-9ff2b21fbdb3';
insert into TsTextResource set FCode='E.Qs.Role.AddDefaultRoleToUser',							FId='8de3fa83-8708-4744-a9c1-b5fdc99628a6', FValue='不能为用户分配默认角色，因为全部用户已经自动拥有默认角色。';
insert into TsTextResource set FCode='E.Qs.Role.AddUserToDefaultRole',							FId='c928a24c-d1b7-4159-b66d-9ff2b21fbdb3', FValue='不能为默认角色添加用户，因为默认角色已经自动关联全部用户。';

delete from TsRoleUser where FRoleId='00000000-0000-0000-1004-000000000001';

update TsField set FTitle='标题文字大小(像素)' where FId='d8b736d7-be23-48ec-911f-4c6bd9bf189a';
alter table TsViewItem add FContentFontSize int;
delete from TsField where FId='03aec976-2cf7-4da5-aecc-dc694bb51e9a';
insert into TsField set FId='03aec976-2cf7-4da5-aecc-dc694bb51e9a', FUnitId='20b2c483-c0e2-47db-afef-ac31628da984', FName='FContentFontSize',  FTitle='内容文字大小(像素)',   FType='InputBox-Integer',    FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',                           FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null,   FValidation=null, FRelationCapacity=null;
java setFormFields('754c3fcb-ec47-40df-904a-16bce2ce2662', '基本信息', '1c65209a-d510-4797-905b-63b637e95bbe', null, 'FName,FType,FMarginTop,FBreakLine,FIsAnchor', '标题', '7d03e988-0729-4f94-ad9a-8522877ddecd', '1c65209a-d510-4797-905b-63b637e95bbe', 'FTitleType,FTitleFontSize,FTitleText,FTitleField,FTitleColor', '字段组', 'c2f26f9b-0663-477b-ae99-3f5d75c53101', '1c65209a-d510-4797-905b-63b637e95bbe', 'FFieldArrangeType,FColumnCount,FContentFontSize', 'HTML字段', '65371d76-dde4-4c36-bd67-e4abe85d4a4c', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHtmlField', '列表', '41810f07-46ee-49df-b803-ad976076614e', '1c65209a-d510-4797-905b-63b637e95bbe', 'FRelationId,FRecordCount', '自定义', '7315643a-27a0-49e1-b1c0-9818b052a871', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHandlerClassName');
