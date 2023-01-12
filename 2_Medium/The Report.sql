/*
STUDENTS: ID NAME MARKS
GRADES: GRADE MIN_MARK MAX MARK
don't want names of grade below 8
order by grade desc, name asc, 

FOR BELOW 8, NULL grades desc, marks asc
*/

SELECT
    CASE WHEN G.GRADE > 7 THEN S.NAME ELSE NULL END AS NAME,
    G.GRADE,
    S.MARKS
FROM
    STUDENTS S
LEFT JOIN
    GRADES G
        ON G.MIN_MARK = CASE WHEN S.MARKS != 100 THEN TRUNCATE(S.MARKS,-1) ELSE 90 END
ORDER BY
    G.GRADE DESC,
    NAME ASC;