# SQL Day 03 - Aggregate Functions & GROUP BY

## Objective
Learn how to summarize data using aggregate functions and group records.

---

# Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single value.

## COUNT()

Counts the number of rows.

```sql
SELECT COUNT(*) FROM employees;
```

Count employees in a specific department.

```sql
SELECT COUNT(*)
FROM employees
WHERE department = 'IT';
```

---

## SUM()

Returns the total of a numeric column.

```sql
SELECT SUM(salary)
FROM employees;
```

---

## AVG()

Returns the average value.

```sql
SELECT AVG(salary)
FROM employees;
```

---

## MIN()

Returns the smallest value.

```sql
SELECT MIN(salary)
FROM employees;
```

---

## MAX()

Returns the largest value.

```sql
SELECT MAX(salary)
FROM employees;
```

---

# GROUP BY

Groups rows having the same values.

Example:

```sql
SELECT department,
COUNT(*)
FROM employees
GROUP BY department;
```

Result:

| Department | Count |
|------------|-------|
| HR | 3 |
| IT | 3 |
| Finance | 2 |
| Sales | 2 |

---

Another example

```sql
SELECT department,
AVG(salary)
FROM employees
GROUP BY department;
```

---

# HAVING

HAVING filters grouped results.

```sql
SELECT department,
AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

---

# WHERE vs HAVING

WHERE filters rows before grouping.

HAVING filters groups after grouping.

Example:

```sql
SELECT department,
COUNT(*)
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) >= 2;
```

---

# Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

---

# Aggregate Functions Summary

| Function | Purpose |
|----------|---------|
| COUNT() | Counts rows |
| SUM() | Adds values |
| AVG() | Average value |
| MIN() | Lowest value |
| MAX() | Highest value |

---

# Topics Covered

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING