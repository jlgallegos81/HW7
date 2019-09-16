-- Select employee Data and Salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
	FROM employees
	
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- Employees hired in 1986.

SELECT emp_no, last_name, first_name, hire_date 
	FROM employees

WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

ORDER BY hire_date ASC;

-- Manager of each department + department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,
	dept_manager.from_date, dept_manager.to_date
	FROM departments
	
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- Department of each employee + employee number, last name, first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM dept_emp

JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- Employees whose first name is Hercules and last names begin with B.

SELECT first_name, last_name
	FROM employees

WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- All employees in the Sales department + including employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM dept_emp
	
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE departments.dept_name = 'Sales';

-- All employees in the Sales and Development departments + employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM dept_emp
	
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE departments.dept_name = 'Sales' 
	OR departments.dept_name = 'Development';
	
-- List the frequency count of employee last names in descending order.

SELECT last_name,
	COUNT(last_name) AS "Frequency"
	FROM employees

GROUP BY last_name

ORDER BY "Frequency" DESC;