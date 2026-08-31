CREATE TABLE Employees (
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(50),
City VARCHAR(50) NOT NULL,
Department VARCHAR(50),
Salary INT NOT NULL
);

INSERT INTO
Employees (Emp_ID, Emp_Name, City, Department, Salary)

VALUES
(1, 'Agni', 'Kolkata', 'IT', 50000),
(2, 'Shree', 'Delhi', 'HR', 60000),
(3, 'Rohit', 'Mumbai', 'Finance', 7000),
(4, 'Anjali', 'Bangalore', 'Marketing', 55000),
(5, 'Priya', 'Chennai', 'IT', 65000),
(6, 'Rahul', 'Hyderabad', 'HR', 6000),
(7, 'Sneha', 'Pune', 'Finance', 7500),
(8, 'Amit', 'Kolkata', 'Marketing', 58000),
(9, 'Riya', 'Delhi', 'IT', 62000),
(10, 'Vikram', 'Mumbai', 'HR', 7000),
(11, 'Nisha', 'Bangalore', 'Finance', 72000),
(12, 'Karan', 'Chennai', 'Marketing', 5600),
(13, 'Ananya', 'Hyderabad', 'IT', 64000),
(14, 'Aditya', 'Pune', 'HR', 6100),
(15, 'Isha', 'Kolkata', 'Finance', 73000),
(16, 'Rohan', 'Delhi', 'Marketing', 5900),
(17, 'Sanya', 'Mumbai', 'IT', 6700),
(18, 'Kabir', 'Bangalore', 'HR', 62000),
(19, 'Meera', 'Chennai', 'Finance', 71000),
(20, 'Aryan', 'Hyderabad', 'Marketing', 5800);

SELECT *FROM Employees;

ALTER TABLE Employees
RENAME COLUMN Department TO Dept_Name;

DELETE FROM Employees
WHERE Salary <= 10000;

SELECT *FROM Employees;