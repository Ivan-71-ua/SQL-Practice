


able: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a
    customer, their name, and the id of the customer who referred them.


Find the names of the customer that are either:

referred by any customer with id != 2.
not referred by any customer.
Return the result table in any order.


SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL