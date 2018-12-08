--minglei

--for simplicity, remove match by wildcard expression

delete from TsDictionaryItem where FDictionaryId='126ccc09-61b3-45f3-b7c1-5ec349c5f3ee';
insert into TsDictionaryItem set FDictionaryId='126ccc09-61b3-45f3-b7c1-5ec349c5f3ee', FEnabled=1, FId='51e0256d-90c8-4f52-8b8e-ff77d2688834', FIndex=1, FParentValue=null, FText='純文字',       FValue='PlainText';
insert into TsDictionaryItem set FDictionaryId='126ccc09-61b3-45f3-b7c1-5ec349c5f3ee', FEnabled=1, FId='fbaf4fb3-d5e4-4ce5-a026-51b31efe7853', FIndex=2, FParentValue=null, FText='規則運算式',   FValue='RegularExpression';

delete from TsSpecialPath;

insert into TsSpecialPath (FId, FMatchMode, FPath, FKey, FValue)
select uuid(), 'RegularExpression', '(.*/)?' || replace(FPath, '.', '\.'), 'JspDirectlyAccessible', '1'
from TsSpecialPage where FJspDirectlyAccessible = 1;

insert into TsSpecialPath (FId, FMatchMode, FPath, FKey, FValue)
select uuid(), 'RegularExpression', '(.*/)?' || replace(FPath, '.', '\.'), 'BypassSession', '1'
from TsSpecialPage where FBypassSession = 1;

delete from TsSpecialPath where lower(FPath) = lower('(.*/)?FileUpload\.jsp');
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.ActionError\.page');          
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.BrowserInvalid\.page');       
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.InstallWordPaster\.page');    
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.OpenPageFromEmail\.page');    
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.User\.PasswordForget\.page');       
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.User\.PasswordReset\.page');        
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.EventLog\.Log\.data');              
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.PutUrlArguments\.data');      
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.TestConnection\.data');       
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.WriteLog\.data');             
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.OnlineUser\.IsOnline\.data');       
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.OnlineUser\.Login\.data');          
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.OnlineUser\.Logout\.data');         
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Page\.GetInformation\.data');       
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.TextResource\.GetText\.data');      
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.User\.ResetPassword\.data');        
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.User\.SendPasswordResetEmail\.data');
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.DiskFile\.ViewImageByPath\.file');  
delete from TsSpecialPath where lower(FPath) = lower('(.*/)?Qs\.Misc\.GetLogo\.file');              

insert into TsSpecialPath set FId='315ec30b-3c8d-4822-aae3-5feb9de6c946', FMatchMode='RegularExpression',	FPath='.*\.exportList\.file',		FKey='VirtualDirectory', FValue='qsvd-export',	FIndex=1;
insert into TsSpecialPath set FId='83149d0f-5f4b-4d28-9e48-d5cadf765213', FMatchMode='PlainText',			FPath='Qs.Report.Html.page',		FKey='VirtualDirectory', FValue='qsvd-report',	FIndex=3;
insert into TsSpecialPath set FId='37e15d1f-1850-43ee-8dc9-409369847664', FMatchMode='PlainText',			FPath='Qs.Chart.getChartData.data',	FKey='VirtualDirectory', FValue='qsvd-chart',	FIndex=2;
