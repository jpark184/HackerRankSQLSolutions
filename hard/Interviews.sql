SELECT
    TBL1.contest_id,
    TBL1.hacker_id,
    TBL1.name,
    sum(TBL2.total_submissions),
    sum(TBL2.total_accepted_submissions),
    sum(TBL1.total_views),
    sum(TBL1.total_unique_views)
FROM
    (
        SELECT
            contests.contest_id,
            contests.hacker_id,
            contests.name,
            sum(view_stats.total_views) as total_views,
            sum(view_stats.total_unique_views) as total_unique_views
        FROM
            view_stats
        LEFT JOIN
            challenges
                ON view_stats.challenge_id = challenges.challenge_id
        LEFT JOIN
            colleges
                ON challenges.college_ID = colleges.college_Id
        LEFT JOIN
            contests
                ON colleges.contest_id = contests.contest_id
        GROUP BY
            contests.contest_id,
            contests.hacker_id,
            contests.name
    )TBL1
LEFT JOIN
    (
        SELECT
            contests.contest_id,
            contests.hacker_id,
            contests.name,
            sum(submission_stats.total_submissions) as total_submissions,
            sum(submission_stats.total_accepted_submissions) as total_accepted_submissions
        FROM
            submission_stats
        LEFT JOIN
            challenges
                ON submission_stats.challenge_id = challenges.challenge_id
        LEFT JOIN
            colleges
                ON challenges.college_ID = colleges.college_Id
        LEFT JOIN
            contests
                ON colleges.contest_id = contests.contest_id
        GROUP BY
            contests.contest_id,
            contests.hacker_id,
            contests.name
    ) TBL2
        ON tbl1.contest_id = tbl2.contest_id
GROUP BY
    TBL1.contest_id,
    TBL1.hacker_id,
    TBL1.name
;
