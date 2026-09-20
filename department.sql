-- B. Department table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Sales', 'Pune');
SELECT * FROM Department;

-- Replace with the actual closed department
DELETE FROM Department WHERE Dept_Name = 'Sales';
SELECT * FROM Department;
