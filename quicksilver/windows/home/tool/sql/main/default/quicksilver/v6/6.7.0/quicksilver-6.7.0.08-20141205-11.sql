--minglei

delete from TsSpecialPath where FPath like '%Qs.Report.Html.page' and FKey='VirtualDirectory';
delete from TsSpecialPath where FPath like '%Qs.Chart.getChartData.data' and FKey='VirtualDirectory';
insert into TsSpecialPath set FId='83149d0f-5f4b-4d28-9e48-d5cadf765213', FMatchMode='PlainText',			FPath='/Qs.Report.Html.page',			FKey='VirtualDirectory', FValue='qsvd-report',	FIndex=3;
insert into TsSpecialPath set FId='37e15d1f-1850-43ee-8dc9-409369847664', FMatchMode='PlainText',			FPath='/Qs.Chart.getChartData.data',	FKey='VirtualDirectory', FValue='qsvd-chart',	FIndex=2;

delete from TsToolSubItem where FId='39e3bd43-ea0c-43ed-bf2c-e3a4f9a06930';
insert into TsToolSubItem set FId='39e3bd43-ea0c-43ed-bf2c-e3a4f9a06930', FToolItemId='ee56ccf6-93e4-49db-b71a-5418b0b680a4', FCode='CheckWordPaster',		FName='檢測貼圖外掛程式',		FExpandMode='None', FIndex=2, FIcon='quicksilver/image/16/Word.gif',	FEventHandler='MainFrame.doCheckWordPaster',	FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
