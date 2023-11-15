-- Create Employee table
CREATE TABLE Employee (
    Empid INT PRIMARY KEY,
    Name VARCHAR(255),
    Basic_salary DECIMAL(10, 2),
    Type VARCHAR(20)
);

-- Sample data for Employee table
INSERT INTO Employee VALUES (101, 'John', 25000, 'Permanent');
INSERT INTO Employee VALUES (102, 'Alice', 18000, 'Temporary');
INSERT INTO Employee VALUES (103, 'Bob', 30000, 'Permanent');

-- Procedure to calculate Gross and Net salary
CREATE OR REPLACE PROCEDURE CalculateSalary AS
    v_emp_id Employee.Empid%TYPE;
    v_name Employee.Name%TYPE;
    v_basic_salary Employee.Basic_salary%TYPE;
    v_type Employee.Type%TYPE;
    v_da DECIMAL(10, 2);
    v_hra DECIMAL(10, 2);
    v_gross_salary DECIMAL(10, 2);
    v_income_tax CONSTANT DECIMAL(10, 2) := 2000;
    v_deductions DECIMAL(10, 2);
    v_net_salary DECIMAL(10, 2);

BEGIN
    -- Cursor to fetch employee details
    FOR emp_rec IN (SELECT * FROM Employee) LOOP
        v_emp_id := emp_rec.Empid;
        v_name := emp_rec.Name;
        v_basic_salary := emp_rec.Basic_salary;
        v_type := emp_rec.Type;

        -- Calculation for Permanent employees
        IF v_type = 'Permanent' THEN
            -- Calculate DA
            v_da := 1.15 * v_basic_salary;
            
            -- Calculate HRA
            v_hra := 0.12 * v_basic_salary;
            IF v_hra > 20000 THEN
                v_hra := 20000;
            END IF;

            -- Calculate Gross Salary
            v_gross_salary := v_basic_salary + v_da + v_hra;

            -- Calculate Deductions
            v_deductions := v_income_tax;

            -- Calculate Net Salary
            v_net_salary := v_gross_salary - v_deductions;

        -- Calculation for Temporary employees
        ELSIF v_type = 'Temporary' THEN
            -- Only basic salary and deductions for temporary employees
            v_gross_salary := v_basic_salary;
            v_deductions := v_income_tax;
            v_net_salary := v_gross_salary - v_deductions;

        END IF;

        -- Display the calculated values
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Gross Salary: ' || v_gross_salary);
        DBMS_OUTPUT.PUT_LINE('Net Salary: ' || v_net_salary);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');

    END LOOP;
END CalculateSalary;

-- Execute the procedure
EXEC CalculateSalary;
