/*
BST: N, P
N, type of node
ORDER BY N asc
*/
SELECT
    N,
    "Root"
FROM
    BST
WHERE
    P is null
UNION
SELECT
    N,
    "Inner"
FROM
    BST
WHERE
    N in (SELECT P FROM BST) AND
    P IS NOT NULL
UNION
SELECT
    N,
    "Leaf"
FROM
    BST
WHERE
    N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL)
ORDER BY
    N;