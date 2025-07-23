-- how to copy the data from one table to another table in sql

create database ex;
use ex;

CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees (id, name, department) VALUES
(1, 'Chandu', 'HR'),
(2, 'chandrika', 'IT'),
(3, 'chandra', 'Finance');

CREATE TABLE employees_backup (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees_backup 
select * from employees;

select * from employees_backup;