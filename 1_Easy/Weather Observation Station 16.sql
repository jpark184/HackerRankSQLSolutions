select round(LAT_N,4) from station
where LAT_N > 38.7780
order by lat_n asc
limit 1;