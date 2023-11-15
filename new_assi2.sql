create database new_assi2;

use new_assi2;

-- Create Dept table
CREATE TABLE Dept (
    Deptno INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    empid INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(255),
    dob DATE,
    date_of_joining DATE,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    salary DECIMAL(10, 2),
    deptno INT
);

-- Create Project table
CREATE TABLE Project (
    Projectid INT PRIMARY KEY,
    title VARCHAR(255),
    city VARCHAR(255)
);

-- Create Works table
CREATE TABLE Works (
    empid INT,
    Projectid INT,
    total_hrs_worked INT,
    PRIMARY KEY (empid, Projectid)
);

-- Create Dependant table
CREATE TABLE Dependant (
    empid INT,
    name_of_dependant VARCHAR(255),
    age INT,
    relation VARCHAR(255),
    PRIMARY KEY (empid, name_of_dependant)
);

-- INSERT statements for each table with sample data.
-- Insert more data into Dept table
INSERT INTO Dept VALUES (2, 'HR Department', 'Mumbai');
INSERT INTO Dept VALUES (3, 'Finance Department', 'Delhi');

-- Insert more data into Employees table
INSERT INTO Employees VALUES (102, 'Jane Smith', '456 Oak St', 'Mumbai', '1992-05-15', '2016-02-01', 'F', 55000, 2);
INSERT INTO Employees VALUES (103, 'Bob Johnson', '789 Pine St', 'Delhi', '1988-08-20', '2017-03-15', 'M', 70000, 3);

-- Insert more data into Project table
INSERT INTO Project VALUES (2, 'Employee Training', 'Mumbai');
INSERT INTO Project VALUES (3, 'Finance System Upgrade', 'Delhi');

-- Insert more data into Works table
INSERT INTO Works VALUES (102, 2, 30);
INSERT INTO Works VALUES (103, 3, 50);

-- Insert more data into Dependant table
INSERT INTO Dependant VALUES (102, 'Spouse1', 30, 'Spouse');
INSERT INTO Dependant VALUES (103, 'Child2', 12, 'Daughter');

DELETE FROM Project WHERE title = 'Testing Project';

SELECT * FROM Employees WHERE salary > 50000;

SELECT * FROM Project WHERE city = 'Pune';

SELECT * FROM Dependant WHERE empid = 102;

SELECT Projectid, COUNT(empid) AS num_employees
FROM Works
GROUP BY Projectid;

SELECT deptno, AVG(salary) AS avg_salary
FROM Employees
GROUP BY deptno;

SELECT *
FROM Employees
WHERE deptno = (SELECT Deptno FROM Dept WHERE Name = 'Testing Department')
ORDER BY date_of_joining ASC
LIMIT 1;

CREATE VIEW PuneEmployees AS
SELECT COUNT(empid) AS num_employees
FROM Works
JOIN Project ON Works.Projectid = Project.Projectid
WHERE Project.city = 'Pune';

show tables;
