CREATE DATABASE devs;
USE devs;

show databases;

-- table 'programmers'
CREATE TABLE programmers (
    Programmer_Name VARCHAR(100) PRIMARY KEY,
    DOB DATE,
    DOJ DATE,
    GENDER CHAR(1),
    Primary_Language VARCHAR(100),
    Secondary_Language VARCHAR(100),
    Salary DECIMAL(10, 2)
);

INSERT INTO programmers (Programmer_Name, DOB, DOJ, GENDER, Primary_Language, Secondary_Language, Salary) VALUES
('Tony Stark', '1970-05-29', '1990-05-11', 'M', 'Python', 'JavaScript', 15000),
('Peter Parker', '2001-08-10', '2018-06-15', 'M', 'JavaScript', 'Python', 12000),
('Thomas Shelby', '1980-11-20', '1999-09-12', 'M', 'Python', 'R', 16000),
('John Wick', '1964-09-18', '1987-10-05', 'M', 'Java', 'C++', 18000),
('Bruce Wayne', '1933-02-19', '1950-06-11', 'M', 'C#', 'Java', 14000),
('Clark Kent', '1938-06-18', '1956-07-01', 'M', 'Java', 'Python', 13500),
('Diana Prince', '1919-08-19', '1945-07-01', 'F', 'Ruby', 'Python', 17500),
('Natasha Romanoff', '1984-11-22', '2000-05-30', 'F', 'Go', 'Rust', 14500),
('Steve Rogers', '1918-07-04', '1943-04-10', 'M', 'C++', 'C', 15500),
('Bruce Banner', '1969-12-18', '1989-07-20', 'M', 'Python', 'JavaScript', 14200),
('Wanda Maximoff', '1989-02-13', '2005-09-12', 'F', 'Swift', 'Kotlin', 14800),
('Stephen Strange', '1936-11-01', '1965-10-15', 'M', 'Fortran', 'Lisp', 15200),
('Thor Odinson', '1900-07-20', '2002-06-01', 'M', 'R', 'Julia', 16200);

-- table 'studies'
CREATE TABLE studies (
    Programmer_Name VARCHAR(100),
    Institute VARCHAR(100),
    Course VARCHAR(100),
    Course_Fee DECIMAL(10, 2),
    FOREIGN KEY (Programmer_Name) REFERENCES programmers(Programmer_Name)
);

INSERT INTO studies (Programmer_Name, Institute, Course, Course_Fee) VALUES
('Tony Stark', 'MIT', 'Computer Science', 4500),
('Peter Parker', 'Stanford', 'Data Science', 7200),
('Thomas Shelby', 'Columbia', 'Artificial Intelligence', 22000),
('John Wick', 'Oxford', 'Machine Learning', 5000),
('Bruce Wayne', 'MIT', 'Cybersecurity', 4500),
('Clark Kent', 'Stanford', 'Robotics', 6200),
('Diana Prince', 'Oxford', 'Quantum Computing', 5200),
('Natasha Romanoff', 'Cambridge', 'Bioinformatics', 14000),
('Steve Rogers', 'MIT', 'Software Engineering', 4500),
('Bruce Banner', 'Columbia', 'Cloud Computing', 11000),
('Wanda Maximoff', 'Cambridge', 'Data Analytics', 6000),
('Stephen Strange', 'MIT', 'Quantum Mechanics', 5000),
('Thor Odinson', 'Columbia', 'Data Science', 48000);

-- table 'software'
CREATE TABLE software (
    Programmer_Name VARCHAR(100),
    Software_Name VARCHAR(100),
    Developed_In VARCHAR(100),
    Software_Cost DECIMAL(10, 2),
    Development_Cost DECIMAL(10, 2),
    Sold INT,
    FOREIGN KEY (Programmer_Name) REFERENCES programmers(Programmer_Name)
);

INSERT INTO software (Programmer_Name, Software_Name, Developed_In, Software_Cost, Development_Cost, Sold) VALUES
('Tony Stark', 'Jarvis', 'Python', 15000, 30000, 150),
('Peter Parker', 'Spider Tracker', 'JavaScript', 8000, 20000, 85),
('Thomas Shelby', 'AI Advisor', 'Python', 20000, 50000, 70),
('John Wick', 'Assassin App', 'Java', 18000, 35000, 60),
('Bruce Wayne', 'Bat Computer', 'C#', 25000, 60000, 90),
('Clark Kent', 'Super Scanner', 'Java', 12000, 30000, 55),
('Diana Prince', 'Lasso of Truth', 'Ruby', 10000, 25000, 45),
('Natasha Romanoff', 'Black Widow Network', 'Go', 14000, 35000, 75),
('Steve Rogers', 'Shield Defense', 'C++', 16000, 40000, 80),
('Bruce Banner', 'Hulk Smash App', 'Python', 14000, 30000, 65),
('Wanda Maximoff', 'Hex Control', 'Swift', 12000, 28000, 50),
('Stephen Strange', 'Time Manipulator', 'Fortran', 16000, 45000, 70),
('Thor Odinson', 'Mjolnir Control', 'R', 18000, 50000, 100);

show databases;

-- Task1 (Get all the programmers start with 'B')
select Programmer_Name, Primary_Language
from programmers
where programmer_Name LIKE 'B%';

-- (Get all the programmers ends with 's')
select Programmer_Name, Primary_Language
from programmers
where programmer_Name LIKE '%s';

