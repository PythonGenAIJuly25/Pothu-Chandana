/* Question 1: Find the Start and End Number of Continuous Ranges
Problem Type: Gaps and Islands problem

Objective: Find the start and end number of continuous ranges in a table.

Input Table: Logs

+------------+
| log_id     |
+------------+
| 1          |
| 2          |
| 3          |
| 7          |
| 8          |
| 10         |
+------------+
Expected Output:

+------------+--------------+
| start_id   | end_id       |
+------------+--------------+
| 1          | 3            |
| 7          | 8            |
| 10         | 10           |
+------------+--------------+
Task: Write a SQL query to identify continuous ranges of log_id values and return the start and end of each range.
*/

-- create database Logsdb
create database logsdb;
use logsdb;

-- create table Logs
create table Logs(
log_id int Primary key);

-- insert data into the table
INSERT INTO Logs (log_id) VALUES
(1),
(2),
(3),
(7),
(8),
(10);

--  Write a SQL query to identify continuous ranges of 
-- log_id values and return the start and end of each range.

WITH NumcallsberedLogs AS (
    SELECT 
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS grp -- Subtract row number from log_id
    FROM logs
)
SELECT         
    MIN(log_id) AS start_id, -- Group and get the min
    MAX(log_id) AS end_id -- Group and get the max 
FROM NumcallsberedLogs
GROUP BY grp
ORDER BY start_id;

-- explanation: This logic effectively groups continuous ranges. 
-- Then the selected the MIN and MAX from each 
-- group to get start and end of each range.

/*
Question 2: Department Highest Salary
Problem Type: Ranking/Window Functions

Objective: Find employees who have the highest salary in each department. 
If there are multiple employees in a department with the same highest salary, include all of them.

Input Tables:

Employee table:

+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:

+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Expected Output:

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Task: Write a SQL query to find the highest-paid employee(s) in each department.

*/

-- Create Department table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

-- Insert sample data
INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee (id, name, salary, departmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);


-- Write a SQL query to find the highest-paid employee(s) in each department.
-- Method 1 - Using Window Function

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
) e
JOIN Department d ON e.departmentId = d.id
WHERE rnk = 1;

--  method 2 - Using Subquery and GROUP BY
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);

-- explanation - Using Window Function with DENSE_RANK — ensures us to get all top earners, even if tied. 
-- Using a Subquery with MAX and IN — this is a more traditional approach.

/*
Question 3: Number of Calls Between Two Persons
Problem Type: Data transformation and aggregation

Objective: Report the number of calls and total call duration between each pair of distinct persons, where person1 < person2 in the output.

Input Table: Calls

+---------+-------+----------+
| from_id | to_id | duration |
+---------+-------+----------+
| 1       | 2     | 59       |
| 2       | 1     | 11       |
| 1       | 3     | 20       |
| 3       | 4     | 100      |
| 3       | 4     | 200      |
| 3       | 4     | 200      |
| 4       | 3     | 499      |
+---------+-------+----------+
Expected Output:

+---------+---------+------------+----------------+
| person1 | person2 | call_count | total_duration |
+---------+---------+------------+----------------+
| 1       | 2       | 2          | 70             |
| 1       | 3       | 1          | 20             |
| 3       | 4       | 4          | 999            |
+---------+---------+------------+----------------+
Task: Write a SQL query to count calls and sum duration between each pair of persons, ensuring person1 < person2 in the final output.

*/

-- create table Calls

create table calls(from_id int, to_id int, duration int);

-- insert data into the Calls table
INSERT INTO calls (from_id, to_id, duration) VALUES
(1, 2, 59),
(2, 1, 11),
(1, 3, 20),
(3, 4, 100),
(3, 4, 200),
(3, 4, 200),
(4, 3, 499);

-- Write a SQL query to count calls and sum duration 
-- between each pair of persons, ensuring person1 < person2 in the final output.

SELECT 
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM Calls
GROUP BY 
    LEAST(from_id, to_id),
    GREATEST(from_id, to_id)
ORDER BY person1, person2;

-- explanation - ensures the count calls between each pair regardless of direction 
-- (1-2 same as 2-1). Then we grouped by the pair and aggregated the count and total duration.
 show tables ;