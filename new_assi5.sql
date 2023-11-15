-- Create a table named 'areas'
CREATE TABLE areas (
    length NUMBER,
    breadth NUMBER,
    area NUMBER,
    perimeter NUMBER
);

DECLARE
    v_length NUMBER;
    v_breadth CONSTANT NUMBER := 10;
    v_area NUMBER;
    v_perimeter NUMBER;

BEGIN
    -- Loop to calculate and insert values for length from 10 to 20
    FOR v_length IN 10..20 LOOP
        -- Calculate area and perimeter
        v_area := v_length * v_breadth;
        v_perimeter := 2 * (v_length + v_breadth);

        -- Insert values into the 'areas' table
        INSERT INTO areas VALUES (v_length, v_breadth, v_area, v_perimeter);   -- breadth is constnat
    END LOOP;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Calculation and insertion completed successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        -- You can handle this exception further as needed.
END;
/
