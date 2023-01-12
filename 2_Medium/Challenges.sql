/*
hacker_id,name,count(challenge_id)
count challenge desc, hacker id asc
*/

SELECT
    c.hacker_id as id,
    h.name as name,
    count(c.challenge_id) as cnt
FROM
    challenges c
LEFT JOIN
    hackers h
        ON h.hacker_id = c.hacker_id
GROUP BY
    id,
    name
HAVING
    cnt = 
        (
        SELECT 
            count(challenge_id) 
        FROM
            challenges
        GROUP BY
            hacker_id
        ORDER BY
            count(challenge_id) desc
        LIMIT
            1
        )
    OR
    cnt in
        (
        SELECT
            tbl1.cnt
        FROM
            (
            SELECT
                count(challenge_id) as cnt
            FROM
                challenges
            GROUP BY
                hacker_id
            ) tbl1
        GROUP BY
            tbl1.cnt
        HAVING
            count(tbl1.cnt) = 1
        )
ORDER BY
    cnt desc, 
    id asc
;