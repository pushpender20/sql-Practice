# SQL Day 02 - Filtering and Sorting Data

## Objective

Learn how to retrieve only the required data from a table using conditions and sort the results efficiently.

---

# 1. WHERE Clause

The `WHERE` clause is used to filter records based on a condition.

### Syntax

```sql
SELECT column_name
FROM employees
WHERE condition;
```

Example

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Returns only employees from the IT department.

---

# 2. Comparison Operators

These operators are used inside the `WHERE` clause.

| Operator | Meaning |
|----------|---------|
| = | Equal To |
| != | Not Equal To |
| > | Greater Than |
| < | Less Than |
| >= | Greater Than or Equal To |
| <= | Less Than or Equal To |

Example

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

---

# 3. Logical Operators

Logical operators allow multiple conditions to be combined.

---

## AND

Both conditions must be TRUE.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;
```

Think of AND as an intersection.

Employee must satisfy **every condition**.

---

## OR

At least one condition must be TRUE.

```sql
SELECT *
FROM employees
WHERE city = 'Delhi'
OR city = 'Shimla';
```

Think of OR as a union.

Employee can satisfy either condition.

---

## NOT

Returns the opposite result.

```sql
SELECT *
FROM employees
WHERE NOT department = 'HR';
```

Returns every employee except HR.

---

# 4. ORDER BY

Used to sort records.

Default sorting is Ascending (ASC).

```sql
SELECT *
FROM employees
ORDER BY salary;
```

Descending Order

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

Multiple Column Sorting

```sql
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;
```

SQL first sorts by department.
Inside each department it sorts salary from highest to lowest.

---

# 5. LIMIT

Returns only a specified number of rows.

```sql
SELECT *
FROM employees
LIMIT 5;
```

Example

Top 3 highest salaries

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

# 6. Combining Clauses

Most SQL interview questions combine multiple clauses.

Example

```sql
SELECT first_name, salary
FROM employees
WHERE department = 'IT'
AND city = 'Delhi'
ORDER BY salary DESC
LIMIT 3;
```

Execution Order

1. FROM
2. WHERE
3. SELECT
4. ORDER BY
5. LIMIT

Remember:

SQL executes in a different order than we write it.

---

# Best Practices

✔ Select only the required columns.

❌ Avoid

```sql
SELECT *
```

when only two columns are needed.

✔ Write SQL keywords in uppercase.

Example

```sql
SELECT first_name
FROM employees
WHERE salary > 60000;
```

✔ Format queries properly.

Poor

```sql
SELECT * FROM employees WHERE salary>60000;
```

Better

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

Readable SQL is professional SQL.

---

# Common Beginner Mistakes

### Forgetting Quotes

Correct

```sql
WHERE city = 'Delhi';
```

Incorrect

```sql
WHERE city = Delhi;
```

---

### Using AND instead of OR

Wrong

```sql
WHERE city='Delhi'
AND city='Shimla';
```

No employee can belong to two cities at once.

Correct

```sql
WHERE city='Delhi'
OR city='Shimla';
```

---

### Forgetting DESC

```sql
ORDER BY salary;
```

returns Lowest → Highest

If the question asks for Highest Salary

Use

```sql
ORDER BY salary DESC;
```

---

### LIMIT without ORDER BY

Wrong

```sql
SELECT *
FROM employees
LIMIT 5;
```

This simply returns the first five stored rows.

Correct

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

Returns the top five highest-paid employees.

---

# Interview Tips

When solving SQL questions:

Step 1 → Identify the table.

Step 2 → Identify the required columns.

Step 3 → Apply filtering using WHERE.

Step 4 → Combine conditions using AND or OR.

Step 5 → Sort the result if required.

Step 6 → Limit the output if required.

Always read the question twice before writing the query.

---

# Key Takeaways

- WHERE filters rows.
- Comparison operators compare values.
- AND requires every condition to be true.
- OR requires at least one condition to be true.
- NOT excludes matching records.
- ORDER BY sorts data.
- DESC sorts from highest to lowest.
- LIMIT restricts the number of rows returned.
- Most interview questions combine multiple clauses.