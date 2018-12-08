--minglei

update TsField set FSupportLocalText=1
where FType='MultiEntityBox' and trim(FLocalTextField) <> '' and FSupportLocalText=0
