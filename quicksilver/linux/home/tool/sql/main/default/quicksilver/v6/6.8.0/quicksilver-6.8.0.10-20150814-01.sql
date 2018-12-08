--minglei

--cluster node

alter table TsClusterNode alter FIpAddress set data type varchar(200);
alter table TsClusterNode add FStatus varchar(10);
update TsField set FSize=200, FListWidth=200 where FId='14c5d2b8-52af-4a41-b651-0ccadfa5e76e';
insert into TsField set FId='80926e09-adbf-49ed-bd0e-7290377047d0', FUnitId='f580bcca-add9-4d56-8b2e-b43bc3ce13b0', FName='FStatus',         FTitle='狀態',			   		FType='InputBox-Text',    FSize=10,		FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null, FEntityUnitId=null,                                   FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=60,  FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
java setFormFields('228b80a4-20da-46f9-b200-2caacf95972e', '基本資訊', '9859d274-94cd-42c1-a507-88f1c36b688f', null, 'FName,FComputerName,FDomain,FOsName,FOsVersion,FStatus,FUpdateTime', 'IP、埠與應用路徑', '854e2841-a860-446e-a17f-efacbfa26fb3', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FIpAddress,FHttpPort,FHttpsPort,FContextPath', 'CPU', '8d753eca-3a86-485c-ac3a-b57278e2e9bc', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FCpuModel,FCpuUsed', '記憶體', 'd54d8d71-bdea-47b4-8133-1625a9deb53c', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FMemoryTotal,FMemoryUsed,FMemoryFree,FJvmMemoryTotal,FJvmMemoryUsed,FJvmMemoryFree', 'Java', '0cd607eb-cca9-42f9-98a4-d1c82de91497', '9859d274-94cd-42c1-a507-88f1c36b688f', 'FJvmName,FJavaVersion,FJavaHome,FLibraryPath,FWorkDir');
java setListFields('30821512-4ef4-4906-9697-d628319eacea', 'FName,FComputerName,FIpAddress,FStatus,FCpuUsed,FMemoryTotal,FMemoryFree,FJvmMemoryTotal,FJvmMemoryFree,FUpdateTime');

insert into TsTextResource set FId='68c0172b-8701-4ce3-9332-3ebdd3aed2ec', FCode='E.Qs.ClusterNode.NotAccessible',						FValue='集群節點“${0}”無法訪問。';

--timer

alter table TsTimer add FLastExecuteClusterNode varchar(50);
insert into TsField set FId='aa8c8eb6-ed1c-4a3c-9483-50484236e140', FUnitId='00000000-0000-0000-0001-000000000022', FName='FLastExecuteClusterNode',	FTitle='最近執行集群節點',	FType='InputBox-Text',		 FSize=50,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=1, FRowSpan=1, FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null;
update TsField set FListWidth=150 where FId='75199554-97d1-4119-bb80-4a66a85b53ef';
update TsField set FListWidth=150 where FId='af6efc67-e971-4dab-bc32-aac1ecc61b8d';

delete from TsDictionaryItem where FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7';
insert into TsDictionaryItem set FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7', FId='4f1b89f8-9708-4220-a8cf-37beb4f5d076', FIndex=1, FParentValue=null, FText='調度中', FValue='Running';
insert into TsDictionaryItem set FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7', FId='ac772eea-3156-49aa-8083-b536fb8acdb3', FIndex=2, FParentValue=null, FText='成功',   FValue='Success';
insert into TsDictionaryItem set FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7', FId='a4449c20-d593-407c-9e87-dbb3c9555daa', FIndex=3, FParentValue=null, FText='失敗',   FValue='Failed';
insert into TsDictionaryItem set FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7', FId='a6a4fede-315b-4345-b28b-af1447af5e22', FIndex=4, FParentValue=null, FText='中斷',   FValue='Terminated';
insert into TsDictionaryItem set FDictionaryId='3f196d23-7b68-499e-9161-4a4a9287e0e7', FId='b51df02a-cac3-4ae0-8735-5f852706b28f', FIndex=5, FParentValue=null, FText='忽略',   FValue='Skip';
