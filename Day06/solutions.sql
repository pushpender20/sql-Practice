-- SQL Journey — Day 06
-- JOINS
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
-- DAY 06 — JOINS
-- =========================================================

-- Q1
-- JOIN is used to combine rows from two or more tables
-- using a related column.

-- Q2
-- Primary Key uniquely identifies a row.
-- Foreign Key connects one table to another table.

-- Q3
-- INNER JOIN
-- Display employee name and department name.

SELECT
employees.name,
departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

-- Q4
-- LEFT JOIN
-- Display all employees and their departments.

SELECT
employees.name,
departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

-- Q5
-- RIGHT JOIN
-- Display all departments and matching employees.

SELECT
employees.name,
departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;

-- Q6
-- FULL OUTER JOIN
-- Display all employees and all departments.

SELECT
employees.name,
departments.department_name
FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id;

-- Q7
-- JOIN + WHERE
-- Display employees working in IT.

SELECT
employees.name,
departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'IT';

-- Q8
-- JOIN + GROUP BY
-- Count employees in each department.

SELECT
departments.department_name,
COUNT(*) AS employee_count
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;

-- Q9
-- JOIN + GROUP BY + HAVING
-- Show departments having more than 2 employees.

SELECT
departments.department_name,
COUNT(*) AS employee_count
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name
HAVING COUNT(*) > 2;

-- Q10
-- Display department-wise total salary.

SELECT
departments.department_name,
SUM(employees.salary) AS total_salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;

-- Q11
-- INNER JOIN vs LEFT JOIN
--------------------------

-- INNER JOIN returns only matching rows.
-- LEFT JOIN returns all rows from the left table,
-- even when there is no matching row.

-- Q12
-- If an employee has no matching department,
-- LEFT JOIN returns NULL for department columns.

-- Q13
-- CROSS JOIN creates every possible combination
-- between the two tables.

SELECT
employees.name,
departments.department_name
FROM employees
CROSS JOIN departments;

-- Q14
-- ON specifies the condition used to match rows
-- between the tables.
