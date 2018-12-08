--minglei

delete from TsCondition where FId='4a01d8c4-a33c-4158-bb15-d82bc338feda';
delete from TsConditionPart where FId='abaa46b7-bf50-42cd-94e2-77f7a7f3623a';
insert into TsCondition set FId='4a01d8c4-a33c-4158-bb15-d82bc338feda', FUnitId='00000000-0000-0000-0001-000000000024';
insert into TsConditionPart set FId='abaa46b7-bf50-42cd-94e2-77f7a7f3623a', FConditionId='4a01d8c4-a33c-4158-bb15-d82bc338feda', FGroupId=null, FIndex=1, FFieldName='FRead', FOperator='False', FValue=null, FText=null;
