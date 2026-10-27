-- 1. Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    DeptID INT,
    ManagerID INT
);

-- 2. Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

-- 3. Project Table
CREATE TABLE Project (
    ProjID INT PRIMARY KEY,
    ProjName VARCHAR(50) NOT NULL,
    Budget DECIMAL(12,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 4. Works_On Table
CREATE TABLE Works_On (
    EmpID INT,
    ProjID INT,
    Hours INT,
    PRIMARY KEY (EmpID, ProjID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (ProjID) REFERENCES Project(ProjID)
);

-- Insert Department values
INSERT INTO Department VALUES
(1, 'Research Department', 'Bangalore'),
(2, 'Development Department', 'Hyderabad'),
(3, 'HR Department', 'Chennai');

-- Insert Employee values
INSERT INTO Employee VALUES
(101, 'Anil', 25000, 1, NULL),
(102, 'Priya', 18000, 1, 101),
(103, 'Ravi', 14000, 2, 104),
(104, 'Neha', 30000, 2, NULL),
(105, 'Kiran', 16000, 3, 101);

-- Insert Project values
INSERT INTO Project VALUES
(201, 'AI Research', 500000, 1),
(202, 'Data Analysis', 300000, 1),
(203, 'Mobile App', 400000, 2),
(204, 'Website', 250000, 2);

-- Insert Works_On values
INSERT INTO Works_On VALUES
(101, 201, 25),
(101, 202, 30),
(101, 203, 22),
(101, 204, 24),
(102, 201, 18),
(102, 202, 28),
(103, 203, 35),
(104, 203, 20),
(104, 204, 25),
(105, 201, 15);

-- 8.1 Find project IDs where employees work more than 20 hours
SELECT DISTINCT ProjID
FROM Works_On
WHERE Hours > 20;

-- 8.2 Find names of all projects managed by the Research Department
SELECT P.ProjName
FROM Project P
JOIN Department D ON P.DeptID = D.DeptID
WHERE D.DeptName = 'Research Department';

-- 8.3 Find names of all employees who earn more than 15000
SELECT EmpName
FROM Employee
WHERE Salary > 15000;

-- 8.4 Find IDs of employees who work on every project
SELECT E.EmpID
FROM Employee E
WHERE NOT EXISTS (
    SELECT P.ProjID
    FROM Project P
    WHERE NOT EXISTS (
        SELECT W.ProjID
        FROM Works_On W
        WHERE W.EmpID = E.EmpID
          AND W.ProjID = P.ProjID
    )
);