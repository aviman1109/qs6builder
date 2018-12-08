﻿--lei.lei
insert into TsParameterGroup set FId='948d19ef-e494-4b60-9cde-cfd8a61e793b', FIndex=2, FName='第三方認證',          FParentId=null,                                   FTreeLevel=1, FTreeSerial='002';
insert into TsParameterGroup set FId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FIndex=1, FName='AD認證',              FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b', FTreeLevel=2, FTreeSerial='002.001';
insert into TsParameterGroup set FId='4e243470-7710-4f27-bed6-dd956f5aa482', FIndex=2, FName='第三方認證',          FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b', FTreeLevel=2, FTreeSerial='002.002';
insert into TsParameterGroup set FId='03f80ede-10d9-4197-a8cb-6a29cb94b226', FIndex=3, FName='第三方登入頁面',      FParentId='948d19ef-e494-4b60-9cde-cfd8a61e793b', FTreeLevel=2, FTreeSerial='002.003';

insert into TsParameterDefinition set FCode='QsADDomain1',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='780ffb22-e844-46fb-a844-780336565d10', FIndex=19, FName='網域1',                          FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServer1',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='b36d445a-73b5-4702-8ea9-e1da32ffb100', FIndex=20, FName='AD伺服器1',                      FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServerPort1',                   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='04ac9157-ae03-432c-9b86-32e989c595b8', FIndex=21, FName='埠1',                            FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADDomain2',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='bd218991-ecf6-4c57-8313-135af1eed1a4', FIndex=22, FName='網域2',                          FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServer2',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='cefc09b2-23d8-4a44-8bbe-df565be02bc5', FIndex=23, FName='AD伺服器2',                      FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServerPort2',                   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='82ba2591-75d0-4eb9-a135-c005b444aa5e', FIndex=24, FName='埠2',                            FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADDomain3',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='7d319d9c-1757-4b0e-b2ef-54b4d8c05ebb', FIndex=25, FName='網域3',                          FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServer3',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='fe1f47c5-4332-4592-92ae-e676b075aaa1', FIndex=26, FName='AD伺服器3',                      FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServerPort3',                   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='af6ba3b8-45b7-4503-9b91-366fa84312e7', FIndex=27, FName='埠3',                            FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADDomain4',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='65936564-40fc-42ed-ba7e-6d37f06fadf4', FIndex=28, FName='網域4',                          FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServer4',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='f60f5759-d94e-45f9-bec0-cb3944440505', FIndex=29, FName='AD伺服器4',                      FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServerPort4',                   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='3a70497f-daca-4f4e-8afe-0b3595dbb569', FIndex=30, FName='埠4',                            FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADDomain5',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='6d283d69-38e5-4cef-9ab1-2790bc5a41c5', FIndex=31, FName='網域5',                          FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServer5',                       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='8fff677e-041e-43c7-9768-10a4e2c7a929', FIndex=32, FName='AD伺服器5',                      FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsADServerPort5',                   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='f65b1574-d181-40de-bea2-c5290d13c0c3', FIndex=33, FName='埠5',                            FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsEnableADServer',                  FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='42b4aecc-b309-4c2a-9071-cb6503401f1e', FIndex=18, FName='啟用AD認證',                     FParameterGroupId='640d9f1d-cd25-466e-b4ae-ed05fac83246', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
insert into TsParameterDefinition set FCode='QsThirdPartyCertificationUrl',      FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='31d0bab1-f311-4d5b-83cf-ba3556d9dcea', FIndex=35, FName='第三方認證URL',                  FParameterGroupId='4e243470-7710-4f27-bed6-dd956f5aa482', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsEnableThirdPartyCertification',   FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='dfbfd47e-d39f-4cd8-990b-f3da491b5ddc', FIndex=34, FName='啟用第三方認證',                 FParameterGroupId='4e243470-7710-4f27-bed6-dd956f5aa482', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;
insert into TsParameterDefinition set FCode='QsThirdPartyLoginPageUrl',          FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='e15d5e7a-d187-45a9-a0ed-0c6db2398376', FIndex=37, FName='第三方登入頁面URL',              FParameterGroupId='03f80ede-10d9-4197-a8cb-6a29cb94b226', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='InputBox-Text',       FVisible=1;
insert into TsParameterDefinition set FCode='QsEnableThirdPartyLoginPage',       FColSpan=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FId='63b585c2-e218-4e08-b41d-eba51ef2659c', FIndex=36, FName='啟用第三方登入頁面',             FParameterGroupId='03f80ede-10d9-4197-a8cb-6a29cb94b226', FRange='System',        FRequired=0, FRowSpan=1, FScale=null, FType='CheckBox',            FVisible=1;

--Qs.ThirdPartyCertification-------------------------------------------------

insert into TsUnit set FId='887741ca-b847-4352-8cd5-2f0474f5046f', FCode='Qs.ThirdPartyCertification', FName='第三方認證', FIcon='quicksilver/image/unit/New.gif', FBigIcon='quicksilver/image/unit/New-64.gif', FEditId='8b7ebd7e-8173-4787-9e34-3d27ad4c9c29', FModuleId='00000000-0000-0000-0008-990000000010', FOpenMode='System', FIsTreeStructure=null, FMaxTreeLevel=null, FIsSlaveUnit=null, FMasterUnitId=null, FSupportWorkflow=null, FSupportUser=null, FSupportDepartment=null, FSupportEditType=null, FSupportAttachment=null, FSupportDataPrivilege=null, FSupportVersion=null, FSupportBusinessLog=null, FSupportNote=null, FSupportSort=null, FSupportPrivilegeField=0, FIsFullTextSearch=0, FSearchAttachment=0, FSupportEqualQuery=0, FUseSystemI18nTable=0, FExtraQueryResultLimit=0, FRecordCreateInfo=0, FRecordUpdateInfo=0, FRecordDeleteInfo=0, FViewPageConditionForList=null, FViewPageConditionForLink=null, FDataSource='default', FTable=null, FKeyField='FId', FKeyType='Uuid', FNameField='FName', FMasterField=null, FHomeClassName='com.jeedsoft.quicksilver.thirdpartycertification.ThirdPartyCertificationHome', FDaoClassName='com.jeedsoft.quicksilver.thirdpartycertification.dao.impl.ThirdPartyCertificationDaoImpl', FServiceClassName='com.jeedsoft.quicksilver.thirdpartycertification.service.impl.ThirdPartyCertificationServiceImpl', FActionClassName='com.jeedsoft.quicksilver.thirdpartycertification.action.impl.ThirdPartyCertificationActionImpl', FWebServiceUniqueField=null, FUnitFilterSql=null, FBusinessFilterSql=null, FDescription='';

insert into TsTextResource set FCode='T.Qs.Index.ADDomain', FId='d1ad5303-7458-4975-a125-6152c80b3283', FValue='網域';
