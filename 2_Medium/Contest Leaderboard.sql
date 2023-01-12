/*
hacker_id,name,total_score
score desc - hacker_id asc
exclude hackers with 0 score
*/
SELECT
    tbl.hacker_id,
    tbl.name,
    sum(tbl.score)
FROM
    (
    SELECT
        s.hacker_id as hacker_id,
        s.challenge_id challenge_id,
        max(s.score) as score,
        h.name as name
    FROM
        Submissions s
    LEFT JOIN
        hackers h
            ON s.hacker_id = h.hacker_id
    GROUP BY
        hacker_id,
        challenge_id,
        name
    ORDER BY
        hacker_id,
        challenge_id
        )tbl
GROUP BY
    tbl.hacker_id,
    tbl.name
HAVING
    sum(tbl.score) > 0
ORDER BY
    sum(tbl.score) desc,
    tbl.hacker_id asc
        ;