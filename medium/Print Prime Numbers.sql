set @num = 1;
set @nu = 1;

SELECT GROUP_CONCAT(NUMB SEPARATOR '&') from
(
select t1.numb from 
(
SELECT @num:=@num+1 as NUMB FROM
    information_schema.tables t1,
    information_schema.tables t2
) t1
where t1.numb <= 1000
and 
not exists
(
select * from(
    SELECT @nu:=@nu+1 as NUMA FROM
    information_schema.tables t1,
    information_schema.tables t2
) t2
where floor(numb/numa) = (numb/numa)
    and
    numa < numb
    and
    numa > 1
)) t3;