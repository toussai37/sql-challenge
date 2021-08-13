# sql-challenge
Employees of the corporation from the 1980s and 1990s

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pHLyFW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


Employees
-
employee_number INT PK 
title_id VARCHAR(250) FK >- Titles.title_id  
birth_date VARCHAR(250)
first_name VARCHAR(250)
last_name VARCHAR(250) 
sex VARCHAR
hire_date VARCHAR

Departments
-
department_number VARCHAR(250) PK
department_name VARCHAR(250)


Department_Employees
-
employee_number INT FK >- Employees.employee_number
department_number VARCHAR(250) FK >- Departments.department_number


Department_Manager
-
department_number VARCHAR(250) FK >- Departments.department_number 
employee_number INT FK >- Employees.employee_number

Salaries
-
employee_number INT FK >- Employees.employee_number
salary INT
