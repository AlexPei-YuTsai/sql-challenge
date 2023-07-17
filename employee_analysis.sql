-- This section is just to check if tables are properly imported
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- DATA ANALYSIS
-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;
-- 36,150 employees were hired in that calendar year

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.emp_no, last_name, first_name, dept_manager.dept_no, dept_name FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
ORDER BY dept_no, emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, last_name, first_name, dept_name FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'
ORDER BY last_name;
-- There are 20 employees in this company named Hercules with a last name that starts with the letter B

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT dept_name, dept_emp.emp_no, last_name, first_name FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.dept_no = 'd007'
ORDER BY emp_no;
-- There are 52,245 employees working in Sales(d007)

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT dept_name, dept_emp.emp_no, last_name, first_name FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.dept_no IN ('d005', 'd007')
ORDER BY dept_name, emp_no;
-- There are 137,952 employees working in either Development(d005) or Sales(d007)

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Frequency of Last Name" FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Name" DESC;
-- The most popular last name by frequency is Baba at 226 occurrences
