Table: customer_transactions

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| transaction_id   | int     |
| customer_id      | int     |
| transaction_date | date    |
| amount           | decimal |
| transaction_type | varchar |
+------------------+---------+
transaction_id is the unique identifier for this table.
transaction_type can be either 'purchase' or 'refund'.
Write a solution to find loyal customers. A customer is considered loyal if they meet ALL the following criteria:

Made at least 3 purchase transactions.
Have been active for at least 30 days.
Their refund rate is less than 20% .
Return the result table ordered by customer_id in ascending order.


SELECT customer_id
FROM (
SELECT customer_id ,
SUM(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_cnt,
SUM(CASE WHEN transaction_type = 'refund' THEN 1 ELSE 0 END) AS refund_cnt,
MIN(transaction_date) AS first_tx_date,
MAX(transaction_date) AS last_tx_date,
COUNT(*) AS total_cnt
FROM customer_transactions
GROUP BY customer_id
) AS Subq
WHERE  purchase_cnt > 2 AND DATEDIFF(last_tx_date, first_tx_date) > 29 AND refund_cnt * 1.0 / total_cnt < 0.2
ORDER BY customer_id