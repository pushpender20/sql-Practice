--Q1
select count(*) from employees;

--Q2
SELECT SUM(salary)
FROM employees;

--Q3
SELECT AVG(salary)
FROM employees;

--Q4
SELECT MAX(salary)
FROM employees;

--Q5
SELECT MIN(salary)
FROM employees;

--Q6
SELECT department,
COUNT(*)
FROM employees
GROUP BY department;

--Q7
SELECT department,
AVG(salary)
FROM employees
GROUP BY department;

--Q8
SELECT department,
MAX(salary)
FROM employees
GROUP BY department;

--Q9
SELECT department,
MIN(salary)
FROM employees
GROUP BY department;

--Q10
SELECT department,
SUM(salary)
FROM employees
GROUP BY department;

--Q11
SELECT department,
COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

--Q12
SELECT department,AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

--Q13
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;

--Q14
select department,avg(age) as avg_age
from employees
group by department;

--Q15
select department,max(age) as max_age
from employees
group by department;

--Q16
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

--Q17
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary ASC
LIMIT 1;

-- Q18
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE salary > 50000
GROUP BY department;

--Q19
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employees;

--Q20
select department,
COUNT(*) as employee_count,
sum(salary) as total_salary,
avg(salary) as average_salary,
max(salary) as highest_salary,
min(salary) as lowest_salary
from employees
group by department;

--Q21
select city, COUNT(*) as employee_count
from employees
group by city
having COUNT(*) > 2;

--Q22
select department,
sum(salary) as total_salary
from employees
GROUP BY department
HAVING sum(salary)>100000;

--Q23
select city,
avg(salary) as avg_salary
from employees
GROUP BY city
ORDER BY avg(salary) DESC;

--Q24
SELECT department,
COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;

--Q25
SELECT city,
AVG(salary) AS average_salary
FROM employees
GROUP BY city
ORDER BY average_salary ASC
LIMIT 1;
