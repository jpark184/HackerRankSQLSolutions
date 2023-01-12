/*
start date - end date
if date is consecutive it is the same project
order by start_date
*/
SET @r1=0,@r2=0;
SELECT
    T1.Start_date,
    T2.End_date
FROM
    (
    SELECT
        Start_date,
        CASE 
            WHEN Start_date not in (Select End_Date from projects) THEN @r1 := @r1+1
        END as rownumber1
    FROM
        PROJECTS
    ) T1,
    (
        SELECT
        end_date,
        CASE 
            WHEN end_date not in (Select start_Date from projects) THEN @r2 := @r2+1
        END as rownumber2
    FROM
        PROJECTS
    )T2
WHERE
    T1.rownumber1 = T2.Rownumber2
ORDER BY
    datediff(t2.end_date,t1.start_date) asc, 
    t1.start_date asc;
;