CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT,
    ManagerID INT
);
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE Project (
    ProjID INT PRIMARY KEY,
    ProjName VARCHAR(50),
    Budget DECIMAL(12,2),
    DeptID INT
);
CREATE TABLE Works_On (
    EmpID INT,
    ProjID INT,
    Hours INT,
    PRIMARY KEY (EmpID, ProjID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (ProjID) REFERENCES Project(ProjID)
);
INSERT INTO Department VALUES
(1, 'Research Department', 'Delhi'),
(2, 'Development Department', 'Mumbai'),
(3, 'HR Department', 'Chennai');

INSERT INTO Employee VALUES
(101, 'Aman', 20000, 1, NULL),
(102, 'Riya', 14000, 2, 101),
(103, 'Karan', 18000, 1, 101);

INSERT INTO Project VALUES
(201, 'AI Project', 500000, 1),
(202, 'Web Portal', 300000, 2),
(203, 'Data Analysis', 400000, 1);

INSERT INTO Works_On VALUES
(101, 201, 25),
(101, 202, 22),
(101, 203, 30),
(102, 202, 15),
(103, 201, 28),
(103, 203, 18);

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