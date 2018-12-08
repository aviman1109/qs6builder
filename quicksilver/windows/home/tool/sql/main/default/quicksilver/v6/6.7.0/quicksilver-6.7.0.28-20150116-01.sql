--minglei

alter table TsMarquee add FIconColor varchar(10);
alter table TsMarquee add FUseHtmlSubject bit;
alter table TsMarquee add FHtmlSubject varchar(500);

insert into TsField set FId='89cc10a6-bbc3-4df7-b434-ab1d40932625', FUnitId='87fba20b-4452-48bf-96f8-596881680b43', FName='FIconColor',				FTitle='圖示顏色',			FType='RadioBox',				FSize=10,		FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa',		FEntityUnitId=null,										FSupportLocalText=0,    FSupportI18n=0,    FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql='',   FSelectListVariableFilterSql='',   FSourceType='local',		FJoinField=null, FSourceField=null, FSource='',		FColSpan=0, FRowSpan=1,		FIsNewRow=0,    FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValue=null, FHint=null, FValidation=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData='';
insert into TsField set FId='d957dcd8-4ad0-4eb2-b8ad-0a3f42b52e9c', FUnitId='87fba20b-4452-48bf-96f8-596881680b43', FName='FUseHtmlSubject',		FTitle='使用富文本標題',	FType='CheckBox',				FSize=null,		FVisible=1, FFilterByRole=0, FRequired=0, FReadOnly=0, FQueryable=1, FDictionaryId=null,										FEntityUnitId=null,										FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local',		FJoinField=null, FSourceField=null, FSource=null,	FColSpan=1, FRowSpan=1,		FIsNewRow=null, FListWidth=120, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint=null, FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;
insert into TsField set FId='586dc1bd-f088-4d96-8d5a-bf72ee5f1897', FUnitId='87fba20b-4452-48bf-96f8-596881680b43', FName='FHtmlSubject',			FTitle='富文本標題',		FType='HtmlBox',				FSize=500,		FVisible=1, FFilterByRole=0, FRequired=1, FReadOnly=0, FQueryable=1, FDictionaryId=null,										FEntityUnitId=null,										FSupportLocalText=null, FSupportI18n=null, FLocalTextField=null, FRelationTable=null, FRelationCapacity=null, FRelationId=null, FSelectListConstantFilterSql=null, FSelectListVariableFilterSql=null, FSourceType='local',		FJoinField=null, FSourceField=null, FSource=null,	FColSpan=0, FRowSpan=5,		FIsNewRow=null, FListWidth=100, FListAlign='default', FScale=null, FLabelColor=null, FDefaultValueType=null, FDefaultValue=null, FHint=null, FAlwaysBringDataToClient=0, FValidation=null, FMobileListFormat=null, FFollowingField=null, FWebServiceListQueryField=null, FWebServiceItemQueryField=null, FWebServiceCreateField=null, FCustomData=null;

insert into TsFieldProperty set FId='c88c743a-af3a-455c-9036-736dab2ae806', FFieldId='586dc1bd-f088-4d96-8d5a-bf72ee5f1897', FName='plugins', FValue='["Source", "|", "Preview", "RemoveFormat", "|", "TextColor", "BGColor", "|", "Bold", "Italic", "Underline", "|", "Cut", "Copy", "Paste", "|",	"Undo", "Redo", "|", "Font", "FontSize"]';

java setFormFields('78a113ed-fe76-4aa9-aa76-41b5fabfd3ef',
	'基本資訊', 'b5b10f6b-15c7-4242-8a54-b3efaea1fcf5', null, 'FName,FUserId,FDepartmentId,FStatus',
		'顯示',		'ffba72f2-c21e-48c7-8fe4-9998fee1b8ca', 'b5b10f6b-15c7-4242-8a54-b3efaea1fcf5', 'FIconColor,FUseHtmlSubject,FHtmlSubject',
		'發佈設置', '2d8adced-935b-4848-a050-a8e5a7aa7114', 'b5b10f6b-15c7-4242-8a54-b3efaea1fcf5', 'FPublishType,FPublishRange',
		'時間設置', '5a920361-6286-4e53-acac-e469c65e2a40', 'b5b10f6b-15c7-4242-8a54-b3efaea1fcf5', 'FStartTime,FEndTime',
		'內容',		'c345c390-e381-47f2-8cf0-47d55cd6d8fb', 'b5b10f6b-15c7-4242-8a54-b3efaea1fcf5', 'FContent',
	'管理', 'c3169bc8-0ceb-4cf7-80ad-66447190bc99', null, 'FCreateUserId,FCreateDepartmentId,FCreateTime,FUpdateUserId,FUpdateDepartmentId,FUpdateTime'
);

insert into TsDictionary set FId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa', FName='QS-跑馬燈-圖示顏色', FBuiltin=1, FTextAsValue=0, FParentId=null, FDescription=null;
insert into TsDictionaryItem set FId='2312abd3-b53f-4489-91d9-9ed50fefa126', FDictionaryId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa', FValue='Red',				FText='紅',	FIndex=1;
insert into TsDictionaryItem set FId='c688255d-cd71-42c5-8357-fccc6278632d', FDictionaryId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa', FValue='Yellow',				FText='黃',	FIndex=2;
insert into TsDictionaryItem set FId='07eb5f3d-9816-4e8b-8a5b-3fd0c7de2907', FDictionaryId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa', FValue='Green',				FText='綠',	FIndex=3;
insert into TsDictionaryItem set FId='1eb9e7ef-4c79-4381-947e-c9ff101a524d', FDictionaryId='f3a9b6ba-d5e2-4612-a0bc-1ba8841635fa', FValue='Blue',				FText='藍',	FIndex=4;

delete from TsToolItem where FPageId='f68e3803-c961-4773-baf1-b802d411fc8c';
insert into TsToolItem set FId='80aabc88-5501-40b1-afa9-20f05d6304d4', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='Save',			FName='保存',		FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Save.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} != "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='EntityForm.doSave';
insert into TsToolItem set FId='2f636de6-5a1a-4576-aa57-8c79afde19b3', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='Publish',			FName='發佈',		FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Share.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} != "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='MarqueeForm.doPublish';
insert into TsToolItem set FId='984ed881-74d4-4965-823a-c9e06906b0d5', FPageId='f68e3803-c961-4773-baf1-b802d411fc8c', FCode='CancelPublish',	FName='取消發佈',	FHint=null, FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Cancel.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition='${entity.FStatus} == "Active"', FHandleType='JavaScript', FHandlePageId=null, FChartId=null, FConfirmMessage=null, FDefaultEventHandler='MarqueeForm.doCancelPublish';

delete from TsQuerySchema where FId='ad1807af-bcea-40ba-99aa-1659f2bdf92d';
insert into TsQuerySchema set FId='ad1807af-bcea-40ba-99aa-1659f2bdf92d', FUnitId='87fba20b-4452-48bf-96f8-596881680b43', FName='發佈給我的跑馬燈', FType='condition',  FPublic=1, FTemp=0, FGlobalAutoQuery=0, FShare=0, FUserId='00000000-0000-0000-1002-000000000001', FConditionId=null,                                   FSqlSource='Text', FSql='FStatus = ''Active'' and (FPublishType = ''All'' or exists (
    select * from TsMarqueePublishRange R
    where FMarqueeId = TsMarquee.FId and (
        FType = ''Qs.User'' and FEntityId = ${user.FId}
        or FType = ''Qs.Department'' and (FEntityId = ${department.FId} or exists (
            select * from TsDepartmentAd
            where FAncestorId = R.FEntityId and FDescendantId = ${department.FId}
        ))
    )
))', FIndex=1, FVisible=1;
