create database new_assi3;

use new_assi3;

-- Create Dept table
CREATE TABLE Dept (
    Deptno INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Managerempid INT
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
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES Dept(Deptno)
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
select * from works;

-- Create Dependant table
CREATE TABLE Dependant (
    empid INT,
    name_of_dependant VARCHAR(255),
    age INT,
    relation VARCHAR(255),
    PRIMARY KEY (empid, name_of_dependant)
);

INSERT INTO Dept VALUES (2, 'HR Department', 'Mumbai', 102);
INSERT INTO Dept VALUES (3, 'Finance Department', 'Delhi', 103);

INSERT INTO Employees VALUES (102, 'Jane Smith', '456 Oak St', 'Mumbai', '1992-05-15', '2016-02-01', 'F', 55000, 2);
INSERT INTO Employees VALUES (103, 'Bob Johnson', '789 Pine St', 'Delhi', '1988-08-20', '2017-03-15', 'M', 70000, 3);

INSERT INTO Project VALUES (2, 'Employee Training', 'Mumbai');
INSERT INTO Project VALUES (3, 'Finance System Upgrade', 'Delhi');

INSERT INTO Works VALUES (102, 2, 30);
INSERT INTO Works VALUES (103, 3, 50);

INSERT INTO Dependant VALUES (102, 'Spouse1', 30, 'Spouse');
INSERT INTO Dependant VALUES (103, 'Child2', 12, 'Daughter');

SELECT E.name AS manager_name
FROM Employees E
JOIN Dept D ON E.empid = D.Managerempid;

SELECT name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM Employees;

SELECT name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM Employees
ORDER BY age DESC;

SELECT E.name
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'ERP Project';

SELECT E.name, E.city
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'Banking Project';

SELECT E.name
FROM Employees E
WHERE E.deptno = (SELECT D.Deptno FROM Dept D WHERE D.Name = 'Testing Department')
ORDER BY E.date_of_joining ASC
LIMIT 1;

SELECT name
FROM Employees
WHERE empid NOT IN (SELECT empid FROM Works);

CREATE VIEW PuneEmployees AS
SELECT COUNT(empid) AS num_employees
FROM Works
JOIN Project ON Works.Projectid = Project.Projectid
WHERE Project.city = 'Pune';

SELECT num_employees * 1000 AS total_travel_allowance
FROM PuneEmployees;
