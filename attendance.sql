-- C. Attendance table
CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Emp_ID INT,
    Attendance_Date DATE,
    Status VARCHAR(20),
    Hours DECIMAL(4,2),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

INSERT INTO Attendance VALUES
(1, 101, '2026-09-01', 'Present', 8),
(2, 102, '2026-09-01', 'Present', 7.5),
(3, 103, '2026-09-01', 'Present', 8),
(4, 101, '2026-09-02', 'Present', 9),
(5, 102, '2026-09-02', 'Absent', 0),
(6, 103, '2026-09-02', 'Present', 8);

UPDATE Attendance
SET Hours = 8, Status = 'Present'
WHERE Attendance_ID = 5;

SELECT SUM(Hours) AS Total_Hours,
       AVG(Hours) AS Average_Hours,
       COUNT(*) AS Total_Records
FROM Attendance;