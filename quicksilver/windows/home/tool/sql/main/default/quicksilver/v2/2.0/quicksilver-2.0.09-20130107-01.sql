update TsHomepageItem set FHandlerClassName='com.jeedsoft.quicksilver.handler.homepage.LastOpenHomepageItemHandler' where FHandlerClassName='com.jeedsoft.quicksilver.query.service.impl.LastOpenHomepageItemHandler';
update TsHomepageItem set FHandlerClassName='com.jeedsoft.quicksilver.handler.homepage.WorkItemHomepageItemHandler' where FHandlerClassName='com.jeedsoft.quicksilver.wfinstance.service.impl.WorkItemHomepageItemHandler';

update TsTimer set FRoutine='com.jeedsoft.quicksilver.handler.timer.SessionCheckRoutine' where FRoutine='com.jeedsoft.quicksilver.user.service.impl.OnlineUserServiceImpl$SessionCheckRoutine';

delete from TsDictionary where FId='65670474-7498-4d59-aa59-74077b0c3cfb';
delete from TsDictionaryItem where FDictionaryId='65670474-7498-4d59-aa59-74077b0c3cfb';
insert into TsDictionary set FId='65670474-7498-4d59-aa59-74077b0c3cfb', FName='QS-活动定义-超时模式', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='c6ecd0a1-3ae4-4a63-a9a9-a0ca21b9fa32', FDictionaryId='65670474-7498-4d59-aa59-74077b0c3cfb', FValue='None',				FText='不超时',			FIndex=1;
insert into TsDictionaryItem set FId='e5fe7841-3eaf-4a88-8110-49917781987a', FDictionaryId='65670474-7498-4d59-aa59-74077b0c3cfb', FValue='FinishActivity',		FText='完成活动',		FIndex=2;

delete from TsDictionaryItem where FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='8bdf8671-a42b-4650-8a81-71a3a83de42c', FIndex=1, FText='无动作',                FValue='None';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='14998f1e-9837-494f-a3db-5a34bd39da36', FIndex=2, FText='弹出表单页面',          FValue='Form';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='862e41c5-8ade-4a3c-b010-281fdfa59763', FIndex=3, FText='批量修改页面',          FValue='BatchModify';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='87ba6853-56fb-4325-bd4f-3f6bcf7ac1ff', FIndex=4, FText='触发后端事件',          FValue='Event';
insert into TsDictionaryItem set FDictionaryId='d6c148ee-b6ea-4dbf-a892-fb69ac9639ab', FId='a3c1cf20-4282-42ee-bd49-970d3237e19d', FIndex=5, FText='函数/语句(JavaScript)',	FValue='JavaScript';

delete from TsI18nString where FId='28bf0e72-3adc-460d-b7c4-aa8d0a94239a';
delete from TsI18nString where FId='321f9325-88a5-4acd-b12d-6fea8e48ce1b';
delete from TsI18nString where FId='dfe08750-cea6-4c9d-89a5-b59fce255151';
delete from TsI18nString where FId='dad93482-a687-41de-b39d-1b42f17088bf';
delete from TsI18nString where FId='210cabec-c52f-4eff-9b99-431956d9162b';
insert into TsI18nString set FCode='T.Wf.Activity.Timeout',						FId='28bf0e72-3adc-460d-b7c4-aa8d0a94239a', FValue='超时';
insert into TsI18nString set FCode='T.Wf.Activity.TimeoutDays',					FId='321f9325-88a5-4acd-b12d-6fea8e48ce1b', FValue='超时天数';
insert into TsI18nString set FCode='T.Wf.Activity.TimeoutMode',					FId='dfe08750-cea6-4c9d-89a5-b59fce255151', FValue='超时模式';
insert into TsI18nString set FCode='T.Wf.Activity.TimeoutResult',				FId='dad93482-a687-41de-b39d-1b42f17088bf', FValue='活动结果';
insert into TsI18nString set FCode='T.Wf.Version.ButtonConfig.SaveForm',		FId='210cabec-c52f-4eff-9b99-431956d9162b', FValue='保存当前表单';

delete from TsTimer where FId='79f32dc0-7750-4797-9e53-b8a6638bc723';
insert into TsTimer set FEnabled=1, FId='79f32dc0-7750-4797-9e53-b8a6638bc723', FInitialTime=timestamp('2012-01-01 00:59:00'), FIntervalLength=1, FIntervalType='hour', FMonthEnd=0,    FName='处理超时流程', FRoutine='com.jeedsoft.quicksilver.handler.timer.ActivityTimeoutRoutine',              FSystemStartupAction='Complement', FType='JavaClass';

delete from TsPage where FId='a846fd6d-3f9d-4c89-8d70-e52174e524dd';
delete from TsPage where FId='d210005f-7b27-46ba-84f2-b65c18f5662a';
delete from TsPage where FId='b0629037-9c76-4955-83bb-b284187d191e';
insert into TsPage set FId='a846fd6d-3f9d-4c89-8d70-e52174e524dd', FName='流程图',           FTitle='流程图',   FCode='Wf.Version.Chart',             FType='Other', FIcon='quicksilver/image/unit/Workflow.png', FUrl='quicksilver/page/workflow/definition/WorkflowVersionChart.jsp',     FActionMethodName='Wf.Version.prepareChart',          FLoadHandler=null, FRelationId=null, FUnitId=null,                                   FMasterUnitId='00000000-0000-0000-0001-000000003002', FIsSlavePage=1, FPlatform='Computer', FIndex=1,    FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;
insert into TsPage set FId='d210005f-7b27-46ba-84f2-b65c18f5662a', FName='实例流程图',       FTitle='流程图',   FCode='Wf.Process.Chart',             FType='Other', FIcon='quicksilver/image/unit/Process.gif',  FUrl='quicksilver/page/workflow/instance/WorkflowProcessChart.jsp',		FActionMethodName='Wf.Process.prepareChart',          FLoadHandler=null, FRelationId=null, FUnitId='00000000-0000-0000-0001-000000003003', FMasterUnitId='00000000-0000-0000-0001-000000003003', FIsSlavePage=1, FPlatform='Computer', FIndex=1,    FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;
insert into TsPage set FId='b0629037-9c76-4955-83bb-b284187d191e', FName='工作流错误信息',   FTitle='消息',     FCode='Wf.Version.ChartError',        FType='Other', FIcon='quicksilver/image/unit/Workflow.png', FUrl='quicksilver/page/workflow/definition/WorkflowVersionChartError.jsp',FActionMethodName=null,                               FLoadHandler=null, FRelationId=null, FUnitId=null,                                   FMasterUnitId='00000000-0000-0000-0001-000000003002', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsToolItem where FPageId='a846fd6d-3f9d-4c89-8d70-e52174e524dd';
insert into TsToolItem set FId='fbf2a6b9-1ed3-4d49-a8df-ff28adbf0d8c', FPageId='a846fd6d-3f9d-4c89-8d70-e52174e524dd', FCode='Save',      FName='保存',               FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='WorkflowVersionChart.doSave',             FIcon='quicksilver/image/16/Save.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus}=="New"', FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='5fd685aa-c487-4802-a03f-b7b3fa459452', FPageId='a846fd6d-3f9d-4c89-8d70-e52174e524dd', FCode='SetActive', FName='保存并设为有效版本', FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='WorkflowVersionChart.doSaveAndSetActive', FIcon='quicksilver/image/16/SetActive.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus}=="New"', FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='4a122748-d94b-4b27-8182-3116255d64ca', FPageId='a846fd6d-3f9d-4c89-8d70-e52174e524dd', FCode='Copy',      FName='另存',               FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FDefaultEventHandler='WorkflowVersionChart.doCopy',             FIcon='quicksilver/image/16/Copy.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null,                       FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='c334286f-9c0f-4f1a-bc21-93a584b99fae', FPageId='a846fd6d-3f9d-4c89-8d70-e52174e524dd', FCode='Verify',    FName='校验',               FLabel=null, FType='Button', FAlign='right', FIndex=4, FWidth=0, FDefaultEventHandler='WorkflowVersionChart.doVerify',           FIcon='quicksilver/image/16/Verify.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null,                       FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a';
insert into TsToolItem set FId='7aa0b60e-4586-4c70-bd25-11b288007572', FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a', FCode='ViewEntity', FName='业务信息', FLabel=null, FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='WorkflowProcessChart.doViewEntity', FIcon='quicksilver/image/16/Open.gif',      FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FEntityId} != null',                                        FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='cd9d0f87-5a0e-4b1f-8b86-cf8d2ceba2c2', FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a', FCode='Suspend',    FName='挂起',     FLabel=null, FType='Button', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='WorkflowProcessChart.doSuspend',    FIcon='quicksilver/image/16/Suspend.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} == "Running"',                                     FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='3f72b123-5dd7-4546-8bcd-9a35d52f2c4d', FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a', FCode='Resume',     FName='恢复',     FLabel=null, FType='Button', FAlign='right', FIndex=3, FWidth=0, FDefaultEventHandler='WorkflowProcessChart.doResume',     FIcon='quicksilver/image/16/Resume.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} == "Suspended"',                                   FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='a7f4dabe-6329-43a2-8398-7c075640ec51', FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a', FCode='Terminate',  FName='终止',     FLabel=null, FType='Button', FAlign='right', FIndex=4, FWidth=0, FDefaultEventHandler='WorkflowProcessChart.doTerminate',  FIcon='quicksilver/image/16/Terminate.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} == "Running" || ${entity.FStatus} == "Suspended"', FHandleType='JavaScript', FHandlePageId=null;

delete from TsDictionaryItem where FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795';
insert into TsDictionaryItem set FId='11619369-e818-4c65-b40c-a0071ff25f87', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Validation-PrivilegeType',	FText='校验 - 权限类型',			FIndex=1; 
insert into TsDictionaryItem set FId='d5f642c7-5e2b-48f3-b4c5-c90ee72b146e', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Validation-Privilege',		FText='校验 - 具体权限',			FIndex=2; 
insert into TsDictionaryItem set FId='443497ad-686e-4bd8-bed5-3b423c5c0fd2', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Validation-Expression',		FText='校验 - 表达式',				FIndex=3; 
insert into TsDictionaryItem set FId='cc7d172b-50e9-4156-af4e-9c51454a5ab2', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Validation-Sql',				FText='校验 - SQL 语句',			FIndex=4; 
insert into TsDictionaryItem set FId='5ed94159-c8f4-4e84-b2fd-48ad18c1ae3b', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Validation-JavaClass',		FText='校验 - Java 类',				FIndex=5; 
insert into TsDictionaryItem set FId='1625f6ee-3578-4025-9044-51a830c1d321', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-SaveForm',			FText='动作 - 保存表单',			FIndex=6; 
insert into TsDictionaryItem set FId='a48341db-764f-4a5d-9ede-76fc2631d9b2', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-SaveJson',			FText='动作 - 保存 JSON 数据',		FIndex=7; 
insert into TsDictionaryItem set FId='566301c2-8a72-4e20-b8a6-6b98f3cdd399', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-Sql',				FText='动作 - SQL 语句',			FIndex=8; 
insert into TsDictionaryItem set FId='a314df58-eca7-4971-a2b4-83a74fab620c', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-SqlFile',			FText='动作 - SQL 文件',			FIndex=9; 
insert into TsDictionaryItem set FId='20c7b7ba-fa9c-45b9-85a5-458adb20154a', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-JavaClass',		FText='动作 - Java 类',				FIndex=10;
insert into TsDictionaryItem set FId='064c6361-3cdb-4225-96e9-2ca3777d10c8', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-CreateProcess',	FText='动作 - 创建工作流',			FIndex=11;
insert into TsDictionaryItem set FId='f5e5d57b-0960-411d-9557-580958591281', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-FinishActivity',	FText='动作 - 完成工作流节点',		FIndex=12;
insert into TsDictionaryItem set FId='6fdb236b-bf45-43d9-84c0-a4036c79e57d', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-TerminateProcess',	FText='动作 - 终止相关工作流',		FIndex=13;
insert into TsDictionaryItem set FId='f61b3e02-d7b8-40b1-bd26-979bce7ee891', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-FireEvent',		FText='动作 - 触发其它事件',		FIndex=14;
insert into TsDictionaryItem set FId='167f6cca-04e5-4fbc-b2ff-416498c41f24', FDictionaryId='b72a9a81-9165-486f-bb8e-8f6b8d7ae795', FValue='Execution-SendNotice',		FText='动作 - 发送通知',			FIndex=15;

delete from TsDictionaryItem where FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815';
insert into TsDictionaryItem set FId='9bdc3d43-59e5-46ed-bd6a-1ccbd70c5e11', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-PrivilegeType',	FText='校验 - 权限类型',			FIndex=1; 
insert into TsDictionaryItem set FId='c91c913c-bf88-404a-a328-cf811608ff6a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Privilege',		FText='校验 - 具体权限',			FIndex=2; 
insert into TsDictionaryItem set FId='5199706d-d0e8-4ded-812c-32dbb7c9d994', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Expression',		FText='校验 - 表达式',				FIndex=3; 
insert into TsDictionaryItem set FId='55086932-0589-4ad3-a6ee-86f305c69628', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-Sql',				FText='校验 - SQL 语句',			FIndex=4; 
insert into TsDictionaryItem set FId='6cdc01ee-28d4-41e8-b49c-bc8973d1e2bf', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Validation-JavaClass',		FText='校验 - Java 类',				FIndex=5; 
insert into TsDictionaryItem set FId='2d4dee7c-fa23-4419-a429-1e1275a2780f', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SaveJson',			FText='动作 - 保存 JSON 数据',		FIndex=6; 
insert into TsDictionaryItem set FId='366eb1e6-5e1f-465e-8d06-415f1fe41776', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-Sql',				FText='动作 - SQL 语句',			FIndex=7; 
insert into TsDictionaryItem set FId='ee0f3004-f07f-4e5f-b8a1-a107ffa8f81a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SqlFile',			FText='动作 - SQL 文件',			FIndex=8; 
insert into TsDictionaryItem set FId='85d37e31-a477-4bdc-a2b5-41c228c40174', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-JavaClass',		FText='动作 - Java 类',				FIndex=9; 
insert into TsDictionaryItem set FId='adeff885-d86c-42a1-9373-f5e6f5b6cbf7', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-CreateProcess',	FText='动作 - 创建工作流',			FIndex=10;
insert into TsDictionaryItem set FId='ef7d8707-a17e-4396-906d-8c7197cac40a', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-FinishActivity',	FText='动作 - 完成工作流节点',		FIndex=11;
insert into TsDictionaryItem set FId='a5ff5c97-60c3-4fdd-8f1c-c248b0980bd3', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-TerminateProcess',	FText='动作 - 终止相关工作流',		FIndex=12;
insert into TsDictionaryItem set FId='df441b5e-f8af-4c46-89a5-a25a3f115d8b', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-FireEvent',		FText='动作 - 触发其它事件',		FIndex=13;
insert into TsDictionaryItem set FId='6656835d-259d-4f04-996f-6723c782f652', FDictionaryId='9a57d06a-f0be-4ea7-8baf-547895b12815', FValue='Execution-SendNotice',		FText='动作 - 发送通知',			FIndex=14;

delete from TsPage where FId='f1ae79e9-e0ff-48df-ba43-ffa9ce7752c3';
delete from TsPage where FId='ce6a7c05-60e9-46ee-abef-3fc209e15483';
insert into TsPage set FId='f1ae79e9-e0ff-48df-ba43-ffa9ce7752c3', FName='单元事件表单', FTitle='表单', FCode='Qs.EntityEvent.Edit', FType='EntityEdit', FIcon='quicksilver/image/16/Form.png',          FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.EntityEvent.prepareEdit', FLoadHandler='EntityEventEdit.doLoad', FRelationId=null, FUnitId='bcd42545-1172-43ad-b436-362b91f04542', FMasterUnitId='bcd42545-1172-43ad-b436-362b91f04542', FIsSlavePage=1, FIndex=1,    FDialogWidth=604,  FDialogHeight=390,  FDescription='',   FVisible=1, FPlatform='Computer';
insert into TsPage set FId='ce6a7c05-60e9-46ee-abef-3fc209e15483', FName='操作步骤表单', FTitle='表单', FCode='Qs.OperationStep.Edit', FType='EntityEdit', FIcon='quicksilver/image/16/Form.png',            FUrl='quicksilver/page/template/EntityEdit.jsp', FActionMethodName='Qs.OperationStep.prepareEdit', FLoadHandler='OperationStepEdit.doLoad', FRelationId=null, FUnitId='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FMasterUnitId='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FIsSlavePage=1, FIndex=1,    FDialogWidth=604,  FDialogHeight=364,  FDescription='',   FVisible=1, FPlatform='Computer';

delete from TsScript where FPageId='ce6a7c05-60e9-46ee-abef-3fc209e15483';
insert into TsScript set FId='e5df0d39-6688-48b1-98e5-c254449c514e', FIndex=1, FPageId='ce6a7c05-60e9-46ee-abef-3fc209e15483', FUrl='quicksilver/page/operation/OperationStepEdit.js';
insert into TsScript set FId='86b35275-2ecc-492a-a1fb-3c3878fba306', FIndex=2, FPageId='ce6a7c05-60e9-46ee-abef-3fc209e15483', FUrl='quicksilver/page/user/UserPickList.js';

alter table TsEntityEvent add FPrivilegeTypeId uuid;
alter table TsEntityEvent add FPrivilegeId uuid;
alter table TsOperationStep add FPrivilegeTypeId uuid;
alter table TsOperationStep add FPrivilegeId uuid;

insert into TsField set FId='f64d8c5e-5878-470c-af0f-866472315133', FUnitId='bcd42545-1172-43ad-b436-362b91f04542', FName='FPrivilegeId',      FTitle='具体权限',   FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001006', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='afbb1009-933d-457f-b7b8-bde99a1333a4', FUnitId='bcd42545-1172-43ad-b436-362b91f04542', FName='FPrivilegeTypeId',  FTitle='权限类型',   FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001005', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='dd73afff-a465-46dc-9d27-0ba5c5593edc', FUnitId='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FName='FPrivilegeId',      FTitle='具体权限',      FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001006', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;
insert into TsField set FId='36fffac9-4a55-42e2-83fe-556f0bc38d1f', FUnitId='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FName='FPrivilegeTypeId',  FTitle='权限类型',      FType='EntityBox',           FSize=null, FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,                                   FEntityUnitId='00000000-0000-0000-0001-000000001005', FSupportLocalText=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListFilterSql='',   FSourceType='local', FJoinField=null, FSourceField=null, FSource='',   FColSpan=1, FRowSpan=1, FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FValidation=null;

java setFormFields('3fe6d67b-efa8-4e3f-963f-a6c1e683a998', '(49be80ac-2711-49be-b706-2ac1f36f568b,基本信息,FName|FMethod|FOccasion|FType|FPrivilegeTypeId|FPrivilegeId|FWorkflowId|FActivityCode|FActivityResult|FNoticeId|FContent|FMessage)');
java setFormFields('8d034f93-b887-4965-a38d-9f046e52de88', '(93fd834f-6e4e-4de4-a674-a3e0a0b9aa36,基本信息,FName|FType|FPrivilegeTypeId|FPrivilegeId|FWorkflowId|FActivityCode|FActivityResult|FNoticeId|FContent|FMessage)');

insert into TsRelation set FId='fb21eea4-a31a-44ae-99a0-0c3e4cd0a889', FOppositeId='91a45fe1-7956-407f-ab66-7d1c9788d4a7', FName='单元事件-权限类型', FOppositeName='权限类型-单元事件', FUnitId1='bcd42545-1172-43ad-b436-362b91f04542', FUnitId2='00000000-0000-0000-0001-000000001005', FType='field', FTable=null, FField1='FId', FField2='FPrivilegeTypeId', FDeleteAction1='cancel', FDeleteAction2='unset',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='f0221529-7b88-46e4-b9e5-9f69af3301cb', FOppositeId='1e5c9f4f-8a65-40d3-a7a6-b76468aff5b6', FName='单元事件-具体权限', FOppositeName='具体权限-单元事件', FUnitId1='bcd42545-1172-43ad-b436-362b91f04542', FUnitId2='00000000-0000-0000-0001-000000001006', FType='field', FTable=null, FField1='FId', FField2='FPrivilegeId',     FDeleteAction1='cancel', FDeleteAction2='unset',  FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='20678f3f-c15e-4e4c-9397-d36b67200ec6', FOppositeId='192ffcb8-6e25-464c-8699-8a8106f91ac6', FName='操作步骤-权限类型', FOppositeName='权限类型-操作步骤', FUnitId1='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FUnitId2='00000000-0000-0000-0001-000000001005', FType='field', FTable=null, FField1='FId', FField2='FPrivilegeTypeId', FDeleteAction1='cancel', FDeleteAction2='unset',   FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;
insert into TsRelation set FId='12099cc2-f3f2-4910-9d2f-796fc525b146', FOppositeId='b01e6794-f0ce-4135-8c53-daadb1499c00', FName='操作步骤-具体权限', FOppositeName='具体权限-操作步骤', FUnitId1='d3d02c05-d36f-4ab1-a231-8cdb3564a79e', FUnitId2='00000000-0000-0000-0001-000000001006', FType='field', FTable=null, FField1='FId', FField2='FPrivilegeId',     FDeleteAction1='cancel', FDeleteAction2='unset',   FPrivilegeTypeId1=null, FPrivilegeTypeId2=null;

--------------------------------------------------------------------------------

java refreshSerial('TsFieldGroup', 'FFormId');

insert into TsRelation (FId, FOppositeId, FUnitId1, FUnitId2, FName, FOppositeName, FType, FTable, FField1, FField2, FDeleteAction1, FDeleteAction2, FPrivilegeTypeId1, FPrivilegeTypeId2)
select FOppositeId, FId, FUnitId2, FUnitId1, FOppositeName, FName, FType, FTable, FField2, FField1, FDeleteAction2, FDeleteAction1, FPrivilegeTypeId2, FPrivilegeTypeId1
from TsRelation T
where not exists (select * from TsRelation where FId = T.FOppositeId);

--------------------------------------------------------------------------------

update TsSystemParameter set FValue='20130107-01' where FKey='bac6459a-db58-49b1-b014-9aed20b3b3ef' and FValue < '20130107-01';
