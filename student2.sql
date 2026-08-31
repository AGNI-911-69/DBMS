CREATE TABLE Student (
    Student_Name VARCHAR(50),
    Student_Roll INT NOT NULL,
    Subject VARCHAR(50),
    Marks INT
);

INSERT INTO Student (Student_Name, Student_Roll, Subject, Marks)
VALUES
    ('Agni', 101, 'Mathematics', 78),
    ('Subhra', 102, 'Science', 85),
    ('Aradhya', 103, 'English', 69),
    ('Shubha', 104, 'Mechanics', 92),
    ('Moupriya', 105, 'History', 74),
    ('Sougata', 106, 'Geography', 88),
    ('Sanchari', 107, 'Physics', 81),
    ('Mishty', 108, 'Chemistry', 76),
    ('Kamya', 109, 'Biology', 90),
    ('Asvin', 110, 'Economics', 65);

-- Display all 5 tuples
SELECT * FROM Student;

-- Delete students with marks 80 or above
DELETE FROM Student
WHERE Marks >= 80;

-- Display remaining tuples
SELECT * FROM Student;