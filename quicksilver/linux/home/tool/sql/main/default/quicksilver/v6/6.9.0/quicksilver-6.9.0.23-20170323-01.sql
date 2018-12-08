update TsNotice set FSystemMessageContent='您的帳戶因密碼錯誤登錄失敗。登錄名：${recipient.FLoginName}，IP：${ip}，時間：${logTime}。'
where FId='63b74cc0-47e0-451a-a51c-4abe3950a585' and (FSystemMessageContent is null or trim(FSystemMessageContent) = '' or FSystemMessageContent like '%failPassword%');

update TsNotice set FShortMessageContent='您在${systemParameter.QsSystemName}的帳戶，因密碼錯誤登錄失敗。登錄名：${recipient.FLoginName}，IP：${ip}，時間：${logTime}。'
where FId='63b74cc0-47e0-451a-a51c-4abe3950a585' and FShortMessageContent like '%failPassword%';

update TsNotice set FEmailContent='<p>${recipient.FName}：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;您好！您在${systemParameter.QsSystemName}的帳戶，用錯誤密碼登錄失敗。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;登錄名：${recipient.FLoginName}<br/>&nbsp;&nbsp;&nbsp;&nbsp;IP：${ip}<br />&nbsp;&nbsp;&nbsp;&nbsp;時間：${logTime}</p>'
where FId='63b74cc0-47e0-451a-a51c-4abe3950a585' and FEmailContent like '%failPassword%';

update TsNotice set FShortMessageContent='您在${systemParameter.QsSystemName}的密碼已經修改。'
where FId='0e6689a3-2bbd-45aa-aa7e-715fb976edf9' and FShortMessageContent='您在${systemParameter.QsSystemName}的密碼已經修改。登錄名：${recipient.FLoginName}，新密碼：${Password}。';

update TsNotice set FEmailContent='<p>${recipient.FName}：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;您好！您在${systemParameter.QsSystemName}的密碼已經修改。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;登錄名：${recipient.FLoginName}<br />&nbsp;&nbsp;&nbsp;&nbsp;網　址：${systemParameter.QsSystemUrl}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;如果本次密碼修改不是您本人所為，請儘快重新設置密碼並與系統管理員聯繫。</p>'
where FId='0e6689a3-2bbd-45aa-aa7e-715fb976edf9' and FEmailContent='<p>${recipient.FName}：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;您好！您在${systemParameter.QsSystemName}的密碼已經修改。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;登錄名：${recipient.FLoginName}<br />&nbsp;&nbsp;&nbsp;&nbsp;新密碼：${Password}<br />&nbsp;&nbsp;&nbsp;&nbsp;網　址：${systemParameter.QsSystemUrl}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;如果本次密碼修改不是您本人所為，請儘快重新設置密碼並與系統管理員聯繫。</p>';
