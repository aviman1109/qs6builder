update TsPage set FIsSlavePage=1, FMasterUnitId='00000000-0000-0000-0001-000000003003' where FCode='Wf.Process.ChartAndDetail';

update TsToolItem set FIndex = FIndex - 1 where FPageId='5d90172c-155e-4e52-bded-9d2c61b19a44' and FAlign='right' and exists (select * from TsToolItem where FId='0681cb26-2d9f-4256-a6e4-18d7518c5692');
delete from TsToolItem where FId='0681cb26-2d9f-4256-a6e4-18d7518c5692'; --theme button in MainFrame

update TsPage set FIcon='quicksilver/image/unit/Form.png' where FIcon='quicksilver/image/16/Form.png';
