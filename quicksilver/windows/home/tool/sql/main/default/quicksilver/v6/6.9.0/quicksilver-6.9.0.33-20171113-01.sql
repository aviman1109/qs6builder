--minglei

java runIgnoreError('alter table TsDiskFile alter FMessageDigest set data type varchar(100)');
java runIgnoreError ('create index IsDiskFile_FMessageDigest on TsDiskFile(FMessageDigest)');
java runIgnoreError ('create index IsDiskFile_FSize on TsDiskFile(FSize)');

update TsDiskFile set FMessageDigest = '2'
    || ',' || lower(case when length(FName) <= 37 then '' when length(FName) <= 57 then substr(FName, 38, length(FName) - 37) else substr(FName, 38, 20) end)
    || ',' || FMessageDigest
where locate(',', FMessageDigest) = 0;
