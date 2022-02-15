
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Y0XiQd
-- drop tables if they are exist

drop table department;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;

-- import data from csv after create table from quick diagram
CREATE TABLE "department" (
    "dept_no" varchar(255)   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

select * from department;

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

select * from dept_emp;

CREATE TABLE "dept_manager" (
    "dept_no" varchar(255)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

select * from dept_emp;

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "title_id" varchar(255)   NOT NULL,
    "birthday" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

select * from employees;

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

select * from salaries;

CREATE TABLE "titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(25)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

select * from titles;

ALTER TABLE "department" ADD CONSTRAINT "fk_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

--ALTER TABLE Persons
--ADD PRIMARY KEY (ID);

-- multiple column as PK:
--ALTER TABLE Persons
-- ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

--ALTER TABLE Orders
--ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE dept_emp ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

select * from dept_emp;




