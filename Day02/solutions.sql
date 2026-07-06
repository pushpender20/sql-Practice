---Q1
select first_name,department,salary from employees where salary >60000 and department = 'IT';

--Q2
select * from employees where city = 'Delhi' and age > 25;

---Q3
select * from employees where department = 'HR' or department = 'Finance';

---Q4
select * from employees where salary >50000 and salary < 70000;

---Q5
select * from employees where city != 'chandigarh';

---Q6
select * from employees where department !='IT' and salary > 50000;

---Q7
select * from employees ORDER BY salary DESC LIMIT 5;

---Q8
select * from employees ORDER BY age ASC LIMIT 5;

---Q9
select * from employees where department ='IT' ORDER BY salary  DESC LIMIT 3;

---Q10
select * from employees ORDER BY age  DESC LIMIT 1;

---Q11
select first_name, last_name, city from employees where city ='shimla';

---Q12
select first_name, salary from employees where salary > 65000;

---Q13
select first_name, department from employees where city ='Banglore';

---Q14
select * from employees where department='IT'and (city ='Banglore' or city='Delhi');

---Q15
select * from employees where salary>60000 and age<30;

---Q16
select * from employees where city != 'Delhi' and city != 'Banglore';

---Q17
select *from employees where department='Finance' and age <30;

---Q18
select *from employees where salary>70000 ORDER BY salary DESC;

--CHALLENGE QUESTIONS


---CHALLENGE 1
SELECT first_name,city,salary 
from employees where department='IT' 
and salary >60000 and city='Banglore' 
ORDER BY salary DESC;


---CHALLENGE 2
select first_name,department,age 
from employees 
where age>25 AND
(department='HR' or department='Finance')
order by age ASC;


---CHALLENGE 3

select first_name,department,salary,city
from employees
where salary > 65000 AND
(city='Delhi' or city='Banglore')
order by salary DESC
limit 2;


