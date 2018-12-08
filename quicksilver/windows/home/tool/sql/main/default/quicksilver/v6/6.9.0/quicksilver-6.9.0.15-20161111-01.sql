--minglei

delete from TsTextResource where FCode='E.Basic.Xml.EmptyText';
delete from TsTextResource where FCode='E.Basic.Xml.TypeCast';
delete from TsTextResource where FCode='E.Basic.Xml.NodeMissing';
delete from TsTextResource where FCode='E.Basic.Xml.AttrMissing';
delete from TsTextResource where FCode='E.Basic.Xml.NodeEmptyText';
delete from TsTextResource where FCode='E.Basic.Xml.AttrEmptyText';
delete from TsTextResource where FCode='E.Basic.Xml.NodeTypeCast';
delete from TsTextResource where FCode='E.Basic.Xml.AttrTypeCast';

delete from TsTextResource where FId='3427e982-b310-4632-b309-6993809c5c96';
delete from TsTextResource where FId='8ed9f169-da1c-4bc5-91f4-c368cd6f6aca';
delete from TsTextResource where FId='28f4b4d4-2d4b-4a5b-b6d4-3126bc096876';
delete from TsTextResource where FId='aa61c2b9-715b-4e97-9e05-3d360e8f8d4c';
delete from TsTextResource where FId='6f4fe1f9-4307-4624-977b-00bb533b4e0f';
delete from TsTextResource where FId='3a7da7c5-44c1-49a2-8202-de3a41058937';

insert into TsTextResource set FId='3427e982-b310-4632-b309-6993809c5c96', FCode='E.Basic.Xml.NodeMissing',								FValue='XML 父節點“${0}”必須包含子節點“${1}”。';
insert into TsTextResource set FId='8ed9f169-da1c-4bc5-91f4-c368cd6f6aca', FCode='E.Basic.Xml.AttrMissing',								FValue='XML 節點“${0}”必須包含屬性“${1}”。';
insert into TsTextResource set FId='28f4b4d4-2d4b-4a5b-b6d4-3126bc096876', FCode='E.Basic.Xml.NodeEmptyText',							FValue='XML 父節點“${0}”的子節點“${1}”不能為空。';
insert into TsTextResource set FId='aa61c2b9-715b-4e97-9e05-3d360e8f8d4c', FCode='E.Basic.Xml.AttrEmptyText',							FValue='XML 節點“${0}”的屬性“${1}”不能為空。';
insert into TsTextResource set FId='6f4fe1f9-4307-4624-977b-00bb533b4e0f', FCode='E.Basic.Xml.NodeTypeCast',							FValue='XML 父節點“${0}”的子節點“${1}”的值“${2}”不能轉為類型“${3}”。';
insert into TsTextResource set FId='3a7da7c5-44c1-49a2-8202-de3a41058937', FCode='E.Basic.Xml.AttrTypeCast',							FValue='XML 節點“${0}”的屬性“${1}”的值“${2}”不能轉為類型“${3}”。';
