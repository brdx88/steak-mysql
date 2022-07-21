-- SELECT answer
-- FROM(
--     SELECT 
--         CONCAT(name, "(", SUBSTR(occupation,1,1), ")" ) as answer 
--     FROM occupations
--     ORDER BY name
--     ) Z
    
-- UNION


-- -- -- -- idenya adalah bikin statement berurutan. pattern sample outputnya mirip banget kayak tabel yang di-group by. tapi bedanya ini statement.
-- -- -- -- gimana caranya bikin statement dengan berurutan dan rapih kayak tabel group by?
-- -- -- -- bikin aja tabel group by, terus dibuat statement-nya per baris dari tabel; urusan urutan pada case-when mah engga ngaruh karena itu cuma rules. outputnya kan balik lagi ke rows yang ada di tabel.


-- SELECT 
--     CASE
--         WHEN occupation = 'Doctor'
--             THEN CONCAT('There are a total of ', num_occ, ' ',                                  LOWER(occupation), 's.')
--         WHEN occupation = 'Professor'
--             THEN CONCAT('There are a total of ', num_occ, ' ',                                  LOWER(occupation), 's.')
--         WHEN occupation = 'Singer'
--             THEN CONCAT('There are a total of ', num_occ, ' ',                                  LOWER(occupation), 's.')
--         WHEN occupation = 'Actor'
--             THEN CONCAT('There are a total of ', num_occ, ' ',                                  LOWER(occupation), 's.')
--     END as statement
    
-- FROM(
--     SELECT 
--         occupation, 
--         count(*) as num_occ
--     FROM occupations
--     GROUP BY 1
--     ORDER BY 
--         num_occ, 
--         occupation
--     ) a



WITH view1 as (
    SELECT *,
        CONCAT(name, "(", SUBSTR(occupation,1,1), ")" ) as answer 
    FROM occupations
    ORDER BY name
)

, view2 as (

SELECT 
    CASE
        WHEN occupation = 'Doctor'
            THEN CONCAT('There are a total of ', num_occ, ' ', LOWER(occupation), 's.')
        WHEN occupation = 'Professor'
            THEN CONCAT('There are a total of ', num_occ, ' ', LOWER(occupation), 's.')
        WHEN occupation = 'Singer'
            THEN CONCAT('There are a total of ', num_occ, ' ', LOWER(occupation), 's.')
        WHEN occupation = 'Actor'
            THEN CONCAT('There are a total of ', num_occ, ' ', LOWER(occupation), 's.')
    END as statements
    
FROM(
    SELECT 
        occupation, 
        count(*) as num_occ
    FROM occupations
    GROUP BY 1
    ORDER BY 
        num_occ, 
        occupation
    ) a
    
)

SELECT answer FROM view1
UNION
SELECT statements FROM view2
ORDER BY answer