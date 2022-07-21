SELECT 
    CASE
        WHEN N in (SELECT DISTINCT P FROM BST) AND P IS NULL
            THEN CONCAT(N, ' Root')
        WHEN N in (SELECT DISTINCT P FROM BST)
            THEN CONCAT(N, ' Inner')
        ELSE CONCAT(N, ' Leaf')
    END as type_of_tree
FROM BST
ORDER BY N