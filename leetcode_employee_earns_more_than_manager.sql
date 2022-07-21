SELECT a.name as Employee
FROM employee a
INNER JOIN employee b
    ON a.managerid = b.id
WHERE a.salary > b.salary


-- # jadi ini idenya adalah
-- # 1. dijoin dulu dengan tabel yang sama tapi aliasnya berbeda, 
-- # 2. tapi dijoin bersifat 'inner' supaya bisa ngebandingin salary-nya.
-- # 3. ngebandingin salary: ngefilter row mana aja yang lolos filter.