
Table: ProductPurchases

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| product_id  | int  |
| quantity    | int  |
+-------------+------+
(user_id, product_id) is the unique key for this table.
Each row represents a purchase of a product by a user in a specific quantity.
Table: ProductInfo

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| category    | varchar |
| price       | decimal |
+-------------+---------+
product_id is the primary key for this table.
Each row assigns a category and price to a product.
Amazon wants to implement the Customers who bought this also bought... feature based on
co-purchase patterns. Write a solution to :

Identify distinct product pairs frequently purchased together by the same customers (where
product1_id < product2_id)
For each product pair, determine how many customers purchased both products
A product pair is considered for recommendation if at least 3 different customers have
purchased both products.

Return the result table ordered by customer_count in descending order, and in case of a tie,
by product1_id in ascending order, and then by product2_id in ascending order.


SELECT
    p1.product_id AS product1_id,
    p2.product_id AS product2_id,
    pi1.category AS product1_category,
    pi2.category AS product2_category,
    COUNT(p1.user_id) AS customer_count
FROM ProductPurchases p1
JOIN ProductPurchases p2
ON p1.user_id= p2.user_id AND p1.product_id < p2.product_id
JOIN ProductInfo pi1
ON pi1.product_id = p1.product_id
JOIN ProductInfo pi2
ON pi2.product_id = p2.product_id
GROUP BY product1_id, product2_id
HAVING customer_count > 2
ORDER BY customer_count DESC, product1_id, product2_id

