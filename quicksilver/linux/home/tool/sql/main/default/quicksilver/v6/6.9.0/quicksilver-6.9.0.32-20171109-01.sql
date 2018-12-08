--minglei

update TsParameterGroup set FName='附件線上閱覽設置' where FId='6d69b985-9411-4bc9-843e-0a5cddabb338';

delete from TsParameterDefinition where FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338';
delete from TsParameterDefinition where FId='4e64d612-7c61-4184-8043-7d2be5e144af';
delete from TsParameterDefinition where FId='a26d6288-48d5-4f0d-a32a-0bba5baa7fe1';
delete from TsParameterDefinition where FId='a72620d8-842d-4880-a3e7-dbeab47a886f';
delete from TsParameterDefinition where FId='f563349d-4a03-42e5-b209-c106beb31d94';
delete from TsParameterDefinition where FId='61022f13-60c9-4db5-90ef-8579ef6219fe';
delete from TsParameterDefinition where FId='c7734f27-1e64-460e-9171-7441e8b7b85a';
delete from TsParameterDefinition where FId='b4dc1353-76ff-4541-a01d-526d47e5041d';
delete from TsParameterDefinition where FId='41f97859-f95d-45a9-ba41-15e2285a04e8';
delete from TsParameterDefinition where FId='8f704bd9-5444-4b23-b534-407bbd960efc';
insert into TsParameterDefinition set FId='4e64d612-7c61-4184-8043-7d2be5e144af', FName='通過遠端服務轉換',						FCode='QsFpcRemoteConvert',					FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=1;
insert into TsParameterDefinition set FId='a26d6288-48d5-4f0d-a32a-0bba5baa7fe1', FName='轉換伺服器 URL',						FCode='QsFpcServerUrl',						FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Url',			FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=2;
insert into TsParameterDefinition set FId='a72620d8-842d-4880-a3e7-dbeab47a886f', FName='轉換伺服器用戶名',						FCode='QsFpcServerUserName',				FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='f563349d-4a03-42e5-b209-c106beb31d94', FName='轉換伺服器密碼',						FCode='QsFpcServerPassword',				FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Password',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;
insert into TsParameterDefinition set FId='61022f13-60c9-4db5-90ef-8579ef6219fe', FName='最大併發數',							FCode='QsFpcMaxConcurrent',					FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=5;
insert into TsParameterDefinition set FId='c7734f27-1e64-460e-9171-7441e8b7b85a', FName='轉換超時時間(秒)',						FCode='QsFpcConversionTimeout',				FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=6;
insert into TsParameterDefinition set FId='b4dc1353-76ff-4541-a01d-526d47e5041d', FName='佇列最大長度',							FCode='QsFpcQueueLength',					FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=7;
insert into TsParameterDefinition set FId='41f97859-f95d-45a9-ba41-15e2285a04e8', FName='佇列超時時間(秒)',						FCode='QsFpcQueueTimeout',					FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='InputBox-Integer',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=8;
insert into TsParameterDefinition set FId='8f704bd9-5444-4b23-b534-407bbd960efc', FName='自動終止超時的進程',					FCode='QsFpcKillTimeoutProcess',			FParameterGroupId='6d69b985-9411-4bc9-843e-0a5cddabb338', FType='CheckBox',				FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=9;

update TsSystemParameter set FKey='QsFpcRemoteConvert' where FKey='QsFlashRemoteConvert';
update TsSystemParameter set FKey='QsFpcServerUrl' where FKey='QsFlashServerUrl';
update TsSystemParameter set FKey='QsFpcServerUserName' where FKey='QsFlashServerUserName';
update TsSystemParameter set FKey='QsFpcServerPassword' where FKey='QsFlashServerPassword';
update TsSystemParameter set FKey='QsFpcConversionTimeout' where FKey='QsFlashConvertTimeout';

java runOnEmpty(
	'select 1 from TsSystemParameter where FKey=''QsFpcMaxConcurrent''',
	'insert into TsSystemParameter set FId=''d6e45e0f-4083-4f9f-91ba-f7465f08697a'', FKey=''QsFpcMaxConcurrent'',	FValue=''2'''
);
java runOnEmpty(
	'select 1 from TsSystemParameter where FKey=''QsFpcQueueLength''',
	'insert into TsSystemParameter set FId=''ecc1b129-1dc2-4e44-acbc-b70391f3be2d'', FKey=''QsFpcQueueLength'',		FValue=''100'''
);
java runOnEmpty(
	'select 1 from TsSystemParameter where FKey=''QsFpcQueueTimeout''',
	'insert into TsSystemParameter set FId=''85268a19-be04-4019-b106-a53cdb78dc39'', FKey=''QsFpcQueueTimeout'',	FValue=''600'''
);

delete from TsPage where FId='6abd68a5-9ca0-4c65-95cb-933702743ca1';
insert into TsPage set FId='6abd68a5-9ca0-4c65-95cb-933702743ca1', FName='附件閱覽轉換監控',	FTitle='附件閱覽轉換監控',	FCode='Qs.DiskFile.ConverterMonitor',	FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FType='Other',		FIcon='quicksilver/image/unit/Attachment.png',	FUrl='quicksilver/page/attachment/DiskFileConverterMonitor.jsp',	FActionMethodName='Qs.DiskFile.prepareConversionMonitor', FLoadHandler=null, FRelationId=null, FUnitId='ecb46e4b-10f8-4bbc-afce-048fff475e0e', FMasterUnitId=null,									FIsSlavePage=0, FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsMenu where FId='18acb2b2-0a96-448a-bb43-c0234b105307';
insert into TsMenu set	FId='18acb2b2-0a96-448a-bb43-c0234b105307', FParentId='1f9907c6-e619-4a9b-bd4a-d83f74fdb3ac',	FIndex=9,	FName='附件閱覽轉換監控',	FPageId='6abd68a5-9ca0-4c65-95cb-933702743ca1',	FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/unit/Attachment.png';

delete from TsTextResource where FId='ba943b1b-142f-4ce8-892d-1f8ccaf6c927';
delete from TsTextResource where FId='127ca53b-ef05-4796-aa4e-8d3da6a22624';
delete from TsTextResource where FId='cad9b142-96db-4e42-ad01-0a3e614a47f8';
delete from TsTextResource where FId='12794f60-6362-4e0d-910c-d3892701da6a';
delete from TsTextResource where FId='32c40859-f407-400d-8e6f-5d7a2d37f0bb';
delete from TsTextResource where FId='34b38c04-9520-4b3e-b5e6-e673331da5e3';
delete from TsTextResource where FId='01c4f612-5cb2-4cb7-a7e6-5512b94a9123';
delete from TsTextResource where FId='0a186865-c2e1-4850-bbdd-ccc39c7be17a';
delete from TsTextResource where FId='c0375354-5f0c-4b5b-a2dc-9c87ef96228b';
delete from TsTextResource where FId='f2316856-ad17-4f8a-835a-9b435dd571b9';
delete from TsTextResource where FId='7b50eadf-1740-4c7a-bdac-adf613db71c5';
delete from TsTextResource where FId='dc270381-b202-4188-aa37-c293fdf73f6a';
delete from TsTextResource where FId='227c2696-02a5-43fb-97cb-42a85c99b47a';
delete from TsTextResource where FId='37234b0e-e5d6-45e9-9e61-d25f9430dca2';
delete from TsTextResource where FId='6103afce-eb69-4df2-9abb-2ff7a3ef98b4';
delete from TsTextResource where FId='bc8d0afc-228c-4164-ae23-542c50f085b6';
delete from TsTextResource where FId='3d38909e-39ce-410b-ac83-928e4038d5f3';
delete from TsTextResource where FId='4917ae3f-8d2b-4244-bbc8-059172c89907';
delete from TsTextResource where FId='30c59a42-684e-43bd-8cfa-9ca41d4fa056';
delete from TsTextResource where FId='3d243722-5d9b-4c05-87f9-b8c965a2b87e';
delete from TsTextResource where FId='a4bf08d1-9ec0-426d-b364-75d6ee7a381c';
delete from TsTextResource where FId='29392791-dcd5-4905-b38b-76e09f2f4cf9';
delete from TsTextResource where FId='1d0bd3d6-4a3c-4fc7-8a02-0b980dc436b0';
delete from TsTextResource where FId='4a2b55b4-05e2-47be-98f5-16ce7189d5ae';
delete from TsTextResource where FId='2ad42b7c-a88d-4831-9862-0ce184db0a91';
delete from TsTextResource where FId='31e77885-049c-4cec-95ff-d3ffcbd82625';
insert into TsTextResource set FId='ba943b1b-142f-4ce8-892d-1f8ccaf6c927', FCode='T.Qs.DiskFile.ConversionMonitor.Title',					FValue='附件閱覽轉換監控';
insert into TsTextResource set FId='127ca53b-ef05-4796-aa4e-8d3da6a22624', FCode='T.Qs.DiskFile.ConversionMonitor.Count',					FValue='數量';
insert into TsTextResource set FId='cad9b142-96db-4e42-ad01-0a3e614a47f8', FCode='T.Qs.DiskFile.ConversionMonitor.Description',				FValue='描述';
insert into TsTextResource set FId='12794f60-6362-4e0d-910c-d3892701da6a', FCode='T.Qs.DiskFile.ConversionMonitor.Process',					FValue='轉換進程';
insert into TsTextResource set FId='32c40859-f407-400d-8e6f-5d7a2d37f0bb', FCode='T.Qs.DiskFile.ConversionMonitor.Current',					FValue='未完成';
insert into TsTextResource set FId='34b38c04-9520-4b3e-b5e6-e673331da5e3', FCode='T.Qs.DiskFile.ConversionMonitor.Finished',				FValue='已完成';
insert into TsTextResource set FId='01c4f612-5cb2-4cb7-a7e6-5512b94a9123', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentRunning',			FValue='轉換中';
insert into TsTextResource set FId='0a186865-c2e1-4850-bbdd-ccc39c7be17a', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentWaiting',			FValue='佇列中';
insert into TsTextResource set FId='c0375354-5f0c-4b5b-a2dc-9c87ef96228b', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentTimeout',			FValue='已超時';
insert into TsTextResource set FId='f2316856-ad17-4f8a-835a-9b435dd571b9', FCode='T.Qs.DiskFile.ConversionMonitor.Success',					FValue='轉換成功';
insert into TsTextResource set FId='7b50eadf-1740-4c7a-bdac-adf613db71c5', FCode='T.Qs.DiskFile.ConversionMonitor.ConversionFailed',		FValue='轉換失敗';
insert into TsTextResource set FId='dc270381-b202-4188-aa37-c293fdf73f6a', FCode='T.Qs.DiskFile.ConversionMonitor.ConversionTimeout',		FValue='轉換超時';
insert into TsTextResource set FId='227c2696-02a5-43fb-97cb-42a85c99b47a', FCode='T.Qs.DiskFile.ConversionMonitor.QueueTimeout',			FValue='佇列超時';
insert into TsTextResource set FId='37234b0e-e5d6-45e9-9e61-d25f9430dca2', FCode='T.Qs.DiskFile.ConversionMonitor.QueueOverflow',			FValue='佇列溢出';
insert into TsTextResource set FId='6103afce-eb69-4df2-9abb-2ff7a3ef98b4', FCode='T.Qs.DiskFile.ConversionMonitor.ProcessDesc', 			FValue='負責轉換的 Word/Excel/PowerPoint 進程數量。';
insert into TsTextResource set FId='bc8d0afc-228c-4164-ae23-542c50f085b6', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentRunningDesc', 		FValue='當前正在執行轉換的數量。';
insert into TsTextResource set FId='3d38909e-39ce-410b-ac83-928e4038d5f3', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentWaitingDesc', 		FValue='在佇列中等待轉換的數量。';
insert into TsTextResource set FId='4917ae3f-8d2b-4244-bbc8-059172c89907', FCode='T.Qs.DiskFile.ConversionMonitor.CurrentTimeoutDesc', 		FValue='已執行轉換且轉換超時，但所屬執行緒尚未結束的數量。如果該值大於 100，建議重啟轉換伺服器。';
insert into TsTextResource set FId='30c59a42-684e-43bd-8cfa-9ca41d4fa056', FCode='T.Qs.DiskFile.ConversionMonitor.SuccessDesc', 			FValue='轉換已結束，且成功轉換的數量。';
insert into TsTextResource set FId='3d243722-5d9b-4c05-87f9-b8c965a2b87e', FCode='T.Qs.DiskFile.ConversionMonitor.ConversionFailedDesc', 	FValue='轉換已結束，且轉換過程中發送異常的數量。';
insert into TsTextResource set FId='a4bf08d1-9ec0-426d-b364-75d6ee7a381c', FCode='T.Qs.DiskFile.ConversionMonitor.ConversionTimeoutDesc', 	FValue='轉換已結束，且轉換超時的數量。';
insert into TsTextResource set FId='29392791-dcd5-4905-b38b-76e09f2f4cf9', FCode='T.Qs.DiskFile.ConversionMonitor.QueueTimeoutDesc', 		FValue='轉換已結束，且在等待佇列中超時的數量。';
insert into TsTextResource set FId='1d0bd3d6-4a3c-4fc7-8a02-0b980dc436b0', FCode='T.Qs.DiskFile.ConversionMonitor.QueueOverflowDesc', 		FValue='轉換已結束，且從等待佇列溢出的數量。';
insert into TsTextResource set FId='4a2b55b4-05e2-47be-98f5-16ce7189d5ae', FCode='T.Qs.DiskFile.ConversionMonitor.AutoRefreshDesc', 		FValue='本表每 10 秒自動刷新。如果伺服器重啟，本表內容將自動歸零並重新計數。';
insert into TsTextResource set FId='2ad42b7c-a88d-4831-9862-0ce184db0a91', FCode='T.Qs.DiskFile.ConversionMonitor.RemoteConversion',		FValue='轉換由遠端伺服器執行，本伺服器無相關資料。';
insert into TsTextResource set FId='31e77885-049c-4cec-95ff-d3ffcbd82625', FCode='T.Qs.DiskFile.Preview.RetryAfter',						FValue='線上閱覽生成失敗，請 ${0} 分鐘後重試。';

java refreshSerial('TsMenu');
