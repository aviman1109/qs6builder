--hotbit.yu
update TsParameterDefinition set FRequired=0 where FCode='QsHtmlBoxEnterMode';
delete from TsSystemParameter where FKey='QsHtmlBoxEnterMode';
insert into TsSystemParameter set FId='7da364b2-36f8-4cc3-b3fc-63ed937a55cc', FKey='QsHtmlBoxEnterMode',                FValue='1';