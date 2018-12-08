--Author: Minglei

update TsParameterDefinition set FIndex = FIndex + 2 where FParameterGroupId='936deb2e-c0b7-4205-a8e9-4446aaa33173' and FIndex >= 3;
delete from TsParameterDefinition where FId='cb9d896a-b69f-4eaa-9f13-333ff0091c76';
delete from TsParameterDefinition where FId='20eb3ea1-58ed-4a9a-b9a6-60d69e594e9a';
insert into TsParameterDefinition set FId='cb9d896a-b69f-4eaa-9f13-333ff0091c76', FName='附件伺服器用戶名',				FCode='QsAttachmentServerUserName',			FParameterGroupId='936deb2e-c0b7-4205-a8e9-4446aaa33173', FType='InputBox-Text',		FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=3;
insert into TsParameterDefinition set FId='20eb3ea1-58ed-4a9a-b9a6-60d69e594e9a', FName='附件伺服器密碼',				FCode='QsAttachmentServerPassword',			FParameterGroupId='936deb2e-c0b7-4205-a8e9-4446aaa33173', FType='InputBox-Password',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=4;

delete from TsTextResource where FId='86daa8c5-a726-4b97-9e1f-6226d584fb8a';
delete from TsTextResource where FId='aa163108-f41a-4d73-aaae-dbaadb30734f';
delete from TsTextResource where FId='1f6a9014-952d-4fbc-83b6-a974ce152988';
delete from TsTextResource where FId='fef97d23-bb2a-46c7-97eb-ac97a4e05be8';
insert into TsTextResource set FId='86daa8c5-a726-4b97-9e1f-6226d584fb8a', FCode='E.Basic.Net.MalformedUrl',							FValue='URL“${0}”格式錯誤。';
insert into TsTextResource set FId='aa163108-f41a-4d73-aaae-dbaadb30734f', FCode='E.Basic.Samba.UnknownHost',							FValue='無法解析文件共用伺服器的主機名稱 ${0}。';
insert into TsTextResource set FId='1f6a9014-952d-4fbc-83b6-a974ce152988', FCode='E.Basic.Samba.LoginFailed',							FValue='文件共用伺服器 ${0} 登錄失敗。請檢查用戶名、密碼以及該使用者是否有訪問文件共用伺服器的許可權。';
insert into TsTextResource set FId='fef97d23-bb2a-46c7-97eb-ac97a4e05be8', FCode='E.Basic.Samba.OperationFailed',						FValue='文件共用伺服器讀寫失敗。';
