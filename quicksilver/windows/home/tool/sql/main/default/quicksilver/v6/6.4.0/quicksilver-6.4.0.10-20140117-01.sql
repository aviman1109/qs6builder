--Qs.SpecialPage---------
create table TsSpecialPage
(
	FId uuid primary key,
	FPath varchar(100),
	FJspDirectlyAccessible bit default 0,
	FBypassSession bit default 0
);

insert into TsSpecialPage set FId='cedb91bb-fce6-4486-82e6-267dfeed2604', FPath='Index.jsp', 									FJspDirectlyAccessible=1, FBypassSession=1;
insert into TsSpecialPage set FId='83e0395f-2edd-400f-b789-552e3174e5be', FPath='FileUpload.jsp', 								FJspDirectlyAccessible=1, FBypassSession=1;
insert into TsSpecialPage set FId='faabd295-39d0-418c-bedb-81db087065fa', FPath='Qs.ActionError.page', 							FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='ac834f39-8674-46b9-990c-974ed08f6626', FPath='Qs.DiskFile.ViewImageByPath.file', 			FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='a36851e1-883b-4c61-adcb-fe86d5589c9f', FPath='Qs.EventLog.Log.data', 						FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='c958b847-28dc-4c51-b522-200e7394ae77', FPath='Qs.Misc.InstallWordPaster.page', 				FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='237bd24e-38fd-4497-b703-4a77539b1550', FPath='Qs.Misc.OpenPageFromEmail.page', 				FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='10e06eda-6b20-456f-8b6e-02b1db6ba111', FPath='Qs.Misc.PutUrlArguments.data', 				FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='7b07bd12-a1f4-419d-9646-b61a680dfc1f', FPath='Qs.Misc.TestConnection.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='d28c842c-6daf-4604-8309-6d1d167efcf4', FPath='Qs.Misc.WriteLog.data', 						FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='58aaf562-53d4-4eb0-bc79-9808c84b1557', FPath='Qs.Misc.GetLogo.file', 						FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='610fd037-7ca2-49af-89f2-bd17207bbcd7', FPath='Qs.OnlineUser.IsOnline.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='32f04e8a-8ae1-4ad6-bbd7-b125f849ee39', FPath='Qs.OnlineUser.Login.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='c7755b83-3127-423e-8173-6d174e6c2904', FPath='Qs.OnlineUser.Logout.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='16a4a398-2548-4d35-ac3f-6651c7894989', FPath='Qs.Page.getInformation.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='5d71a6e1-f24e-4b02-af29-90c697ea9a3e', FPath='Qs.TextResource.GetText.data', 				FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='3e8a549e-f08d-48a9-bc29-17181105903f', FPath='Qs.User.PasswordForget.page', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='b7aa7f31-5f02-44bb-8719-cbbbe20daed9', FPath='Qs.User.PasswordReset.page', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='e43aa1ce-6a2d-4408-9f29-4461dc072f34', FPath='Qs.User.ResetPassword.data', 					FJspDirectlyAccessible=0, FBypassSession=1;
insert into TsSpecialPage set FId='bcee767e-2116-446d-b407-07b37f1a1fe7', FPath='Qs.User.SendPasswordResetEmail.data', 			FJspDirectlyAccessible=0, FBypassSession=1;