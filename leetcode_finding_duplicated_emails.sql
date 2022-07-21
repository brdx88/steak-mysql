SELECT Email
FROM PERSON
GROUP BY Email
HAVING COUNT(1) > 1

# idenya adalah:
# 1. dibuat group by, terus dilihat mana email yang nongol lebih dari 1
# 2. setelah keliatan ada yang lebih dari 1, ambil deh row tersebut.