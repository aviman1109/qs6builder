--minglei--------------------------------------------------

--add new report parameter type

delete from TsDictionaryItem where FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d';
insert into TsDictionaryItem set FId='d5e88843-56d5-48c0-bca1-25a7522b529d', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Text',			FText='文字方塊',		FIndex=1;
insert into TsDictionaryItem set FId='6a84a005-fb0c-4cf5-aa08-ea9984eea3d9', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Integer',		FText='整數框',			FIndex=3;
insert into TsDictionaryItem set FId='bff4007b-37cd-471a-871a-1398149fa0d1', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-BigInt',		FText='大整數框',		FIndex=4;
insert into TsDictionaryItem set FId='761c8d58-0c2a-4724-8ee4-560446187274', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Double',		FText='小數框',			FIndex=5;
insert into TsDictionaryItem set FId='9a7ae279-0275-4b62-a7f2-0adbe6c815e8', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='InputBox-Percent',		FText='百分比框',		FIndex=6;
insert into TsDictionaryItem set FId='41a7407f-eb4a-415b-9ab4-858066f89122', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='CheckBox',				FText='勾選框',			FIndex=9;
insert into TsDictionaryItem set FId='9a3565f5-c413-46b9-9c6c-87ad667c8ec3', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='ComboBox-Inputable',		FText='可輸入下拉清單',	FIndex=10;
insert into TsDictionaryItem set FId='3c931b15-916b-4f45-af72-4305598be93e', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='ComboBox-SelectOnly',	FText='只選下拉清單',	FIndex=11;
insert into TsDictionaryItem set FId='07233aff-0ddf-4edb-a476-4937a091c266', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='MultiCheckComboBox',		FText='多選下拉清單',	FIndex=12;
insert into TsDictionaryItem set FId='40289e39-126f-4bc2-941f-294b3f79df0e', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='DateBox-Date',			FText='日期框',			FIndex=13;
insert into TsDictionaryItem set FId='e9f723e4-2fca-4bb7-9599-35a77682c6e1', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='DateBox-DateTime',		FText='日期時間框',		FIndex=14;
insert into TsDictionaryItem set FId='28ada6a3-411c-4a13-b2ae-fe56e728dcce', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='EntityBox',				FText='實體框',			FIndex=15;
insert into TsDictionaryItem set FId='dee55fbf-319e-4568-9041-20297e449921', FDictionaryId='f7437083-fbd4-40b0-98a6-e8197e81c80d', FValue='MultiEntityBox',			FText='多實體框',		FIndex=16;
