


Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.


Write a solution to swap the seat id of every two consecutive students.
If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

SELECT s.id AS id,
CASE
WHEN id % 2 = 0 THEN (SELECT student FROM Seat WHERE id = s.id - 1)
WHEN id % 2 = 1 THEN IF(s.id + 1 IN (SELECT id FROM Seat), (SELECT student FROM Seat WHERE id = s.id + 1), s.student)
END AS student
FROM Seat s
ORDER BY s.id