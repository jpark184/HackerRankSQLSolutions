select distinct(city) from station
where
    mod(ID,2) = 0
order by city asc
;