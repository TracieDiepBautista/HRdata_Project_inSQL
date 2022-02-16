-- queries

-- 1) get the required info: employee number, last name, first name, sex, and salary
-- JOIN 

select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
from employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- just try to know who is with id49994d2 from fun fact and how much is his sal
select e.emp_no, e.first_name, e.last_name , s.salary
from employees AS e 
inner join salaries AS s
on e.emp_no = s.emp_no
where e.emp_no = '499942';

-- 2) List first name, last name, and hire date for employees who were hired in 1986
select *
from employees;

SELECT first_name, last_name, hire_date 
FROM employees
WHERE extract(year from hire_date) = 1986;

-- 3) list manager of each dept with: dept_no, dept_name, manager_emp_no, last name, first name
-- JOIN 3 tables together

select e.emp_no, e.last_name, e.first_name, dm.dept_no, dp.dept_name
from employees as e
inner join dept_manager as dm
on e.emp_no = dm.emp_no
left join department as dp
on dm.dept_no = dp.dept_no;

-- 4) List the department of each employee with: employee number, last name, first name, and department name

select e.emp_no, e.last_name, e.first_name, dy.dept_no, dp.dept_name
from employees as e
inner join dept_emp as dy
on e.emp_no = dy.emp_no
left join department as dp
on dp.dept_no = dy.dept_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex 
FROM employees as e
WHERE e.first_name = 'Hercules' 
and e.last_name like 'B%';

-- 6) List all employees in the Sales department: employee number, last name, first name, and department name

select e.emp_no, e. first_name, e.last_name, dp.dept_name
from employees AS e 
inner join dept_emp as dy
on e.emp_no = dy.emp_no
left join department as dp
on dp.dept_no = dy.dept_no
where dept_name = 'Sales';

-- 7) list all employees in Sales and Development dept: last_name, first_name, emp_no, dept_name

select e.emp_no, e. first_name, e.last_name, dp.dept_name
from employees AS e 
inner join dept_emp as dy
on e.emp_no = dy.emp_no
left join department as dp
on dp.dept_no = dy.dept_no
where dept_name = 'Sales' OR dept_name = 'Development'
Order by dept_name;

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select * from employees
order by last_name DESC;

select last_name, count (*)
as "count_last_names"
from employees
group by last_name
order by "count_last_names" desc;

-- Bonus: pre_works

select e.title_id, t.title, s.salary
from employees as e
inner join titles as t
on e.title_id = t.title_id
left join salaries as s
on s.emp_no = e.emp_no;


-------- job completed, move to bonus in jupyternote ----------


