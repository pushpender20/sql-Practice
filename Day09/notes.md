# SQL Day 09 — Database Concepts + Real SQL Problems

## 1. Primary Key

A Primary Key uniquely identifies every row in a table.

Example:

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

`employee_id` uniquely identifies each employee.

Important properties:

* Must be unique
* Cannot be NULL
* Identifies a row

---

## 2. Foreign Key

A Foreign Key connects one table to another table.

Example:

CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50)
);

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100),
department_id INT REFERENCES departments(department_id)
);

Here:

departments.department_id → Primary Key

employees.department_id → Foreign Key

The Foreign Key creates a relationship between the tables.

---

## 3. NOT NULL

`NOT NULL` means a column cannot contain NULL.

Example:

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

Every employee must have a name.

---

## 4. UNIQUE

`UNIQUE` prevents duplicate values.

Example:

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
email VARCHAR(100) UNIQUE
);

Two employees cannot have the same email.

---

## 5. CHECK

`CHECK` ensures that data satisfies a condition.

Example:

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
salary NUMERIC(10,2) CHECK (salary >= 0)
);

A negative salary cannot be inserted.

---

## 6. DEFAULT

`DEFAULT` provides a value automatically when no value is supplied.

Example:

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
status VARCHAR(20) DEFAULT 'Active'
);

If status is not provided, PostgreSQL inserts:

Active

---

## 7. Database Relationships

Tables can have relationships with each other.

Common types:

* One-to-One
* One-to-Many
* Many-to-Many

---

## 8. One-to-One

One row in Table A is related to one row in Table B.

Example:

One employee → One employee profile.

---

## 9. One-to-Many

One row in Table A can be related to many rows in Table B.

Example:

One department → Many employees.

This is one of the most common relationships.

---

## 10. Many-to-Many

Many rows in Table A can be related to many rows in Table B.

Example:

Students ↔ Courses

One student can take many courses.

One course can have many students.

A junction table is normally used.

Example:

student_courses

student_id

course_id

---

## 11. Normalization

Normalization is the process of organizing database data to reduce:

* Duplicate data
* Data inconsistency
* Update problems

The common normal forms are:

1NF
2NF
3NF

---

## 12. First Normal Form — 1NF

A table is in 1NF when:

* Each column contains atomic values.
* There are no repeating groups.
* Each row can be uniquely identified.

Bad example:

| student | courses          |
| ------- | ---------------- |
| Aman    | SQL, Python, C++ |

The courses column contains multiple values.

Better:

| student | course |
| ------- | ------ |
| Aman    | SQL    |
| Aman    | Python |
| Aman    | C++    |

---

## 13. Second Normal Form — 2NF

A table is in 2NF when:

* It is already in 1NF.
* Non-key columns depend on the entire primary key.

This mainly becomes important when a table has a composite primary key.

---

## 14. Third Normal Form — 3NF

A table is in 3NF when:

* It is already in 2NF.
* Non-key columns should not depend on other non-key columns.

The goal is to reduce unnecessary duplication and dependency problems.

---

## 15. Index

An index helps the database find rows faster.

Example:

CREATE INDEX idx_employee_department
ON employees(department_id);

Indexes can improve query performance.

However, indexes also have costs:

* They require storage.
* INSERT/UPDATE/DELETE operations may become more expensive because indexes must also be updated.

Do not create indexes on every column without a reason.

---

## 16. Transactions

A transaction is a group of database operations treated as one unit.

Example:

BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

If everything works, COMMIT saves the changes.

---

## 17. ROLLBACK

`ROLLBACK` cancels changes made during the current transaction.

Example:

BEGIN;

UPDATE employees
SET salary = salary + 5000;

ROLLBACK;

The salary changes are cancelled.

---

## 18. COMMIT

`COMMIT` permanently saves the changes made during the transaction.

Example:

BEGIN;

UPDATE employees
SET salary = salary + 5000;

COMMIT;

The changes are saved.

---

## 19. ACID Properties

ACID describes important properties of database transactions.

A = Atomicity

The transaction happens completely or not at all.

C = Consistency

The database remains valid before and after the transaction.

I = Isolation

Transactions should not incorrectly interfere with each other.

D = Durability

Once a transaction is committed, its changes are preserved.

---

## 20. Real SQL Problem — Second Highest Salary

A common interview problem is finding the second-highest salary.

Example:

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
SELECT MAX(salary)
FROM employees
);

---

## 21. Employees Earning More Than Average

Example:

SELECT name, salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

---

## 22. Highest Salary in Each Department

Example:

SELECT *
FROM (
SELECT
name,
department_id,
salary,
RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS salary_rank
FROM employees
) t
WHERE salary_rank = 1;

---

## 23. Count Employees Per Department

Example:

SELECT
department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

---

## 24. Departments With More Than One Employee

Example:

SELECT
department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;

---

## 25. DELETE vs TRUNCATE vs DROP

DELETE:

Removes selected rows.

Example:

DELETE FROM employees
WHERE employee_id = 5;

TRUNCATE:

Removes all rows from a table quickly.

Example:

TRUNCATE TABLE employees;

DROP:

Removes the table itself.

Example:

DROP TABLE employees;

Remember:

DELETE → rows

TRUNCATE → all rows

DROP → table

---

## 26. Important Day 09 Summary

Primary Key:

Uniquely identifies a row.

Foreign Key:

Connects tables.

NOT NULL:

Prevents NULL.

UNIQUE:

Prevents duplicate values.

CHECK:

Validates values using a condition.

DEFAULT:

Provides an automatic value.

Index:

Can improve search/query performance.

Transaction:

Group of operations treated as one unit.

COMMIT:

Save transaction.

ROLLBACK:

Cancel transaction.

ACID:

Atomicity, Consistency, Isolation, Durability.

Normalization:

Organizes data and reduces unnecessary duplication.
