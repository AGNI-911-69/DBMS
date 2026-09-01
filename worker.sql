-- 1. Create table
CREATE TABLE Worker (
    Worker_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Worker (Worker_ID, First_Name, Last_Name, Department, Salary)
VALUES
(1, 'Ramesh', 'Kumar', 'ADMIN', 25000),
(2, 'Suresh', 'Sharma', 'HR', 22000),
(3, 'Mohan', 'Singh', 'ADMIN', 32000),
(4, 'Amit', 'Verma', 'IT', 35000),
(5, 'Rajesh', 'Gupta', 'SALES', 18000);

SELECT * FROM Worker;

-- 2. First name ends with 'h' and has exactly six letters
SELECT * FROM Worker
WHERE First_Name LIKE '_____h';

-- 3. Rename Last_Name column to Surname
ALTER TABLE Worker
RENAME COLUMN Last_Name TO Surname;

-- 4. Workers whose salary is between 20,000 and 30,000
SELECT * FROM Worker
WHERE Salary BETWEEN 20000 AND 30000;

-- 5. Names of workers in the ADMIN department
SELECT First_Name, Surname
FROM Worker
WHERE Department = 'ADMIN';
