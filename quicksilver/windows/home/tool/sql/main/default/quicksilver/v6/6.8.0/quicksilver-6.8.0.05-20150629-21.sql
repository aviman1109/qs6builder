--minglei

update TsPage set FDialogWidth=800 where FCode='Wf.Version.Config';

delete from TsTextResource where FCode='T.Wf.Version.NoticeSource';

delete from TsTextResource where FCode='T.Wf.Version.NoticeSource.Default';
delete from TsTextResource where FCode='T.Wf.Version.NoticeSource.Custom';
delete from TsTextResource where FId='852252c3-636b-43bf-afbb-a0de991c059c';
delete from TsTextResource where FId='1a86dcec-3759-454c-8d9d-510a8f3e2d4f';
insert into TsTextResource set FId='852252c3-636b-43bf-afbb-a0de991c059c', FCode='T.Wf.Version.Notice.Default',					FValue='默認';
insert into TsTextResource set FId='1a86dcec-3759-454c-8d9d-510a8f3e2d4f', FCode='T.Wf.Version.Notice.Custom',					FValue='指定';

delete from TsTextResource where FCode='T.Wf.Version.NoticeMedia';
delete from TsTextResource where FCode='T.Wf.Version.NoticeMedia.Email';
delete from TsTextResource where FCode='T.Wf.Version.NoticeMedia.ShortMessage';
delete from TsTextResource where FCode='T.Wf.Version.NoticeMedia.SystemMessage';
delete from TsTextResource where FId='dbe01f44-96aa-49be-8ea5-bd88182bf7c1';
delete from TsTextResource where FId='a0a6367e-d003-4e20-bc25-f75a5c75b0df';
delete from TsTextResource where FId='5256edb7-e4ef-41d8-8104-2b88c69347bd';
delete from TsTextResource where FId='4397d9ea-bd23-41bf-9002-409cf94445ee';
insert into TsTextResource set FId='dbe01f44-96aa-49be-8ea5-bd88182bf7c1', FCode='T.Wf.Version.Media',							FValue='發送方式';
insert into TsTextResource set FId='a0a6367e-d003-4e20-bc25-f75a5c75b0df', FCode='T.Wf.Version.Media.Email',					FValue='郵件';
insert into TsTextResource set FId='5256edb7-e4ef-41d8-8104-2b88c69347bd', FCode='T.Wf.Version.Media.ShortMessage',				FValue='短信';
insert into TsTextResource set FId='4397d9ea-bd23-41bf-9002-409cf94445ee', FCode='T.Wf.Version.Media.SystemMessage',			FValue='系統消息';

delete from TsTextResource where FCode='T.Wf.Version.SpecifiedNotice';
delete from TsTextResource where FCode='T.Wf.Version.SpecifiedMedia';
insert into TsTextResource set FId='ef5fd9bd-580d-4c04-b236-89b436f888a9', FCode='T.Wf.Version.SpecifiedNotice',					FValue='指定通知';
insert into TsTextResource set FId='1854123f-d5a3-4ebd-88ee-e3b2e3074be9', FCode='T.Wf.Version.SpecifiedMedia',						FValue='指定發送方式';
