--Author: Minglei

update TsPage set FDialogWidth=800, FDialogHeight=600 where FCode='Qs.Chart.Show';

--阅览项是否可见

alter table TsViewItem add FVisible bit default 1;
update TsViewItem set FVisible=1 where FVisible is null;
delete from TsField where FId='3e07a4ac-49de-4a49-9dcc-95ff484fb908';
insert into TsField set FId='3e07a4ac-49de-4a49-9dcc-95ff484fb908', FUnitId='20b2c483-c0e2-47db-afef-ac31628da984', FName='FVisible',		   FTitle='是否可見',             FType='CheckBox',            FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='true', FValidation=null, FRelationCapacity=null;
java setFormFields('754c3fcb-ec47-40df-904a-16bce2ce2662', '基本資訊', '1c65209a-d510-4797-905b-63b637e95bbe', null, 'FName,FType,FMarginTop,FBreakLine,FVisible,FIsAnchor,FCollapsed', '標題', '7d03e988-0729-4f94-ad9a-8522877ddecd', '1c65209a-d510-4797-905b-63b637e95bbe', 'FTitleType,FTitleFontSize,FTitleText,FTitleField,FTitleColor', '欄位組', 'c2f26f9b-0663-477b-ae99-3f5d75c53101', '1c65209a-d510-4797-905b-63b637e95bbe', 'FFieldArrangeType,FColumnCount,FContentFontSize', 'HTML欄位', '65371d76-dde4-4c36-bd67-e4abe85d4a4c', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHtmlField', '列表', '41810f07-46ee-49df-b803-ad976076614e', '1c65209a-d510-4797-905b-63b637e95bbe', 'FRelationId,FRecordCount', '自訂', '7315643a-27a0-49e1-b1c0-9818b052a871', '1c65209a-d510-4797-905b-63b637e95bbe', 'FHandlerClassName');
java setListFields('a0f758e4-a0a0-4821-ad13-f9b2d30c1d61', 'FName,FType,FVisible,FIsAnchor,FCollapsed,FFieldArrangeType');
java setListFields('37fe8631-d3a1-44a1-9177-4392e2dfbca0', 'FName,FType,FVisible,FIsAnchor,FCollapsed,FFieldArrangeType');
java setListFields('b0943e52-7e8c-450b-b14f-4dd7175fc43e', 'FName,FType,FVisible,FIsAnchor,FCollapsed,FFieldArrangeType');

--图表是否在图表中心显示

alter table TsChart add FShowInChartCenter bit default 1;
update TsChart set FShowInChartCenter=1 where FShowInChartCenter is null;
delete from TsField where FId='ab33bbdf-88dc-4ad4-871b-19e8f6c80539';
insert into TsField set FId='ab33bbdf-88dc-4ad4-871b-19e8f6c80539', FUnitId='00000000-0000-0000-0001-000000000018', FName='FShowInChartCenter',		FTitle='顯示在圖表中心',	FType='CheckBox',            FSize=0,    FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=80,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='true',      FValidation=null, FRelationCapacity=null;
java setEditFields('15045e7d-7030-43a7-95ae-90095556ed2a', 'FName,FChartCatalogId,FShowInChartCenter,FSupportQuerySchema,FUnitId,FQuerySchemaId,FHandleType,FHandler,FCustomProperties');
java setEditFields('54ba42a7-e200-486d-aceb-672598dbd92f', 'FName,FChartCatalogId,FShowInChartCenter,FUnitId,FDisplayType,FLimitType,FLimit,FQuerySchemaId,FGroupField1,FGroupTitle1,FGroupOption1,FGroupField2,FGroupTitle2,FGroupOption2,FGroupField3,FGroupTitle3,FGroupOption3,FValueField,FValueTitle,FGridHorizontalExpand,FGridShowCount,FGridShowPercent,FGridPercentType,FSqlType,FSql,FCustomProperties');
java setFormFields('75df8a5e-f105-4ae0-b38c-cb5e95e618dd', '基本資訊', 'b7cb7844-b035-40a5-84f1-b532e2b75860', null, 'FName,FUnitId,FChartCatalogId,FSupportQuerySchema,FDisplayType,FQuerySchemaId,FLimitType,FLimit,FEditId,FPublic,FShowInChartCenter', '欄位設置', '8fa280a0-bb51-4852-a2fe-3ae711cf3743', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FGroupField1,FGroupTitle1,FGroupOption1,FGroupField2,FGroupTitle2,FGroupOption2,FGroupField3,FGroupTitle3,FGroupOption3,FValueField,FValueTitle', '表格設置', '988de96d-371f-4811-b6a7-e49e65e806c2', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FGridHorizontalExpand,FGridShowCount,FGridShowPercent,FGridPercentType', '查詢語句定制', '42935865-51ea-4dbc-8904-da9766e3b252', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FSqlType,FSql', '處理', '430584dd-08b2-4c52-94ee-63fd8b8a826e', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FHandleType,FHandler', '自訂屬性', 'b0314c2b-d247-480f-8690-0e6d3e2feb5b', 'b7cb7844-b035-40a5-84f1-b532e2b75860', 'FCustomProperties');

--删除多余的工具条内容

delete from TsToolItem where FId='d66967fa-37f5-4dfb-8cdc-a06329d676cf';
delete from TsToolItem where FId='58a3ab32-734a-44db-850a-987490928f36';
delete from TsToolItem where FId='2a177238-a535-4a45-bc29-b292a004879b';
delete from TsToolItem where FId='ac94f09a-19f3-4f7a-8d2f-9010e21c5176';
delete from TsToolItem where FId='f4a69f9a-b999-4493-a57d-2779d171516b';
delete from TsToolItem where FId='3fe24a08-f93f-40df-9998-54d543df6793';
delete from TsToolSubItem where FId='afd65c4c-eea7-482f-9298-c465ea3829cd';
delete from TsToolSubItem where FId='ed9fb072-b4f5-4f4c-a624-0585b1c52876';
delete from TsToolSubItem where FId='b37570c5-d614-4087-944e-7db69448e0e4';
delete from TsToolSubItem where FId='4a6cbb19-11f8-4544-bc6e-0a73cfda5928';
delete from TsToolSubItem where FId='5116cf92-1945-46a2-821d-24b65eac8c15';
delete from TsToolSubItem where FId='7f153e3a-935b-49e9-963f-bb5b7701ca45';
delete from TsToolSubItem where FId='5501ac5f-c22b-4d2e-bfb4-25f143469d37';
delete from TsToolSubItem where FId='f0e8585d-04d2-45a5-a5ed-b814a04478c0';
delete from TsToolSubItem where FId='0eed3030-62f6-4870-b02b-798d9eee4f4a';
delete from TsToolSubItem where FId='8316ff16-02c8-45a4-8e4a-a59166bcc6ec';
delete from TsToolSubItem where FId='596a7773-b7d9-4948-a4db-aab9b5291a2d';
delete from TsToolSubItem where FId='cba439b8-134e-4146-ac7e-b681718e9098';
delete from TsToolSubItem where FId='340895c3-2c3c-4c13-b20f-d5d54606b112';
delete from TsToolSubItem where FId='0f9838ff-41a7-4e4b-952a-59c65c8c41e3';
delete from TsToolSubItem where FId='323e2630-392b-4301-be5a-6155ac3f4b76';
delete from TsToolSubItem where FId='1204a11b-8dca-4124-9223-a7e08ccce2f2';
delete from TsToolSubItem where FId='89ddba90-8a71-4a18-85f3-ab607e2ae9b6';
delete from TsToolSubItem where FId='f810eabf-d612-45c8-acea-f38a7d7eefbf';
delete from TsToolSubItem where FId='207fb8eb-8c25-4f30-ac45-40fc9432f2fe';
delete from TsToolSubItem where FId='8f06ead7-0cc1-407b-9fa3-e5ec404bcb42';
delete from TsToolSubItem where FId='62d5ae1b-66bc-4ca6-b5ee-6313d3f0be07';
delete from TsToolSubItem where FId='c0efda67-57f6-4fb0-a1e2-9cc2f7e9f3a4';
delete from TsToolSubItem where FId='bf07fbb9-a804-4bf0-b909-10ca1d790b25';
delete from TsToolSubItem where FId='9dff129f-1122-4b8d-83e6-99a5915f7bc2';
delete from TsToolSubItem where FId='7366428f-4faa-42b1-af3e-bdf7c79ef0fc';
