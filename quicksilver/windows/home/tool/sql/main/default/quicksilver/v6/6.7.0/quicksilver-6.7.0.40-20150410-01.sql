--lei.lei
insert into TsTextResource set FCode='T.Qs.RoleRelation.Description', FId='f4269390-a4d2-4e23-9c93-90eed7bf236c', FValue='${0} 員工：${1}。';
insert into TsTextResource set FCode='T.Qs.RolePrivilege.Description', FId='f7ef11d5-dba7-486f-a042-fb242cc51336', FValue='${0} 許可權：${1}。';

update TsUnit set FSupportBusinessLog=1 where FId='00000000-0000-0000-0001-000000001004';
insert into TsPage set FId='cc257574-1f70-48ec-ab6e-63517c092d40', FName='角色日誌清單',   FTitle='日誌',     FCode='Qs.Role.BusinessLog', FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FPlatform='Computer', FType='EntityList', FIcon='quicksilver/image/unit/BusinessLog.png', FUrl='quicksilver/page/template/EntityList.jsp',  FActionMethodName='Qs.BusinessLog.prepareSlaveList',    FLoadHandler=null,              FRelationId=null,                                   FUnitId=null,                                   FMasterUnitId='00000000-0000-0000-0001-000000001004', FIsSlavePage=1, FIndex=8,    FFormColumnCount=null, FDialogWidth=null, FDialogHeight=null, FDialogMaximized=null, FQueryFormAutoQuery=1,    FHasViewFrame=null, FQueryOnLoad=null, FQuerySchemaId=null, FCreateQuerySchemaBox=null, FCreateKeywordBox=null, FToolItemInitArguments=null, FVisible=1, FVisibleCondition=null, FDescription=null;

insert into TsDictionaryItem set FDictionaryId='9d32f429-f312-48d5-8990-3ad57804d04d', FEnabled=1, FId='e01f4893-ead4-4900-a6ca-ffe68a275127', FIndex=7, FParentValue=null, FText='登錄失敗',         FValue='LoginFalure';
