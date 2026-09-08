-- 1) Create Table EMPLOYEE
CREATE TABLE EMPLOYEE (
    Emp_No INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_No INT,
    Dept_Name VARCHAR(50),
    Designation VARCHAR(50),
    Salary NUMBER(10, 2)
);

-- Inserting sample data with real Indian names for testing
INSERT INTO EMPLOYEE (Emp_No, Emp_Name, Dept_No, Dept_Name, Designation, Salary) VALUES
(1, 'Agni', 10, 'IT', 'IT-MANAGER', 85000),
(2, 'Subhra', 20, 'HR', 'MANAGER', 75000),
(3, 'Asvin', 10, 'IT', 'CLERK', 35000),
(4, 'Aman', 30, 'Finance', 'CLERK', 38000),
(5, 'Kamya', 10, 'IT', 'DIRECTOR', 120000);

-- 2) List the Emp_No, Emp_Name, Salary of all employees working as MANAGER in any Department.
SELECT Emp_No, Emp_Name, Salary 
FROM EMPLOYEE 
WHERE Designation = 'MANAGER';

-- 3) Display all the details of the employee whose Salary is more than the IT-MANAGER.
SELECT * FROM EMPLOYEE 
WHERE Salary > (SELECT MAX(Salary) FROM EMPLOYEE WHERE Designation = 'IT-MANAGER');

-- 4) Display the total Number of salary amount of all the clerks together.
SELECT SUM(Salary) AS Total_Clerk_Salary 
FROM EMPLOYEE 
WHERE Designation = 'CLERK';

-- 5) Display the list of employee details where their salary is below than the MANAGERs.
-- Note: Uses MIN(Salary) to find employees making less than the lowest-paid manager.
SELECT * FROM EMPLOYEE 
WHERE Salary < (SELECT MIN(Salary) FROM EMPLOYEE WHERE Designation = 'MANAGER');

-- 6) Display the count of Employees in the EMPLOYEE table.
SELECT COUNT (*) AS Total_Employees 
FROM EMPLOYEE;