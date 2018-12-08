--驗證碼

delete from TsPage where FId='bb51d744-15d7-474d-9356-42f58a20fed9';
insert into TsPage set FId='bb51d744-15d7-474d-9356-42f58a20fed9', FName='驗證碼頁面',			FTitle='驗證',			FCode='Qs.Misc.Captcha',               FType='Other', FIcon=null,												FUrl='quicksilver/page/misc/CaptchaDialog.jsp',			FActionMethodName=null,										FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=400,  FDialogHeight=270,  FDescription=null, FVisible=1;

delete from TsToolItem where FId='fa046750-1f85-465c-86da-fe0cebeabb17';
insert into TsToolItem set FId='fa046750-1f85-465c-86da-fe0cebeabb17', FPageId='bb51d744-15d7-474d-9356-42f58a20fed9', FCode='Confirm', FName='確定', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='CaptchaDialog.doConfirm', FIcon='quicksilver/image/16/Ok.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsTextResource where FId='5598a4cc-a6e1-4a52-8705-a2fc290698d3';
delete from TsTextResource where FId='f59b1777-4253-45ac-87e8-3e5a7005595e';
insert into TsTextResource set FId='5598a4cc-a6e1-4a52-8705-a2fc290698d3', FCode='T.Qs.Misc.SqlExecuteCaptchaMessage',				    FValue='您將在 <label style="color:red;font-weight:bold">${0}</label> 執行 SQL。為確認您的身份，請輸入驗證碼(不區分大小寫)。';
insert into TsTextResource set FId='f59b1777-4253-45ac-87e8-3e5a7005595e', FCode='T.Qs.Misc.InputCaptchaAlert',							FValue='請輸入驗證碼。';

--查詢方案

update TsQuerySchema set FConditionId = null where FConditionId is not null and not exists (select * from TsCondition where FId = TsQuerySchema.FConditionId);
delete from TsCondition where not exists (select * from TsQuerySchema where FConditionId = TsCondition.FId);
delete from TsConditionGroup where not exists (select * from TsCondition where FId = TsConditionGroup.FConditionId);
delete from TsConditionPart where not exists (select * from TsCondition where FId = TsConditionPart.FConditionId);
