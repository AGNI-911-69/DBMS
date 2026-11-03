CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget DECIMAL(12,2)
);
CREATE TABLE Works_On (
    emp_id INT,
    project_id INT,
    hours INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);
INSERT INTO Department VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune');

INSERT INTO Employee VALUES
(101, 'Amit', 'Sharma', 20, 50000),
(102, 'Priya', 'Verma', 20, 60000),
(103, 'Rahul', 'Singh', 10, 45000);

INSERT INTO Project VALUES
(201, 'Website Development', 200000),
(202, 'Payroll System', 150000),
(203, 'Mobile App', 300000);

INSERT INTO Works_On VALUES
(101, 201, 40),
(102, 202, 35),
(103, 201, 25);

-- Q1. Display all departments and first name of employees assigned to them.
SELECT d.dept_id, d.dept_name, d.location, e.first_name
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id;

-- Q2. List all projects with first and last name of employees working on them.
SELECT p.project_id, p.project_name,
       e.first_name, e.last_name,
       w.hours
FROM Project p
LEFT JOIN Works_On w
ON p.project_id = w.project_id
LEFT JOIN Employee e
ON w.emp_id = e.emp_id;

-- Q3. Complete master list of all employees and all departments.
SELECT e.emp_id, e.first_name, e.last_name,
       d.dept_id, d.dept_name, d.location
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.first_name, e.last_name,
       d.dept_id, d.dept_name, d.location
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id = d.dept_id;

-- Q4. List departments with total number of employees.
SELECT d.dept_id, d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM Department d
JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 5;