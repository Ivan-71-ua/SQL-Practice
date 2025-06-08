

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1