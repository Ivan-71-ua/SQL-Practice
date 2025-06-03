# SQL Practice Tasks

This repository contains a collection of SQL tasks and practice queries written in **MySQL**.  
The goal is to reinforce core database concepts through real-world examples.


## 🧠 Topics Covered

- Table creation and schema design
- Data insertion and updates
- Basic and advanced `SELECT` queries
- Filtering with `WHERE`, `IN`, `LIKE`
- Aggregation with `GROUP BY`, `HAVING`
- Sorting with `ORDER BY`
- Subqueries and nested selects
- `JOIN` operations (`INNER`, `LEFT`, `RIGHT`, `FULL`)
- Views, aliases, and formatting

## ⚙️ Example Query

```sql
-- Find the names of students with the highest grade
SELECT name
FROM students
WHERE grade = (
    SELECT MAX(grade) FROM students
);
