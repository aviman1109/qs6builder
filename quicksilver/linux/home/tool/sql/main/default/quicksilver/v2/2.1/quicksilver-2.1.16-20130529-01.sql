delete from TsTextResource where FId='b643b27c-62e1-4d14-a563-5c3b4a83173d';
delete from TsTextResource where FId='f9bb11ed-4eff-41b5-9fc1-dfe5cfa083d9';
delete from TsTextResource where FId='76691ba7-ed5e-436b-a6c4-0af374312069';
delete from TsTextResource where FId='d950a305-6166-4322-9793-9c08980da625';
insert into TsTextResource set FCode='T.Qs.List.NavigateBackward',						FId='b643b27c-62e1-4d14-a563-5c3b4a83173d', FValue='后退到上一查询条件，并执行查询';
insert into TsTextResource set FCode='T.Qs.List.NavigateForward',						FId='f9bb11ed-4eff-41b5-9fc1-dfe5cfa083d9', FValue='前进到下一查询条件，并执行查询';
insert into TsTextResource set FCode='T.Qs.List.SwitchLeftPane',						FId='76691ba7-ed5e-436b-a6c4-0af374312069', FValue='显示/隐藏左侧查询表单';
insert into TsTextResource set FCode='T.Qs.List.SwitchRightPane',						FId='d950a305-6166-4322-9793-9c08980da625', FValue='显示/隐藏右侧阅览窗格';

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9' and FIndex >= 3;
insert into TsParameterDefinition set FId='543f0987-0581-429b-a353-8e27dad28f0c', FName='登录处理类',					FCode='QsLoginHandler',						FParameterGroupId='a1f8cfc6-2cc8-4c27-ba78-74c1455b8ca9', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
