WITH Aver as
(
    SELECT
        row_number() over (order by lat_n desc) as row_num,
        lat_n
    FROM
        Station
)

select round(lat_n,4) from aver
where row_num = (select round(avg(row_num),0) from aver);