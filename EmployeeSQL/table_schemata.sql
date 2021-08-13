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


