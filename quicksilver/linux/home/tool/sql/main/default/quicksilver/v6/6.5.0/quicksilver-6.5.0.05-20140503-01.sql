--minglei--------------------------------------------------

update TsReport set FTemplateFile = substr(FTemplateFile, 8, length(FTemplateFile) - 7) where locate('report/', FTemplateFile) = 1;
update TsReport set FTemplateFile = substr(FTemplateFile, 8, length(FTemplateFile) - 7) where locate('report\', FTemplateFile) = 1;
