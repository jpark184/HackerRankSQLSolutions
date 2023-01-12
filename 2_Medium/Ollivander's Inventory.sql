/*
id,age,coins_needed,power
power desc, age desc
min coins
*/

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM
    wands w
LEFT JOIN
    wands_property wp
        ON w.code = wp.code
WHERE
    wp.is_evil = 0
    AND
    w.coins_needed =
        (
        SELECT
            MIN(wands.coins_needed)
        FROM
            wands
        LEFT JOIN
            wands_property
                ON wands_property.code = wands.code
        WHERE
            wands.power = w.power
            AND
            wands_property.age = wp.age
        )
ORDER BY
    w.power desc,
    wp.age desc