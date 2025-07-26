Table: Products

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company products.


Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.


Write a solution to get the names of products that have at least 100
units ordered in February 2020 and their amount.

Return the result table in any order.

SELECT a.product_name, SUM(b.unit) AS unit
FROM Products a JOIN Orders b
ON a.product_id = b.product_id
WHERE YEAR(b.order_date) = 2020 AND MONTH(b.order_date) = 2
GROUP BY b.product_id
HAVING SUM(unit) >= 100