--alter table TsBill add FDescription varchar(500);

update TsParameterDefinition set FIndex = FIndex + 1 where FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab' and FIndex >= 6;
delete from TsParameterDefinition where FId='f1ab3d5d-a71a-49aa-8b31-4fb90c483ee6';
insert into TsParameterDefinition set FId='f1ab3d5d-a71a-49aa-8b31-4fb90c483ee6', FName='最大页签宽度(像素)',			FCode='QsMaxTabWidth',						FParameterGroupId='621529ad-7daf-4768-9a1a-54ba72cfb3ab', FType='InputBox-Integer',		FRange='SystemAndUser',	FRowSpan=1, FColSpan=1, FRequired=0, FVisible=1, FIndex=6; 
