SELECT email
FROM (
        SELECT *,
            ROW_NUMBER() OVER(PARTITION BY email) as row_num
        FROM person
    ) z
WHERE row_num > 1

# idenya adalah:
# 1. ngebuat tabel dengan kolom tambahan
# 2. kolom tambahannya berupa numerasi angka yang sama jika value dari data itu sama pada kolom 'email'
# 3. setelah itu, tabel tersebut dijadikan subquery
# 4. kemudian, select email dari subquery tersebut.
