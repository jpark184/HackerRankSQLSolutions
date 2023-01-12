select distinct(city)from station
where
    not regexp_like(city,'^[aeiou]')
and
    not regexp_like(city,'[aeiou]$')
;