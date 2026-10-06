-- SQL Journey — Day 08
-- Window Functions + Data Cleaning
-- PostgreSQL Setup + Solutions

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department_id INT REFERENCES departments(department_id),
salary NUMERIC(10,2)
);

INSERT INTO departments (department_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Sales'),
('Marketing');

INSERT INTO employees (name, department_id, salary)
VALUES
('Aman', 1, 60000),
('Rahul', 1, 55000),
('Priya', 2, 50000),
('Neha', 2, 52000),
('Arjun', 3, 70000),
('Simran', 3, 65000),
('Karan', 4, 45000),
('Riya', 4, 48000),
('Aman', 1, 60000);

SELECT * FROM departments;
SELECT * FROM employees;

-- Q1
SELECT
name,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS department_average
FROM employees;

-- Q2
SELECT
name,
salary,
AVG(salary) OVER() AS overall_average
FROM employees;

-- Q3
SELECT
name,
salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number
FROM employees;

-- Q4
SELECT
name,
department_id,
salary,
ROW_NUMBER() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS row_number
FROM employees;

-- Q5
SELECT
name,
salary,
RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q6
SELECT
name,
salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q7
-- ROW_NUMBER() gives every row a unique number.
-- RANK() gives the same rank to ties and leaves gaps.
-- DENSE_RANK() gives the same rank to ties without leaving gaps.

-- Q8
SELECT
name,
salary,
LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employees;

-- Q9
SELECT
name,
salary,
LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employees;

-- Q10
SELECT
name,
salary,
SUM(salary) OVER(ORDER BY salary) AS running_total
FROM employees;

-- Q11
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

-- Q12
SELECT
name,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS department_average
FROM employees
WHERE salary > (
SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id = employees.department_id
);

-- Q13
SELECT *
FROM employees
WHERE salary IS NULL;

-- Q14
SELECT
name,
COALESCE(salary, 0) AS salary
FROM employees;

-- Q15
SELECT
name,
salary,
salary / NULLIF(salary, 0) AS safe_calculation
FROM employees;

-- Q16
SELECT
name,
COUNT(*) AS count
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

-- Q17
SELECT
department_id,
name,
salary,
DENSE_RANK() OVER(
PARTITION BY department_id
ORDER BY salary DESC
) AS salary_rank
FROM employees;

-- Q18
-- GROUP BY combines rows into groups and normally returns one row per group.
-- Window Functions keep the individual rows and calculate across related rows.
