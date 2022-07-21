--------------------------------------------- v1

-- SELECT
--     -- CASE
--     --     WHEN occupation = 'Doctor'
--     --         THEN name
--     --     ELSE NULL
--     -- END as Doctor
--     -- ,
--     CASE
--         WHEN occupation = 'Professor'
--             THEN name
--         ELSE NULL
--     END as Professor
--     -- ,
--     -- CASE
--     --     WHEN occupation = 'Singer'
--     --         THEN name
--     --     ELSE NULL
--     -- END AS Singer,
--     -- CASE
--     --     WHEN occupation = 'Actor'
--     --         THEN name
--     --     ELSE NULL
--     -- END as Actor
    
-- FROM OCCUPATIONS
-- ORDER BY
--     -- Doctor IS NULL
--     -- COALESCE(Doctor, 'zz')
--     -- ,
--     COALESCE(Professor, 'ZZ')
--     -- ,
--     -- COALESCE(Singer, 'SS'),
--     -- COALESCE(Actor, 'ZZ')

--------------------------------------------- v2

-- WITH view1 AS (

--     SELECT
--         CASE
--             WHEN occupation = 'Doctor'
--                 THEN name
--             ELSE NULL
--         END as Doctor
--     FROM OCCUPATIONS
--     ORDER BY Doctor IS NULL

-- )

-- , view2 AS (

--     SELECT
--         CASE
--             WHEN occupation = 'Professor'
--                 THEN name
--             ELSE NULL
--         END as Professor
--     FROM OCCUPATIONS
--     ORDER BY Professor IS NULL
    
-- )

-- , view3 AS (

--     SELECT
--         CASE
--             WHEN occupation = 'Singer'
--                 THEN name
--             ELSE NULL
--         END AS Singer
--    FROM OCCUPATIONS
--    ORDER BY Singer IS NULL

-- )

-- , view4 AS (

--     SELECT
--         CASE
--             WHEN occupation = 'Actor'
--                 THEN name
--             ELSE NULL
--         END as Actor
--     FROM OCCUPATIONS
--     ORDER BY Actor IS NULL

-- )

--------------------------------------------- v3

WITH view1 AS (

    SELECT
        CASE
            WHEN occupation = 'Doctor'
                THEN name
            ELSE NULL
        END as Doctor
    FROM OCCUPATIONS
    GROUP BY doctor
    ORDER BY Doctor IS NULL, doctor

)

, view2 AS (

    SELECT
        CASE
            WHEN occupation = 'Professor'
                THEN name
            ELSE NULL
        END as Professor
    FROM OCCUPATIONS
    GROUP BY professor
    ORDER BY Professor IS NULL, professor
    
)

, view3 AS (

    SELECT
        CASE
            WHEN occupation = 'Singer'
                THEN name
            ELSE NULL
        END AS Singer
   FROM OCCUPATIONS
   GROUP BY singer
   ORDER BY Singer IS NULL, singer

)

, view4 AS (

    SELECT
        CASE
            WHEN occupation = 'Actor'
                THEN name
            ELSE NULL
        END as Actor
    FROM OCCUPATIONS
    GROUP BY actor
    ORDER BY Actor IS NULL, actor

)

-- tinggal dijoin atau union secara horizontal


----------------------- SOLUTION FROM DISCUSSION

SELECT 
    MIN(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
    MIN(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
    MIN(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
    MIN(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
  SELECT a.Occupation,
         a.Name,
         (
            SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation       -- jadi dia mau ngurutin nama-nama dengan cara
                AND a.Name > b.Name) AS ranks       -- dari tabel yang sama, seolah2 jadi 2 tabel.
                                                    -- lalu disamain dulu OCCUPATION-nya, 
                                                    -- trus nama2 yang OCCUPATION-nya sama bakal diurutin sesuai alfabet.
                                                    -- trus baru deh dicount sesuai urutan yang nongol duluan dan tersortir sercara alfabet
  FROM Occupations AS a
) AS c
GROUP BY c.ranks;


------------------------- SOLUTION FROM ME
SELECT 
    MIN(CASE 
            WHEN Occupation = 'Doctor' 
                THEN Name 
            ELSE NULL 
        END
       ) AS Doctor,
    MIN(CASE 
            WHEN Occupation = 'Professor' 
                THEN Name 
            ELSE NULL 
        END
       ) AS Professor,
    MIN(CASE 
            WHEN Occupation = 'Singer' 
                THEN Name 
            ELSE NULL 
        END
       ) AS Singer,
    MIN(CASE 
            WHEN Occupation = 'Actor' 
                THEN Name 
            ELSE NULL 
        END
       ) AS Actor

-- MIN/MAX itu buat reduce NULL at the lowest level


FROM (
        SELECT 
            Occupation,
            Name,
            ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) ROW_NUM
        FROM Occupations
        ) c

-- modif database supaya keluar angka berdasarkan urutan alfabet nama, group by pekerjaan
-- supaya nanti bisa dimainin urutannya secara leluasa.

GROUP BY c.row_num