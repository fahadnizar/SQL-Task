create database task2;
       e.emp_name,
       e.hire_date,
       e.salary 
	   FROM employees e WHERE hire_date <'1991-04-01';
--16. From the following table, write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)
insert into salary_grade
values
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,999);
select*from salary_grade;
update salary_grade
set max_salary=9999
where grade=5;
select emp.emp_name, emp.salary  from employees emp, salary_grade sal 
where emp.emp_name='FRANK' and emp.salary between sal.min_salary and sal.max_salary and emp.salary = sal.max_salary;
--17. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries. Return complete information about the employees.  (Using Order By)
SELECT *
FROM employees
WHERE job_name NOT IN ('PRESIDENT','MANAGER')
ORDER BY salary ASC;
--18. From the following table, write a SQL query to find the highest salary. Return the highest salary.
select MAX(salary) as "max" from employees;
--19. From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration. (Using GROUP BY)
select job_name,avg(salary) as "avg" ,avg(salary+ commission) as "avg" from employees group by job_name;
--20. From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)
insert into department
values
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');
select * from department;
select emp.emp_id, emp.emp_name,dep.dep_id, dep.dep_location, dep.dep_name  from employees emp, department dep 
where emp.dep_id=dep.dep_id and emp.dep_id in ('1001','2001');
--21. From the table, write a SQL query to list the managers and number of employees work under them. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)
select manager_id, count(*) as "count" from employees group by manager_id order by manager_id asc;
--22. From the table, write a SQL query to find those departments where at least two employees work. Return department id, number of employees.(GROUP BY & HAVING)
select dep_id,count(*) as "count" from employees group by dep_id having count(*)>=2;
--23. From the table, write a SQL query to find those employees whose names contain the character set 'AR' together. Return complete information about the employees. (using �like�)
select * from employees
where emp_name like '%AR%';
--24. Add a column for �Gender� in the employee table and update each row accordingly.
alter table employees
add gender varchar(20);
update employees set gender = 'MALE' where emp_id in ('68319','66928','65646','69062','68454','69324'); 
update employees set gender = 'FEMALE' where emp_id NOT IN ('68319','66928','65646','69062','68454','69324');
select * from employees;
--25. From the above table we need to retrieve all employees except �Manager� & �President� Job name. 
select * from employees
where job_name not in ('MANAGER','PRESIDENT');
--26. From the above table we need to display �Management Level� - labelname for �President�,�Manager�,�Analyst� jobs and �Employee Level� - label name for �Salesman�,�Clerk� job names.
select distinct(job_name),
	case
		 when  job_name in ('PRESIDENT','MANAGER','ANALYST') then 'Management Level'
		 when  job_name in ('SALESMAN','CLERK') then 'Employee Level'end as 'label' from employees;
--27. Update commission field to 650.00 for job name titled as  �analyst� in �employee� table using �Exist� clauses.
update employees set commission=650.00 from employees where job_name='ANALYST' and exists(select job_name from employees where job_name='ANALYST'); 
select * from employees;