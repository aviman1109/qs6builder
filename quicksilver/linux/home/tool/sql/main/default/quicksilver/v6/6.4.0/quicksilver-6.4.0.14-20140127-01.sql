delete from TsTextResource where FCode like 'T.Jui.%';
insert into TsTextResource set FId='dba240c3-ddf4-4da0-bf92-a16a87fd6c2c', FCode='T.Jui.LongWeekDays',									FValue='星期日,星期一,星期二,星期三,星期四,星期五,星期六';
insert into TsTextResource set FId='3ee5c3e4-e9b0-498f-a64b-e94539098928', FCode='T.Jui.ShortWeekDays',									FValue='日,一,二,三,四,五,六';
insert into TsTextResource set FId='d4fdb643-c510-4037-a773-e2ed0a7c045c', FCode='T.Jui.BackForm.RegExpAlert',							FValue='“${0}”的格式不符合系統要求。';
insert into TsTextResource set FId='605cfbdd-9220-4ac7-8153-9ec01fb8a648', FCode='T.Jui.BackForm.RequiredAlert',						FValue='請填寫“${0}”。';
insert into TsTextResource set FId='0c8092ad-9986-457e-9b2f-0d8dc7cd7d9e', FCode='T.Jui.BackForm.ValueTooLong',							FValue='“${0}”的長度超過系統限制。';
insert into TsTextResource set FId='fc6ac0fd-57c7-402a-9f64-f5f61222ed62', FCode='T.Jui.Calendar.Today',								FValue='今天';
insert into TsTextResource set FId='df482ee6-e1b7-4f25-9023-84e5a45c03bd', FCode='T.Jui.Calendar.Day',									FValue='日';
insert into TsTextResource set FId='322e2562-d7fb-4506-8aa7-7cac1c471cd0', FCode='T.Jui.Calendar.Week',									FValue='周';
insert into TsTextResource set FId='dfb18fe2-9f2e-425c-8440-769fa0ca400d', FCode='T.Jui.Calendar.Month',								FValue='月';
insert into TsTextResource set FId='5351cf0d-9dd2-4175-b4fa-27fb7e87edc3', FCode='T.Jui.Calendar.RangeTitle',							FValue='${0} 至 ${1}';
insert into TsTextResource set FId='8e6e18a6-3302-4744-b522-89683f05fb4f', FCode='T.Jui.Condition.And',									FValue='且';
insert into TsTextResource set FId='9736da76-bffb-4d95-bad9-e7e20ec40a3f', FCode='T.Jui.Condition.Field',								FValue='欄位';
insert into TsTextResource set FId='d6f41ba2-227e-4877-9f65-4bb24e57da5a', FCode='T.Jui.Condition.Group',								FValue='條件組（組內為“${0}”關係）';
insert into TsTextResource set FId='bfe8efb0-066b-4a89-a5b4-fe3fbd51eabb', FCode='T.Jui.Condition.InvalidField',						FValue='無效的查詢欄位：${0}';
insert into TsTextResource set FId='0745af86-7abf-4e1e-af7e-7b6713bf2887', FCode='T.Jui.Condition.InvalidRelation',						FValue='無效的關聯關係：${0}';
insert into TsTextResource set FId='9172546e-5dd1-4574-8510-83520f2d2cb4', FCode='T.Jui.Condition.Or',									FValue='或';
insert into TsTextResource set FId='7e7bac7b-4bb9-49d5-8d15-496aada23ff3', FCode='T.Jui.Condition.Relation',							FValue='關聯對象';
insert into TsTextResource set FId='78dcdc68-9c0d-4912-b31c-bcd2abfcc059', FCode='T.Jui.Condition.SelectHint',							FValue='請選擇欄位或關聯物件';
insert into TsTextResource set FId='92a6e4a1-240d-4d35-bdf6-b22b08b64cba', FCode='T.Jui.Condition.ValueAlert',							FValue='請填寫正確的條件值。';
insert into TsTextResource set FId='d7475dc5-007f-4a1b-811d-5bdb568dc8c4', FCode='T.Jui.Condition.ConditionAlert',						FValue='請選擇條件。';
insert into TsTextResource set FId='c525509b-c9d9-473b-99ff-c3ea7dfac53d', FCode='T.Jui.Condition.SwitchSelection',						FValue='選擇/取消選擇';
insert into TsTextResource set FId='6a4a548a-49c7-47de-9284-abe3d092193b', FCode='T.Jui.Condition.Delete',								FValue='刪除';
insert into TsTextResource set FId='a24f792b-83f8-4a7f-8c7f-83121b32c168', FCode='T.Jui.Condition.GroupByAnd',							FValue='組合為“且”關係';
insert into TsTextResource set FId='93a22e30-b233-402f-8c7b-b590c8281a7d', FCode='T.Jui.Condition.GroupByOr',							FValue='組合為“或”關係';
insert into TsTextResource set FId='9b1f4f2c-ad9d-42f7-9b47-9c1e9f9ab037', FCode='T.Jui.Condition.SwitchGroup',							FValue='且/或關係切換';
insert into TsTextResource set FId='0a10b757-445a-4fbc-a11e-6f9a1c5c6b61', FCode='T.Jui.Condition.ReleaseGroup',						FValue='解除分組';
insert into TsTextResource set FId='65c06beb-d1d7-4410-9997-a6127ce6f3f6', FCode='T.Jui.Condition.Year',								FValue='年';
insert into TsTextResource set FId='710d5b86-157a-48af-b885-085fb5667054', FCode='T.Jui.Condition.Quarter',								FValue='季';
insert into TsTextResource set FId='e6dea0fe-a871-4e1f-ae33-6f11e4e5ef93', FCode='T.Jui.Condition.Month',								FValue='月';
insert into TsTextResource set FId='bc73a26b-9261-472c-b006-8678c1fb2c22', FCode='T.Jui.Condition.Week',								FValue='周';
insert into TsTextResource set FId='1879fdf4-bdb2-4ec7-a792-ee25835cf696', FCode='T.Jui.Condition.Day',									FValue='天';
insert into TsTextResource set FId='5eab745e-a021-4f73-83a4-023acfa31999', FCode='T.Jui.Condition.Hour',								FValue='小時';
insert into TsTextResource set FId='5b36a8b9-9c10-4b02-a7d0-4ce51c7fd9de', FCode='T.Jui.Condition.Minute',								FValue='分';
insert into TsTextResource set FId='3e681306-f6d9-4f4d-87cc-fb3a01ad2249', FCode='T.Jui.Condition.Equal',								FValue='等於';
insert into TsTextResource set FId='8aefeef1-297d-494b-8f8f-7e4bb2625a2f', FCode='T.Jui.Condition.NotEqual',							FValue='不等於';
insert into TsTextResource set FId='132d96b9-4aee-4be1-94cd-befbd403f3ea', FCode='T.Jui.Condition.Great',								FValue='大於';
insert into TsTextResource set FId='e7021439-4853-4edb-a65b-7ec6dfeca323', FCode='T.Jui.Condition.GreatEqual',							FValue='大於等於';
insert into TsTextResource set FId='c38292fd-2f67-4490-b912-c620c1f27219', FCode='T.Jui.Condition.Less',								FValue='小於';
insert into TsTextResource set FId='8be097d3-a7d2-4384-a128-c551089d9de9', FCode='T.Jui.Condition.LessEqual',							FValue='小於等於';
insert into TsTextResource set FId='d42b9bb5-6155-4ea8-9e98-a89994f062f1', FCode='T.Jui.Condition.HasData',								FValue='有數據';
insert into TsTextResource set FId='7f245023-76f5-44d6-9fc4-ff006ba4b72d', FCode='T.Jui.Condition.NotHasData',							FValue='沒有資料';
insert into TsTextResource set FId='7e0afb85-4a4f-477b-8893-5b2da977e900', FCode='T.Jui.Condition.Contain',								FValue='包含';
insert into TsTextResource set FId='da8c7118-b9ae-4650-a3a5-66f679b1ee1d', FCode='T.Jui.Condition.NotContain',							FValue='不包含';
insert into TsTextResource set FId='9d4ebf7f-c157-4355-bc32-4fa8e32d6e20', FCode='T.Jui.Condition.StartWith',							FValue='以…開始';
insert into TsTextResource set FId='8f7a6012-8a85-4ec9-b1ba-814ea7d3d9d2', FCode='T.Jui.Condition.NotStartWith',						FValue='不以…開始';
insert into TsTextResource set FId='b9a43780-6fdc-4a59-a300-a72f51bc090e', FCode='T.Jui.Condition.EndWith',								FValue='以…結束';
insert into TsTextResource set FId='d378069a-de4b-477d-a680-f95dec1972ce', FCode='T.Jui.Condition.NotEndWith',							FValue='不以…結束';
insert into TsTextResource set FId='f0662b14-2b42-4aea-b4fd-89fd185e38c2', FCode='T.Jui.Condition.EqualWithSub',						FValue='等於（含子部門）';
insert into TsTextResource set FId='2f0015a8-dc84-4623-917f-15b07c1089fc', FCode='T.Jui.Condition.In',									FValue='在…中';
insert into TsTextResource set FId='6a61ca49-7471-4060-b7b4-60b7cf6c4fb5', FCode='T.Jui.Condition.InWithSub',							FValue='在…中（含下級）';
insert into TsTextResource set FId='4e0144e9-89a5-477a-9508-fd643b212b2b', FCode='T.Jui.Condition.Current',								FValue='當前';
insert into TsTextResource set FId='78c24032-1553-4404-b9b4-3bce1ec795db', FCode='T.Jui.Condition.Previous',							FValue='過去';
insert into TsTextResource set FId='dd769b02-2251-49b8-a788-5d456c2eac16', FCode='T.Jui.Condition.Next',								FValue='將來';
insert into TsTextResource set FId='13e5d9b6-b28c-4d52-8340-eedf15e8da84', FCode='T.Jui.Condition.CurrentPrevious',						FValue='當前或過去';
insert into TsTextResource set FId='4591face-94c1-42aa-80f8-7823f6726e25', FCode='T.Jui.Condition.CurrentNext',							FValue='當前或將來';
insert into TsTextResource set FId='e90fd3d7-06c9-4ee8-bb03-56ff693d514a', FCode='T.Jui.Condition.CurrentUser',							FValue='等於當前用戶';
insert into TsTextResource set FId='511d3750-5beb-4ffa-b900-de9178c15553', FCode='T.Jui.Condition.NotCurrentUser',						FValue='不等於當前用戶';
insert into TsTextResource set FId='c385d29c-fde3-42bc-b79d-9d45833296ea', FCode='T.Jui.Condition.True',								FValue='為真';
insert into TsTextResource set FId='fd77b6d5-a592-48e3-82e5-1281428b97cc', FCode='T.Jui.Condition.False',								FValue='為假';
insert into TsTextResource set FId='03b334fa-52ae-4d8b-9600-9dbb7e8b8fc8', FCode='T.Jui.Condition.CurrentDept',							FValue='等於當前部門';
insert into TsTextResource set FId='b6b61ee2-2f20-4d17-8977-e9ca7626918f', FCode='T.Jui.Condition.CurrentDeptWithSub',					FValue='等於當前及子部門';
insert into TsTextResource set FId='ecdb5c19-faff-4fe2-b472-793fe99b1ce4', FCode='T.Jui.Condition.NotCurrentDept',						FValue='不等於當前部門';
insert into TsTextResource set FId='e42cba00-06a3-407a-ac26-c24c9eaa73bd', FCode='T.Jui.Condition.NotCurrentDeptWithSub',				FValue='不等於當前及子部門';
insert into TsTextResource set FId='fbd748eb-bcb1-4dbd-a080-1dbd42af3a55', FCode='T.Jui.DateBox.Today',									FValue='今天';
insert into TsTextResource set FId='954fde00-004d-4271-9463-b6d856e7f80a', FCode='T.Jui.DateBox.Clear',									FValue='清空';
insert into TsTextResource set FId='a073d3da-7ecb-4c33-ab54-f9ff69c5d9cc', FCode='T.Jui.Dialog.DefaultTitle',							FValue='對話方塊';
insert into TsTextResource set FId='3edf3320-dea8-440a-a42c-97d13d7b6366', FCode='T.Jui.Form.EmptyInfo',								FValue='沒有可以顯示的內容。';
insert into TsTextResource set FId='978eff34-8abf-4ccf-9bd6-cc8cfccb28b8', FCode='T.Jui.Graph.LegendTitleDesign',						FValue='選用板';
insert into TsTextResource set FId='5bff4a4a-6dbd-4807-b33e-3efc5eb08e7d', FCode='T.Jui.Graph.LegendTitleDisplay',						FValue='圖例';
insert into TsTextResource set FId='41c8f9fb-9f97-48b8-9307-cefd70514d6c', FCode='T.Jui.Graph.LegendSelect',							FValue='選擇';
insert into TsTextResource set FId='06543e9d-d883-48eb-b34b-35b0ba024d8d', FCode='T.Jui.Graph.LegendLine',								FValue='連線';
insert into TsTextResource set FId='a8d00672-64ce-4668-ab33-fc6809ce27ca', FCode='T.Jui.Graph.LegendArrow',								FValue='箭頭線';
insert into TsTextResource set FId='cfd7be56-de32-44a9-9ce4-04687f2a9471', FCode='T.Jui.Graph.LegendDoubleArrow',						FValue='雙箭頭線';
insert into TsTextResource set FId='83a3cbbe-cefd-47cd-a4ab-0c6ddd519cef', FCode='T.Jui.Graph.LegendNormalNode',						FValue='普通節點';
insert into TsTextResource set FId='5545be6a-5a2c-40db-940d-daf9c5a6f8e4', FCode='T.Jui.Graph.LegendVirtualNode',						FValue='虛擬節點';
insert into TsTextResource set FId='be106bbb-5065-4f11-b50a-c2bcc18f5bd4', FCode='T.Jui.List.HidePageCount',							FValue='隱藏總頁數';
insert into TsTextResource set FId='41e6f1cb-938d-4330-9bc1-b24ebe12e4ca', FCode='T.Jui.List.ShowPageCount',							FValue='顯示總頁數';
insert into TsTextResource set FId='772b77d1-fbbd-48ba-9133-704bd6410c4e', FCode='T.Jui.List.TimeCost',									FValue='用時 ${0} 秒';
insert into TsTextResource set FId='c950982f-26fb-44fd-81e7-c36c1e3b6ecf', FCode='T.Jui.PictureBox.View',								FValue='查看';
insert into TsTextResource set FId='19618988-339b-4b75-9537-ee5125d7996e', FCode='T.Jui.PictureBox.SelectFile',							FValue='選擇檔...';
insert into TsTextResource set FId='b0468484-efcb-4dca-bb21-8680f0368665', FCode='T.Jui.PictureBox.Clear',								FValue='清除';
insert into TsTextResource set FId='aeaca980-9555-4747-9eca-74516a61444e', FCode='T.Jui.Upload.FileCountInvalid',						FValue='選入的檔不得超過一個。';
insert into TsTextResource set FId='84b8ab52-a740-4b3a-80e0-c99b9da02898', FCode='T.Jui.Upload.FileTypeInvalid',						FValue='檔“${0}”格式錯誤，請選擇格式符合要求的檔。';
insert into TsTextResource set FId='30b53ea2-8cd9-4200-8272-ec1edb598423', FCode='T.Jui.Upload.FileSizeInvalid',						FValue='檔“${0}”的大小超過限制(${1})。';
insert into TsTextResource set FId='2129afb1-c5a9-43df-9a86-f8c2e3d99398', FCode='T.Jui.Workflow.LegendTitleDesign',					FValue='選用板';
insert into TsTextResource set FId='ef6b6bd2-e792-4e0c-9376-ff15bab319cd', FCode='T.Jui.Workflow.LegendTitleDisplay',					FValue='圖例';
insert into TsTextResource set FId='5e71c67b-99fb-4360-9a82-c57d9bbb3d18', FCode='T.Jui.Workflow.LegendItemSelect',						FValue='選擇';
insert into TsTextResource set FId='996d1bd0-159b-49ad-9d8a-953177b5d026', FCode='T.Jui.Workflow.LegendItemLine',						FValue='連線';
insert into TsTextResource set FId='7f30d9e3-0fd1-4d0f-b57b-2180a50f98ce', FCode='T.Jui.Workflow.LegendItemStart',						FValue='開始';
insert into TsTextResource set FId='78f59f4a-f908-45ec-9cef-e06a5060ae7d', FCode='T.Jui.Workflow.LegendItemEnd',						FValue='結束';
insert into TsTextResource set FId='a3a1bbcc-2ad2-40a8-b458-6596e7a160bf', FCode='T.Jui.Workflow.LegendItemManual',						FValue='人工活動';
insert into TsTextResource set FId='604ee628-bd4c-47bb-b6fb-04ad478b0642', FCode='T.Jui.Workflow.LegendItemAuto',						FValue='自動活動';
insert into TsTextResource set FId='7b89e152-2635-40f7-91f9-4e6f32f8d83f', FCode='T.Jui.Workflow.LegendItemNotStarted',					FValue='未開始';
insert into TsTextResource set FId='c73fc524-c7ca-4849-b0b8-0657bcfbe3f7', FCode='T.Jui.Workflow.LegendItemRunning',					FValue='運行中';
insert into TsTextResource set FId='00a53634-5278-4bea-a815-60414b9541f3', FCode='T.Jui.Workflow.LegendItemFinished',					FValue='已完成';
insert into TsTextResource set FId='aeab28ce-18f8-48b0-9813-4b97d7c8444d', FCode='T.Jui.MessageBox.DefaultTitle',						FValue='消息';
insert into TsTextResource set FId='20e2dc39-8e29-43d2-8280-e400799b58f9', FCode='T.Jui.MessageBox.Ok',									FValue='確定';
insert into TsTextResource set FId='0ba6d69c-350d-4ef3-a1d9-d51568e15506', FCode='T.Jui.MessageBox.Yes',								FValue='是';
insert into TsTextResource set FId='abd237dc-a7a3-4808-b2e6-e9964d49c6c6', FCode='T.Jui.MessageBox.No',									FValue='否';
insert into TsTextResource set FId='94685ee8-993e-4433-a5d3-1a2f322b77e3', FCode='T.Jui.MessageBox.Cancel',								FValue='取消';
insert into TsTextResource set FId='d5297e47-94e5-47fd-96b9-dfb1ec736fdf', FCode='T.Jui.ProgressBar.Title',								FValue='請等待';

--Edit改Form
update TsPage set FCode=substr(FCode, 1, length(FCode) - 4) || 'Form', FType='EntityForm', FUrl='quicksilver/page/template/EntityForm.jsp' where FCode like '%.Edit' and FUrl='quicksilver/page/template/EntityEdit.jsp';
update TsPage set FCode=substr(FCode, 1, length(FCode) - 4) || 'Form', FType='EntityForm', FActionMethodName = replace(FActionMethodName, 'prepareEdit', 'prepareForm') where FCode like '%.Edit' and FActionMethodName like '%.prepareEdit';
update TsPage set FActionMethodName=replace(FActionMethodName, 'prepareEdit', 'prepareForm') where FCode like '%.Form' and FUrl='quicksilver/page/template/EntityForm.jsp' and FActionMethodName like '%prepareEdit';
update TsPage set FType='EntityForm' where FType='EntityEdit';
update TsPage set FIcon='quicksilver/image/unit/Form.png' where FType='EntityForm' and FIcon <> 'quicksilver/image/unit/Form.png';
update TsToolItem set FDefaultEventHandler=replace(FDefaultEventHandler, 'EntityEdit.', 'EntityForm.') where FDefaultEventHandler like 'EntityEdit.%' and FPageId in (select FId from TsPage where FType='EntityForm');
update TsToolSubItem set FEventHandler=replace(FEventHandler, 'EntityEdit.', 'EntityForm.') where FEventHandler like 'EntityEdit.%' and FToolItemId in (select FId from TsToolItem where FPageId in (select FId from TsPage where FType='EntityForm'));

update TsPage set FDialogWidth=500, FDialogHeight=240, FCode='Qs.User.PasswordModify' where FId='bc620904-6e90-4942-ba76-b5d9b65f7654';
update TsToolItem set FDefaultEventHandler='PasswordModify.doConfirm' where FId='a10e69f5-1e19-4649-9e72-f8fc0f6fe817';

update TsPage set FDialogWidth=900, FDialogHeight=600 where FCode='Qs.QuerySchema.Config';
update TsPage set FDialogWidth=null, FDialogHeight=null where FCode='Qs.QuerySchema.Sort';

update TsPage set FDialogWidth=640, FDialogHeight=600, FUrl='quicksilver/page/rule/DuplicationForm.jsp' where FCode='Qs.Duplication.Form';
update TsToolItem set FDefaultEventHandler='DuplicationForm.doSave' where FId='495ffba5-e419-4e14-9bd1-24de266fdb11';
delete from TsScript where FId='7a32467e-6059-4b28-b7b8-61c9bb4e8bde';

update TsPage set FCode='Qs.Misc.ActionError' where FCode='Qs.ActionError';
update TsToolItem set FDefaultEventHandler='ActionError.doSwitch' where FId='a2584571-d757-4d4d-8700-b76ecc7b6644';

update TsPage set FLoadHandler=null where FCode='Qs.Duplication.Confirm';
update TsPage set FLoadHandler=null where FCode='Qs.Duplication.Warning';
delete from TsScript where FId='12553e34-6959-4749-8e36-2a7bd0d0e6af';
delete from TsScript where FId='0e9ea57d-8163-4344-bfa6-6577bbf48a01';
update TsToolItem set FDefaultEventHandler='Duplication.doConfirm' where FId='18cae229-8a6e-42ea-a3f9-1ee06024334d';

update TsDictionaryItem set FValue='EntityForm' where FDictionaryId='d4cb2373-3c3c-4833-8ce5-f1b2d4b4981c' and FValue='EntityEdit';

delete from TsTextResource where FId='498eeaeb-f3bf-43cf-a537-68d7550eb84d';
delete from TsTextResource where FId='d3c81930-edc0-4b24-8342-dceb593a5ce0';
insert into TsTextResource set FId='498eeaeb-f3bf-43cf-a537-68d7550eb84d', FCode='T.Qs.Page.FormName',									FValue='${0}表單';
insert into TsTextResource set FId='d3c81930-edc0-4b24-8342-dceb593a5ce0', FCode='T.Qs.Page.FormTitle',									FValue='表單';

update TsSpecialPage set FPath='Qs.Misc.ActionError.page' where FPath='Qs.ActionError';

update TsPage set FDialogWidth=750, FDialogHeight=460, FLoadHandler='EntityEventForm.doLoad' where FCode='Qs.EntityEvent.Form';
update TsScript set FUrl='quicksilver/page/operation/EntityEventForm.js' where FUrl='quicksilver/page/operation/EntityEventEdit.js';

update TsPage set FDialogWidth=750, FDialogHeight=572 where FCode='Qs.User.Pick';
update TsPage set FDialogWidth=800, FDialogHeight=600 where FCode='Qs.Field.OrderConfig';
update TsPage set FDialogWidth=750, FDialogHeight=400 where FCode='Qs.ChartParameter.Form';
update TsPage set FDialogWidth=900, FDialogHeight=600 where FCode='Qs.Chart.Show';
update TsPage set FDialogWidth=616, FDialogHeight=600 where FCode='Qs.Keyword.FieldConfig';
update TsPage set FDialogWidth=600, FDialogHeight=200 where FCode='Qs.Page.SlavePageGenerate';
update TsPage set FDialogWidth=330, FDialogHeight=200 where FCode='Qs.Entity.Assign';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.Bill.Form';
update TsPage set FDialogWidth=750, FDialogHeight=600 where FCode='Qs.Version.EntityForm';
update TsPage set FDialogWidth=750, FDialogHeight=600, FLoadHandler='FormForm.doLoad' where FCode='Qs.Form.Form';

update TsToolItem set FDefaultEventHandler='FormForm.doGroupAdd'	where FId='a012cf58-b752-4365-a4d4-0ea01aae8d4b';
update TsToolItem set FDefaultEventHandler='FormForm.doGroupEdit'	where FId='b6b8b1b5-31ae-44c7-8b5a-d34834327b84';
update TsToolItem set FDefaultEventHandler='FormForm.doGroupDelete'	where FId='dcc903c4-af30-4334-8b6c-40f7d28a5fa2';

update TsPage set FUrl='quicksilver/page/message/NoticeForm.jsp', FActionMethodName='Qs.Notice.prepareForm', FDialogWidth=900, FDialogHeight=600 where FCode='Qs.Notice.Form';
update TsToolItem set FDefaultEventHandler='NoticeForm.doSave' where FId='d5a1c107-28bd-426b-854e-77d3a9927a62';

update TsField set FTitle='抄送' where FId='dbdfab53-da65-4392-b728-272dbca76f8b';

update TsPage set FUrl='quicksilver/page/template/MultiTree.jsp' where FCode='Qs.Role.Chart';
update TsPage set FUrl='quicksilver/page/template/MultiTree.jsp' where FCode='Qs.Role.Report';
update TsPage set FUrl='quicksilver/page/template/MultiTree.jsp' where FCode='Qs.Role.Menu';
update TsPage set FUrl='quicksilver/page/template/MultiTree.jsp' where FCode='Qs.Menu.Export';

delete from TsScript where FId='ee04e1ab-55ab-4ac8-b130-f1f95cbb616d';
delete from TsScript where FId='02e26ba5-a78d-4fa0-aa6c-c14ae3c19ba9';
delete from TsScript where FId='dec40505-2299-44dc-a3ab-12aff6b149c2';
delete from TsScript where FId='79998e51-bf5e-47f7-a56b-c8cc69ee34d0';
insert into TsScript set FId='ee04e1ab-55ab-4ac8-b130-f1f95cbb616d', FIndex=1, FPageId='9e55a0d2-588b-4e2d-86a3-5c5ee4966b58', FUrl='quicksilver/page/user/RoleChart.js';
insert into TsScript set FId='02e26ba5-a78d-4fa0-aa6c-c14ae3c19ba9', FIndex=1, FPageId='a4c1790b-ca36-415c-b4b8-b17c6e26e647', FUrl='quicksilver/page/user/RoleReport.js';
insert into TsScript set FId='dec40505-2299-44dc-a3ab-12aff6b149c2', FIndex=1, FPageId='cf277c1c-59f4-421a-9204-a86d7d3e270a', FUrl='quicksilver/page/user/RoleMenu.js';
insert into TsScript set FId='79998e51-bf5e-47f7-a56b-c8cc69ee34d0', FIndex=1, FPageId='ffddbce4-9def-4f52-9720-047135db5070', FUrl='quicksilver/page/menu/MenuExport.js';

update TsToolItem set FDefaultEventHandler='RoleMenu.doSave' where FId='6139761c-3c44-4d67-a83b-f62e593ce9bc';
update TsToolSubItem set FEventHandler='RoleMenu.doExportCurrent'	where FId='7906213b-aef3-4149-9a61-04c62c1b49fb';
update TsToolSubItem set FEventHandler='RoleMenu.doExportAll'		where FId='7fd1583e-ee7b-4db1-96a0-fc0832601ae5';

delete from TsPage where FId='8a99cf1a-cb02-4ed4-ab92-a92831e914a1';
insert into TsPage set FId='8a99cf1a-cb02-4ed4-ab92-a92831e914a1', FName='欄位分組表單',         FTitle='欄位分組',     FCode='Qs.FieldGroup.Form',        FType='EntityForm',      FIcon='quicksilver/image/unit/FieldGroup.gif', FUrl='quicksilver/page/layout/FieldGroupForm.jsp', FActionMethodName='',                                  FLoadHandler='',                             FRelationId=null, FUnitId='00000000-0000-0000-0001-000000000003', FMasterUnitId='00000000-0000-0000-0001-000000000003',                                   FIsSlavePage=1, FPlatform='Computer', FIndex=null, FDialogWidth=400,    FDialogHeight=180,    FDescription=null, FVisible=1;

delete from TsToolItem where FId='3e70a81e-5c00-46ae-bd61-db78e3c55ecb';
insert into TsToolItem set FId='3e70a81e-5c00-46ae-bd61-db78e3c55ecb', FPageId='8a99cf1a-cb02-4ed4-ab92-a92831e914a1', FCode='Confirm', FName='確定', FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='FieldGroupForm.doConfirm', FIcon='quicksilver/image/16/Confirm.gif', FScale=0, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine='', FVisibleCondition='', FEnableCondition='', FHandleType='JavaScript', FHandlePageId=null;
update TsPage set FDialogWidth=600, FDialogHeight=450 where FCode='Qs.Privilege.UserAccessFieldConfig';
update TsPage set FDialogWidth=600, FDialogHeight=600 where FCode='Qs.Monitor.CacheTree';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Misc.InstallWordPaster';

delete from TsTextResource where FId='67db3d0b-8203-4bbb-aa4d-6b49ab6af946';
insert into TsTextResource set FId='67db3d0b-8203-4bbb-aa4d-6b49ab6af946', FCode='T.Qs.Misc.InstallWordPasterInformation',				FValue='如果貼圖外掛程式已經成功安裝，則點擊 <img src="quicksilver/editor/ckeditor/plugins/imagepaster/images/paster.png"> 圖示，可粘貼剪切板中的圖片。如果貼圖外掛程式尚未安裝，則流覽器將提醒用戶安裝貼圖外掛程式。<br><br>注：對於 Internet Explorer，請將當前網站加入到受信任網站，並將受信任網站的安全級別調至較低級別。';

delete from TsToolItem where FPageId='bf724a07-ee1a-498c-a6cc-0526bf4111b4';
insert into TsToolItem set FId='b24fef49-92b5-45d1-9fe6-ea88cc70241e', FPageId='bf724a07-ee1a-498c-a6cc-0526bf4111b4', FCode='SelectFile',	FName='選擇檔案',	FLabel='', FType='Button', FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='FileBatchUpload.doSelectFile', FIcon='quicksilver/image/16/FolderOpen.png',	FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='4f96f755-40dd-45c2-89d3-6b18ceccc8c7', FPageId='bf724a07-ee1a-498c-a6cc-0526bf4111b4', FCode='Upload',		FName='上傳',		FLabel='', FType='Button', FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='FileBatchUpload.doUpload',		FIcon='quicksilver/image/16/Upload.png',		FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null, FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsTextResource where FId='8b81fe10-94c8-430c-a578-9126e78eb137';
delete from TsTextResource where FId='87694354-27f4-4be5-9084-11b1c24a20e5';
delete from TsTextResource where FId='b926932c-c436-4a7c-9e56-733688a4b079';
delete from TsTextResource where FId='608c4f61-21af-445d-8e0e-a0a6d3509e13';
delete from TsTextResource where FId='cf6c53c8-bcad-45de-ae80-eeaf0edc2351';
delete from TsTextResource where FId='20278cf6-934c-4719-bcf6-7c77240f7d71';
delete from TsTextResource where FId='86e186a8-88c8-46f1-9a8d-00bd9a56b361';
delete from TsTextResource where FId='85e23d4d-b66a-40aa-8e0d-e593770fd192';
insert into TsTextResource set FId='8b81fe10-94c8-430c-a578-9126e78eb137', FCode='T.Qs.Ajax.AbortAlert',							FValue='用戶已終止操作。';
insert into TsTextResource set FId='87694354-27f4-4be5-9084-11b1c24a20e5', FCode='T.Qs.Ajax.TimeoutAlert',							FValue='遠端伺服器訪問超時。';
insert into TsTextResource set FId='b926932c-c436-4a7c-9e56-733688a4b079', FCode='T.Qs.Ajax.JsonFormatInvalid',						FValue='JSON 格式錯誤：${0}';
insert into TsTextResource set FId='608c4f61-21af-445d-8e0e-a0a6d3509e13', FCode='T.Qs.Ajax.ErrorWithHtml',							FValue='遠端伺服器訪問失敗，具體資訊請參考錯誤頁面。';
insert into TsTextResource set FId='cf6c53c8-bcad-45de-ae80-eeaf0edc2351', FCode='T.Qs.Ajax.ErrorWithMessage',						FValue='遠端伺服器訪問失敗：${0}';
insert into TsTextResource set FId='20278cf6-934c-4719-bcf6-7c77240f7d71', FCode='T.Qs.Ajax.ErrorWithoutMessage',					FValue='遠端伺服器訪問失敗。可能是網路中斷、伺服器暫時關閉或其它問題導致。';
insert into TsTextResource set FId='86e186a8-88c8-46f1-9a8d-00bd9a56b361', FCode='T.Qs.Ajax.Aborted',								FValue='已取消';
insert into TsTextResource set FId='85e23d4d-b66a-40aa-8e0d-e593770fd192', FCode='T.Qs.Ajax.Timeout',								FValue='超時';

delete from TsTextResource where FId='f501cb2a-d12d-4215-bb51-20625be7f4e5';
delete from TsTextResource where FId='56a4af3c-4365-450e-b241-67a5f9658581';
delete from TsTextResource where FId='244e8e84-4efd-4731-b886-d5a439b57bcb';
delete from TsTextResource where FId='9907097b-0bb0-4736-b057-6e8921f6663d';
delete from TsTextResource where FId='d0807b94-2237-46fc-b9a0-6404a34eed77';
delete from TsTextResource where FId='c5bce9cc-6a74-4b70-8103-746b076d1d1f';
delete from TsTextResource where FId='e497a69a-1fe8-499d-90b7-c1a12eda11eb';
delete from TsTextResource where FId='e09c0e89-f9ab-45f2-9a22-94ec0e8907b5';
delete from TsTextResource where FId='d61218c0-246d-4ca0-88b7-de94af095742';
delete from TsTextResource where FId='aec11da9-144e-43df-aa1b-572f65dcb073';
insert into TsTextResource set FId='f501cb2a-d12d-4215-bb51-20625be7f4e5', FCode='T.Qs.Misc.FileBatchUpload.FileName',						FValue='檔案名';
insert into TsTextResource set FId='56a4af3c-4365-450e-b241-67a5f9658581', FCode='T.Qs.Misc.FileBatchUpload.FileSize',						FValue='大小';
insert into TsTextResource set FId='244e8e84-4efd-4731-b886-d5a439b57bcb', FCode='T.Qs.Misc.FileBatchUpload.UploadProgress',				FValue='上傳進度';
insert into TsTextResource set FId='9907097b-0bb0-4736-b057-6e8921f6663d', FCode='T.Qs.Misc.FileBatchUpload.Delete',						FValue='刪除';
insert into TsTextResource set FId='d0807b94-2237-46fc-b9a0-6404a34eed77', FCode='T.Qs.Misc.FileBatchUpload.Cancel',						FValue='取消';
insert into TsTextResource set FId='c5bce9cc-6a74-4b70-8103-746b076d1d1f', FCode='T.Qs.Misc.FileBatchUpload.Success',						FValue='上傳成功';
insert into TsTextResource set FId='e497a69a-1fe8-499d-90b7-c1a12eda11eb', FCode='T.Qs.Misc.FileBatchUpload.Failed',						FValue='上傳失敗';
insert into TsTextResource set FId='e09c0e89-f9ab-45f2-9a22-94ec0e8907b5', FCode='T.Qs.Misc.FileBatchUpload.Ready',							FValue='待上傳';
insert into TsTextResource set FId='d61218c0-246d-4ca0-88b7-de94af095742', FCode='T.Qs.Misc.FileBatchUpload.NoReadyFileAlert',				FValue='沒有待上傳的檔案。';
insert into TsTextResource set FId='aec11da9-144e-43df-aa1b-572f65dcb073', FCode='T.Qs.Misc.FileBatchUpload.CloseConfirm',					FValue='檔案正在上傳。您是否確定關閉窗口並終止上傳？';

update TsPage set FDialogWidth=680, FDialogHeight=320 where FCode='Qs.Misc.FileBatchUpload';
update TsPage set FDialogWidth=700, FDialogHeight=240 where FCode='Qs.GraphHomepage.Item';
update TsPage set FDialogWidth=700, FDialogHeight=240 where FCode='Qs.GraphHomepage.Property';

delete from TsToolItem where FPageId='65866673-cc70-453d-9027-58271d9ccc9d';
insert into TsToolItem set FId='a654f645-3723-47ff-a071-1950a55ae78c', FPageId='65866673-cc70-453d-9027-58271d9ccc9d', FCode='Execute',       FName='執行',       FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='ReportCenter.doExecute',         FIcon='quicksilver/image/16/Execute.gif',   FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;
insert into TsToolItem set FId='63bc7d57-3dc8-41f7-8c9f-447cff3393b1', FPageId='65866673-cc70-453d-9027-58271d9ccc9d', FCode='OpenNewWindow', FName='打開新視窗', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FDefaultEventHandler='ReportCenter.doOpenNewWindow',   FIcon='quicksilver/image/16/NewWindow.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='b56f8520-79ec-465f-9d99-d36ff735a8d3';
insert into TsToolItem set FId='9d2e10bf-4eb3-4b22-96a8-2dbeeb0cb334', FPageId='b56f8520-79ec-465f-9d99-d36ff735a8d3', FCode='Execute', FName='執行', FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FDefaultEventHandler='ReportShow.doExecute', FIcon='quicksilver/image/16/Execute.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null;

delete from TsToolItem where FPageId='3ff58410-7e93-483d-9382-7d488da71203';

update TsPage set FCode='Qs.Report.Show', FUrl='quicksilver/page/report/ReportShow.jsp', FActionMethodName='Qs.Report.prepareShow' where FCode='Qs.Report.View';
update TsPage set FCode='Qs.Bill.Show', FUrl='quicksilver/page/report/BillShow.jsp', FActionMethodName='Qs.Bill.prepareShow' where FCode='Qs.Bill.View';

update TsPage set FDialogWidth=750, FDialogHeight=400 where FCode='Qs.ReportParameter.Form';
update TsPage set FDialogWidth=750, FDialogHeight=490 where FCode='Wf.Version.Config';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Wf.Node.Config';
update TsPage set FDialogWidth=750, FDialogHeight=460 where FCode='Wf.Line.Config';
update TsPage set FDialogWidth=750, FDialogHeight=460 where FCode='Wf.Event.Config';
update TsPage set FDialogWidth=750, FDialogHeight=490 where FCode='Wf.Button.Config';

delete from TsTextResource where FCode='T.Wf.Participant.InputJavaClass';
insert into TsTextResource set FId='8610dceb-100e-4506-8a04-5ad7885cbf72', FCode='T.Wf.Participant.InputJavaClass',						FValue='請輸入 Java 類。';

delete from TsPage where FId='d210005f-7b27-46ba-84f2-b65c18f5662a';
delete from TsPage where FId='5af8d69b-92f1-40ab-a148-998beaa61917';

delete from TsToolItem where FPageId='d210005f-7b27-46ba-84f2-b65c18f5662a';

update TsToolItem set FDefaultEventHandler='WfChartAndDetail.doViewEntity' where FId='eba8f7fd-7ac0-4b87-abb5-9dadfb3e9c62';
update TsToolItem set FDefaultEventHandler='WfChartAndDetail.doSuspend'    where FId='c0d03e48-f841-40e2-946a-1f9d807ada72';
update TsToolItem set FDefaultEventHandler='WfChartAndDetail.doResume'     where FId='6fb60802-4195-4823-8fa2-140f5e2df201';
update TsToolItem set FDefaultEventHandler='WfChartAndDetail.doTerminate'  where FId='31e23081-9f5f-4dab-a9b3-f70f685c1fe8';

update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.UnitConvert.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Edit.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.List.Form';

delete from TsPage where FCode='Qs.Unit.ListFilterList';
insert into TsPage set FId='4eea1450-3bfa-4fc2-afd8-272a94997e0c', FName='單元列表過濾列表',			FTitle='列表過濾',		FCode='Qs.Unit.ListFilterList',				FPlatform='Computer', FType='EntityList',	FIcon='quicksilver/image/unit/ListFilter.png',			FUrl='quicksilver/page/template/EntityList.jsp',          FActionMethodName='Qs.ListFilter.prepareList',					FLoadHandler=null,              FRelationId='47005a2b-4f42-4e20-b31b-d0610d4356f9', FUnitId='3650ea5e-ab48-4c3f-bcc3-21e96468a821', FMasterUnitId='00000000-0000-0000-0001-000000000001', FIsSlavePage=1, FIndex=16,   FDialogWidth=null, FDialogHeight=null, FVisible=1, FDescription=null;

delete from TsToolItem where FPageId='4eea1450-3bfa-4fc2-afd8-272a94997e0c';
--單元列表過濾列表
insert into TsToolItem set FId='c2705ea2-087a-4d70-afa3-6b30f334d79b', FPageId='4eea1450-3bfa-4fc2-afd8-272a94997e0c', FCode='Add',     FName='新增', FHint='新增一筆記錄',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=1, FWidth=0, FIcon='quicksilver/image/16/Add.gif',     FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doAdd';
insert into TsToolItem set FId='b27b1f47-037b-45d2-a249-c9cd7b6f86eb', FPageId='4eea1450-3bfa-4fc2-afd8-272a94997e0c', FCode='Open',    FName='打開', FHint='打開當前選中的記錄。如果選中了多筆，第一筆將被打開。', FLabel=null, FType='Button',      FAlign='right', FIndex=2, FWidth=0, FIcon='quicksilver/image/16/Open.gif',    FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doOpen';
insert into TsToolItem set FId='df8fa98c-b011-437e-be8f-18e2dd12c7ae', FPageId='4eea1450-3bfa-4fc2-afd8-272a94997e0c', FCode='Delete',  FName='刪除', FHint='刪除當前選中的記錄',                                   FLabel=null, FType='Button',      FAlign='right', FIndex=3, FWidth=0, FIcon='quicksilver/image/16/Delete.gif',  FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doDelete';
insert into TsToolItem set FId='83bec7d7-0249-4ca6-a1f7-439d6d7906e2', FPageId='4eea1450-3bfa-4fc2-afd8-272a94997e0c', FCode='Refresh', FName='刷新', FHint='刷新清單內容',                                         FLabel=null, FType='Button',      FAlign='right', FIndex=4, FWidth=0, FIcon='quicksilver/image/16/Refresh.gif', FScale=null, FEntityUnitId=null, FDefaultValue=null, FSubItemSource=null,           FDictionaryId=null, FSubItemRoutine=null, FVisibleCondition=null, FEnableCondition=null, FHandleType='JavaScript', FHandlePageId=null, FConfirmMessage=null, FDefaultEventHandler='EntityList.doRefresh';

update TsField set FRowSpan=11 where FId='0b9cd021-0bba-420f-8033-a3734c9eaf91';
update TsUnit set FOpenMode='System' where FCode='Qs.Timer';
update TsUnit set FNameField='FContent' where FCode='Qs.ShortMessage';

update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Unit.Form';
update TsPage set FDialogWidth=750, FDialogHeight=594 where FCode='Qs.FieldLinkage.Form';
update TsPage set FDialogWidth=750, FDialogHeight=250 where FCode='Qs.Relation.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.Script.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.ToolSubItem.Form';
update TsPage set FDialogWidth=750, FDialogHeight=458 where FCode='Qs.Menu.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.QuerySchema.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.Language.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.ListFilter.Form';
update TsPage set FDialogWidth=750, FDialogHeight=424 where FCode='Qs.OperationStep.Form';
update TsPage set FDialogWidth=750, FDialogHeight=492 where FCode='Qs.BusinessLog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.EventLog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Timer.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.TimerLog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=594 where FCode='Qs.SystemMessage.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.ChartCatalog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.ReportSolution.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.ParameterGroup.Form';
update TsPage set FDialogWidth=750, FDialogHeight=356 where FCode='Qs.ParameterDefinition.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.HomepageItem.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.SerialNumberPart.Form';
update TsPage set FDialogWidth=750, FDialogHeight=452 where FCode='Qs.ShortMessage.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.DiskFile.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Picture.Form';
update TsPage set FDialogWidth=750, FDialogHeight=458 where FCode='Qs.Note.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.ClusterNode.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.ClusterNodeFileSystem.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.ClusterNodePerformance.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.PrivilegeType.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.LoginLog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.WebServiceProvider.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.WebServiceInterface.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Wf.Node.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Wf.Line.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Wf.Button.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Wf.Event.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.MobileHomepageItem.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.Version.Form';
update TsPage set FDialogWidth=750, FDialogHeight=500 where FCode='Qs.ViewItem.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.ViewItemButton.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.ViewItemField.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.Deputy.Form';
update TsPage set FDialogWidth=750, FDialogHeight=300 where FCode='Qs.OnlineUser.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.SqlExecuteLog.Form';
update TsPage set FDialogWidth=750, FDialogHeight=526 where FCode='Qs.SqlUpgradeLog.Form';

update TsPage set FDialogWidth=600, FDialogHeight=600 where FCode='Qs.Monitor.CacheTree';
update TsPage set FDialogWidth=600, FDialogHeight=200 where FCode='Qs.Import.ImportDialog';
update TsPage set FDialogWidth=480, FDialogHeight=200 where FCode='Qs.User.PasswordModify';
update TsPage set FDialogWidth=750, FDialogHeight=400 where FCode='Wf.Version.ChartError';

delete from TsPage where FId='396c26cf-7c8a-400c-9322-084c65140ee6';
insert into TsPage set FId='396c26cf-7c8a-400c-9322-084c65140ee6', FName='流覽器無效',			FTitle='流覽器不支持',		FCode='Qs.Misc.BrowserInvalid',		   FType='Other', FIcon=null,												FUrl='quicksilver/page/misc/BrowserInvalid.jsp',		FActionMethodName=null,										FLoadHandler=null, FRelationId=null, FUnitId=null, FMasterUnitId='00000000-0000-0000-0001-000000002007', FIsSlavePage=0, FPlatform='Computer', FIndex=null, FDialogWidth=null, FDialogHeight=null, FDescription=null, FVisible=1;

delete from TsSpecialPage where FId='2ef95406-aec1-4b9f-820d-273121ce5852';
insert into TsSpecialPage set FId='2ef95406-aec1-4b9f-820d-273121ce5852', FPath='Qs.Misc.BrowserInvalid.page', 			FJspDirectlyAccessible=0, FBypassSession=1;

delete from TsTextResource where FId='3cb33e05-eb3a-40ca-9497-13c0358098e6';
insert into TsTextResource set FId='3cb33e05-eb3a-40ca-9497-13c0358098e6', FCode='T.Qs.System.BrowserInvalidMessage',					FValue='系統不支援您的流覽器。我們推薦您採用最新版本的 <a href="http://www.google.com/intl/zh-TW/chrome/browser">Chrome</a> 流覽器訪問本系統。您也可以採用：<div class=BrowserList><li>最新版本的 Firefox 瀏覽器</li><li>Internet Explorer 10 或更高版本的 IE 流覽器</li><li>其它基於最新版本的 Blink、WebKit 或 Trident 內核的流覽器</li></div>';
