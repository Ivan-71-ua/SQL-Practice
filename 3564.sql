

Table: sales

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| sale_id       | int     |
| product_id    | int     |
| sale_date     | date    |
| quantity      | int     |
| price         | decimal |
+---------------+---------+
sale_id is the unique identifier for this table.
Each row contains information about a product sale including the product_id, date of sale, quantity sold,
and price per unit.
Table: products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| product_name  | varchar |
| category      | varchar |
+---------------+---------+
product_id is the unique identifier for this table.
Each row contains information about a product including its name and category.
Write a solution to find the most popular product category for each season. The seasons are defined as:

Winter: December, January, February
Spring: March, April, May
Summer: June, July, August
Fall: September, October, November
The popularity of a category is determined by the total quantity sold in that season. If there is
a tie, select the category with the highest total revenue (quantity × price).

Return the result table ordered by season in ascending order.



WITH sales_enriched AS (
  SELECT
    CASE
      WHEN MONTH(s.sale_date) IN (12, 1, 2)  THEN 'Winter'
      WHEN MONTH(s.sale_date) IN (3, 4, 5)   THEN 'Spring'
      WHEN MONTH(s.sale_date) IN (6, 7, 8)   THEN 'Summer'
      ELSE 'Fall'
    END AS season,
    p.category,
    s.quantity,
    s.price
  FROM sales AS s
  JOIN products AS p USING (product_id)
),
season_category AS (
  SELECT
    season,
    category,
    SUM(quantity)                    AS total_quantity,
    SUM(quantity * price)            AS total_revenue
  FROM sales_enriched
  GROUP BY season, category
),
ranked AS (
  SELECT
    season,
    category,
    total_quantity,
    total_revenue,
    ROW_NUMBER() OVER (
      PARTITION BY season
      ORDER BY total_quantity DESC, total_revenue DESC
    ) AS rn
  FROM season_category
)
SELECT
  season,
  category,
  total_quantity,
  total_revenue
FROM ranked
WHERE rn = 1
ORDER BY season ASC;
