use organisation;

#EDA
SELECT * 
FROM employees;

## What is the employee id of the highest paid employee?
SELECT emp_id, salary AS Highest_Paid_Salary
FROM salaries 
group by salary 
order by salary DESC LIMIT 3;

## What is the name of youngest employee ?
SELECT first_name, last_name, birth_date AS BOD 
FROM employees group by BOD
order by birth_date ASC;

## What is the name of the first hired employee? 
SELECT first_name AS First , last_name AS Last, hire_date
FROM employees group by hire_date
 order by hire_date ASC;

## Query 4  # What percentage of employees are Female ?
SELECT (SELECT count(*) FROM employees
WHERE gender = 'F') * 100.0 / count(*) FROM employees;

## Query 5 # Show the employee count by department name wise, sorted alphabetically on department name.
select count(dept_emp.emp_id) AS Employee_count, dept_name
from departments INNER JOIN dept_emp
ON departments.dept_no= dept_emp.dept_no
group by dept_name
order by dept_name ASC;

## QUERY 6 ## Count the number of employees by each calendar year (take the value of year from from_date)
SELECT count(employees.emp_id) AS employee_count, extract(year FROM from_date) AS Calendar_year
from dept_emp
INNER join employees
ON dept_emp.emp_id=employees.emp_id
group by calendar_year
order by calendar_year DESC;


## QUERY 7
# Count the number of employees by each calendar year (take the value of year from from_date) ordered by calendar year exlcuding all years before 1990.

SELECT count(employees.emp_id) AS Employee_count, extract(year FROM dept_manager.from_date) AS Calendar_year, gender
FROM employees
JOIN dept_manager
ON dept_manager.emp_id=employees.emp_id
group by Calendar_year
order by Calendar_year < 1990 asc

