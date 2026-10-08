-- SQL Journey — Day 09
-- Database Concepts + Real SQL Problems
-- PostgreSQL Setup + Solutions

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
department_id INT REFERENCES departments(department_id),
salary NUMERIC(10,2) CHECK (salary >= 0),
status VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO departments (department_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Sales'),
('Marketing');

INSERT INTO employees (name, email, department_id, salary)
VALUES
('Aman', '[aman@example.com](mailto:aman@example.com)', 1, 60000),
('Rahul', '[rahul@example.com](mailto:rahul@example.com)', 1, 55000),
('Priya', '[priya@example.com](mailto:priya@example.com)', 2, 50000),
('Neha', '[neha@example.com](mailto:neha@example.com)', 2, 52000),
('Arjun', '[arjun@example.com](mailto:arjun@example.com)', 3, 70000),
('Simran', '[simran@example.com](mailto:simran@example.com)', 3, 65000),
('Karan', '[karan@example.com](mailto:karan@example.com)', 4, 45000),
('Riya', '[riya@example.com](mailto:riya@example.com)', 4, 48000);

SELECT * FROM departments;
SELECT * FROM employees;

-- Q1
-- A Primary Key uniquely identifies each row in a table.
-- It cannot contain NULL values and must be unique.

-- Q2
-- A Foreign Key connects one table to another table.
-- It references a key in another table.

-- Q3
-- PRIMARY KEY uniquely identifies a row.
-- FOREIGN KEY creates a relationship between tables.

-- Q4
CREATE TABLE employee_constraints_demo (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
salary NUMERIC(10,2) CHECK (salary >= 0),
status VARCHAR(20) DEFAULT 'Active'
);

-- Q5
-- One-to-One:
-- One row in one table is related to one row in another table.
---------------------------------------------------------------

-- One-to-Many:
-- One row can be related to many rows.
-- Example: one department has many employees.
----------------------------------------------

-- Many-to-Many:
-- Many rows in one table can relate to many rows in another table.
-- Example: students and courses.

-- Q6
-- Normalization organizes data to reduce unnecessary duplication
-- and improve data consistency.

-- Q7
-- 1NF: Atomic values and no repeating groups.
-- 2NF: 1NF + non-key columns depend on the complete primary key.
-- 3NF: 2NF + non-key columns do not depend on other non-key columns.

-- Q8
-- An Index can help the database find rows faster.
-- Indexes require storage and can make INSERT, UPDATE and DELETE
-- operations more expensive because the index also needs updating.

-- Q9
CREATE INDEX idx_employee_department
ON employees(department_id);

-- Q10
-- A transaction is a group of database operations treated as one unit.

-- Q11
-- COMMIT permanently saves transaction changes.
-- ROLLBACK cancels transaction changes.

-- Q12
-- A = Atomicity
-- C = Consistency
-- I = Isolation
-- D = Durability

-- Q13
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
SELECT MAX(salary)
FROM employees
);

-- Q14
SELECT
name,
salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

-- Q15
SELECT
name,
department_id,
salary
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

-- Q16
SELECT
department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- Q17
SELECT
department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;

-- Q18
SELECT
department_id,
SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Q19
SELECT
department_id,
SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;

-- Q20
SELECT
salary,
COUNT(*) AS employee_count
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;

-- Q21
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 2
LIMIT 1;

-- Q22
SELECT
department_id,
COUNT(*) AS employee_count,
AVG(salary) AS average_salary,
MAX(salary) AS maximum_salary,
MIN(salary) AS minimum_salary
FROM employees
GROUP BY department_id;

-- Q23
SELECT
name,
department_id,
salary
FROM (
SELECT
name,
department_id,
salary,
ROW_NUMBER() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS rn
FROM employees
) t
WHERE rn = 1;

-- Q24
-- DELETE removes rows and can use a WHERE condition.
-- TRUNCATE removes all rows from a table.
-- DROP removes the table itself.

-- Q25
-- Indexes can make searches faster.
-- However, indexes require storage and can slow down
-- INSERT, UPDATE and DELETE operations.
