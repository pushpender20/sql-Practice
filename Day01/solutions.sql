--Q1
SELECT * FROM employees;

--Q2
select first_name FROM employees;

--Q3
select first_name,salary FROM employees;

--Q4
select * from employees where department = 'IT';

--Q5
select * from employees where salary > 50000;

--Q6
select * from employees where salary < 50000;

--Q7
select * from employees where age > 28;

--Q8
select * from employees where department = 'HR';

--Q9
select * from employees where department = 'IT' and salary > 50000;

--Q10
select * from employees where department = 'IT' or department = 'HR';

--Q11
select * from employees order by salary ASC;

--Q12
select * from employees order by salary DESC;

--Q13
select * from employees order by age ASC;

--Q14
select * from employees limit 3;

--Q15
select * from employees where salary != 45000;