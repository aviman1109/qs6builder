--minglei

update TsRelation set FDeleteAction1='unset' where FId='0705858c-a26b-459a-8feb-c84254afcd8f';
update TsRelation set FDeleteAction2='unset' where FId='0704de21-64ad-44a4-8109-ffdaaece6134';

delete from TsToolItem where FId='6f397590-d4d5-42ef-a2a8-b4a3ff284e54'; --Qs.LaguageForm/SetDefault
delete from TsTextResource where FCode='T.Qs.Language.DefaultModified';
delete from TsTextResource where FCode='T.Qs.Language.SetDefaultConfirm';
update TsField set FVisible=0 where FId='6a80c9bd-f90e-4afd-a96c-cd50eeba7375'; --TsLanguage.FDefault
