--minglei--------------------------------------------------

delete from TsTextResource where FId='fb4e8d5b-b783-4b39-bc78-f2ca19e8acf1';
insert into TsTextResource set FId='fb4e8d5b-b783-4b39-bc78-f2ca19e8acf1', FCode='E.Qs.User.AdministratorCannotBeDisabled',				FValue='不能禁用 administrator 用戶。';

update TsSpecialPage set FPath='Qs.Misc.ActionError.page' where FPath='Qs.ActionError.page';

--menu

delete from TsDictionary where FId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e';
delete from TsDictionary where FId='0d8049d6-d50a-4b7c-b411-b276cc234684';
insert into TsDictionary set FId='9266afe5-2ef8-4cb2-9acc-377c5c09a13e', FName='QS-菜單-類型', FBuiltin=0, FTextAsValue=0;
insert into TsDictionary set FId='0d8049d6-d50a-4b7c-b411-b276cc234684', FName='QS-左菜單-頁面開啟模式', FBuiltin=0, FTextAsValue=0;
java setFormFields('1b47ee93-6036-4ee7-b569-83c463500497', '基本資訊', '8a596b8b-fa29-4d14-99da-360d4e7264d2', null, 'FName,FParentId,FIcon,FType,FEnabled', '內部頁面', '4f43b8dd-d4d2-4444-b42c-a9ed8cdc3a2a', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FPageId,FShowMenuNameInTab,FQuerySchemaId,FQuerySchemaLocked,FArguments', '外部頁面', 'ec80678f-73f2-43f3-8a56-d40303a58a3b', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FExternalPageUrl,FOpenMode', '函數', 'a4682f3a-2348-4b5f-8a9d-818f56e1c9ae', '8a596b8b-fa29-4d14-99da-360d4e7264d2', 'FFunctionName', '子功能表', '7b0e7f63-57db-468d-8738-b83ad99d2dd5', null, 'FSubMenuSource,FReplaceByChildren,FSubMenuRoutine');
java setListFields('891e97b3-bebc-4a56-b88a-8fa3fae71d6c', 'FName,FTreeSerial,FType,FPageId,FFunctionName');
