update TsPage set FCode='Qs.Misc.About', FActionMethodName='Qs.Misc.prepareAbout', FDialogWidth=480, FDialogHeight=380 where FId='a1143e5e-0fe1-4629-ab53-73fe1d9f21b8';

delete from TsTextResource where FId='da1764a2-5133-467a-87ae-13cfe2415653';
insert into TsTextResource set FId='da1764a2-5133-467a-87ae-13cfe2415653', FCode='T.Qs.About.VersionInfo',								FValue='版本信息';
