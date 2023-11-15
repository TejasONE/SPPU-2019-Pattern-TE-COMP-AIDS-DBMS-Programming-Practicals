create database new_assi1;

use new_assi1;

show tables;

-- 1. Develop DDL to implement the above schema enforcing primary key, check constraints (F and M for gender), and foreign key constraints.

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
    Mobile_number VARCHAR(15),
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
    PRIMARY KEY (empid, Projectid),
    FOREIGN KEY (empid) REFERENCES Employees(empid),
    FOREIGN KEY (Projectid) REFERENCES Project(Projectid)
);

-- Create Dependant table
CREATE TABLE Dependant (
    empid INT,
    name_of_dependant VARCHAR(255),
    age INT,
    relation VARCHAR(255),
    PRIMARY KEY (empid, name_of_dependant),
    FOREIGN KEY (empid) REFERENCES Employees(empid)
);

-- 2. Insert data in each table.

-- Insert data into Dept table
INSERT INTO Dept (Deptno, Name, Location, Managerempid)
VALUES (1, 'IT Department', 'Building 1', 101),
       (2, 'HR Department', 'Building 2', 102),
       (3, 'Finance Department', 'Building 3', 103);

-- Insert data into Employees table
INSERT INTO Employees (name, empid, address, city, dob, date_of_joining, gender, salary, deptno, Mobile_number)
VALUES ('John Doe', 101, '123 Main St', 'City1', '1990-01-01', '2015-01-01', 'M', 60000, 1, '9876543210'),
       ('Jane Smith', 102, '456 Oak St', 'City2', '1992-05-15', '2016-02-01', 'F', 55000, 2, '9876543211'),
       ('Bob Johnson', 103, '789 Pine St', 'City3', '1988-08-20', '2017-03-15', 'M', 70000, 3, '9876543212');

-- Insert data into Project table
INSERT INTO Project (Projectid, title, city)
VALUES (1, 'Software Development', 'City1'),
       (2, 'Employee Training', 'City2'),
       (3, 'Banking project', 'City3');

-- Insert data into Works table
INSERT INTO Works (empid, Projectid, total_hrs_worked)
VALUES (101, 1, 40),
       (102, 2, 30),
       (103, 3, 50);

-- Insert data into Dependant table
INSERT INTO Dependant (empid, name_of_dependant, age, relation)
VALUES (101, 'Child1', 8, 'Son'),
       (102, 'Spouse1', 30, 'Spouse'),
       (103, 'Child2', 12, 'Daughter');

-- 3. Add column Mobile number in the employee table.
-- Already added in the previous response
show tables;
select * from works;
select * from employees;

-- 3. Add column Mobile number in the employee table.

ALTER TABLE Employees
ADD COLUMN Mobile_number VARCHAR(15);

-- 4. Update mobile numbers for each employee.

UPDATE Employees
SET Mobile_number = '9876543210'
WHERE empid IS NOT NULL;

-- 5. Develop a SQL query to list employees having a name starting with 'S'.

SELECT *
FROM Employees
WHERE name LIKE 'S%';

-- 6. Develop a SQL query to list the department having location 'Building 1'.

SELECT *
FROM Dept
WHERE Location = 'Building 1';

-- 7. Develop a SQL query to list employees having a joining year between 2019 and 2020.

SELECT *
FROM Employees
WHERE YEAR(date_of_joining) BETWEEN 2019 AND 2020;

-- 8. Develop a SQL query to find the names and cities of residence of all employees who work for “Banking project”.

SELECT E.name, E.city
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'Banking project';

-- 9. Develop a SQL query to find time required for “Banking project”.

SELECT E.name, W.total_hrs_worked
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE P.title = 'Banking project';

-- 10. Develop a SQL query to find all employees in the database who live in the same cities as the project for which they work.

SELECT E.name, E.city
FROM Employees E
JOIN Works W ON E.empid = W.empid
JOIN Project P ON W.Projectid = P.Projectid
WHERE E.city = P.city;
