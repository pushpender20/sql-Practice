# SQL Day 05 Notes

## 1. GROUP BY

`GROUP BY` is used to group rows that have the same value.

### Syntax

```sql
SELECT column, aggregate_function(column)
FROM table
GROUP BY column;
```

### Example

```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department;
```

This gives the number of employees in each department.

---

## 2. GROUP BY + COUNT()

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

Counts employees in each department.

---

## 3. GROUP BY + AVG()

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

Finds the average salary of each department.

---

## 4. GROUP BY + SUM()

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

Finds the total salary of each department.

---

## 5. GROUP BY + MAX()

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
```

Finds the highest salary in each department.

---

## 6. GROUP BY + MIN()

```sql
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;
```

Finds the lowest salary in each department.

---

# 7. HAVING

`HAVING` is used to filter groups created by `GROUP BY`.

### Example

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;
```

This shows only departments having more than one employee.

---

# 8. WHERE vs HAVING

### WHERE

Filters individual rows.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

### HAVING

Filters groups.

```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

### Easy way to remember

```text
WHERE  → Rows
GROUP BY → Groups
HAVING → Groups after grouping
```

---

# Important Rule

If you select a normal column along with an aggregate function, that normal column generally needs to be included in `GROUP BY`.

Example:

```sql
SELECT department, AVG(salary)
FROM employees
GROUP BY department;
```

---

# Day 05 Summary

```text
GROUP BY → Creates groups

COUNT() → Counts rows

SUM() → Calculates total

AVG() → Calculates average

MAX() → Finds maximum

MIN() → Finds minimum

HAVING → Filters groups
```
