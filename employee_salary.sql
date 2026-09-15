-- A. Employee table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Designation VARCHAR(50),
    Dept VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

ALTER TABLE Employee ADD Email VARCHAR(100);
ALTER TABLE Employee DROP COLUMN Designation;

INSERT INTO Employee (Emp_ID, Name, Dept, Salary, Experience, Email) VALUES
(101, 'Agni', 'IT', 50000, 3, 'agni@gmail.com'),
(102, 'Subhra', 'HR', 42000, 2, 'subhra@gmail.com'),
(103, 'Aradhya', 'Finance', 60000, 5, 'aradhya@gmail.com'),
(104, 'Moupriya', 'Sales', 48000, 4, 'moupriya@gmail.com');

UPDATE Employee
SET Salary = 55000
WHERE Name = 'Agni';

-- Replace 104 with the resigned employee's ID if needed
DELETE FROM Employee WHERE Emp_ID = 104;

SELECT COUNT(*) AS Total_Employees,
       SUM(Experience) AS Total_Experience
FROM Employee;

SELECT SUM(Salary) AS Total_Salary FROM Employee;

SELECT MAX(Salary) AS Highest_Salary,
       MIN(Salary) AS Lowest_Salary
FROM Employee;

SELECT AVG(Salary) AS Average_Salary FROM Employee;