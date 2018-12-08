--hotbit.yu

--實體分配頁面
update TsPage set FDialogWidth=800, FDialogHeight=400 where FId='592d3721-c68a-46fd-bb1f-57fc5fb896d1';
insert into TsTextResource set FCode='T.Qs.EntityAssign.Comment', FId='15981793-9320-0fd5-51d9-c65444558360', FValue='分配意見：';
update TsTextResource set FValue='分配給：${0}，分配意見：${1}' where FId='1c77d2b5-fd03-44ff-bc09-a3f7eae5355c';