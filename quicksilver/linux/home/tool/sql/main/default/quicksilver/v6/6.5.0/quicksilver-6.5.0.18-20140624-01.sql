--minglei

delete from TsTextResource where FCode='T.Qs.Page.ViewName';
insert into TsTextResource set FId='600e8710-3a8a-4e73-876a-cf7aefedb30d', FCode='T.Qs.Page.ViewName',									FValue='${0}閱覽';

delete from TsTextResource where FCode='T.Qs.Unit.DeleteConfirm';
insert into TsTextResource set FId='3e54f1e0-6c58-461c-ae21-cd3fdfe63a5b', FCode='T.Qs.Unit.DeleteConfirm',								FValue='您是否確定要刪除選定的單元？警告：刪除單元具有很大的風險。如果刪除單元，相關的所有資訊，包括單元對應的表都將被刪除。如果您對刪除單元帶來的後果缺少瞭解，我們強烈建議您不要刪除單元。';

delete from TsTextResource where FCode='E.Qs.Unit.CannotDeleteSystemUnit';
delete from TsTextResource where FCode='E.Qs.Unit.CannotDeleteInProductMode';
insert into TsTextResource set FId='760c8afd-069f-4e5d-8925-58f2fdb47ffe', FCode='E.Qs.Unit.CannotDeleteSystemUnit',					FValue='不能删除以“Qs.”或“Wf.”开头的单元。';
insert into TsTextResource set FId='c514fd7c-51c2-4f01-a35f-7fcb0b4e8cde', FCode='E.Qs.Unit.CannotDeleteInProductMode',					FValue='在生產模式下不允許刪除單元。';

update TsPage set FDialogWidth = null where FDialogWidth=750 and (FType='EntityForm' or FCode like '%.Form');
