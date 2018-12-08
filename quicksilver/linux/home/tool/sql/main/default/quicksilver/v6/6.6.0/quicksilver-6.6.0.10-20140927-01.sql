--minglei

--Mobile Page Platform

update TsField set FQueryable=0 where FId='fe1cfe26-655e-47ca-8c98-39e9d6dd81c4';

--Mobile List

update TsPage set FDialogWidth=900 where FCode='Qs.List.Form';

delete from TsScript where FPageId='e052c588-eb80-465f-a375-d40d04cfc791';
insert into TsScript set FId='2f6e4bde-3975-4e78-8266-0671f8348164', FIndex=1, FPageId='e052c588-eb80-465f-a375-d40d04cfc791', FUrl='quicksilver/page/layout/FieldSelect.js';
insert into TsScript set FId='8cd7fcdb-d99a-4abb-9a8e-21c2aeda9bcf', FIndex=2, FPageId='e052c588-eb80-465f-a375-d40d04cfc791', FUrl='quicksilver/page/layout/FieldSelectWithList.js';
insert into TsScript set FId='20efc317-7f69-476d-a465-36b415a40bf9', FIndex=3, FPageId='e052c588-eb80-465f-a375-d40d04cfc791', FUrl='quicksilver/page/layout/ListForm.js';

alter table TsListField add FIsNewRow bit;
alter table TsListField add FFontSize varchar(10);
alter table TsListField add FColor varchar(10);

insert into TsTextResource set FId='1252a56e-9ed0-4429-850e-09c1a507a392', FCode='T.Qs.ListField.Color',								FValue='顏色';
insert into TsTextResource set FId='52050a81-3b44-43a3-ae32-4beafac93744', FCode='T.Qs.ListField.FontSize',								FValue='大小';
insert into TsTextResource set FId='dd257054-f41e-41f5-8112-f969896d3545', FCode='T.Qs.ListField.IsNewRow',								FValue='開啟新行';
insert into TsTextResource set FId='718225e6-dced-422e-adc2-9f6d9c7e0132', FCode='T.Qs.ListField.Name',									FValue='欄位';

insert into TsDictionary set FId='26cb57d1-6c92-45e1-a465-bde253a85f9b', FName='QS-手機列表-字體大小', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='945eb960-0c79-4f50-9fb1-b59d4dc36169', FDictionaryId='26cb57d1-6c92-45e1-a465-bde253a85f9b', FValue='18',					FText='大',	FIndex=1;
insert into TsDictionaryItem set FId='8112ce78-37ca-4934-bb2c-1c4806e1d4ae', FDictionaryId='26cb57d1-6c92-45e1-a465-bde253a85f9b', FValue='14',					FText='中',	FIndex=2;
insert into TsDictionaryItem set FId='9c1a61b7-a1cf-4f12-a4ef-084bff96efe0', FDictionaryId='26cb57d1-6c92-45e1-a465-bde253a85f9b', FValue='12',					FText='小',	FIndex=3;

insert into TsDictionary set FId='91113b23-cc0b-4c8c-b4a6-99390da20546', FName='QS-手機列表-顏色', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='5b6f6ac6-560a-4259-8ee5-6bacaaa8aafd', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#000000',			FText='黑',	FIndex=1;
insert into TsDictionaryItem set FId='2cf80b1d-fa58-40be-af11-7a8790049e6b', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#999999',			FText='灰',	FIndex=2;
insert into TsDictionaryItem set FId='6cf60430-3914-4924-8c5c-68cf7da14d75', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#FF0000',			FText='紅',	FIndex=3;
insert into TsDictionaryItem set FId='60003e02-d968-49c5-bca1-143380cb2beb', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#FF8000',			FText='橙',	FIndex=4;
insert into TsDictionaryItem set FId='2d006317-8fdf-4b48-9789-f512e087089f', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#FFFF00',			FText='黃',	FIndex=5;
insert into TsDictionaryItem set FId='47cc662b-2426-40ba-bce6-3f2bacdffa0a', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#00FF00',			FText='綠',	FIndex=6;
insert into TsDictionaryItem set FId='dd98fe49-4462-49d5-9703-1b86fac09410', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#0000FF',			FText='藍',	FIndex=7;
insert into TsDictionaryItem set FId='624e93d6-3393-4456-92e7-a820d4cd0480', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#00FFFF',			FText='青',	FIndex=8;
insert into TsDictionaryItem set FId='ff1dd44a-fd3e-4622-8055-5ca312e73178', FDictionaryId='91113b23-cc0b-4c8c-b4a6-99390da20546', FValue='#FF00FF',			FText='紫',	FIndex=9;

--Unit Big Icon

alter table TsUnit add FBigIcon varchar(100);
update TsField set FTitle='圖示(16x16)' where FId='001d1fd2-4cb9-47b9-a428-5ec5208f56c6';
insert into TsField set FId='962ac84f-b1cf-412e-95e2-774e751c647c', FUnitId='00000000-0000-0000-0001-000000000001', FName='FBigIcon',               FTitle='大圖示(64x64)',			FType='InputBox-Text',       FSize=100, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId=null,                                   FSupportLocalText=null, FLocalTextField=null, FSourceType='local', FJoinField=null, FSourceField=null, FSource=null, FColSpan=0, FRowSpan=1, FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue='quicksilver/image/unit/New.gif', FValidation=null, FRelationCapacity=null;
java setEditFields('541c707d-79dd-4dbb-85fc-1a214fd5fce4', 'FName,FCode,FIcon,FBigIcon,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIsTreeStructure,FSupportWorkflow,FSupportUser,FSupportDepartment,FSupportEditType,FSupportAttachment,FSupportDataPrivilege,FSupportBusinessLog,FSupportNote,FSupportSort,FRecordCreateInfo,FRecordUpdateInfo,FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FUnitFilterSql,FBusinessFilterSql,FDescription,FViewPageConditionForList,FViewPageConditionForLink,FSupportVersion,FWebServiceUniqueField');
java setEditFields('8b7ebd7e-8173-4787-9e34-3d27ad4c9c29', 'FName,FCode,FModuleId,FIcon,FBigIcon,FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName,FDescription');
java setFormFields('e3bcb757-7788-4d88-b923-38bfc92e17a0', '基本資訊', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', null, 'FName,FCode,FModuleId,FOpenMode,FIsSlaveUnit,FMasterUnitId,FIcon,FBigIcon,FIsTreeStructure,FSupportSort,FSupportUser,FSupportDepartment,FSupportWorkflow,FSupportEditType,FSupportDataPrivilege,FSupportNote,FSupportAttachment,FSupportVersion,FSupportBusinessLog,FRecordCreateInfo,FRecordUpdateInfo,FEditId', '資料庫設置', '70cd09f2-5607-4d3d-a4e4-15a010b5c2d0', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FDataSource,FTable,FKeyField,FKeyType,FNameField,FMasterField', '類設置', 'f3c8ed03-71a9-44ea-866a-ce74f02fb94e', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', 'FHomeClassName,FDaoClassName,FServiceClassName,FActionClassName', '高級設置', 'f3f089fa-9689-41aa-abe8-2430f90869c9', '59d36e10-fa9b-4ca7-8650-f4bc2333c5f0', '', '其它資訊', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', null, '', '閱覽頁面打開條件', 'a9fb9172-544a-4871-a6be-6ac416d6a75b', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FViewPageConditionForList,FViewPageConditionForLink', 'WebService', 'ddda7e36-69f2-4228-bb1b-c250e97c70ab', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FWebServiceUniqueField', '過濾條件', 'd1882fc0-77a8-442f-9cde-2857b6c08760', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FUnitFilterSql,FBusinessFilterSql', '描述', '88b5af9a-d39d-493d-b1f9-db23b282327e', '8716f3a5-7c55-4a1d-b4d4-adde4702a211', 'FDescription');

update TsUnit set FBigIcon='quicksilver/image/unit/User-64.png'			where FCode='Qs.User';
update TsUnit set FBigIcon='quicksilver/image/unit/Department-64.png'	where FCode='Qs.Department';
