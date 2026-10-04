-- SQL Journey — Day 07
-- SUBQUERIES + CTEs + CASE
-- PostgreSQL Setup + Solutions

-- =========================================================
-- POSTGRESQL SETUP
-- =========================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Departments table
CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) NOT NULL
);

-- Employees table
CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department_id INT REFERENCES departments(department_id),
salary NUMERIC(10,2) NOT NULL
);

-- Insert departments
INSERT INTO departments (department_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Sales'),
('Marketing');

-- Insert employees
INSERT INTO employees (name, department_id, salary)
VALUES
('Aman', 1, 60000),
('Rahul', 1, 55000),
('Priya', 2, 50000),
('Neha', 2, 52000),
('Arjun', 3, 70000),
('Simran', 3, 65000),
('Karan', 4, 45000),
('Riya', 4, 48000);

-- Check the tables
SELECT * FROM departments;
SELECT * FROM employees;

-- =========================================================
-- DAY 07 — SUBQUERIES + CTEs + CASE
-- =========================================================

-- Q1
-- A subquery is a query written inside another query.

-- Q2
-- Employees earning more than the average salary.

SELECT
name,
salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

-- Q3
-- Employee(s) having the highest salary.

SELECT
name,
salary
FROM employees
WHERE salary = (
SELECT MAX(salary)
FROM employees
);

-- Q4
-- Employees working in IT or HR.

SELECT *
FROM employees
WHERE department_id IN (
SELECT department_id
FROM departments
WHERE department_name IN ('IT', 'HR')
);

-- Q5
-- Display each employee with the overall average salary.

SELECT
name,
salary,
(
SELECT AVG(salary)
FROM employees
) AS average_salary
FROM employees;

-- Q6
-- EXISTS checks whether the subquery returns at least one row.

-- Q7
-- Employees whose department exists in the departments table.

SELECT
e.name
FROM employees e
WHERE EXISTS (
SELECT 1
FROM departments d
WHERE d.department_id = e.department_id
);

-- Q8
-- A correlated subquery depends on the outer query.

-- Q9
-- Employees earning more than their department's
-- average salary.

SELECT
e.name,
e.salary,
e.department_id
FROM employees e
WHERE e.salary > (
SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id = e.department_id
);

-- =========================================================
-- CTEs
-- =========================================================

-- Q10
-- Simple CTE

WITH high_salary AS (
SELECT *
FROM employees
WHERE salary > 50000
)
SELECT *
FROM high_salary;

-- Q11
-- Department-wise average salary using a CTE.

WITH dept_salary AS (
SELECT
department_id,
AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
)
SELECT *
FROM dept_salary;

-- Q12
-- Multiple CTEs

WITH dept_count AS (
SELECT
department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
),
dept_salary AS (
SELECT
department_id,
AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
)
SELECT
dept_count.department_id,
dept_count.employee_count,
dept_salary.average_salary
FROM dept_count
JOIN dept_salary
ON dept_count.department_id = dept_salary.department_id;

-- =========================================================
-- CASE
-- =========================================================

-- Q13
-- Categorize employees based on salary.

SELECT
name,
salary,
CASE
WHEN salary >= 60000 THEN 'High'
WHEN salary >= 50000 THEN 'Medium'
ELSE 'Low'
END AS salary_category
FROM employees;

-- Q14
-- Count employees in each salary category.

SELECT
CASE
WHEN salary >= 60000 THEN 'High'
WHEN salary >= 50000 THEN 'Medium'
ELSE 'Low'
END AS salary_category,
COUNT(*) AS employee_count
FROM employees
GROUP BY
CASE
WHEN salary >= 60000 THEN 'High'
WHEN salary >= 50000 THEN 'Medium'
ELSE 'Low'
END;

-- Q15
-- CASE can be used to create conditional output.
-- It is similar to IF/ELSE logic in programming.
