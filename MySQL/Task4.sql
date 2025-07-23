-- 1. Find programmers who earn more than the average salary of programmers with the same primary language.
SELECT *
FROM programmers p1
WHERE salary > (
    SELECT AVG(p2.salary)
    FROM programmers p2
    WHERE p2.Primary_Language = p1.Primary_Language
);

-- 2. For each programmer, show their name, salary,  and the number of software they've developed.
SELECT 
    p.Programmer_Name,
    p.Salary,
    COUNT(s.Software_Name) AS Software_Count
FROM programmers p
LEFT JOIN software s ON p.Programmer_Name = s.Programmer_Name
GROUP BY p.Programmer_Name, p.Salary;

-- 3. Find programmers who earn more than all programmers with 'Python' as their primary language.
SELECT *
FROM programmers
WHERE Salary > ALL (
    SELECT Salary
    FROM programmers
    WHERE Primary_Language = 'Python'
);
