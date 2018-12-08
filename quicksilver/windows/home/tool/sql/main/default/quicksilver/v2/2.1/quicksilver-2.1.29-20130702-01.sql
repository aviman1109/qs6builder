--修正工作台显示问题

delete from TsWorkbench where not exists (
	select * from TsRoleMenu where FRoleId = TsWorkbench.FRoleId and FMenuId = TsWorkbench.FMenuId
);

--工作项立即执行

delete from TsToolItem where FId='f709abd1-01b0-4720-ab01-36d0619b6e32';
insert into TsToolItem set FId='f709abd1-01b0-4720-ab01-36d0619b6e32', FPageId='0953493e-d9f6-4f0e-a9a5-21a36b3fd97b', FCode='Execute',	FName='执行',	FLabel=null, FType='Button', FAlign='right', FIndex=4, FWidth=0, FDefaultEventHandler='TimerEdit.doExecute', FIcon='quicksilver/image/16/Execute.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsTextResource where FId='b89b1623-cb39-4528-ad3b-6f0436e44f9d';
delete from TsTextResource where FId='2285ca62-0f53-4adc-96ea-d3b3e15ae560';
insert into TsTextResource set FCode='T.Qs.Timer.ExecuteConfirm',							FId='b89b1623-cb39-4528-ad3b-6f0436e44f9d', FValue='您是否确定要立即执行该定时器？';
insert into TsTextResource set FCode='T.Qs.Timer.SubmitExecuteSuccess',						FId='2285ca62-0f53-4adc-96ea-d3b3e15ae560', FValue='定时器已提交执行，请在定时器日志中查看执行状况。';

delete from TsField where FId='9c76ff46-da98-454e-9516-b51a8d9db302';
insert into TsField set FId='9c76ff46-da98-454e-9516-b51a8d9db302', FUnitId='429a0d3b-4328-4243-917a-636f15fe7e08', FName='FCallType',     FTitle='调用方式', FType='ComboBox-SelectOnly', FSize=10,   FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='ab460bb2-d8e6-4149-9567-33331596e7e3', FEntityUnitId=null,                                   FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1,  FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null, FRelationCapacity=null, FSupportI18n=0,    FHint=null;

delete from TsDictionaryItem where FDictionaryId='ab460bb2-d8e6-4149-9567-33331596e7e3';
insert into TsDictionaryItem set FDictionaryId='ab460bb2-d8e6-4149-9567-33331596e7e3', FId='2f058548-2c41-4b56-9950-86684ec0432a', FIndex=1, FParentValue=null, FText='自动', FValue='Auto';
insert into TsDictionaryItem set FDictionaryId='ab460bb2-d8e6-4149-9567-33331596e7e3', FId='cb67cacc-29db-4d33-8f70-9c58035f3685', FIndex=2, FParentValue=null, FText='手动', FValue='Manual';

update TsTimerLog set FCallType='Auto' where FCallType is null;
