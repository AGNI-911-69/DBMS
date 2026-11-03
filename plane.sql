CREATE TABLE Passenger (
    P_ID INT PRIMARY KEY,
    P_Name VARCHAR(50),
    P_Gender VARCHAR(10),
    P_City VARCHAR(50)
);
CREATE TABLE Agency (
    A_ID INT PRIMARY KEY,
    A_Name VARCHAR(50),
    A_City VARCHAR(50)
);
CREATE TABLE Flight (
    F_ID INT PRIMARY KEY,
    F_Date DATE,
    F_Time TIME,
    Src VARCHAR(50),
    Dest VARCHAR(50)
);
CREATE TABLE Booking (
    P_ID INT,
    A_ID INT,
    F_ID INT,
    F_Name VARCHAR(50),
    Booking_Time TIME,
    Src VARCHAR(50),
    PRIMARY KEY (P_ID, A_ID, F_ID),
    FOREIGN KEY (P_ID) REFERENCES Passenger(P_ID),
    FOREIGN KEY (A_ID) REFERENCES Agency(A_ID),
    FOREIGN KEY (F_ID) REFERENCES Flight(F_ID)
);
INSERT INTO Passenger VALUES
(1, 'Arun Kumar', 'Male', 'Chennai'),
(2, 'Priya Sharma', 'Female', 'Delhi'),
(3, 'Rahul Das', 'Male', 'Mumbai');

INSERT INTO Agency VALUES
(101, 'Indigo Airlines', 'Chennai'),
(102, 'Air India', 'Delhi'),
(103, 'SpiceJet', 'Mumbai');

INSERT INTO Flight VALUES
(201, '2026-10-05', '10:00:00', 'Delhi', 'Chennai'),
(202, '2026-12-01', '16:00:00', 'Chennai', 'Delhi'),
(203, '2026-12-02', '16:00:00', 'Mumbai', 'Bangalore');

INSERT INTO Booking VALUES
(1, 101, 201, 'Indigo Airlines', '09:00:00', 'Delhi'),
(2, 102, 202, 'Air India', '15:00:00', 'Chennai');

-- 1. Flights from Chennai to Delhi
SELECT *
FROM Flight
WHERE Src = 'Chennai' AND Dest = 'Delhi';

-- 2. Flight numbers for P_ID 1, 2, 3,
SELECT DISTINCT B.F_ID AS Flight_Number
FROM Booking B
JOIN Flight F ON B.F_ID = F.F_ID
WHERE B.P_ID IN (1, 2, 3)
  AND F.Dest = 'Chennai'
  AND F.F_Date < '2026-10-06';

-- 3. Passengers with no booking
SELECT P.P_Name
FROM Passenger P
LEFT JOIN Booking B ON P.P_ID = B.P_ID
WHERE B.P_ID IS NULL;

-- 4. Male passengers associated with Indigo Airlines
SELECT DISTINCT P.*
FROM Passenger P
JOIN Booking B ON P.P_ID = B.P_ID
WHERE P.P_Gender = 'Male'
  AND B.F_Name = 'Indigo Airlines';

-- 5. Flights on 01-12-2026 or 02-12-2026 at 16:00
SELECT *
FROM Flight
WHERE F_Date IN ('2026-12-01', '2026-12-02')
  AND F_Time = '16:00:00';