--lei.lei password
create table TsUserInputPasswordErrorCount
(
	FLoginName varchar(50),
	FErrorTime timestamp,
	FCount int
);

insert into TsTextResource set FCode='E.Qs.User.Lock', FId='b4d74122-22b6-4177-99ef-f05162a722bf', FValue='登錄名為 "${0}" 已被鎖住，請等  ${1} 分鐘后再試。';
insert into TsSpecialPath set FId='f73c6202-9602-4e13-8dd0-cdf982a01fa1', FPath='Qs.OnlineUser.updateInputPasswordErrorCount.data', FMatchMode='PlainText',         FKey='BypassSession',    FValue='true',        FIndex=4;
insert into TsNotice set FId='63b74cc0-47e0-451a-a51c-4abe3950a585', FSubject='帳戶登錄失敗通知', FSendSystemMessage=1, FSendShortMessage=0, FSendEmail=1, FSystemMessageContent='您的帳戶因密碼錯誤登錄失敗。登錄名：${recipient.FLoginName}，IP：${ip}，時間：${logTime}。', FShortMessageContent='您在${systemParameter.QsSystemName}的帳戶，因密碼錯誤登錄失敗。登錄名：${recipient.FLoginName}，IP：${ip}，時間：${logTime}。',FEmailCc='', FEmailContent='<p>${recipient.FName}：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;您好！您在${systemParameter.QsSystemName}的帳戶，用錯誤密碼登錄失敗。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;登錄名：${recipient.FLoginName}<br/>&nbsp;&nbsp;&nbsp;&nbsp;IP：${ip}<br />&nbsp;&nbsp;&nbsp;&nbsp;時間：${logTime}</p>',FEmailBcc='';

---BrowserBehavior
insert into TsParameterDefinition set FCode='QsBrowserBehavior',                 FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='36585a3e-7e0b-4655-911c-80c04b2ba01c', FIndex=18, FName='限制瀏覽器右鍵，複製',                 FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
