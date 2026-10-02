-- SQL Journey — Day 05
-- GROUP BY + HAVING
-- PostgreSQL Setup + Solutions

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);

INSERT INTO employees (name, department, salary)
VALUES
    ('Aman', 'IT', 60000),
    ('Rahul', 'IT', 55000),
    ('Priya', 'HR', 50000),
    ('Neha', 'HR', 52000),
    ('Arjun', 'Finance', 70000),
    ('Simran', 'Finance', 65000),
    ('Karan', 'Sales', 45000),
    ('Riya', 'Sales', 48000);

SELECT *
FROM employees;

-- Q1
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Q2
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Q3
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- Q4
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Q5
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING COUNT(*) >= 2;

-- Q6
SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Q7
SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 90000;

-- Q8
-- WHERE filters individual rows BEFORE grouping.
-- HAVING filters groups AFTER GROUP BY.