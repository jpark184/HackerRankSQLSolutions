/*
Enter your query here.
*/

SELECT
    S.Name
FROM
    students S
LEFT JOIN
    friends f
        ON S.ID = F.ID
LEFT JOIN
    packages p2
        ON F.Friend_ID = P2.ID
LEFT JOIN
    Packages p1
        ON s.id = p1.id
WHERE
    P2.Salary > P1.Salary
ORDER BY
    P2.Salary
;