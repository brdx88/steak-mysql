SELECT name as Customers
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customerid
WHERE o.customerid IS NULL

-- # idenya adalah:
-- # 1. left join 2 tabel supaya nanti ada yang null
-- # 2. nah dijoin dengan id pada customer dengan customerid pada order
-- # 3. id pada tabel order menunjukkan bahwa order id, bukan customer id
-- # 4. setelah dijoin, filter dengan customerid atau id milik tabel order yang NULL