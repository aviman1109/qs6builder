--minglei

delete from TsDictionaryItem where FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7';
insert into TsDictionaryItem set FId='597043bf-18b1-490e-afd5-e22c4b876b68', FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7', FValue='New',				FText='草稿',		FIndex=1;
insert into TsDictionaryItem set FId='5924018b-0efe-4136-9471-17948186f919', FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7', FValue='Waiting',			FText='等待生效',	FIndex=2;
insert into TsDictionaryItem set FId='96db7065-5670-4558-ab77-b8599763e9b2', FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7', FValue='Active',				FText='已生效',		FIndex=3;
insert into TsDictionaryItem set FId='59f8027a-ed56-4ba2-af70-cbdfd79619ad', FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7', FValue='Cancel',				FText='取消',		FIndex=4;
insert into TsDictionaryItem set FId='2cc2dff5-2bd6-43cd-ae00-032e67e569b1', FDictionaryId='6b6e10d4-8d86-4e8e-afe2-35b930f970b7', FValue='Timeout',			FText='超時',		FIndex=5;

delete from TsToolItem where FPageId='f68e3803-c961-4773-baf1-b802d411fc8c';
insert into TsToolItem set FId='80aabc88-5501-40b1-afa9-20f05d6304d4', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='Save',			FName='保存',		FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} != "Waiting" && ${entity.FStatus} != "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';
insert into TsToolItem set FId='2f636de6-5a1a-4576-aa57-8c79afde19b3', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='Publish',			FName='發佈',		FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Share.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} != "Waiting" && ${entity.FStatus} != "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='MarqueeForm.doPublish';
insert into TsToolItem set FId='984ed881-74d4-4965-823a-c9e06906b0d5', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='CancelPublish',	FName='取消發佈',	FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Cancel.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} == "Waiting" || ${entity.FStatus} == "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='MarqueeForm.doCancelPublish';

update TsMarquee set FStatus='Active' where FStatus='Published';
update TsMarquee set FStatus='Waiting' where FStatus='Active' and FStartTime > now();
