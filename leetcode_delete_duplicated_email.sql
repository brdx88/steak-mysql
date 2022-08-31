DELETE a                    -- delete tabel A yang berisi id yang lebih besar 
                                -- daripada pada tabel B
FROM Person a
INNER JOIN Person b
    ON a.email = b.email
WHERE a.id > b.id;