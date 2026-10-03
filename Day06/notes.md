# SQL Day 06 Notes

# 1. What is a JOIN?

A JOIN is used to combine data from two or more tables.

Tables are usually connected using a related column.

Example:

### Employees

| id | name  | department_id |
| -: | ----- | ------------: |
|  1 | Rahul |            10 |
|  2 | Aman  |            20 |
|  3 | Priya |            10 |

### Departments

| department_id | department_name |
| ------------: | --------------- |
|            10 | IT              |
|            20 | HR              |

Here:

```text
employees.department_id
        ↓
departments.department_id
```

These columns connect the two tables.

---

# 2. Primary Key and Foreign Key

### Primary Key

Uniquely identifies each row.

Example:

```sql
department_id INT PRIMARY KEY
```

### Foreign Key

A column that refers to a key in another table.

Example:

```sql
department_id INT REFERENCES departments(department_id)
```

Simple idea:

```text
Primary Key → Main identifier

Foreign Key → Connection to another table
```

---

# 3. INNER JOIN

Returns only matching rows from both tables.

### Syntax

```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

### Example

```sql
SELECT employees.name,
       departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;
```

Only employees having a matching department are returned.

---

# 4. LEFT JOIN

Returns:

* All rows from the left table
* Matching rows from the right table

If there is no match, the right-side columns contain `NULL`.

### Example

```sql
SELECT employees.name,
       departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;
```

Think:

```text
LEFT JOIN → Keep everything from the LEFT table
```

---

# 5. RIGHT JOIN

Returns:

* All rows from the right table
* Matching rows from the left table

### Example

```sql
SELECT employees.name,
       departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;
```

Think:

```text
RIGHT JOIN → Keep everything from the RIGHT table
```

---

# 6. FULL OUTER JOIN

Returns:

* Matching rows
* Unmatched rows from the left table
* Unmatched rows from the right table

### Example

```sql
SELECT employees.name,
       departments.department_name
FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id;
```

Think:

```text
FULL JOIN → Keep everything from both tables
```

---

# 7. CROSS JOIN

Returns every possible combination of rows from both tables.

### Example

```sql
SELECT employees.name,
       departments.department_name
FROM employees
CROSS JOIN departments;
```

If there are:

```text
3 employees × 2 departments
```

The result contains:

```text
6 rows
```

---

# 8. JOIN + WHERE

We can filter the joined result.

Example:

```sql
SELECT employees.name,
       departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'IT';
```

This returns employees belonging to IT.

---

# 9. JOIN + GROUP BY

We can group joined data.

Example:

```sql
SELECT departments.department_name,
       COUNT(*) AS employee_count
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;
```

This finds the number of employees in each department.

---

# 10. JOIN + HAVING

We can also filter groups.

Example:

```sql
SELECT departments.department_name,
       COUNT(*) AS employee_count
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name
HAVING COUNT(*) > 2;
```

This shows departments having more than 2 employees.

---

# 11. Joining More Than Two Tables

SQL can join multiple tables.

Example:

```sql
SELECT employees.name,
       departments.department_name,
       companies.company_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
JOIN companies
ON departments.company_id = companies.company_id;
```

The important idea is:

```text
Table 1
   ↓
Table 2
   ↓
Table 3
```

---

# Quick JOIN Summary

```text
INNER JOIN
→ Only matching rows

LEFT JOIN
→ Everything from left + matching right

RIGHT JOIN
→ Everything from right + matching left

FULL OUTER JOIN
→ Everything from both tables

CROSS JOIN
→ Every possible combination
```

# Most Important JOIN Syntax

```sql
SELECT columns
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;
```

Remember:

```text
JOIN → Which tables?
ON   → How are they connected?
WHERE → Which rows?
GROUP BY → How should they be grouped?
HAVING → Which groups?
```
