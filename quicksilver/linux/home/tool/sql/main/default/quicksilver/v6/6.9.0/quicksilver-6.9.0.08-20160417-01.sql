--minglei

update TsScript set FUrl = replace(FUrl, 'jeedui/script', 'jeedui/js') where locate('jeedui/script', FUrl) > 0;
