delete from TsToolItem where FPageId='65866673-cc70-453d-9027-58271d9ccc9d';
insert into TsToolItem set FId='a654f645-3723-47ff-a071-1950a55ae78c', FPageId='65866673-cc70-453d-9027-58271d9ccc9d', FCode='Execute',       FName='執行',       FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='ReportCenter.doExecute',         FIcon='quicksilver/image/16/Execute.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='63bc7d57-3dc8-41f7-8c9f-447cff3393b1', FPageId='65866673-cc70-453d-9027-58271d9ccc9d', FCode='OpenNewWindow', FName='打開新視窗', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='ReportCenter.doOpenNewWindow',   FIcon='quicksilver/image/16/NewWindow.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='b56f8520-79ec-465f-9d99-d36ff735a8d3';
insert into TsToolItem set FId='9d2e10bf-4eb3-4b22-96a8-2dbeeb0cb334', FPageId='b56f8520-79ec-465f-9d99-d36ff735a8d3', FCode='Execute', FName='執行', FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='ReportShow.doExecute', FIcon='quicksilver/image/16/Execute.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='3ff58410-7e93-483d-9382-7d488da71203';

update TsPage set FCode='Qs.Report.Show', FUrl='quicksilver/page/report/ReportShow.jsp', FActionMethodName='Qs.Report.prepareShow' where FCode='Qs.Report.View';
update TsPage set FCode='Qs.Bill.Show', FUrl='quicksilver/page/report/BillShow.jsp', FActionMethodName='Qs.Bill.prepareShow' where FCode='Qs.Bill.View';
