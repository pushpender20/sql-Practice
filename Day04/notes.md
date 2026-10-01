# SQL Day 04 - UPDATE, DELETE, ALTER, DISTINCT & ALIASES

## Objective

Learn how to modify existing data, remove records, change table structure, and display unique values.

---

# 1. UPDATE

The UPDATE statement is used to modify existing records in a table.

Syntax:

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

Example:

```sql
UPDATE employees
SET salary = 60000
WHERE emp_id = 1;
```

Update multiple columns:

```sql
UPDATE employees
SET salary = 70000,
    city = 'Shimla'
WHERE emp_id = 2;
```

> Always use the WHERE clause unless you want to update every row.

---

# 2. DELETE

The DELETE statement removes records from a table.

Syntax:

```sql
DELETE FROM table_name
WHERE condition;
```

Example:

```sql
DELETE FROM employees
WHERE emp_id = 5;
```

Delete all rows:

```sql
DELETE FROM employees;
```

> DELETE removes data but keeps the table structure.

---

# 3. ALTER TABLE

Used to modify the structure of an existing table.

### Add a column

```sql
ALTER TABLE employees
ADD email VARCHAR(100);
```

### Rename a column

```sql
ALTER TABLE employees
RENAME COLUMN city TO location;
```

### Change data type

```sql
ALTER TABLE employees
ALTER COLUMN salary TYPE BIGINT;
```

### Drop a column

```sql
ALTER TABLE employees
DROP COLUMN email;
```

---

# 4. DISTINCT

Returns only unique values.

Syntax:

```sql
SELECT DISTINCT department
FROM employees;
```

Example:

Without DISTINCT

```
IT
IT
HR
HR
Sales
```

With DISTINCT

```
IT
HR
Sales
```

---

# 5. AS (Alias)

Used to give temporary names to columns or tables.

Example:

```sql
SELECT
name AS Employee_Name,
salary AS Monthly_Salary
FROM employees;
```

Another example:

```sql
SELECT AVG(salary) AS Average_Salary
FROM employees;
```

---

# Difference Between DELETE, DROP and TRUNCATE

| Command | Removes Data | Removes Table | Can Use WHERE |
|----------|-------------|--------------|---------------|
| DELETE | Yes | No | Yes |
| TRUNCATE | Yes | No | No |
| DROP | Yes | Yes | No |

---

# Topics Covered

- UPDATE
- DELETE
- ALTER TABLE
- DISTINCT
- AS (Alias)