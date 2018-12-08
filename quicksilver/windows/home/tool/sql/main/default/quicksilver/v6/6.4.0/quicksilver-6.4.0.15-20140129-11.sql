update TsPage set FUrl = 'quicksilver/page/template/EntityForm.jsp' where FUrl = 'quicksilver/page/template/EntityEdit.jsp';
update TsPage set FActionMethodName = replace(FActionMethodName, '.prepareEdit', '.prepareForm') where FActionMethodName like '%.prepareEdit';
update TsPage set FCode = substr(FCode, 1, length(FCode) - 4) || 'Form' where FCode like '%.Edit' and FUrl = 'quicksilver/page/template/EntityForm.jsp';
update TsPage set FIcon='quicksilver/image/unit/Form.png' where FType='EntityForm' and FIcon <> 'quicksilver/image/unit/Form.png';
