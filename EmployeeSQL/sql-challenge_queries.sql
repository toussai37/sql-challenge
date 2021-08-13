-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pHLyFW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Employees" (
    "employee_number" INT   NOT NULL,
    "title_id" VARCHAR(250)   NOT NULL,
    "birth_date" VARCHAR(250)   NOT NULL,
    "first_name" VARCHAR(250)   NOT NULL,
    "last_name" VARCHAR(250)   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "Departments" (
    "department_number" VARCHAR(250)   NOT NULL,
    "department_name" VARCHAR(250)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "Department_Employees" (
    "employee_number" INT   NOT NULL,
    "department_number" VARCHAR(250)   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "department_number" VARCHAR(250)   NOT NULL,
    "employee_number" INT   NOT NULL
);

CREATE TABLE "Salaries" (
    "employee_number" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(250)   NOT NULL,
    "title" VARCHAR(250)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_title_id" FOREIGN KEY("title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_department_number" FOREIGN KEY("department_number")
REFERENCES "Departments" ("department_number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_department_number" FOREIGN KEY("department_number")
REFERENCES "Departments" ("department_number");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");


SELECT * FROM "Employees";
SELECT * FROM "Departments";
SELECT * FROM "Department_Manager";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";
SELECT * FROM "Department_Employees";


--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees".employee_number, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
JOIN "Salaries"
ON "Employees".employee_number = "Salaries".employee_number;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date LIKE '%1986'; 


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Departments".department_number, "Departments".department_name, "Department_Manager".employee_number, "Employees".last_name, "Employees".first_name
FROM "Departments"
JOIN "Department_Manager"
ON "Departments".department_number = "Department_Manager".department_number
JOIN "Employees"
ON "Department_Manager".employee_number = "Employees".employee_number;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Department_Employees".employee_number, "Employees".last_name, "Employees".first_name, "Departments".department_name
FROM "Department_Employees"
JOIN "Employees"
ON "Department_Employees".employee_number = "Employees".employee_number
JOIN "Departments"
ON "Department_Employees".department_number = "Departments".department_number;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Department_Employees".employee_number, "Employees".last_name, "Employees".first_name, "Departments".department_name
FROM "Department_Employees"
JOIN "Employees"
ON "Department_Employees".employee_number = "Employees".employee_number
JOIN "Departments"
ON "Department_Employees".department_number = "Departments".department_number
WHERE department_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Department_Employees".employee_number, "Employees".last_name, "Employees".first_name, "Departments".department_name
FROM "Department_Employees"
JOIN "Employees"
ON "Department_Employees".employee_number = "Employees".employee_number
JOIN "Departments"
ON "Department_Employees".department_number = "Departments".department_number
WHERE department_name = 'Sales' OR department_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency_count"
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;