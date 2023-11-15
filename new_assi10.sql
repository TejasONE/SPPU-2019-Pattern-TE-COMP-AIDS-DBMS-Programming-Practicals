create database new_assi9;

use new_assi9;

-- 1. Create tables and insert values

-- Create Physician table
CREATE TABLE Physician (
    reg_no INT PRIMARY KEY,
    name VARCHAR(255),
    tel_no VARCHAR(15),
    city VARCHAR(255)
);

-- Create Patient table
CREATE TABLE Patient (
    p_name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255)
);

-- Create Visit table
CREATE TABLE Visit (
    p_name VARCHAR(255),
    reg_no INT,
    date_of_visit DATE,
    fees DECIMAL(10, 2)
);

-- Insert sample data into Physician table
INSERT INTO Physician VALUES (101, 'Dr. Smith', '1234567890', 'Mumbai');
INSERT INTO Physician VALUES (102, 'Dr. Patel', '9876543210', 'Nashik');
INSERT INTO Physician VALUES (103, 'Dr. Kumar', '8765432109', 'Mumbai');

-- Insert sample data into Patient table
INSERT INTO Patient VALUES ('John', '123 Oak St', 'Mumbai');
INSERT INTO Patient VALUES ('Alice', '456 Pine St', 'Nashik');
INSERT INTO Patient VALUES ('Bob', '789 Maple St', 'Mumbai');

-- Insert sample data into Visit table
INSERT INTO Visit VALUES ('John', 101, '2022-01-15', 2000);
INSERT INTO Visit VALUES ('Alice', 102, '2022-02-20', 5000);
INSERT INTO Visit VALUES ('Bob', 103, '2022-03-25', 7000);

-- 2. Delete entry of p_name 'Dipak'
DELETE FROM Patient WHERE p_name = 'Dipak';

-- 3. Get the patient details of 'Nashik' city
SELECT * FROM Patient WHERE city = 'Nashik';

-- 4. Count the number of physicians in 'Mumbai'
SELECT COUNT(*) FROM Physician WHERE city = 'Mumbai';   -- count madhe *

-- 5. Display a list of p_name in ascending order
SELECT p_name FROM Patient ORDER BY p_name ASC;      -- p_name rahila

-- 6. Get the patient name and fees, who paid fees > 5000
SELECT p_name, fees FROM Visit WHERE fees > 5000;

-- 7. Find the name and city of the patient who visited the physician on 13th July 2017
-- Assuming date_of_visit is stored as a DATE type
SELECT P.p_name, P.city
FROM Patient P
JOIN Visit V ON P.p_name = V.p_name
WHERE V.date_of_visit = '2017-07-13';

-- 8. Get the name of the physician and the number of patients visited to him
SELECT P.name, COUNT(V.p_name) AS num_of_patients
FROM Physician P
JOIN Visit V ON P.reg_no = V.reg_no
GROUP BY P.name;

-- 9. Get date-wise fees collected
SELECT date_of_visit, SUM(fees) AS total_fees
FROM Visit
GROUP BY date_of_visit;

-- 10. Display physician names who treated 'Mina'
SELECT P.name
FROM Physician P
JOIN Visit V ON P.reg_no = V.reg_no
WHERE V.p_name = 'Mina';
