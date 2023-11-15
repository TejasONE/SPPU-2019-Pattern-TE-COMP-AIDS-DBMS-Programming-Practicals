DECLARE
    v_Roll_no NUMBER;
    v_Name_of_Book VARCHAR2(50);
    v_Date_of_Issue DATE;
    v_Current_Date DATE;
    v_Days NUMBER;
    v_Fine_Amount NUMBER;
    v_Status VARCHAR2(1);
    v_Exception_Message VARCHAR2(200);

    -- User-defined exception
    Fine_Exception EXCEPTION;

BEGIN
    -- Accept user input
    v_Roll_no := &Enter_Roll_no;  -- You can replace &Enter_Roll_no with an actual input value
    v_Name_of_Book := '&Enter_Name_of_Book';  -- You can replace &Enter_Name_of_Book with an actual input value

    -- Retrieve data from Borrower table based on Roll_no and Name_of_Book
    SELECT Date_of_Issue, Status INTO v_Date_of_Issue, v_Status
    FROM Borrower
    WHERE Roll_no = v_Roll_no AND Name_of_Book = v_Name_of_Book;

    -- Calculate the number of days
    v_Current_Date := SYSDATE  -- allows developers to retrieve the current date and time of the database server
    v_Days := v_Current_Date - v_Date_of_Issue;

    -- Control structure to determine fine amount
    IF v_Days BETWEEN 15 AND 30 THEN
        v_Fine_Amount := v_Days * 5;
    ELSIF v_Days > 30 THEN
        v_Fine_Amount := v_Days * 50;
    ELSE
        v_Fine_Amount := 0;
    END IF;

    -- Update status in Borrower table
    UPDATE Borrower
    SET Status = 'R'
    WHERE Roll_no = v_Roll_no AND Name_of_Book = v_Name_of_Book;

    -- Insert fine details into Fine table if fine amount is greater than 0
    IF v_Fine_Amount > 0 THEN
        INSERT INTO Fine VALUES (v_Roll_no, v_Current_Date, v_Fine_Amount);
    END IF;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Fine calculated and transaction completed successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_Exception_Message := 'No data found for the given Roll_no and Name_of_Book.';
        DBMS_OUTPUT.PUT_LINE(v_Exception_Message);
        -- You can handle this exception further as needed.

    WHEN Fine_Exception THEN
        v_Exception_Message := 'Fine Exception: Unable to calculate fine amount.';
        DBMS_OUTPUT.PUT_LINE(v_Exception_Message);
        -- You can handle this exception further as needed.

    WHEN OTHERS THEN
        v_Exception_Message := 'An error occurred: ' || SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_Exception_Message);
        -- You can handle this exception further as needed.
END;
/
