
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.


Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.


Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.


Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

SELECT с.student_id as student_id, с.student_name as student_name, с.subject_name as subject_name, COUNT(ex.student_id) AS attended_exams
FROM (SELECT * FROM Students AS st CROSS JOIN Subjects AS sb) as с
LEFT JOIN Examinations AS ex
ON с.student_id = ex.student_id AND с.subject_name = ex.subject_name
GROUP BY с.student_id, с.subject_name
ORDER BY student_id, subject_name