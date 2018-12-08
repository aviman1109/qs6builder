--minglei

update TsDictionaryItem set FIndex = FIndex + 1 where FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e';
insert into TsDictionaryItem set FDictionaryId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FId='68b5cad6-7e25-48a7-ae5d-b9f3764fe2a6', FIndex=1, FParentValue=null, FText='目錄', FValue='Directory';
update TsMenu set FType='Directory' where FType is null and (FTreeLevel <= 2 or exists (select * from TsMenu T where FParentId = TsMenu.FId));

java setEditHiddenPages('8b7ebd7e-8173-4787-9e34-3d27ad4c9c29', 'Qs.Unit.FieldList,Qs.Unit.RelationList,Qs.Unit.EditList,Qs.Unit.FormList,Qs.Unit.ListList,Qs.Unit.OperationList,Qs.Unit.EntityEventList,Qs.Unit.PageList,Qs.Unit.PrivilegeList,Qs.Unit.SerialNumberList,Qs.Unit.ImportConfig,Qs.Unit.WorkflowList,Qs.Unit.DuplicationList,Qs.Unit.ViewItemList,Qs.Unit.SlaveUnitPrivilege,Qs.Unit.ListColorList,Qs.Unit.ListFilterList,Qs.Unit.SlavePagePrivilege');

delete from TsField where FId='dc4c8a79-562a-410b-889c-e9760749bc33';
java setQueryFormFields('35df7649-0a1e-4bca-8e6d-9e475010806b', 'FName,FCode,FDescription');
java setFormFields('26ecc6d5-b42e-4a0c-88ca-cbda5fbe20f0', '基本資訊', 'a3cd9820-62ed-4a7c-b853-586d340417ae', null, 'FName,FCode,FEnabled,FTimeoutSeconds', '描述', '12f774ac-2af4-4821-8aac-f6e95a7a1e7a', 'a3cd9820-62ed-4a7c-b853-586d340417ae', 'FDescription');
java setListFields('8841d48f-79fa-4475-a4cc-3dc6ee9b734b', 'FName,FCode,FTimeoutSeconds,FEnabled,FDescription');
java setListFields('7c001ab2-bee8-4f8a-a570-e4a52db3d694', 'FName,FCode,FTimeoutSeconds,FEnabled,FDescription');
java setListFields('631447f8-2d42-4d94-bb6c-d778d039a58a', 'FName,FCode,FTimeoutSeconds,FEnabled,FDescription');
