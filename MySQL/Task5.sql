-- Basic Queries (SELECT, WHERE, ORDER BY): 
use devs;

select * from programmers;

-- 1. List the names and dates of birth of all programmers.
select programmer_name, DOB 
from programmers;

-- 2. Display the names of programmers whose primary language is 'Python'.
select programmer_name
from programmers
where Primary_language = 'Python';

-- 3. Show the names of programmers who joined the company after the year 2000.
select programmer_name 
from programmers
where DOJ > 2000;

-- 4. List the names and salaries of all female programmers.
select programmer_name, Salary 
from programmers
where Gender = 'F';

-- 5. Display the names of programmers sorted by their date of birth in ascending order.
select programmer_name, DOB
from programmers
order by DOB;

-- 6. Find the names of programmers whose secondary language is 'Java'.
Select programmer_name 
from programmers
where Secondary_Language = 'Java';

-- 7. Show the details of programmers who earn a salary greater than $15,000.
Select programmer_name 
from programmers 
where Salary > 15000;

-- 8. List the names of programmers whose primary language is 'C++' and who were born before 1970.
Select programmer_name 
from programmers
where Primary_Language = 'C++' and DOB < 1970;

-- 9. Display the software names developed in 'Java'.
Select Software_Name
from software
where Developed_In = 'Java';

-- 10. List the courses studied at 'MIT'.
Select Course
from studies
where Institute = 'MIT';

-- Aggregate Functions (COUNT, AVG, MIN, MAX, SUM):

-- 11. What is the average salary of all programmers?
select avg(Salary) as average_salary
from programmers;

-- 12. How many programmers know 'Python' as their primary language?
select count(*), Programmer_Name 
from programmers
where Primary_language = 'Python'
group by Programmer_Name;

-- 13. What is the highest salary paid to a programmer?
select max(Salary) as highest_salary
from programmers;

-- 14. What is the total development cost of all software?
SELECT SUM(Development_cost) AS Total_Dev_Cost
FROM software;

-- 15. What is the minimum course fee paid by a programmer?
SELECT MIN(Fee) AS Min_Course_Fee
FROM studies;

-- 16. How many software packages were sold in total?
select sum(sold) as sum_sold
from software;

-- 17. What is the average cost of a course at 'Columbia'?
select avg(Course_Fee) as avg_fee
from studies
where Institute = 'Columbia';

-- 18. How many male programmers are in the database?
select count(*) as no_male_programmers
from programmers
where Gender = 'M';

-- 19. What is the sum of the software costs of packages developed in 'R'?
select sum(Software_cost) as sum_of_software
from software
where Developed_In = 'R';

-- 20. What is the maximum development cost for a package?
select max(Development_Cost) as max_cost
from software;

-- Grouping and Filtering (GROUP BY, HAVING):

-- 21. Display the average salary for each primary language.
select Primary_Language, avg(Salary) as avg_salary
from programmers
group by Primary_language;

-- 22. How many software packages were developed by each programmer?
select Developed_In, count(*) as no_of_packages
from software 
group by Developed_In;

-- 23. Show the number of programmers for each gender.
select Gender, count(*) as Gender_count
from programmers 
group by Gender;

-- 24. List the institutes and the number of courses offered by each.
select Institute, count(*) as no_of_courses
from studies
group by Institute;

-- 25. Find the primary languages where the average salary is greater than $15,000.
select Primary_Language
from programmers 
group by Primary_Language
having avg(Salary) > 15000;

-- 26. Display the total sales for each software developer.
select Developed_In, sum(Sold) as total_sales
from software
group by Developed_In;

-- 27. List the software languages and the number of software packages developed in each.
select Developed_In, count(*) as no_of_software
from software
group by Developed_In;

-- 28. Show the average course fee for each institute.
select Institute, avg(Course_Fee) as avg_course
from studies
group by Institute;

-- 29. Find the programmers who have developed more than one software package.
select Developed_In, count(*) as software_developer
from software
group by Developed_In
having  COUNT(*) > 1;

-- 30. Display the number of courses for each institute, but only for 
-- institutes with more than two courses.
select Institute, count(*) as no_of_courses
from studies
group by Institute
having count(*) > 1;

-- Joins (INNER JOIN, LEFT JOIN, RIGHT JOIN):

-- 31. Display the names of programmers and the software they developed.
select p.programmer_Name, s.Software_Name
from programmers p
join software s
on p.Programmer_Name = s.programmer_Name;

