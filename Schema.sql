DROP TABLE dept_manager, departments, dept_emp, employees, salaries, titles

SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM salaries
SELECT * FROM departments
SELECT * FROM dept_manager
SELECT * FROM titles

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(15) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL
);
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(20) NOT NULL   
);
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL
);
CREATE TABLE titles (
    title_id VARCHAR(15) NOT NULL,
    title VARCHAR(20) NOT NULL
);