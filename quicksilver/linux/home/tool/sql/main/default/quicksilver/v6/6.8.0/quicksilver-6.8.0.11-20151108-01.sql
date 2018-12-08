--minglei

delete from TsTimer where FId='a91651f3-160d-446b-b1eb-21e194997812';
insert into TsTimer set FId='a91651f3-160d-446b-b1eb-21e194997812', FName='流程清理',							FType='JavaClass', FRoutine='com.jeedsoft.quicksilver.handler.timer.WorkflowCleanRoutine',		FIntervalLength=1, FIntervalType='day',     FSystemStartupAction='None',	    FEnabled=1, FBaseTime=timestamp('2015-01-01 02:00:00'), FAllowConcurrentRun=0, FAllowOverlapRun=1;

java setFormFields('0fdc26e8-11de-4816-a0a5-d2a1757b01f0', '基本資訊', '7290ff50-b9bc-4302-ac92-f6f352baa9c7', null, 'FName,FCheckOnSave,FAllowDuplication');
java setListFields('0a88f153-5d48-4c90-a6eb-d816f8ffdd97', 'FCheckOnSave,FAllowDuplication,FName');
java setListFields('00595518-1a4f-4764-8956-6ee69264218c', 'FCheckOnSave,FAllowDuplication,FName');
java setListFields('d02fd08d-5fa4-4c39-be67-7e4f289b47c5', 'FCheckOnSave,FAllowDuplication,FName');
update TsField set FVisible=0 where FId='680afe00-67c5-4cf9-8d62-736db746074c';
update TsField set FVisible=0 where FId='3dcbc4fa-d0df-4b91-987a-42cf00c24b78';
update TsField set FListWidth=120 where FId='c9c89b42-a4ad-4a44-a8c0-1fda3d5f4139';
update TsField set FListWidth=120 where FId='7ea755ac-0153-410e-bb82-2f11133aa402';
