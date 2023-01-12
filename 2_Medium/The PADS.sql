/*
name(O)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

*/
SELECT
    CONCAT(NAME,"(",LEFT(occupation,1),")")
FROM
    OCCUPATIONS
ORDER BY
    NAME;
SELECT
    CONCAT("There are a total of ",count(Occupation)," ",lower(occupation),"s.")
FROM
    OCCUPATIONS
GROUP BY
    Occupation
ORDER BY
    count(occupation) asc;