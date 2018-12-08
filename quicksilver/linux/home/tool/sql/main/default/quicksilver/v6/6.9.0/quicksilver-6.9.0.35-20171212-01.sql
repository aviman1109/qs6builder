--minglei

java runOnError (
	'select * from TsCorsOrigin',
	'create table TsCorsOrigin (FId uuid primary key, FOrigin varchar(100), FAllowed bit, FIndex int)'
);

delete from TsDictionary where FId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783';
delete from TsDictionaryItem where FDictionaryId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783';
insert into TsDictionary set FId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783', FName='QS-參數-CORS模式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='9151c85f-07d3-4369-8a6a-e2a4d0fca4d6', FDictionaryId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783', FValue='AllowAll',			FText='允許所有其它網域請求本系統資源',		FIndex=1;
insert into TsDictionaryItem set FId='d0e4f347-be01-418d-8d04-c181e65bb22e', FDictionaryId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783', FValue='AllowWhiteList',		FText='允許白名單中的網域請求本系統資源',	FIndex=2;
insert into TsDictionaryItem set FId='2a02682e-4a61-4469-a102-8f7f49d2e99d', FDictionaryId='4ee52d9a-70f4-4bb4-821c-0c88e7ed6783', FValue='DenyAll',			FText='禁止所有其它網域請求本系統資源',		FIndex=3;

delete from TsParameterDefinition where FId='06214d1a-b81f-44a1-900b-dac2fc6ea8d7';
insert into TsParameterDefinition set FId='06214d1a-b81f-44a1-900b-dac2fc6ea8d7', FName='跨域資源分享(CORS)模式',					FCode='QsCorsMode',							FParameterGroupId=null,									  FType='ComboBox-SelectOnly',	FRange='System',		FRowSpan=1, FColSpan=1, FRequired=0, FVisible=0, FIndex=1;

java runOnEmpty (
	'select * from TsDual where exists (select * from TsSystemParameter where FKey = ''QsCorsMode'') or exists (select * from TsLoginLog)',
	'insert into TsSystemParameter set FId=''b2de8e83-7f2b-4ad5-a940-22c23ae88653'', FKey=''QsCorsMode'', FValue=''DenyAll'''
);

delete from TsPage where FId='98451d2c-17ec-486b-b16f-bba0c83edc56';
insert into TsPage set FId='98451d2c-17ec-486b-b16f-bba0c83edc56', FName='跨域資源分享設置',		FTitle='跨域資源分享',	FCode='Qs.Misc.CorsConfig',				FType='Other', FIcon=null,												FUrl='quicksilver/page/misc/CorsConfig.jsp',				FActionMethodName='Qs.Misc.prepareCorsConfig',				FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FEditId='4e9b96a5-4c20-42a0-8929-d83efc27af4e', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsToolItem where FId='5ad893bf-c31d-433a-8c4f-8f112febca35';
insert into TsToolItem set FId='5ad893bf-c31d-433a-8c4f-8f112febca35', FPageId='98451d2c-17ec-486b-b16f-bba0c83edc56', FCode='Save',       FName='保存', FHint=null, FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',       FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='CorsConfig.doSave';

delete from TsMenu where FId='894089cd-557c-4db3-ab2f-ae1db80aa82b';
insert into TsMenu set	FId='894089cd-557c-4db3-ab2f-ae1db80aa82b', FParentId='0317797f-7d43-4b33-a05f-dd0adf3914c7',	FIndex=5,	FName='跨域資源分享',		FPageId='98451d2c-17ec-486b-b16f-bba0c83edc56', FEnabled=1, FSubMenuSource='MenuTable', FIcon='quicksilver/image/16/Cors.png';

delete from TsTextResource where FId='1b6deeed-e5fe-4536-9c51-9d5532f8b0ac';
delete from TsTextResource where FId='f24fa5b8-a45c-430f-ae4e-1c39213abcad';
insert into TsTextResource set FId='1b6deeed-e5fe-4536-9c51-9d5532f8b0ac', FCode='T.Qs.CorsConfig.Mode',								FValue='模式';
insert into TsTextResource set FId='f24fa5b8-a45c-430f-ae4e-1c39213abcad', FCode='T.Qs.CorsConfig.WhiteList',							FValue='白名單（每個網域一行）';

java refreshSerial('TsMenu');
