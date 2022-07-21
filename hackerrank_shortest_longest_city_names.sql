WITH view1 as (
    SELECT city, length(city) 
    FROM STATION
    WHERE length(city) = 
            (
                SELECT MIN(length_city)
                FROM (
                        SELECT city, LENGTH(city) as length_city
                        FROM station
                        ORDER BY city
                    ) Y 
            )
    ORDER BY city
    LIMIT 1
)

,view2 as (
    SELECT city, length(city) 
    FROM STATION
    WHERE length(city) = 
            (
                SELECT MAX(length_city)
                FROM (
                        SELECT city, LENGTH(city) as length_city
                        FROM station
                        ORDER BY city
                        ) Z
            )
)

SELECT * FROM view1
UNION
SELECT * FROM view2