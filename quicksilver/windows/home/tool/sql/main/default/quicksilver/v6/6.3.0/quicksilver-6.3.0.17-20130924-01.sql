--Author: Minglei

update TsField set FSelectListConstantFilterSql = FSelectListFilterSql where (FSelectListFilterSqlExceedable is null or FSelectListFilterSqlExceedable = 0) and (FSelectListConstantFilterSql is null or trim(FSelectListConstantFilterSql) = '') and trim(FSelectListFilterSql) <> '';
