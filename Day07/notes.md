# SQL Day 07 Notes

# PART 1 — SUBQUERIES

## 1. What is a Subquery?

A subquery is a query written inside another SQL query.

Example:

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

The inner query finds the average salary.

The outer query finds employees earning more than that average.

Think:

```text
Outer Query
    ↓
Subquery
```

---

# 2. Subquery with WHERE

Example:

Find employees earning more than the average salary.

```sql
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

The subquery returns one value:

```text
Average salary
```

The outer query uses that value.

---

# 3. Single-Row Subquery

A subquery that returns one value is a single-row subquery.

Example:

```sql
SELECT MAX(salary)
FROM employees;
```

It returns one value.

That value can be used by the outer query.

---

# 4. Multi-Row Subquery

A subquery can return multiple values.

Example:

```sql
SELECT department_id
FROM departments
WHERE location = 'Delhi';
```

If multiple departments are returned, we can use `IN`.

```sql
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Delhi'
);
```

---

# 5. IN

`IN` checks whether a value exists in a list of values.

Example:

```sql
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);
```

---

# 6. Subquery in SELECT

A subquery can also be used inside `SELECT`.

Example:

```sql
SELECT name,
       salary,
       (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;
```

Each employee row is displayed along with the overall average salary.

---

# 7. Subquery in FROM

A subquery can act like a temporary table.

Example:

```sql
SELECT department, average_salary
FROM (
    SELECT department,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
) AS dept_salary;
```

The inner query creates a temporary result.

The outer query uses that result.

---

# 8. EXISTS

`EXISTS` checks whether a subquery returns at least one row.

Example:

```sql
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);
```

If a matching department exists, the employee is returned.

Simple idea:

```text
EXISTS
→ Does at least one matching row exist?
```

---

# 9. Correlated Subquery

A correlated subquery depends on the outer query.

Example:

```sql
SELECT e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
```

This compares each employee's salary with the average salary of their own department.

Important:

```text
Normal subquery
→ Can work independently

Correlated subquery
→ Depends on the outer query
```

---

# PART 2 — CTE

## 10. What is a CTE?

CTE means:

**Common Table Expression**

It creates a temporary named result that can be used by the main query.

Syntax:

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT *
FROM cte_name;
```

---

# 11. Simple CTE

Example:

```sql
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)
SELECT *
FROM high_salary;
```

The CTE creates `high_salary`.

The main query uses it.

---

# 12. CTE with GROUP BY

```sql
WITH dept_salary AS (
    SELECT department,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_salary;
```

---

# 13. Multiple CTEs

We can create more than one CTE.

```sql
WITH dept_count AS (
    SELECT department,
           COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
),
dept_salary AS (
    SELECT department,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_count
JOIN dept_salary
ON dept_count.department = dept_salary.department;
```

---

# 14. CTE vs Subquery

### Subquery

Query inside another query.

### CTE

A named temporary result created using `WITH`.

Simple rule:

```text
Small/simple query → Subquery

Complex/multiple-step query → CTE
```

---

# PART 3 — CASE

## 15. What is CASE?

`CASE` is used to create conditional logic in SQL.

It works similar to:

```text
if
else if
else
```

Syntax:

```sql
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

---

# 16. Simple CASE Example

```sql
SELECT name,
       salary,
       CASE
           WHEN salary >= 60000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;
```

Example result:

| name  | salary | salary_category |
| ----- | -----: | --------------- |
| Rahul |  50000 | Medium          |
| Aman  |  60000 | High            |
| Priya |  45000 | Low             |

---

# 17. CASE with GROUP BY

We can use CASE with aggregate functions.

Example:

```sql
SELECT
    CASE
        WHEN salary >= 50000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary >= 50000 THEN 'High Salary'
        ELSE 'Low Salary'
    END;
```

This counts employees in each salary category.

---

# Day 07 Quick Summary

```text
Subquery
→ Query inside another query

IN
→ Checks multiple possible values

EXISTS
→ Checks whether a matching row exists

Correlated Subquery
→ Subquery depends on outer query

CTE
→ Named temporary result using WITH

CASE
→ Conditional logic in SQL
```
