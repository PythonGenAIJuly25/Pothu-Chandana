/*
You are given three tables: Students, Friends and Packages. 
Students contains two columns: ID and Name. Friends contains two columns: 
ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: 
ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered 
a higher salary than them. Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.

Sample Output

Samantha
Julia
Scarlet
*/

-- solution:

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p1 ON s.ID = p1.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;

-- all test cases passed

/*

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and 
displayed underneath its corresponding Occupation. The output should consist of four columns 
(Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed 
alphabetically under each column.
Note: Print NULL when there are no more names corresponding to an occupation.

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation 
(in this case, the Professor and Actor columns) are filled with NULL values.

*/

-- solution:

SELECT
    MIN(IF(occupation = "Doctor", name, NULL)) AS Doctor,
    MIN(IF(occupation = "Professor", name, NULL)) AS Professor,
    MIN(IF(occupation = "Singer", name, NULL)) AS Singer,
    MIN(IF(occupation = "Actor", name, NULL)) AS Actor
FROM
    (SELECT name, occupation,ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS indexing
     FROM occupations) AS short_table
GROUP BY indexing;

-- all test cases passed