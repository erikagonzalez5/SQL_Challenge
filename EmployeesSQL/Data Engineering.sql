--created tables

CREATE TABLE titles (
    title_id VARCHAR(5)  NOT NULL ,
    title VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no integer  NOT NULL ,
    emp_title_id VARCHAR(5)  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name VARCHAR(30)  NOT NULL ,
    last_name VARCHAR(30)  NOT NULL ,
    sex VARCHAR(1)  NOT NULL ,
    hire_date date  NOT NULL ,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR(4)  NOT NULL ,
    dept_name VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no integer  NOT NULL ,
    dept_no VARCHAR(4)  NOT NULL ,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4)  NOT NULL ,
    emp_no integer  NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no integer  NOT NULL ,
    salary integer  NOT NULL ,
    PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--constraints were addded for the tables

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);