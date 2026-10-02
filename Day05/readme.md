# SQL Journey — Day 05

## Topic

GROUP BY + HAVING

## Goal

Learn how to:

* Group data using `GROUP BY`
* Use aggregate functions with groups
* Filter groups using `HAVING`
* Understand the difference between `WHERE` and `HAVING`

---

## Practice Table

We will use the `employees` table:

```sql
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
```

Insert sample data:

```sql
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Aman', 'IT', 60000),
(3, 'Priya', 'HR', 45000),
(4, 'Neha', 'HR', 55000),
(5, 'Raj', 'Sales', 40000),
(6, 'Karan', 'Sales', 50000);
```

---

## Topics Covered

### 1. GROUP BY

Used to group rows having the same value.

### 2. GROUP BY with Aggregate Functions

Used to calculate values for each group.

Examples:

* COUNT()
* SUM()
* AVG()
* MAX()
* MIN()

### 3. HAVING

Used to filter groups after `GROUP BY`.

### 4. WHERE vs HAVING

`WHERE` → filters individual rows.

`HAVING` → filters groups.

---

## Day 05 Practice

Complete the questions in `questions.md`.

Check your answers using `solutions.md`.

---

## Day 05 Completion Checklist

* [ ] Understand GROUP BY
* [ ] GROUP BY + COUNT
* [ ] GROUP BY + AVG
* [ ] GROUP BY + SUM
* [ ] GROUP BY + MAX
* [ ] GROUP BY + MIN
* [ ] Understand HAVING
* [ ] Understand WHERE vs HAVING
* [ ] Complete practice questions
