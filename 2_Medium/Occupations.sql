/*
Enter your query here.
*/

SET @a = 0, @b = 0, @c = 0, @d = 0;
SELECT
    MIN(DOCTOR),
    MIN(Professor),
    MIN(Singer),
    MIN(Actor)
FROM
(
SELECT
    CASE 
        WHEN OCCUPATION = "Doctor" THEN @a := @a + 1
        WHEN OCCUPATION = "Professor" THEN @b := @b + 1
        WHEN OCCUPATION = "Singer" THEN @c := @c + 1
        WHEN OCCUPATION = "Actor" THEN @d := @d + 1
    END as NUM,
    CASE
        WHEN OCCUPATION = "Doctor" THEN NAME ELSE NULL
    END as Doctor,
    CASE
        WHEN OCCUPATION = "Professor" THEN NAME ELSE NULL
    END as Professor,
    CASE
        WHEN OCCUPATION = "Singer" THEN NAME ELSE NULL
    END as Singer,
    CASE
        WHEN OCCUPATION = "Actor" THEN NAME ELSE NULL
    END as Actor
FROM
    OCCUPATIONS
ORDER BY
    NAME) as tbl
GROUP BY
    NUM;
        