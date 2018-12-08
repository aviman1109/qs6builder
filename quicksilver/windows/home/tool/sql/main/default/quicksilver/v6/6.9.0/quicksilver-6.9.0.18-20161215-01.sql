--minglei

update TsToolItem set FIndex = 2 where FId='7362fb42-dd18-44c5-a238-f10076281285';
delete from TsToolItem where FId='b3987a2a-ebb9-43f6-9566-2e3a1b0354ac';
insert into TsToolItem set FId='b3987a2a-ebb9-43f6-9566-2e3a1b0354ac', FPageId='95a95007-9a91-4987-979b-13abaf66dc5c', FCode='Node',    FName='',     FLabel='集群節點', FType='ComboBox-SelectOnly', FAlign='left',  FIndex=2, FWidth=100, FDefaultEventHandler='MonitorPerformance.doNodeChange', FIcon=null,                           FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='Sql', FDictionaryId=null, FSubItemRoutine='select FName, FName as FCode from TsClusterNode where datediff(''m'', FUpdateTime, now()) < 5 order by FName', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolSubItem where FId='f84964c6-59f7-4f41-bd96-6e81fc75d3a1';
delete from TsToolSubItem where FId='5bedf0ef-280c-4d46-a314-97bac8582d73';
delete from TsToolSubItem where FId='e09f6c1f-8704-4402-886e-db1a66235380';
delete from TsToolSubItem where FId='8f35f934-5927-43e5-913b-37286c0998b4';
delete from TsToolSubItem where FId='67995357-0a55-4c99-bce6-5be788d9f454';
insert into TsToolSubItem set FId='f84964c6-59f7-4f41-bd96-6e81fc75d3a1', FToolItemId='7362fb42-dd18-44c5-a238-f10076281285', FCode='Api',         FName='API',         FExpandMode='None', FIndex=5, FIcon=null,                         FEventHandler=null,                               FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='5bedf0ef-280c-4d46-a314-97bac8582d73', FToolItemId='7362fb42-dd18-44c5-a238-f10076281285', FCode='Action',      FName='Action',      FExpandMode='None', FIndex=1, FIcon=null,                         FEventHandler=null,                               FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='e09f6c1f-8704-4402-886e-db1a66235380', FToolItemId='7362fb42-dd18-44c5-a238-f10076281285', FCode='Service',     FName='Service',     FExpandMode='None', FIndex=2, FIcon=null,                         FEventHandler=null,                               FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='8f35f934-5927-43e5-913b-37286c0998b4', FToolItemId='7362fb42-dd18-44c5-a238-f10076281285', FCode='Dao',         FName='DAO',         FExpandMode='None', FIndex=3, FIcon=null,                         FEventHandler=null,                               FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;
insert into TsToolSubItem set FId='67995357-0a55-4c99-bce6-5be788d9f454', FToolItemId='7362fb42-dd18-44c5-a238-f10076281285', FCode='Transaction', FName='Transaction', FExpandMode='None', FIndex=4, FIcon=null,                         FEventHandler=null,                               FVisibleCondition=null, FEnableCondition=null, FHandleType='None',       FHandlePageId=null;

delete from TsTextResource where FId='e23b56fe-12f2-4cd1-94b5-ccf97fd20f1e';
insert into TsTextResource set FId='e23b56fe-12f2-4cd1-94b5-ccf97fd20f1e', FCode='T.Qs.Performance.SlowCount',								FValue='過慢次數 ${0}';

delete from TsToolItem where FId='996dd4dc-a90a-4a7d-bbad-0a2a66c343e9';
insert into TsToolItem set FId='996dd4dc-a90a-4a7d-bbad-0a2a66c343e9', FPageId='48859b88-6f49-4261-9cf6-c4593debfafd', FCode='Node',    FName='',     FLabel='集群節點', FType='ComboBox-SelectOnly', FAlign='left',  FIndex=1, FWidth=100, FDefaultEventHandler='ApplicationManage.doNodeChange', FIcon=null,                           FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource='Sql', FDictionaryId=null, FSubItemRoutine='select FName, FName as FCode from TsClusterNode where datediff(''m'', FUpdateTime, now()) < 5 order by FName', FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
