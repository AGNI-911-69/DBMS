DROP TABLE IF EXISTS Students;

CREATE TABLE Students (

Student_ID INT PRIMARY KEY,

First_Name VARCHAR (50) NOT NULL,

Last_Name VARCHAR(50),

Enrollment_Date DATE,

GPA DECIMAL (1,2)

);

INSERT INTO

Students (Student_ID, First_Name, Last_Name, Enrollment_Date, GPA)

VALUES
(100, 'Agni', 'Pratap', '01.08.2026', 8.15),
(101, 'Shree', 'Saha', '03.04.2026', 9.15);

SELECT *FROM Students;