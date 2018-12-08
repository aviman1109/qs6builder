--minglei

delete from TsTextResource where FCode='E.Jsql.JavaInvalidArgument';
delete from TsTextResource where FCode='E.Jsql.JavaInvalidArgumentFormat';
delete from TsTextResource where FCode='E.Jsql.JavaInvalidArgumentValue';
insert into TsTextResource set FId='e524d6be-02f2-4d72-a810-4ec203a283ea', FCode='E.Jsql.JavaInvalidArgumentFormat',					FValue='Java 常式的參數“${0}”格式錯誤：${1}。';
insert into TsTextResource set FId='151b98fa-069f-4651-8fcf-640906e1176d', FCode='E.Jsql.JavaInvalidArgumentValue',						FValue='Java 常式的參數“${0}”的值錯誤：${1}。';
