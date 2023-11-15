create database new_assi8;

use new_assi8;

-- 1. Create tables using proper primary keys

-- Create account table
CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(255),
    balance DECIMAL(10, 2)
);

-- Create depositor table  
CREATE TABLE depositor (
    cust_name VARCHAR(255),
    acc_no INT,
    PRIMARY KEY (cust_name, acc_no),
    foreign key (acc_no) references account(acc_no)     -- spell forign and references also no semicolon
);

-- Create borrower table
CREATE TABLE borrower (
    cust_name VARCHAR(255),
    loan_no INT,
    PRIMARY KEY (cust_name, loan_no)
);

-- Create loan table
CREATE TABLE loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(255),
    amount DECIMAL(10, 2)
);


-- Sample data for the account table
INSERT INTO account VALUES (101, 'Branch1', 5000);
INSERT INTO account VALUES (102, 'Branch2', 8000);
INSERT INTO account VALUES (103, 'Branch1', 10000);

-- Sample data for the depositor table
INSERT INTO depositor VALUES ('John', 101);
INSERT INTO depositor VALUES ('Alice', 102);
INSERT INTO depositor VALUES ('Bob', 103);

-- Sample data for the borrower table
INSERT INTO borrower VALUES ('John', 1);
INSERT INTO borrower VALUES ('Alice', 2);
INSERT INTO borrower VALUES ('Bob', 3);

-- Sample data for the loan table
INSERT INTO loan VALUES (1, 'Branch1', 50000);
INSERT INTO loan VALUES (2, 'Branch2', 75000);
INSERT INTO loan VALUES (3, 'Branch1', 120000);


-- 2. Update information of a particular customer

UPDATE account
SET balance = 5000
WHERE acc_no = 101;

-- 3. Find the customers having a loan less than 1 lac

SELECT cust_name
FROM borrower
WHERE loan_no IN (SELECT loan_no FROM loan WHERE amount < 100000);   -- where lone_no IN loan 

-- 4. Display account number and customer name starting with ‘P’

SELECT acc_no, cust_name
FROM depositor
WHERE cust_name LIKE 'P%';

-- 5. Display name of the depositor with balance

SELECT D.cust_name, A.balance
FROM depositor D
JOIN account A ON D.acc_no = A.acc_no;

-- 6. Find names of all customers who have a loan at the ‘Redwood branch’.

SELECT DISTINCT B.cust_name
FROM borrower B
JOIN loan L ON B.loan_no = L.loan_no
WHERE L.branch_name = 'Redwood';

-- 7. Find all customers who have an account and loan or both.

SELECT DISTINCT D.cust_name
FROM depositor D
LEFT JOIN borrower B ON D.cust_name = B.cust_name
WHERE D.acc_no IS NOT NULL OR B.loan_no IS NOT NULL;

-- 8. Find all customers who do not have a loan

SELECT D.cust_name
FROM depositor D
LEFT JOIN borrower B ON D.cust_name = B.cust_name
WHERE B.loan_no IS NULL;

-- 9. Find average account balance at each branch.

SELECT branch_name, AVG(balance) AS avg_balance
FROM account
GROUP BY branch_name;

-- 10. Find the name of the borrower having the maximum loan amount

SELECT B.cust_name
FROM borrower B
JOIN loan L ON B.loan_no = L.loan_no
ORDER BY L.amount DESC
LIMIT 1;
