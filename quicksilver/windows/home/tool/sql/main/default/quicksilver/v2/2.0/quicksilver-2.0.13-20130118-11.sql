delete from TsDictionaryItem where FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815';
insert into TsDictionaryItem set FId='9bdc3d43-59e5-46ed-bd6a-1ccbd70c5e11', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-PrivilegeType',	FText='校验 - 权限类型',			FIndex=1; 
insert into TsDictionaryItem set FId='c91c913c-bf88-404a-a328-cf811608ff6a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Privilege',		FText='校验 - 具体权限',			FIndex=2; 
insert into TsDictionaryItem set FId='5199706d-d0e8-4ded-812c-32dbb7c9d994', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Expression',		FText='校验 - 表达式',				FIndex=3; 
insert into TsDictionaryItem set FId='55086932-0589-4ad3-a6ee-86f305c69628', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Sql',				FText='校验 - SQL 语句',			FIndex=4; 
insert into TsDictionaryItem set FId='6cdc01ee-28d4-41e8-b49c-bc8973d1e2bf', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-JavaClass',		FText='校验 - Java 类',				FIndex=5; 
insert into TsDictionaryItem set FId='5487cbbd-e5ff-4743-bca4-f3ffeec77219', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SaveForm',			FText='动作 - 保存表单',			FIndex=6; 
insert into TsDictionaryItem set FId='2d4dee7c-fa23-4419-a429-1e1275a2780f', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SaveJson',			FText='动作 - 保存 JSON 数据',		FIndex=7; 
insert into TsDictionaryItem set FId='366eb1e6-5e1f-465e-8d06-415f1fe41776', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-Sql',				FText='动作 - SQL 语句',			FIndex=8; 
insert into TsDictionaryItem set FId='ee0f3004-f07f-4e5f-b8a1-a107ffa8f81a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SqlFile',			FText='动作 - SQL 文件',			FIndex=9; 
insert into TsDictionaryItem set FId='85d37e31-a477-4bdc-a2b5-41c228c40174', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-JavaClass',		FText='动作 - Java 类',				FIndex=10;
insert into TsDictionaryItem set FId='adeff885-d86c-42a1-9373-f5e6f5b6cbf7', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-CreateProcess',	FText='动作 - 创建工作流',			FIndex=11;
insert into TsDictionaryItem set FId='ef7d8707-a17e-4396-906d-8c7197cac40a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-FinishActivity',	FText='动作 - 完成工作流节点',		FIndex=12;
insert into TsDictionaryItem set FId='a5ff5c97-60c3-4fdd-8f1c-c248b0980bd3', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-TerminateProcess',	FText='动作 - 终止相关工作流',		FIndex=13;
insert into TsDictionaryItem set FId='df441b5e-f8af-4c46-89a5-a25a3f115d8b', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-FireEvent',		FText='动作 - 触发其它事件',		FIndex=14;
insert into TsDictionaryItem set FId='6656835d-259d-4f04-996f-6723c782f652', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SendNotice',		FText='动作 - 发送通知',			FIndex=15;

delete from TsTextResource where FCode='T.Qs.QueryForm.Save';
insert into TsTextResource set FCode='T.Qs.QueryForm.Save',								  FId='4c92665a-2a3e-4b98-b0e7-91dd931050ef', FValue='保存为查询方案';
