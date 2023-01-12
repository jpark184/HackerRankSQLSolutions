/*
hacker_id,name(who got full score on more than 1 challenge)
order by challenge_completed desc, hacker_id asc
*/

SELECT
    s.hacker_id,
    h.name
FROM
    submissions s
LEFT JOIN
    hackers h
ON
    s.hacker_id = h.hacker_id
LEFT JOIN
    challenges c
ON
    s.challenge_id = c.challenge_id
LEFT JOIN
    difficulty d
ON
    d.difficulty_level = c.difficulty_level
GROUP BY
    s.hacker_id,
    h.name
HAVING
    sum(if(d.score=s.score,1,0)) > 1
ORDER BY
    sum(if(d.score=s.score,1,0)) desc, 
    s.hacker_id asc
;