--minglei

delete from TsDictionaryItem where FId='8bd7db03-2c2e-4f15-9f9e-090fc915dd65';
delete from TsDictionaryItem where FId='acb1f6f6-2479-4315-8032-0d7fbf6551c8';
delete from TsDictionaryItem where FId='6cfd6bf0-54c8-491a-88c7-a8d59f26de6e';
insert into TsDictionaryItem set FId='8bd7db03-2c2e-4f15-9f9e-090fc915dd65', FDictionaryId='d8da3463-788c-4061-a22d-e1d20c179633', FValue='OnParticipantCreateAfter',	FText='參與者創建後',	FIndex=18;
insert into TsDictionaryItem set FId='acb1f6f6-2479-4315-8032-0d7fbf6551c8', FDictionaryId='d8da3463-788c-4061-a22d-e1d20c179633', FValue='OnParticipantCloneAfter',	FText='參與者加簽後',	FIndex=19;
insert into TsDictionaryItem set FId='6cfd6bf0-54c8-491a-88c7-a8d59f26de6e', FDictionaryId='d8da3463-788c-4061-a22d-e1d20c179633', FValue='OnParticipantTransferAfter',	FText='參與者轉辦後',	FIndex=20;

delete from TsDictionaryItem where FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5';
insert into TsDictionaryItem set FId='738418b5-600f-4507-a331-521b3512ba5b', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='User',				FText='指定員工',		FIndex=1;
insert into TsDictionaryItem set FId='9d9f8ee6-d0ad-4b29-9aea-450175e6a5ca', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Role',				FText='指定角色',		FIndex=2;
insert into TsDictionaryItem set FId='23c872f4-4a7f-4155-ad7f-f4d4c6b69880', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Department',			FText='指定部門',		FIndex=3;
insert into TsDictionaryItem set FId='2338c91f-5e4d-4230-97d2-1fa17988a051', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='UserField',			FText='員工欄位',		FIndex=4;
insert into TsDictionaryItem set FId='80bfdb7e-fe72-40be-ab62-b127b9d918ca', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='DepartmentField',	FText='部門欄位',		FIndex=5;
insert into TsDictionaryItem set FId='f39cfc99-41a5-47b7-8b1d-12bb0c59d99a', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='JavaClass',			FText='Java 類',		FIndex=6;
insert into TsDictionaryItem set FId='9ca722e3-d79f-40fa-8692-335cc6715fa0', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Sql',				FText='SQL 語句',		FIndex=7;
insert into TsDictionaryItem set FId='5eec6601-073d-4132-8d2f-bda6d5bc6d4b', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Initiator',			FText='流程啟動者',		FIndex=8;
insert into TsDictionaryItem set FId='56cf4174-f15c-44f2-b424-90a13ed3bd28', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Participant',		FText='工作項參與者',	FIndex=9;
insert into TsDictionaryItem set FId='9d61fd9b-8c79-482b-b7c8-2ccd73cd7a3a', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='Executor',			FText='活動執行者',		FIndex=10;
insert into TsDictionaryItem set FId='fb4dba38-02a9-4f62-9aad-368fa66b76d4', FDictionaryId='b3510b90-488a-478d-a3de-900a4bf995f5', FValue='RelevantData',		FText='相關資料',		FIndex=11;

delete from TsTextResource where FId='fb1bf5d1-a38c-457b-b557-76f790bed747';
insert into TsTextResource set FId='fb1bf5d1-a38c-457b-b557-76f790bed747', FCode='T.Public.Clear',										FValue='清空';

update TsPage set FDialogHeight=246 where FCode='Wf.WorkItem.Transfer';

alter table TsShortMessage add FReturnContent varchar(500);
insert into TsField set FId='7715ec30-106c-4f29-9cc5-6a791193fdfa', FUnitId='4a31273a-b5ba-4214-a06c-ee59035869a8', FName='FReturnContent', FTitle='回傳內容', FType='TextBox',             FSize=500,  FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FSourceType='local', FColSpan=0, FRowSpan=5,  FListWidth=100, FListAlign='default';
java setFormFields('58636698-59e1-4147-aa64-df5e7c9628f8', '基本資訊', '69e28dd0-3eec-43c0-999f-dc259709e281', null, 'FMobile,FSendTime,FStatus,FContent', '其它', 'd3724cc2-838c-4866-9a7a-730c11010ea6', null, 'FReturnContent,FErrorMessage');
