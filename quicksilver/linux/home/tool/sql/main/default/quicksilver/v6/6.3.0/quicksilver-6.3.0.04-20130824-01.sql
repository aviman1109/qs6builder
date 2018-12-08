--图表展示页面调整

update TsPage set FDialogWidth=800,  FDialogHeight=500 where FCode='Qs.Chart.Show';

delete from TsToolItem where FId='f23ee2de-6f04-4334-8ba8-54aeee5bd6a3';
insert into TsToolItem set FId='f23ee2de-6f04-4334-8ba8-54aeee5bd6a3', FPageId='f06109c9-9fd7-46e4-bcc0-1732888c07a6', FCode='ExportGrid',			FName='导出表格',		FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='ChartShow.doExportGrid',			FIcon='quicksilver/image/16/Excel.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
