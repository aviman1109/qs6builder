--Author: Minglei

delete from TsPage where FId='2b352b8a-80c1-4ec8-9473-74bc11a0ff8e';
insert into TsPage set FId='2b352b8a-80c1-4ec8-9473-74bc11a0ff8e', FName='流程環節資訊',     FTitle='環節資訊',     FCode='Wf.Process.CommentForm',    FType='Other',      FIcon='quicksilver/image/unit/WfActivity.gif', FUrl='quicksilver/page/template/SimpleEdit.jsp',			FActionMethodName=null,								  FLoadHandler=null, FRelationId=null, FUnitId=null,                                   FMasterUnitId='00000000-0000-0000-0001-000000003003', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=640, FDialogHeight=435, FDescription=null, FVisible=1;
delete from TsScript where FId='70f456ed-df38-4304-9794-ce751dc53bc1';
insert into TsScript set FId='70f456ed-df38-4304-9794-ce751dc53bc1', FIndex=1, FPageId='2b352b8a-80c1-4ec8-9473-74bc11a0ff8e', FUrl='quicksilver/page/wfinstance/WfCommentForm.js';
