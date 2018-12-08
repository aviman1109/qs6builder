delete from TsTextResource where FId='cce2890c-424d-4dd3-a279-26ec9bac287e';
insert into TsTextResource set FCode='E.Qs.Auth.CannotAccessJspDirectly',					FId='cce2890c-424d-4dd3-a279-26ec9bac287e', FValue='不能直接访问规定范围之外的 JSP 页面。';

update TsTimer set FAllowConcurrentRun=1 where FId='b018229d-c47d-4f3d-b604-f216c61aff53';
update TsTimer set FAllowConcurrentRun=0 where FAllowConcurrentRun is null;
