# SQL Day 08 — Window Functions + Data Cleaning

## 1. Window Functions

A Window Function performs a calculation across related rows without combining those rows into one row.

Example:

SELECT
name,
department,
salary,
AVG(salary) OVER(PARTITION BY department) AS department_average
FROM employees;

GROUP BY gives one row per group.

Window Functions keep the individual rows and add the calculation to them.

---

## 2. OVER()

`OVER()` tells PostgreSQL that a Window Function is being used.

Example:

SELECT
name,
salary,
AVG(salary) OVER() AS overall_average
FROM employees;

The overall average appears on every row.

---

## 3. PARTITION BY

`PARTITION BY` divides rows into groups for the Window Function.

Example:

SELECT
name,
department,
salary,
AVG(salary) OVER(PARTITION BY department) AS department_average
FROM employees;

Each department gets its own average.

Important:

PARTITION BY does not remove rows.

---

## 4. ORDER BY Inside a Window Function

Example:

SELECT
name,
salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number
FROM employees;

The rows are numbered according to salary from highest to lowest.

---

## 5. ROW_NUMBER()

`ROW_NUMBER()` gives every row a unique number.

Example:

SELECT
name,
salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number
FROM employees;

Result concept:

Highest salary → 1

Second highest → 2

Third highest → 3

Even if two employees have the same salary, they receive different numbers.

---

## 6. ROW_NUMBER() With PARTITION BY

Example:

SELECT
name,
department,
salary,
ROW_NUMBER() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS row_number
FROM employees;

The numbering starts again for every department.

Example:

IT:
1
2

HR:
1
2

Finance:
1
2

---

## 7. RANK()

`RANK()` gives the same rank to tied values.

Example:

Salaries:

70000
70000
60000

Ranks:

1
1
3

There is a gap after the tie.

---

## 8. DENSE_RANK()

`DENSE_RANK()` also gives the same rank to tied values but does not leave a gap.

Example:

Salaries:

70000
70000
60000

Dense ranks:

1
1
2

---

## 9. ROW_NUMBER vs RANK vs DENSE_RANK

ROW_NUMBER:

1
2
3

RANK:

1
1
3

DENSE_RANK:

1
1
2

Interview question:

What is the difference?

Answer:

ROW_NUMBER always gives unique numbers.

RANK gives the same rank to ties and leaves gaps.

DENSE_RANK gives the same rank to ties but does not leave gaps.

---

## 10. LAG()

`LAG()` accesses a previous row.

Example:

SELECT
name,
salary,
LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employees;

Useful for:

* Previous month's sales
* Previous day's revenue
* Previous salary
* Growth calculations

---

## 11. LEAD()

`LEAD()` accesses the next row.

Example:

SELECT
name,
salary,
LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employees;

Remember:

LAG → Previous row

LEAD → Next row

---

## 12. Running Total

A running total can be calculated using SUM() with a Window Function.

Example:

SELECT
name,
salary,
SUM(salary) OVER(ORDER BY salary) AS running_total
FROM employees;

The calculation continues row by row.

---

## 13. Top Employee Per Department

A common SQL interview problem is finding the highest-paid employee from every department.

Example:

SELECT *
FROM (
SELECT
name,
department,
salary,
ROW_NUMBER() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS rn
FROM employees
) t
WHERE rn = 1;

Logic:

1. Divide employees by department.
2. Sort salary from highest to lowest.
3. Give each employee a row number.
4. Select row number 1.

---

## 14. NULL

NULL represents a missing or unknown value.

NULL is not:

0

NULL is not:

''

To find NULL values:

SELECT *
FROM employees
WHERE salary IS NULL;

To find non-NULL values:

SELECT *
FROM employees
WHERE salary IS NOT NULL;

Do not use:

salary = NULL

Use:

salary IS NULL

---

## 15. COALESCE()

`COALESCE()` replaces NULL with another value.

Example:

SELECT
name,
COALESCE(salary, 0) AS salary
FROM employees;

If salary is NULL, the result becomes 0.

---

## 16. NULLIF()

`NULLIF()` returns NULL when two values are equal.

Example:

SELECT NULLIF(10, 10);

Result:

NULL

A common use is preventing division by zero.

Example:

SELECT sales / NULLIF(quantity, 0)
FROM sales;

If quantity is 0, it becomes NULL instead of causing a division-by-zero error.

---

## 17. Finding Duplicates

To find duplicate names:

SELECT
name,
COUNT(*) AS count
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

The query groups identical names and displays names appearing more than once.

---

## 18. Important Day 08 Summary

Window Function:

Performs calculations across rows while keeping individual rows.

OVER():

Defines the Window Function.

PARTITION BY:

Divides rows into groups.

ROW_NUMBER():

Unique row number.

RANK():

Same rank for ties, gaps after ties.

DENSE_RANK():

Same rank for ties, no gaps.

LAG():

Previous row.

LEAD():

Next row.

COALESCE():

Replaces NULL.

NULLIF():

Returns NULL when two values are equal.

---

## Interview Reminder

One of the most important differences to remember:

GROUP BY → combines rows into groups.

Window Function → keeps rows and calculates across them.
