1. List the following details of each employee: 
employee number, last name, first name, sex, and salary.


SELECT emp_no, first_name, last_name, sex, salary
FROM employees
NATURAL JOIN salaries


2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE (SELECT EXTRACT(YEAR FROM hire_date)::INTEGER = 1986)




3. List the manager of each department with the following information: department number, department name, the managers employee number, last name, first name.


SELECT first_name,last_name, dept_manager.dept_no, dept_manager.emp_no, dept_name FROM employees
JOIN 
dept_manager ON dept_manager.emp_no = employees.emp_no 
JOIN departments ON dept_manager.dept_no = departments.dept_no


4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT first_name, last_name, employees.emp_no, dept_name FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no



5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


SELECT * FROM employees WHERE last_name ~ '[B]' AND first_name ~'Hercules'


6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


SELECT first_name, last_name, employees.emp_no, dept_name FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' 



7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


SELECT first_name, last_name, employees.emp_no, dept_name FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'


8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


SELECT last_name, COUNT(last_name) AS last_name_count 
FROM employees 
GROUP BY last_name
ORDER BY COUNT(last_name) DESC 