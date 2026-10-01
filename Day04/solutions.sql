select * from employees;
-- Q1
UPDATE employees
SET salary = 55000
WHERE emp_id = 1;

-- Q2
UPDATE employees
SET city = 'Shimla'
WHERE emp_id = 3;

-- Q3
UPDATE employees
SET salary = 60000,
    city = 'Delhi'
WHERE emp_id = 4;

-- Q4
DELETE FROM employees
WHERE emp_id = 10;

-- Q5
SELECT DISTINCT department
FROM employees;

-- Q6
SELECT DISTINCT city
FROM employees;

-- Q7
SELECT name AS Employee_Name
FROM employees;

-- Q8
SELECT salary AS Monthly_Salary
FROM employees;

-- Q9
SELECT AVG(salary) AS Average_Salary
FROM employees;

-- Q10
ALTER TABLE employees
ADD email VARCHAR(100);

-- Q11
ALTER TABLE employees
ADD phone_number VARCHAR(15);

-- Q12
ALTER TABLE employees
RENAME COLUMN city TO location;

-- Q13
ALTER TABLE employees
ALTER COLUMN salary TYPE BIGINT;

-- Q14
ALTER TABLE employees
DROP COLUMN phone_number;

-- Q15
UPDATE employees
SET salary = salary + 5000
WHERE department = 'IT';

-- Q16
DELETE FROM employees
WHERE salary < 45000;

-- Q17
UPDATE employees
SET location = 'Chandigarh'
WHERE department = 'HR';

-- Q18
SELECT DISTINCT department, location
FROM employees;

-- Q19
SELECT
    name AS Employee_Name,
    department AS Department,
    salary AS Monthly_Salary
FROM employees;

-- Q20
SELECT
    department AS Department,
    SUM(salary) AS Total_Salary
FROM employees
GROUP BY department;

-- Q21
UPDATE employees
SET salary = salary + (salary * 0.10);

-- Q22
DELETE FROM employees
WHERE department = 'Sales';

-- Q23
ALTER TABLE employees
ADD joining_date DATE;

-- Q24
ALTER TABLE employees
RENAME COLUMN joining_date TO hire_date;

-- Q25
ALTER TABLE employees
DROP COLUMN hire_date;