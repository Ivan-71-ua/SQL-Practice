
Table: Salary

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |
+-------------+----------+
id is the primary key (column with unique values) for this table.
The sex column is ENUM (category) value of type ('m', 'f').
The table contains information about an employee.


Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm'
and vice versa) with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select
statement for this problem.

UPDATE Salary
SET sex = IF(sex = 'm', 'f', 'm')