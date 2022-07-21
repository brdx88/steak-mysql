SELECT city
FROM STATION
WHERE city RLIKE '^[aiueoAIUEO]'

-- https://www.geeksforgeeks.org/rlike-operator-in-mysql/
-- RLIKE itu kayak Regexp, dia match string di SQL dengan pattern yang kita berikan
-- '^' ini tuh artinya awalan
-- '$' tuh artinya akhiran.